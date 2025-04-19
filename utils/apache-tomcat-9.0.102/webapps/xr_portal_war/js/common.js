//window
$(window).resize(function (){
	// width값을 가져오기
	var width_size = window.outerWidth;
	/*
	if (width_size < 1000) {
		$("#side_layer_datacounsel").hide();
	}else{
		$("#side_layer_datacounsel").show();
	}
	*/
});

/*
$(document).ready(function(){
});
*/

function fncAlertPop(options){
	var option = {
		"alertPopMsg" : "" //메세지
		, "per" : "" //가로비율
		, "fn" : "" //사용시 함수
		, "closeX_yn" : "Y" //닫기버튼 노출
	}
	
	if(typeof options != "undefined"){
        $.extend(option, JSON.parse(options));
    }

	var html = "";
	html += '<div class="layer_popup">';
		html += '<div class="w" style="min-height: 40px;">';
			html += '<div class="popup_box pop_data_use_request">';
				html += '<div class="pop_hd_w">';
					html += '<h3>알림</h3>';
					if(option.closeX_yn == 'Y'){
						html += '<a href="javascript:void(0);" class="ico btn_close layerPopupCloseRemove">';
							html += '<span>닫기</span>';
						html += '</a>';	
					}
				html += '</div>';
				html += '<div class="pop_content_w">';
					html += '<div class="pop_content">';
						html += '<div class="w">';
							html += '<div class="">';
								html += option.alertPopMsg;
							html += '</div>';
							html += '<div class="btm_area align_r">';
									if(option.fn != ""){
										html += '<a href="'+option.fn+'" class="btn btn_regist">';	
									}else{
										html += '<a href="javascript:void(0);" class="btn btn_regist layerPopupCloseRemove">';
									}
									html += '<span>확인</span>';
								html += '</a>';
							html += '</div>';
						html += '</div>';
					html += '</div>';
				html += '</div>';
			html += '</div>';
		html += '</div>';
		html += '<!--// 팝업 : 공통 레이어 팝업 -->';
	html += '</div>';
	
	$("body").append(html);
}

/**
 * 파일 다운로드
 * @param clrcsId : 문화자원ID
 * @param type : 파일타입
 * @param prdctSn : 단일파일 ID
 * @param path : 해당경로
 * @param progressId : 진행율ElementID
 * @param progressId : 진행율표시Element ID
 * @param fileName : fileName
 */
const fncFileDownload = function (clrcsId, type, prdctSn, path, progressId, progressTextId, fileName) {

	document.getElementById('downloadArea').style.display = 'block';

	//const apiUrl = "http://14.63.58.81:5005/api/tus/file/download";
	//const apiUrl = "http://localhost:8080/api/tus/file/download";

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
			userId: cmmnUid
		}),
	})
		.then(response => {
			const contentLength = response.headers.get("content-length");
			if (!contentLength) {
				throw new Error('Content-Length header is missing');
			}

			const total = parseInt(contentLength, 10);
			let loaded = 0;

			if(progressId != null && progressTextId != null) {
				fncUpdateProgress(loaded, total);
			}
			
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
									document.getElementById('downloadArea').style.display = 'none';
									return;
								}

								loaded += value.byteLength;
								if(progressId != null && progressTextId != null) {
									fncUpdateProgress(loaded, total);
								}
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
			alert("다운로드 중 에러가 발생했습니다.");
			document.getElementById('downloadArea').style.display = 'none';
		});
}

/**
 * 진행상태 수정
 * @param loaded
 * @param total
 */
function fncUpdateProgress(loaded, total) {
	const progress = Math.round((loaded / total) * 100);
	//console.log(`Downloaded ${progress}%`);

	document.getElementById('downloadProgress').value = progress;
	document.getElementById('progressText').innerText = `${progress}% 다운로드`;
}

/**
 * null check
 * @param value
 */
function fncIsNull(value) {
    return (value === undefined || value === null || value ==='') ? true : false;	
}

/**
 * null을 빈값으로
 * @param value
 */
function fncNullToEmpty(value) {
    return (value !== null && value !== undefined && value !== '') ? value : '';
}

/**
 * 숫자에 컴마 추가
 * @param value
 */
function fncAddComma(value) {

    if (value == null || value === undefined || value === '') {
        return 0;
    }
    // 숫자 포맷에 천단위 컴마 추가
    return Number(value).toLocaleString();
}

