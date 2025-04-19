<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br/>
<div class="contants">
	<div class="content-div top_file_area">
		<div class="uploadbox" id="dropArea" style="height: 180px;">
			<strong>아래양식을 다운로드 받아 파일을 작성하여 업로드 하여 주세요<br /></strong>
			<p>아래양식외에 파일은 인식이 불가능 합니다.</p>
		</div>
	</div>


	<div class="btn-wrap between top_file_area">
		<button id="templetExcelFile" type="button" class="btns small color-orange" onclick="">업로드 양식 받기</button>
		<div>
			<label for="excelFile" style="cursor: pointer;">
				<div class="btns">파일선택</div>
			</label>

				<input type="file" id="excelFile" name="excelFile" accept=".xlsx" style="display: none">


			<button id="uploadFile" type="button" class="btns small" onclick="excelUpload()">업로드</button>
		</div>
	</div>

	<!-- 테이블 -->
	<div class="quality-control">
        <div class="mid-title-wrap">
            <h2>
                업로드된 디지털 문화자원 목록
            </h2>
        </div>
        <div class="table-wrap">

            <table>
                <colgroup>
                    <col width="10%"/><col width="10%"/><col width="10%"/><col width="*"/>
                </colgroup>
                <thead>
                <tr>
                    <th width="10%">순번</th>
                    <th width="*">디지털문화자원명칭</th>
                    <th width="10%">기관명</th>
                    <th width="10%">데이터유형</th>
                    <th width="10%">공통분류</th>
                    <th width="10%">다운로드가능여부</th>
                    <th width="10%">저작권유형</th>
                    <th width="10%">파일명</th>
                    <th width="10%">파일첨부여부</th>
                    <th width="10%">진행</th>
                </tr>
                </thead>
                <tbody id="uldList">
                </tbody>
            </table>
        </div>
		<!-- 파일을 드래그 및 업로드 -->
		<div class="uploadbox" id="multiDropArea">
		    <p>우측 하단의 파일선택 버튼을 이용하여 업로드 하여 주시기 바랍니다.</p>
		</div>
		
		
		<div class="btn-wrap align-right">
        <label for="zipFiles" style="cursor: pointer;">
            <div class="btns">파일선택</div>
        </label>
        <input type="file" id="zipFiles" name="zipFiles" style="display: none" multiple>
        <button id="multiUploadFile" type="button" class="btns small">일괄 업로드</button>
        </div>
		
		
	</div>

</div>


