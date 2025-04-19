//SELECT BOX 데이터 매핑
const cmmn_listToSelectBox = async  function (url, selectBoxId, codeNm, codeId, upperCodId, nullOptionText) {
    console.log("cmmn_listToSelectBox");
    var selectBox = document.getElementById(selectBoxId);

    // select 박스 초기화
    selectBox.innerHTML = "";

    // 새로운 옵션 생성 및 추가
    const addOption = (value, text) => {
        let option = document.createElement("option");
        option.value = value;
        option.text = text;
        selectBox.appendChild(option);
        console.log("cmmn_listToSelectBox : Data addOption");
    };

    if (!upperCodId) {
        addOption("", nullOptionText);
    } else {
        const response = await axios.post(url, {
            codeNm: codeNm,
            step: 2,
            codeId: codeId,
            upperCodeId: upperCodId
        }).then(function (response) {
            console.log("cmmn_listToSelectBox : Data Success");

            if (response.data.length > 0) {
                addOption("", "전체");  // 기본 옵션 추가
                response.data.forEach(item => addOption(item.codeId, item.codeNm));
            }
        }).catch(function (error) {
            console.error(error);
        });
    }
};

//파일 다운로드
/**
 *
 * @param clrcsId : 문화자원ID
 * @param type : 파일타입
 * @param prdctSn : 단일파일 ID
 * @param path : 해당경로
 * @param progressId : 진행율ElementID
 * @param progressId : 진행율표시Element ID
 * @param fileName : fileName
 */
const cmmn_fileDownload = function (clrcsId, type, prdctSn, path, progressId, progressTextId, fileName) {

    fetch(apiUrl, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            clrcsId: clrcsId,
            type: type,
            prdctSn: prdctSn,
            path: path,
        }),
    })
        .then(response => {

            const contentLength = response.headers.get("content-length");
            if (!contentLength) {
                throw new Error('Content-Length header is missing');
            }

            const total = parseInt(contentLength, 10);
            let loaded = 0;


            const contentDisposition = response.headers.get('Content-Disposition');
            if(contentDisposition){
                const fileNameMatch = contentDisposition.match(/filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/);
                if (fileNameMatch.length > 1) {
                    fileName = fileNameMatch[1].replace(/['"]/g, '');
                }
            }

            return new Response(
                new ReadableStream({
                    start(controller) {
                        const reader = response.body.getReader();
                        read();
                        function read() {
                            reader.read().then(({ done, value }) => {
                                if (done) {
                                    controller.close();
                                    return;
                                }

                                loaded += value.byteLength;
                                //downloadProgress(loaded, total);
                                controller.enqueue(value);
                                read();
                            }).catch(error => {
                                console.error('Download failed:', error);
                                controller.error(error);
                            });
                        }
                    }
                })
            );
        })
        .then((response) => response.blob())
        .then(blob => {
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.style.display = 'none';
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            //init(url);
            //animate();
            window.URL.revokeObjectURL(url);
        })
        .catch((error) => {
            console.error("Download Error:", error);
        });
}

function downloadProgress(loaded, total) {
    const progress = Math.round((loaded / total) * 100);
    console.log(`다운로드 진행중 ${progress}%`);

    document.getElementById('downloadProgress').value = progress;
    if(progress == 100){
        document.getElementById('progressText').innerText = `다운로드 완료`;
    }else {
        document.getElementById('progressText').innerText = `다운로드 진행중 ${progress}%`;
    }

}


function uploadProgress(loaded, total) {
    const progress = Math.round((loaded / total) * 100);
    //console.log(`업로드 진행중 ${progress}%`)

    document.getElementById('downloadProgress').value = progress;
    if(progress == 100){
        document.getElementById('progressText').innerText = `업로드 완료`;
    }else {
        document.getElementById('progressText').innerText = `업로드 진행중 ${progress}%`;
    }

}

function multiUploadProgress(loaded, total, key) {
    const progress = Math.round((loaded / total) * 100);
    //console.log(`업로드 진행중 ${progress}%`)

    document.getElementById('downloadProgress_'+key).value = progress;
    if(progress == 100){
        document.getElementById('progressText_'+key).innerText = `업로드 완료`;
    }else {
        document.getElementById('progressText_'+key).innerText = `업로드 진행중 ${progress}%`;
    }
}

const cmmn_fileStream =  async function (clrcsId, type, prdctSn, elementId) {
    return await getOneResource(apiUrl+'/download', clrcsId, prdctSn, type, elementId);
}

async function getOneResource(url, clrcsId, prdctSn, type) {
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            clrcsId: clrcsId,
            prdctSn: prdctSn,
            type: type
        })
    });
    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }

    return window.URL.createObjectURL(await response.blob());
}


// async function getNewOneResource(url, clrcsId, prdctSn, type) {
//     try {
//         const response = await fetch(apiUrl, {
//             method: "POST",
//             headers: {
//                 "Content-Type": "application/json",
//             },
//             body: JSON.stringify({ clrcsId, prdctSn, type }),
//         });
//
//         if (!response.ok) {
//             throw new Error(`HTTP error! status: ${response.status}`);
//         }
//
//         const blob = await response.blob();
//         return window.URL.createObjectURL(blob);
//     } catch (error) {
//         console.error("Download Error:", error);
//         return null;
//     }
// }

const wsConnect = function (id) {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame){
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/result', function (greeting){


            console.log('recive: ' + greeting);
            alert(greeting);
            //disconnect();
            // alert(JSON.parse(greeting.body).content);
        }, function (error) {
            setTimeout(wsConnect, 50000)
        });

    });
}

const wsDisconnect = function () {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

	// strip
	String.prototype.strip =  function() {
	    return this.replace(/^\s+/, '').replace(/\s+$/, '');
	 }
    
    // 숫자에 1000단위 컴마
	Number.prototype.addNumCommas = function() {
	    return this.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	String.prototype.isNumber = function() {
    return /^\d+$/.test(this);
	};

	String.prototype.addStrCommas = function() {
	    if (this.isNumber()) {
	        return this.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    } else {
	        return this;
	    }
	};

	// text 타입의 element strip
	function formStrip(f) {
		var elList = f.getElementsByTagName("input");
		for (i=0;i<elList.length;i++ ){
			if (elList[i].type.toLowerCase() == "text" || elList[i].type.toLowerCase() == "textarea"){
				elList[i].value = elList[i].value.strip();
			}
		}
	}
	
	//CK에디터 필수 입력 체크
	function ckeditorChk(field, msg) {
		if(CKEDITOR.instances[field].getData() == "") {
			alert (msg+"을 입력해 주십시오.");
			CKEDITOR.instances[field].focus();
			return false;
		} else {
			$("#"+field).val(CKEDITOR.instances[field].getData());
		}
	}