/**
 * trim 함수
 * @param value
 */
String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g,"");
}

/**
 * 다운로드 실행화면 팝업
 * @param clrcsId : 문화자원ID
 */
function fncDwnldExecPopup (clrcsId) {
	const dwnldExecUrlLocal = cmmnDwnldExecUrl + "?clrcsId="+clrcsId;
	//front.layerClose('dwnldLayer');
    $("#dwnldExecConts").load(dwnldExecUrlLocal);
    front.layerOpen($(this),'dwnldLayer');
}

/**
 * 다운로드 이용동의화면 팝업
 * @param clrcsId : 문화자원ID
 */
function fncDwnldNotePopup (clrcsId) {
	const dwnldNoteUrlLocal = cmmnDwnldNoteUrl + "?clrcsId="+clrcsId;
	//front.layerClose('dwnldNoteLayer');
    $("#dwnldNoteConts").load(dwnldNoteUrlLocal);
    front.layerOpen($(this),'dwnldNoteLayer');
}

/**
 * 컬렉션 미리보기 화면 팝업
 * @param exbiId : 전시회ID
 */
function fncClctPreviewPopup (exbiId) {
	const clctPreviewUrlLocal = cmmnClctPreviewUrl + "?exbiId="+exbiId;
	//front.layerClose('clctPreviewLayer');
    $("#clctPreviewConts").load(clctPreviewUrlLocal);
    front.layerOpen($(this),'clctPreviewLayer');
}

/**
 * 컬렉션 상세화면 이동
 * @param exbiId : 전시회ID
 */
function fncSelectClctDtl (exbiId) {
	location.href = cmmnCltClctDtlUrl + "?exbiId="+exbiId;
}

/**
 * 문화자원 상세화면 이동
 * @param clrcsId : 문화자원ID
 */
function fncSelectCltRscDtl (clrcsId) {
	location.href= cmmnCltRscDtlUrl + "?clrcsId="+clrcsId;
}

/**
 * 넘어온 element ID 위치로 스크롤 이동
 * @param eleId : 각태그의 ID
 */
function fncTopMvmnScrl (eleId) {
   var targetElement = $('#' + eleId);
   if (targetElement.length > 0) {
       $('html, body').animate({ scrollTop: targetElement.offset().top }, 'fast');
   }
}


/**
 * 다운로드 관련 샘플
 */

// <div class="modals" id="modals">
// 	<div class="pop_layer">
// 		<div class="layer_head">
// 			<h2>파일 다운로드</h2>
// 			<button id="mdClsBtn" class="btn_close">팝업 닫기</button>
// 		</div>
// 		<div class="layer_cont">
// 			선택 하신 파일을 다운로드 중입니다. 잠시만 기다려주세요. <br>
// 			다운로드가 진행되면 진행상황이 업데이트 됩니다.
// 		</div>
// 		<progress id="downloadProgress" value="0" max="100" style="height: 50px; width: 100%"></progress>
// 		<span id="progressText"></span>
// 	</div>
// </div>

//
// const modalsShow = function(id) {
// 	var name_id = document.getElementById(id),
// 		html = document.documentElement,
// 		body = document.body,
// 		htmlScrollTop = window.scrollY || html.scrollTop;
//
// 	// 스크롤 방지 및 모달 활성화
// 	body.style.overflow = 'hidden';
// 	body.style.position = 'fixed';
// 	body.style.height = '100%';
// 	name_id.classList.add('on');
//
// 	setTimeout(() => {
// 		name_id.classList.add('show');
// 	}, 100);
//
//
//
// 	const closeBtn = document.getElementById('mdClsBtn');
// 	// 모달 닫기 버튼 이벤트 리스너
// 	closeBtn.addEventListener('click', function(e) {
// 		e.preventDefault();
// 		e.stopPropagation();
//
// 		// 스타일 및 모달 비활성화
// 		body.style.overflow = '';
// 		body.style.position = '';
// 		body.style.height = '';
// 		name_id.classList.remove('show');
// 		document.getElementById('downloadProgress').value = 0;
//
// 		setTimeout(() => {
// 			name_id.classList.remove('on');
// 		}, 500);
//
//
// 		// 이전 스크롤 위치로 복귀
// 		window.scrollTo(0, htmlScrollTop);
// 	});
// };