<script>
    let convertedFiles = []; //업로드 파일
	let notInListFiles = []; //목록에 없는 파일
	let dupFiles = [];       //중복된 파일
    let multiUploadRsltCnt = 0; //업로드결과 카운트
    let multiUploadTryCnt = 0; //업로드 시도파일 카운트



    document.addEventListener('DOMContentLoaded', function() {
        setupAllChangeHandler();
        
        const uploadBtn = document.getElementById('multiUploadFile');
        uploadBtn.onclick = multiUpload;
        
        const downloadBtn = document.getElementById('templetExcelFile');
        downloadBtn.onclick = excelDownload;
    });

	const setupAllChangeHandler = function() {
        // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
        const allInputAndSelectBoxes = document.querySelectorAll('input, select, textarea');
        allInputAndSelectBoxes.forEach(function (box) {
            box.addEventListener('change', handleChangeEvent);
        });
    }

    const handleChangeEvent =  function(event) {
    	const target = event.target;
        const tartId = target.id;
        let value, text;
        // input 박스와 select 박스 구분
        if (target.tagName.toLowerCase() === 'input') {
            value = text = target.value;
            // 파일 업로드일 경우  변경로칙 추가
            if(tartId === 'excelFile'){
                const dataDiv = document.getElementById('dropArea');
                dataDiv.innerHTML = '';
                const files = event.target.files;
                dataDiv.innerHTML +='<strong>파일명 : ' +files[0].name+ '</strong>';
                dataDiv.innerHTML +='<strong>파일크기 : ' +files[0].size+ '</strong>';
                dataDiv.innerHTML +='<strong>파일타입 : ' +files[0].type+ '</strong>';
            
            }else if(tartId === 'zipFiles'){
            	
            	const tableBody = document.getElementById('uldList');
                if (!tableBody || tableBody.children.length === 0) {
                    alert('목록 데이터가 없습니다. 먼저 엑셀 파일을 업로드하고 목록을 조회하세요.');
                    return;
                }
            	
            	notInListFiles = [];
            	dupFiles = [];
            	
                const dataDiv = document.getElementById('multiDropArea');
                dataDiv.innerHTML = '';
                const files = event.target.files;

                Object.keys(files).forEach(k=> {
                    convertedFiles = [
                        ...convertedFiles,
                        {id: URL.createObjectURL(files[k]), file: files[k]}
                    ];
                });
                
                //업로드 하려는 파일명들을 수집
				const uploadFileNames = convertedFiles.map(fileObj => fileObj.file.name);
				
                for(let key = 0; key < convertedFiles.length; key++) {
                    try {
                        const file = convertedFiles[key].file;
                        //중복 체크
                        const isDuplicate = uploadFileNames.filter(name => name === file.name).length > 1;
                        
                        if (isDuplicate && !dupFiles.includes(file.name)) {
                            dupFiles.push(file.name);
                            continue;
                        }
 
                        var idByfileNm = btoa(unescape(encodeURIComponent(file.name)))
                            .replace(/[^a-zA-Z0-9]/g, '')
                            .replace(/=+$/, '');

                        var cellId = 'chk_' + idByfileNm;
                        const chkEle = document.getElementById(cellId);

                        if (chkEle) {
                        	//파일첨부여부
                            chkEle.innerHTML = 'Y';
                        } else {
                        	//목록에 없는 파일 업로드 시
                            notInListFiles.push(file.name);
                        	continue;
                        }

                        //문화자원 ID
                        var clrcsId = 'hdnClrcsId_' + idByfileNm;
                        var clrcsIdVal = document.getElementById(clrcsId).value;
                        // dataDiv에 파일 정보 추가
                        dataDiv.innerHTML += '파일명 : ' + file.name + ' 파일크기 : ' + file.size + ' 파일타입 : ' + file.type + '<br>';

                    } catch (error) {
                        console.error('Error processing file:', error);
                        alert("업로드 처리중 에러가 발생하였습니다.");
                    }
                }

                if(notInListFiles.length > 0) {
                    alert('다음 파일들은 목록에 없어 업로드를 처리할 수 없습니다.\n' + notInListFiles.join(', '));
                }
                
                if(dupFiles.length > 0) {
                    alert('다음 파일들은 파일명이 중복되어 업로드 목록에서 제외하였습니다.\n' + dupFiles.join(', '));
                }
                
                //목록에 없는 파일 제거
                notInListFiles.forEach(notInFileName => {
                    const index = convertedFiles.findIndex(fileObj => fileObj.file.name === notInFileName);
                    if (index !== -1) {
                    	convertedFiles.splice(index, 1);
                    }
                });
                
                // 중복된 파일 제거
                dupFiles.forEach(dupFileName => {
                    const index = convertedFiles.findIndex(fileObj => fileObj.file.name === dupFileName);
                    if (index !== -1) {
                        convertedFiles.splice(index, 1);
                    }
                });
                
            }
        }
    }

    //일괄업로드 버튼 선택 시
    const multiUpload = function (){
    	
    	multiUploadTryCnt = convertedFiles.length;
    	
    	if(multiUploadTryCnt == 0){
    		alert("먼저 파일을 선택하세요.");
    		return;
    	}
    	
    	convertedFiles.forEach((fileObj) => {
    	    const file = fileObj.file;

            const chunkSize = parseInt(500000000, 10);

            var idByfileNm = btoa(unescape(encodeURIComponent(file.name)))
                            .replace(/[^a-zA-Z0-9]/g, '')
                            .replace(/=+$/, '');

             var cellId = 'chk_' + idByfileNm;
             const chkEle = document.getElementById(cellId);

             if(chkEle){//파일이 목록에 존재하면 시작
             	 //문화자원 ID
                 var clrcsId = 'hdnClrcsId_' + idByfileNm;
                 var clrcsIdVal = document.getElementById(clrcsId).value;
                 //상품타입
                 var dataTypeCd = 'hdnDataTypeCd_' + idByfileNm;
                 var dataTypeCdVal = document.getElementById(dataTypeCd).value;
                 
                 const upload = new tus.Upload(file, {
                     endpoint: apiUrl + '/upload',
                     chunkSize,
                     retryDelays: [0, 1000, 3000, 5000],
                     metadata: {
                         filename: file.name,
                         filetype: file.type,
                         xrId: clrcsIdVal,
                         prdctTypeCd: dataTypeCdVal,
                         regUserId: 'admin',
                         objType: 'zip'
                     },
                     onError: function (error) {
                         console.log("실패: " + error);
                     },
                     onProgress: function (bytesUploaded, bytesTotal) {
                    	 multiUploadProgress(bytesUploaded, bytesTotal, idByfileNm);
                     },
                     onSuccess: function () {
                     	 multiUploadRsltCnt++;
                     	 console.log("업로드결과 카운트/업로드 카운트 ===>"+multiUploadRsltCnt+"/"+multiUploadTryCnt);
                     	 if(multiUploadTryCnt == multiUploadRsltCnt){
                     		 alert("총 "+multiUploadRsltCnt+"건의 업로드가 완료되었습니다.");
                     		 return;
                     	 }
                     	 
                     }
                 });

                 upload.findPreviousUploads().then(function (previousUploads) {
                     if (previousUploads.length) {
                         upload.resumeFromPreviousUpload(previousUploads[0])
                     }
                     upload.start();
                 });
             }//파일이 목록에 존재하면 끝
        });
    	
    }
    
	//엑셀 목록 파일 업로드
	const excelUpload = function (){
		
		const fileInput = document.getElementById('excelFile');
        
        if (!fileInput.files || fileInput.files.length === 0) {
            alert('먼저 엑셀 파일을 선택하세요.');
            return;
        }
        
        const formData = new FormData();
		formData.append('excelFile', fileInput.files[0]);

        const response = axios.post(contextPath + '/dgtlMgt/excelUpload.do', formData, {
            headers: {
                'Content-Type': 'multipart/form-data'
			}
		}).then(function (response) {
			
			if (response.status === 200) {
				if(response.data.resultCode == 200){
					let seqNo = 1; 
					for (const item of response.data.resultData) {
					    
						//파일명 인코딩해서 아이디로 사용 
						var idByfileNm = btoa(unescape(encodeURIComponent(item.uldTrgtFileNm)))
					    .replace(/[^a-zA-Z0-9]/g, '')
					    .replace(/=+$/, '');
						
						var cpyrTypeCd = "";
						if("NURI000001" == item.cpyrTypeCd){
							cpyrTypeCd = "공공누리제1유형";
						}
						if("NURI000002" == item.cpyrTypeCd){
							cpyrTypeCd = "공공누리제2유형";
						}
						if("NURI000003" == item.cpyrTypeCd){
							cpyrTypeCd = "공공누리제3유형";
						}
						if("NURI000004" == item.cpyrTypeCd){
							cpyrTypeCd = "공공누리제4유형";
						}
						
				        const newRow = document.createElement('tr');
				        newRow.innerHTML = '<td>'+seqNo+'</td>' +
				        '<td style="text-align: left;">' + item.srchDgtlClrcsNmVal + '</td>' +
				        '<td>' + item.srchInstTypeNmVal + '</td>' +
				        '<td>' + item.srchDataTypeNmVal + '</td>' +
				        '<td>' + item.srchCntTypeNmVal + '</td>' +
				        '<td>' + item.dwnldAplcnYn + '</td>' +
				        '<td>' + cpyrTypeCd + '</td>' +
				        '<td style="text-align: left;">' + item.uldTrgtFileNm + '</td>' +
				        '<td id="chk_'+idByfileNm+'"></td>' +
				        '<td><progress id="downloadProgress_' + idByfileNm + '" value="0" max="100" style="height: 50px; width: 60%"></progress><br><span id="progressText_' + idByfileNm + '"></td>' +
				        '<td style="display:none"><input type="hidden" id="hdnClrcsId_'+idByfileNm+'" value="'+ item.clrcsId +'"></td>' +
				        '<td style="display:none"><input type="hidden" id="hdnDataTypeCd_'+idByfileNm+'" value="'+ item.srchDataTypeCdVal +'"></td>';
				        const tableBody = document.getElementById('uldList');
				        tableBody.appendChild(newRow);
				        seqNo++;
				    }
					
					var elements = document.getElementsByClassName("top_file_area");
					for (var i = 0; i < elements.length; i++) {
					    elements[i].style.display = "none";
					}
					
				}else{
					alert(response.data.resultData);
				} 
	        }
        }).catch(function (error) {
            console.error("엑셀 형식이 올바르지 않습니다.(Invalid Format)");
            console.error(error);
        });
	}
	
	//샘플양식 다운로드
	const excelDownload = function (){
	
		axios({
	        url: contextPath +'/dgtlMgt/excelDownload.do',
	        method: 'GET',
	        responseType: 'arraybuffer',
	    }).then(function (response) {
	    
	    	const blob = new Blob([response.data], { type: response.headers['content-type'] });
	        // 파일 다운로드
	        const fileName = 'template.xlsx';
	        if (navigator.msSaveBlob) {
	            // IE 브라우저
	            navigator.msSaveBlob(blob, fileName);
	        } else {
	            // 다른 브라우저
	            const downloadLink = document.createElement('a');
	            downloadLink.href = window.URL.createObjectURL(blob);
	            downloadLink.download = fileName;
	            downloadLink.style.display = 'none';
	            document.body.appendChild(downloadLink);
	            downloadLink.click();
	            document.body.removeChild(downloadLink);
	        }
	    }).catch(function (error) {
	        console.error(error);
	    });
	}
</script>