const fncViewRprsPrdct = async function (clrcsId, type, prdctSn, fileName, ctgryId, elementId) {
	//파일명에서 확장자를 확인하여 이미지인지 아닌지 확인
	var ext = fileName.split('.').pop();
	if(ext == 'jpg' || ext == 'png' || ext == 'gif' || ext == 'bmp' || ext == 'jpeg') {

		//이미지일 경우
		var imgURL =  await fncFileStream(clrcsId, type, prdctSn, elementId);

		const container = document.getElementById(elementId);
		
		container.style.display='flex';
		container.style.justifyContent= 'center';
		// container.style.flexDirection='column';
		// container.style.alignItems='center';
		
		var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

        if(elementId.includes('rscConts')){//메인 상단
        	// if(screenWidth <= 980){
		    //     container.style.width='100%';
			// 	container.style.height='60.5556vw';
	        // }else{
			// 	container.style.width='37.5vw';
			// 	container.style.height='21.09375vw';
	        // }
        }else if(elementId == 'rscDtlConts'){//상세 상단
        	// if(screenWidth <= 980){
		    //     container.style.width='100%';
			// 	container.style.height='50vw';
	        // }else{
			// 	container.style.width='52.0833vw';
			// 	container.style.height='29.2708vw';
	        // }
        }else{//상세 하단
				container.style.height='100%';
        }  
		
		const img = document.createElement('img');
		img.src = imgURL;
		img.id  = 'viewerImg';
		container.appendChild(img);
	}else if (ext == 'mp3' || ext == 'wav' || ext == 'aac' || ext == 'pcm' || (ext == 'mp4' && ctgryId == 'D04') ){

		const contentsViewer = document.getElementById(elementId);
		contentsViewer.style.display='flex';
		contentsViewer.style.flexDirection='column';
		contentsViewer.style.alignItems='center';
		
		var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		
		if(elementId.includes('rscConts')){//메인 상단
        	if(screenWidth <= 980){
		        contentsViewer.style.width='100%';
				contentsViewer.style.height='60.5556vw';

	        }else{
				contentsViewer.style.width='37.5vw';
				contentsViewer.style.height='21.09375vw';
		    }
        }else if(elementId == 'rscDtlConts'){//상세 상단
        	if(screenWidth <= 980){
		        contentsViewer.style.width='100%';
				contentsViewer.style.height='50vw';
		    }else{
				contentsViewer.style.width='100%';
				/*contentsViewer.style.width='52.0833vw';
				contentsViewer.style.height='29.2708vw';*/
		    }
        }else{//상세 하단
			if(screenWidth <= 980){
		        contentsViewer.style.width='100%';
				contentsViewer.style.height='45vw';
		    }else{
				contentsViewer.style.height='100%';
		    }	
	    }  
		
		
		// 오디오 태그 생성
		const audioElement = document.createElement('audio');
		audioElement.id = 'audioPlayer';
		audioElement.controls = true;
		audioElement.controlsList = 'nodownload';
		audioElement.style.width = '100%';
		//audioElement.style.height = '100%';
		// 캔버스 태그 생성
		const canvasElement = document.createElement('canvas');
		canvasElement.id = 'audioCanvas'+ Math.floor(Math.random() * 1000000);
		canvasElement.style.backgroundColor = '#333';
		canvasElement.style.width = '100%';
		canvasElement.style.height = '100%';
		
		// contentsViewer div에 오디오 및 캔버스 태그 추가
		contentsViewer.appendChild(canvasElement);
		contentsViewer.appendChild(audioElement);

		// 이후 코드는 오디오 및 캔버스 요소를 사용하여 Web Audio API와 연동
		const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
		let sourceNode = audioCtx.createMediaElementSource(audioElement);
		let analyser = audioCtx.createAnalyser();
		sourceNode.connect(analyser);
		analyser.connect(audioCtx.destination);

		// Load your audio file
		//audioElement.src = await fncFileStream(clrcsId, type, prdctSn, 'contentsViewer');

		audioElement.src = apiRgnUrl+'/'+clrcsId+'/'+prdctSn+'';
		audioElement.crossOrigin = 'anonymous'

		function draw() {
			const canvas = document.getElementById(canvasElement.id);
			const canvasCtx = canvas.getContext('2d');
			const width = canvas.width;
			const height = canvas.height;
			const bufferLength = analyser.frequencyBinCount; // FFT bins의 개수
			const dataArray = new Uint8Array(bufferLength);

			// analyser.fftSize = 256; // FFT 사이즈 설정 (예: 256)
			analyser.fftSize = 256; // FFT 사이즈 설정 (예: 256)

			requestAnimationFrame(draw);
			analyser.getByteFrequencyData(dataArray); // 주파수 데이터 얻기

			canvasCtx.fillStyle = 'rgb(0, 0, 0)';
			canvasCtx.fillRect(0, 0, width, height);

			// const barWidth = (width / bufferLength) * 2.5; // 막대의 너비
			const barWidth = (width / bufferLength) * 5; // 막대의 너비
			let barHeight;
			let x = 0;

			for (let i = 0; i < bufferLength; i++) {
				barHeight = dataArray[i];
				canvasCtx.fillStyle = 'rgb(' + (barHeight+100) + ',50,50)';
				canvasCtx.fillRect(x, height - barHeight / 2, barWidth, barHeight / 2);
				x += barWidth + 1; // 막대 사이의 간격
			}

		}

		// Start drawing when the audio starts playing
		audioElement.onplay = () => {
			if(audioCtx.state === 'suspended') {
				audioCtx.resume();
			}
			draw();
		};

	}else if( ext == 'mov' || (ext == 'mp4' && ctgryId == 'D02')){

		var container = document.getElementById(elementId);
		container.style.display='flex';
		container.style.flexDirection='column';
		container.style.alignItems='center';
		
		const video = document.createElement('video');
		video.controls= true;
		video.controlsList = 'nodownload';
		
		var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

        if(elementId.includes('rscConts')){//메인 상단
        	if(screenWidth <= 980){
		        container.style.width='100%';
				container.style.height='60.5556vw';
				video.style.width='100%';
	            video.style.height='100%';
	        }else{
				container.style.width='37.5vw';
				container.style.height='21.09375vw';
				video.style.width='100%';
	            video.style.height='100%';
	        }
        }else if(elementId == 'rscDtlConts'){//상세 상단
        	if(screenWidth <= 980){
		        container.style.width='100%';
				container.style.height='50vw';
				video.style.width='100%';
	            video.style.height='100%';
	        }else{
				container.style.width='100%';
				container.style.height='100%';
				video.style.width='100%';
	            video.style.height='100%';
				/*
				container.style.width='52.0833vw';
				container.style.height='29.2708vw';
				video.style.width='100%';
	            video.style.height='100%';
				*/
	        }
        }else{//상세 하단
				container.style.height='100%';
				video.style.width='100%';
        }  
		
		const source = document.createElement('source');
		//video.src = 'http://14.63.58.81:5005/api/tus/file/region/'+clrcsId+'/'+prdctSn+'';
		video.src = apiRgnUrl+'/'+clrcsId+'/'+prdctSn+'';
		video.type = 'video/mp4';
		video.appendChild(source);

		container.appendChild(video);
	}else if(ext === 'fbx' || ext === 'obj' || ext === 'stl' || ext === 'glb' || ext === 'ply' ){
        let targetFiles = [];

        await axios.post(baseUrl+'/txtInfo', {
            clrcsId: clrcsId,
            prdctSn: prdctSn
        }).then(function (response) {
            if (response.data.length > 0) {
                response.data.forEach(file => {
                    targetFiles.push({name : file.fileNm, prdctSn: file.prdctSn});
                });
            }
        }).catch(function (error) {
            console.error(error);
        });

		//3D 모델링 파일일 경우
		var container = document.getElementById(elementId);

		if(container.clientHeight === 0){
			container.style.height='700px';
		}

		const viewer =new window.ThreeDViewer(elementId, clrcsId,prdctSn, fileName, targetFiles);
		viewer.animate();
	}
	else {
		alert('해당파일은 다운로드하여 확인해 주시기 바랍니다.');
	}

}

const fncFileStream =  async function (clrcsId, type, prdctSn, elementId) {
	//const apiUrl = 'http://14.63.58.81:5005/api/tus/file/download';
	return await fncGetOneResource(apiUrl, clrcsId, prdctSn, type, elementId);
}

async function fncGetOneResource(url, clrcsId, prdctSn, type) {
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

function fncShowConts(pClrscId, pPrdctSn, ctgryId, divId) {
   	const param = {
	   		'clrcsId' : pClrscId,
	   		'prdctSn' : pPrdctSn
	   	};
	   	
    $.ajax({
        type: 'POST',
        url: cmmnShowContsUrl,
        data: param,
        success: function (data) {
            if(data.resultCode == 200){
            	const prdctFile = data.result.prdctFile;
            	fncViewRprsPrdct(prdctFile.clrcsId, 'selectOne', prdctFile.prdctSn, prdctFile.fileNm, ctgryId, divId);
            }
        },
        error: function (e) {
            console.log('ERROR : ', e);
        }
    }); 

}


//const baseUrl = 'http://14.63.58.81:5005/api/tus/file/';

const  reqFileInfo = function (clrcsId) {
	return new Promise((resolve, reject) => {
		const fileInfoUrl = baseUrl + 'info';
		$.ajax({
			url: fileInfoUrl,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				clrcsId : clrcsId
			}),
			success: function(data) {
				resolve(data);
			},
			error: function(error) {
				reject(error);
			}
		});
	});
}
const  reqFileDownload = function(fileName, clrcsId, prdctSn, inputFiles, fileCount, viewer){

	const fileDownloadUrl = baseUrl + 'download';
	getResource(fileDownloadUrl, fileName, clrcsId, prdctSn).then(data => {

		if(!data){
			//fileCount--;
			console.error('file download failed');
			return;
		}
		const blob = new Blob([data]);
		const file = new File([blob], fileName);
		inputFiles.push(new OV.InputFile(file.name, 2, file));
		//fileCount--;
		if(inputFiles.length === fileCount){

			viewer.LoadModelFromInputFiles(inputFiles);
		}
		// if(fileCount === 0){
		// 	viewer.LoadModelFromInputFiles(inputFiles);
		// }
	});
}


const filterObjFileInfo = function(fileList) {
	return fileList.filter(file => {
		return file.orgDirNm.includes('/Fbx') && (file.prdctNm.includes('.fbx'));

		//return file.orgDirNm === '3DAsset/Fbx' && (file.prdctNm.includes('.fbx'));
		// return file.orgDirNm === '3D_Conversion/Obj' && (file.prdctNm.includes('.obj') || file.prdctNm.includes('.mtl'));
	});
}
const filterTextureFileInfo = function(fileList) {
	return fileList.filter(file => {

		return file.orgDirNm.includes('/Texture') && file.fileSz > 0;
		//return file.orgDirNm === '3DAsset/Fbx/Texture' && file.fileSz > 0;
		// return file.orgDirNm === '3D_Conversion/Texture' && file.fileSz > 0;
	});
}


const getResource = function (url, fileName, clrcsId, prdctSn){

	return fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({
			clrcsId: clrcsId,
			type: 'selectOne',
			prdctSn: prdctSn
		})

	}).then(response => {
		const contentLength = response.headers.get('Content-Length');
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
							//updateProgress(loaded, total);
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
		.then(response => response.blob())
		.catch(error => {
			console.error('Download failed:', error);
			return null;
		});
}

// 만료 시간과 함께 데이터를 저장
function fncSetItemWithExpireTime(keyName, keyValue, tts) {
	// localStorage에 저장할 객체  
	const objStg = {    
		value : keyValue,    
		expire : Date.now() + tts  
	};
	
	// 객체를 JSON 문자열로 변환  
	const objString = JSON.stringify(objStg);
	   
	// setItem  
	window.localStorage.setItem(keyName, objString);
}

// 만료 시간을 체크하며 데이터 읽기
function fncGetItemWithExpireTime(keyName) {    
	// localStorage 값 읽기 (문자열)  
	const objString = window.localStorage.getItem(keyName);    
	
	// null 체크  
	if(!objString) {    
		return null;  
	}    
	
	// 문자열을 객체로 변환  
	const objStg = JSON.parse(objString);
	    
	// 현재 시간과 localStorage의 expire 시간 비교  
	if(Date.now() > objStg.expire) {    
		// 만료시간이 지난 item 삭제    
		window.localStorage.removeItem(keyName);        
		
		// null 리턴    
		return null;  
	}
	    
	// 만료기간이 남아있는 경우, value 값 리턴  
	return objStg.value;
}

	// strip
	String.prototype.strip =  function() {
	    return this.replace(/^\s+/, '').replace(/\s+$/, '');
	 }

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
			alert (msg+"을(를) 입력해 주십시오.");
			CKEDITOR.instances[field].focus();
			return false;
		} else {
			$("#"+field).val(CKEDITOR.instances[field].getData());
		}
	}
