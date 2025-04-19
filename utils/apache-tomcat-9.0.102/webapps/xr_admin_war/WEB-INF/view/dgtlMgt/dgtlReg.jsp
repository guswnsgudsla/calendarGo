<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">

<div class="contants">
    <ul class="step-wrap">
        <li class="active" onclick="showDiv('dgtlDtl_step01', this)">
            <strong>1. 기본정보 입력</strong>
            <p>디지털문화자원 기본정보를 입력합니다.</p>
        </li>
        <li onclick="showDiv('dgtlDtl_step02', this)">
            <strong>2. 파일등록</strong>
            <p>디지털문화자원 파일을 등록합니다.</p>
        </li>
<%--        <li>--%>
<%--            <strong>3. 품질정보</strong>--%>
<%--            <p>디지털문화자원 파일 품질을 확인합니다.</p>--%>
<%--        </li>--%>
        <li onclick="showDiv('dgtlDtl_step04', this)">
            <strong>3. 품질정보</strong>
            <p>디지털문화자원 파일 품질을 확인합니다.</p>
        </li>
        <li onclick="showDiv('dgtlDtl_step03', this)">
            <strong>4. 부가정보</strong>
            <p>디지털문화자원 부가정보를 입력합니다.</p>
        </li>

    </ul>
    <form name="frmDgtlClrcsSrch" id="frmDgtlClrcsSrch" method="post" enctype="multipart/form-data">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsNmVal" name="srchDgtlClrcsNmVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsNmVal}">
        <input type="hidden" class="serverValue" id="srchInstTypeCdVal" name="srchInstTypeCdVal" value="${srchDgtlClrcsInfo.srchInstTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchCntTypeCdVal" name="srchCntTypeCdVal" value="${srchDgtlClrcsInfo.srchCntTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchCntDtlTypeCdVal" name="srchCntDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchCntDtlTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchDataTypeCdVal" name="srchDataTypeCdVal" value="${srchDgtlClrcsInfo.srchDataTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchDataDtlTypeCdVal" name="srchDataDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchDataDtlTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchNationTypeCdVal" name="srchNationTypeCdVal" value="${srchDgtlClrcsInfo.srchNationTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchNationDtlTypeCdVal" name="srchNationDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchNationDtlTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchSvcTypeCdVal" name="srchSvcTypeCdVal" value="${srchDgtlClrcsInfo.srchSvcTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchIndrTypeCdVal" name="srchIndrTypeCdVal" value="${srchDgtlClrcsInfo.srchIndrTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchMtrTypeCdVal" name="srchMtrTypeCdVal" value="${srchDgtlClrcsInfo.srchMtrTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchMtrDtlTypeCdVal" name="srchMtrDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchMtrDtlTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchClrcsExplnVal" name="srchClrcsExplnVal" value="${srchDgtlClrcsInfo.srchClrcsExplnVal}">
        <input type="hidden" class="serverValue" id="srchRlsYnVal" name="srchRlsYnVal" value="${srchDgtlClrcsInfo.srchRlsYnVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsSbttlVal" name="srchDgtlClrcsSbttlVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsSbttlVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsUrlAddrVal" name="srchDgtlClrcsUrlAddrVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsUrlAddrVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsEngNmVal" name="srchDgtlClrcsEngNmVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsEngNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsChnNmVal" name="srchDgtlClrcsChnNmVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsChnNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsAutNmVal" name="srchDgtlClrcsAutNmVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsAutNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlInstItslMngNoVal" name="srchDgtlInstItslMngNoVal" value="${srchDgtlClrcsInfo.srchDgtlInstItslMngNoVal}">
        <input type="hidden" class="serverValue" id="srchDgtlWriNmVal" name="srchDgtlWriNmVal" value="${srchDgtlClrcsInfo.srchDgtlWriNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlFdspNmVal" name="srchDgtlFdspNmVal" value="${srchDgtlClrcsInfo.srchDgtlFdspNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlDspyNmVal" name="srchDgtlDspyNmVal" value="${srchDgtlClrcsInfo.srchDgtlDspyNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlDspyPlcNmVal" name="srchDgtlDspyPlcNmVal" value="${srchDgtlClrcsInfo.srchDgtlDspyPlcNmVal}">
        <input type="hidden" class="serverValue" id="srchDgtlClrcsAnxtExplnVal" name="srchDgtlClrcsAnxtExplnVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsAnxtExplnVal}">
        <input type="hidden" class="serverValue" id="srchHashTagVal" name="srchHashTagVal" value="${srchDgtlClrcsInfo.srchHashTagVal}">
        <input type="hidden" class="serverValue" id="srchClrcsSzCnVal" name="srchClrcsSzCnVal" value="${srchDgtlClrcsInfo.srchClrcsSzCnVal}">
        <input type="hidden" class="serverValue" id="srchCpyrTypeCdVal" name="srchCpyrTypeCdVal" value="${srchDgtlClrcsInfo.srchCpyrTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchInstCtgryNmVal" name="srchInstCtgryNmVal" value="${srchDgtlClrcsInfo.srchInstCtgryNmVal}">



        <input type="hidden"  id="srchPageModeVal" name="srchPageModeVal" value="${srchDgtlClrcsInfo.srchPageModeVal}">
        <input type="hidden"  id="srchSaveModeVal" name="srchSaveModeVal" value="${srchDgtlClrcsInfo.srchSaveModeVal}">
        <input type="hidden"  id="srchSaveStepVal" name="srchSaveStepVal" value="${srchDgtlClrcsInfo.srchSaveStepVal}">
        <input type="hidden"  id="srchSaveResultVal" name="srchSaveResultVal" value="${srchDgtlClrcsInfo.srchSaveResultVal}">
        <input type="hidden"  id="srchRprsImgGroupIdVal" name="srchRprsImgGroupIdVal" value="${srchDgtlClrcsInfo.srchRprsImgGroupIdVal}">


        <input type="hidden" id="clrcsId" name="clrcsId" value="${srchDgtlClrcsInfo.clrcsId}">
        <input type="hidden" id="fileVal" name="fileVal" value="">
        <input type="hidden" id="prdctUsgCdVal" name="prdctUsgCdVal" value="">
        
        
        <div id="dgtlDtl_step01" class="content-div" >
            <jsp:include page="dgtlRegStep01.jsp"></jsp:include>
        </div>
        <div id="dgtlDtl_step02" class="content-div" style="display: none">
            <jsp:include page="dgtlRegStep02.jsp"></jsp:include>
        </div>
        <div id="dgtlDtl_step03" class="content-div" style="display: none">
            <jsp:include page="dgtlRegStep03.jsp"></jsp:include>
        </div>
        <div id="dgtlDtl_step04" class="content-div" style="display: none">
            <jsp:include page="dgtlRegStep04.jsp"></jsp:include>
        </div>

    </form>

<%--    <div class="btn-wrap">--%>
<%--        <button type="button" class="btns btn-gray">취소</button>--%>
<%--        <button type="button" class="btns" onclick="saveData();">저장</button>--%>
<%--    </div>--%>

</div>
<div class="modals" id="modals_process">
    <div class="pop_layer">
        <div class="layer_head">
            <h2>기본정보 저장 완료</h2>
            <button id="mdClsBtn" class="btn_close">팝업 닫기</button>
        </div>
        <div class="layer_cont">
            입력하신 문화자원 기본정보가 저장되었습니다.<br>
            파일등록 페이지로 이동하시겠습니까?
        </div>
    </div>
</div>
<script>

	//자동완성 
	var atmcDataTypeCodeList = [];//데이터유형
	var atmcDataTypeNmList = []; 
	var atmcNationTypeCodeList = [];//국가/시대
	var atmcNationTypeNmList = []; 
	var atmcCntTypeCodeList = [];//컨텐츠유형
	var atmcCntTypeNmList = []; 
	var atmcMtrTypeCodeList = [];//재질
	var atmcMtrTypeNmList = []; 

    let convertedFiles = [];
    const uploadBtn = document.getElementById('uploadFile');
    // DOM 생성 후 실행
    document.addEventListener('DOMContentLoaded', async function() {
        console.log("DOMContentLoaded");
        if(document.getElementById('srchSaveStepVal').value ==='02'){
            const secondUl = document.querySelector('ul.step-wrap li:nth-child(2)');
            showDiv('dgtlDtl_step02', secondUl);
        }else if(document.getElementById('srchSaveStepVal').value ==='03'){
            const secondUl = document.querySelector('ul.step-wrap li:nth-child(3)');
            showDiv('dgtlDtl_step03', secondUl);
        }


        if(document.getElementById('srchSaveResultVal').value === '001'){
            alert('기본정보가 등록되었습니다.');
            document.getElementById('srchSaveResultVal').value = '';

        }else if(document.getElementById('srchSaveResultVal').value === '002'){
            alert('기본정보가 수정되었습니다.');
            document.getElementById('srchSaveResultVal').value = '';
        }

        var input = document.getElementById('srchHashTag');

        // 'keypress' 이벤트 리스너 추가
        input.addEventListener('keypress', function(event) {
            if (event.keyCode === 13) { // 13은 엔터 키의 키 코드
                addHashTag(); // '추가' 버튼의 기능 실행
                event.preventDefault(); // 폼 제출 방지
            }
        });
        //품질기준 세렉트박스 조회
        listToSelectBox(contextPath + '/qcMgt/codeList.do', 'prdctUsgCd', 'CLSF000024', 'D01', '콘텐츠세부유형');
        init();
        
        //자동완성 세팅
        <c:forEach var="item" items="${atmcCrtCtgryList}" varStatus="loopStatus">
            <c:choose>
                <c:when test="${item.ctgryTypeCd == 'CLRCSCT002'}">
                    atmcDataTypeCodeList.push('<c:out value="${item.ctgryId}"/>');
                    atmcDataTypeNmList.push('<c:out value="${item.ctgryNm}"/>');
                </c:when>
                <c:when test="${item.ctgryTypeCd == 'CLRCSCT003'}">
                    atmcCntTypeCodeList.push('<c:out value="${item.ctgryId}"/>');
                    atmcCntTypeNmList.push('<c:out value="${item.ctgryNm}"/>');
                </c:when>
                <c:when test="${item.ctgryTypeCd == 'CLRCSCT006'}">
                    atmcNationTypeCodeList.push('<c:out value="${item.ctgryId}"/>');
                    atmcNationTypeNmList.push('<c:out value="${item.ctgryNm}"/>');
                </c:when>
                <c:when test="${item.ctgryTypeCd == 'CLRCSCT007'}">
                    atmcMtrTypeCodeList.push('<c:out value="${item.ctgryId}"/>');
                    atmcMtrTypeNmList.push('<c:out value="${item.ctgryNm}"/>');
                </c:when>
            </c:choose>
        </c:forEach>
    });


    /**
     * 파일 변환 요청
     */
    const convertFile = function (){
        axios.post(contextPath +'/rabbit/callConvert.do', {
            clrcsId: document.getElementById('clrcsId').value  // 여기에 필요한 값을 입력하세요.
        })
        .then(function (response) {
            console.log(response);
            alert(response.data);
            // document.getElementById('apiResponse').innerHTML = 'Response: ' + response.data;
        })
        .catch(function (error) {
            console.log(error);
            //alert('오류가 발생하였습니다.');

        });
    }


    const reflashPage = function (){
        document.getElementById('srchSaveStepVal').value = '02';
        document.getElementById('srchSaveModeVal').value = '';
        document.getElementById('frmDgtlClrcsSrch').action = contextPath + '/dgtlMgt/dgtlMgtReg.do';
        document.getElementById('frmDgtlClrcsSrch').submit();
    }

    const connect = function (){
        // var socket = new SockJS('http://localhost:9090/ws');
        var socket = new SockJS(contextPath +'/ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame){
            console.log('Connected: ' + frame);
            var taskId = '...';
            stompClient.subscribe(contextPath +'/topic/result', function (greeting){
                //showGreeting(JSON.parse(greeting.body).content);

                console.log('recive: ' + greeting);
                alert(greeting);
                //disconnect();
                // alert(JSON.parse(greeting.body).content);
            });

        });
    }

    const disconnect = function (){
        if(stompClient !== null){
            stompClient.disconnect();
        }
        console.log("Disconnected");
    }


    const init = async function() {
        // // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
        await setupAllChangeHandler();

        //서버에서 받아온 데이터를 hidden input에 설정
        await setParamToObject();


        document.getElementById('thumnailFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = new Image();
                    img.onload = function() {
                        // 이미지와 div의 크기에 따라 조절
                        const container = document.getElementById('thumnailImageBox');
                        const scale = Math.min(container.clientWidth / img.width, container.clientHeight / img.height);
                        img.width = img.width * scale;   // 이미지의 너비 조절
                        img.height = img.height * scale; // 이미지의 높이 조절

                        // 기존의 이미지 제거 및 새 이미지 추가
                        container.innerHTML = '';
                        container.appendChild(img);
                    };
                    img.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });


    }



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
            if(tartId == 'file'){
                const dataDiv = document.getElementById('dropArea');
                const clrcsId = document.getElementById('clrcsId').value;
                const prdctTypeCd = document.getElementById('srchDataTypeCdVal').value;
                if(!clrcsId){
                    alert('기본정보를 먼저 저장하시고 파일업로드를 해주세요');
                    event.target.value ='';
                    return;
                }
                dataDiv.innerHTML = '';
                const files = event.target.files;

                Object.keys(files).forEach(k=> {
                    convertedFiles = [
                        ...convertedFiles,
                        {id: URL.createObjectURL(files[k]), file: files[k]}
                    ];
                });

                convertedFiles.map((i, key) => {
                    const file = i.file;
                    key++;

                    const chunkSize = parseInt(50000000, 10);
                    dataDiv.innerHTML +='<strong>ID : ' +clrcsId+ '</strong>';
                    dataDiv.innerHTML +='<strong>파일명 : ' +i.file.name+ '</strong>';
                    dataDiv.innerHTML +='<strong>파일크기 : ' +i.file.size+ '</strong>';
                    dataDiv.innerHTML +='<strong>파일타입 : ' +i.file.type+ '</strong>';
                    dataDiv.innerHTML +='<div class="progress pr_'+ key+'>';
                    dataDiv.innerHTML +='<progress id="downloadProgress" value="0" max="100" style="height: 50px; width: 60%"></progress>';
                    dataDiv.innerHTML +='<span id="progressText"></span>';


                    let upload = new tus.Upload(file, {
                        endpoint: apiUrl + '/upload',
                        //endpoint: "http://localhost:8080/api/tus/file/upload",
                        chunkSize,
                        retryDelays: [0, 1000, 3000, 5000],
                        metadata: {
                            filename: file.name,
                            filetype: file.type,
                            xrId: clrcsId,              //문화자원ID
                            prdctTypeCd : prdctTypeCd,  //데이터 유형코드
                            regUserId: 'admin',      //기관관리자, admin
                            objType: 'zip'              // 3D, Image, Video, Audio, Text,
                        },
                        onError: function (error) {
                            console.log("Failed because: " + error);
                        },
                        onProgress: function (bytesUploaded, bytesTotal) {
                            uploadProgress(bytesUploaded, bytesTotal);
                        },
                        onSuccess: function () {
                            alert("파일업로드가 완료되었습니다.");

                            if (confirm("업로드된 파일 정보를 확인하시겠습니까?")) {
                                reflashPage();
                            }
                        }
                    });

                    uploadBtn.addEventListener('click', (e) => {
                        reset();
                        upload.findPreviousUploads().then(function (previousUploads) {
                            if (previousUploads.length) {
                                upload.resumeFromPreviousUpload(previousUploads[0])
                            }
                            upload.start()
                        })
                    });
                })
            }

        } else if (target.tagName.toLowerCase() === 'select') {
            const selectedOption = target.options[target.selectedIndex];
            value = selectedOption.value;
            text = selectedOption.textContent;
        } else if(target.tagName.toLowerCase() === 'textarea') {
            value = target.value;
        } else {
            return;
        }
		
        if(tartId == "srchDataTypeBox" || tartId == "srchNationTypeBox" || 
           tartId == "srchCntTypeBox" || tartId == "srchMtrTypeBox"){
        	return;
        }

        // 선택된값을 hidden input에 저장
        document.getElementById(tartId + 'Val').value = value;


        // 해당 태그 삭제

        if(tartId == 'srchCntTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchCntDtlTypeCd', 'contents', 'CLRCSCT003', value, '콘텐츠세부유형');
        }else if (tartId =='srchDataTypeCd') {
            cmmn_listToSelectBox(contextPath + '/cmmn/codeList.do', 'srchDataDtlTypeCd', 'data', 'CLRCSCT002', value, '데이터세부유형');
        }else if (tartId =='srchNationTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchNationDtlTypeCd', 'nation', 'CLRCSCT006', value, '시대');
        }else if (tartId =='srchMtrTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchMtrDtlTypeCd', 'mtr', 'CLRCSCT007', value, '재질');
        }

        event.stopPropagation();
    }

    const setParamToObject = function() {
        const allInputAndSelectBoxes = document.querySelectorAll('input, select, textarea');
        allInputAndSelectBoxes.forEach(function (box) {
            const hiddenInputValue = document.getElementById(box.id + 'Val')?.value;
            if (hiddenInputValue) {
                box.value = hiddenInputValue;
            }
        });
    };

    const saveData = function (){
        if(document.getElementById('srchSaveStepVal').value != ''){
            if(confirm('이미 기본정보가 저장되었습니다. 수정하시겠습니까?')){
                if(checkValidate()){
                    //convertImage();
                    checkDiv();
                    document.getElementById('srchSaveModeVal').value = 'm';
                    document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtReg.do';
                    document.getElementById('frmDgtlClrcsSrch').submit();
                }
            }
        }else {
            if(confirm('기본정보를 저장하시겠습니까?')){
                if(checkValidate()){
                    //convertImage();
                    checkDiv();
                    document.getElementById('srchSaveModeVal').value = 'i';
                    document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtReg.do';
                    document.getElementById('frmDgtlClrcsSrch').submit();
                }

            }
        }
    }

    const checkDiv = function (){
        const divElements = document.querySelectorAll('.content-div');
        divElements.forEach(function (div){
            var style = window.getComputedStyle(div);
            if (style.display !== 'none') {
                if(div.id === 'dgtlDtl_step02'){
                    document.getElementById('srchSaveStepVal').value = '02';
                }else if(div.id === 'dgtlDtl_step03'){
                    document.getElementById('srchSaveStepVal').value = '03';
                }else {
                    document.getElementById('srchSaveStepVal').value = '';
                }
                console.log('Visible Div ID:', div.id);
            }
        })
    }

    const showDiv = function (id, obj){
        var divs = document.getElementsByClassName("content-div");
        for (var i = 0; i < divs.length; i++) {
            divs[i].style.display = "none";
        }

        var tabs = document.querySelectorAll("ul li");
        tabs.forEach(function(tab) {
            tab.classList.remove("active");
        });

        document.getElementById(id).style.display = "block";
        obj.classList.add("active");
        //품질관리 화면 처리
        if(id == "dgtlDtl_step04"){
        	var dataType = "<c:out value='${srchDgtlClrcsInfo.srchDataTypeCdVal}'/>";
        	
        	if(dataType ==""){
        		document.getElementById('qltProc').style.display = "none";
        		document.getElementById('noFile').style.display = "";
        		document.getElementById('noData').style.display = "none";
        		document.getElementById('qltArea').style.display = "none";
        		return;
        	}
        	
            if (dataType == 'D01'){
            	document.getElementById('qltProc').style.display = "";
            	document.getElementById('noFile').style.display = "none";
            	document.getElementById('noData').style.display = "none";
            	document.getElementById('qltArea').style.display = "";
            } else {
            	document.getElementById('qltProc').style.display = "none";
            	document.getElementById('noFile').style.display = "none";
            	document.getElementById('noData').style.display = "";
            	document.getElementById('qltArea').style.display = "none";
            }
        	//품질관리 검사결과 조회
            selectPrdctQltInspInfoList();
        }
    }

    const reset = function () {
        convertedFiles.map((i, key) => {
            $('.progress-bar_' + key).css('width', '0%');
            $('#js-upload-text-progress_' + key).html('');
        })
    }


    const formatBytes = function(bytes, decimals = 2) {
        if (bytes === 0) {
            return '0 Bytes'
        }

        const k = 1024
        const dm = decimals < 0 ? 0 : decimals
        const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
        const i = Math.floor(Math.log(bytes) / Math.log(k))
        return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i]
    }

    /**
     * 필수 요소 Validate 체크
     */
    const checkValidate = function (){
        const allInputAndSelectBoxes = document.querySelectorAll('input.require, select.require, textarea.require');
        try{
            allInputAndSelectBoxes.forEach(function(tab) {
                if(tab.value == ''){
                    alert(tab.title + '은(는) 필수 입력 항목입니다.');
                    tab.focus();
                    throw new Error(tab.title + '은(는) 필수 입력 항목입니다.');
                }
            });

        }catch (e) {
            console.log(e);
            return false;
        }
        return true;
    }

    /**
     * 해쉬태그 추가
     */
    const addHashTag = function (){
        const input = document.getElementById('srchHashTag');
        const tagWrap = document.getElementById('tagWrap');
        const srchHashTagVal = document.getElementById('srchHashTagVal');

        if(input.value == ''){
            return;
        }

        const newTag = document.createElement('span');
        newTag.className = 'tag';
        newTag.textContent = '#' + input.value.trim();

        const deleteBtn = document.createElement('button');
        deleteBtn.type = 'button';
        deleteBtn.className = 'tag-delete';
        deleteBtn.innerHTML = '<span class="blind">삭제</span>';
        deleteBtn.onclick = function (){
            removeTag(newTag);
        }

        newTag.appendChild(deleteBtn);
        tagWrap.insertBefore(newTag, tagWrap.lastElementChild);
        updateHiddenInput(srchHashTagVal, tagWrap);

        input.value = '';
    }

    /**
     * 해쉬태그 삭제
     * @param tag
     */
    const removeTag = function (tag) {
        const tagWrap = document.getElementById('tagWrap');
        const srchHashTagVal = document.getElementById('srchHashTagVal');

        tagWrap.removeChild(tag);
        updateHiddenInput(srchHashTagVal, tagWrap);
    }

    /**
     * 해쉬태그 hidden input 업데이트
     * @param hiddenInput
     * @param tagWrap
     */
    const updateHiddenInput = function (hiddenInput, tagWrap) {
        const tags = tagWrap.querySelectorAll('span.tag');
        let tagValues = [];
        tags.forEach(function (tag) {
            tagValues.push(tag.textContent.replace('#', '').trim());
        });
        hiddenInput.value = tagValues.join(':');
    }

    /**
     * 해쉬태그 초기화
     */
    const resetHashTag = function (){
        const tagWrap = document.getElementById('tagWrap');
        const srchHashTagVal = document.getElementById('srchHashTagVal');

        while (tagWrap.firstChild && tagWrap.firstChild !== tagWrap.lastChild) {
            tagWrap.removeChild(tagWrap.firstChild);
        }
        srchHashTagVal.value = '';
    }

    const goBack = function (){
        window.history.back();
    }
    
    //품질관리 유형 세렉트박스
    const listToSelectBox = async  function (url, selectBoxId, codeId, upperCodId, nullOptionText) {
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
                codeId: codeId,
                upperCodeId: upperCodId
            }).then(function (response) {
                console.log("cmmn_listToSelectBox : Data Success");

                if (response.data.length > 0) {
                    addOption("", "유형 선택"); 
                    response.data.forEach(item => addOption(item.codeId, item.codeNm));
                }
            }).catch(function (error) {
                console.error(error);
            });
        }
    };
    
    //산출물품질검사정보 조회
	const selectPrdctQltInspInfoList = function (){

    	var clrcsId = document.getElementById('clrcsId').value;
    	if(clrcsId == null || clrcsId == ""){
    		document.getElementById('qltList').innerHTML = '';
    		var rowHtml = '<tr><td colspan="7">조회된 데이터가 없습니다.</td></tr>';
	        const tableBody = document.getElementById('qltList');
		    tableBody.innerHTML += rowHtml;
			return;
		}

        axios.post(contextPath +'/dgtlMgt/selectPrdctQltInspInfoList.do',{
        	clrcsId: clrcsId
		}).then(function (response) {
			
			if (response.status === 200) {
				if(response.data.resultCode == 200){
					
					var rowCnt = response.data.resultData.length;
					document.getElementById('qltList').innerHTML = '';

					if(rowCnt > 0){
						//document.getElementById('qltProc').style.display = "none";
						document.getElementById('rowCnt').innerHTML = rowCnt;
					}else{
						document.getElementById('rowCnt').innerHTML = '0';
						
						var rowHtml = '<tr><td colspan="7">조회된 데이터가 없습니다.</td></tr>';
				        const tableBody = document.getElementById('qltList');
					    tableBody.innerHTML += rowHtml;
						return;
					}
					
					let seqNo = 1; 
					for (const item of response.data.resultData) {
						var rowHtml = '<tr><td>'+seqNo+'</td>' +
				        '<td>' + item.fileNm + '</td>' +
				        '<td>' + item.fileExtn + '</td>' +
						'<td><span class="tag">'+ item.artclStbltVal1+'</span></td>' +
						'<td><span class="tag">'+ item.artclStbltVal2+'</span></td>' +
						'<td><span class="tag">'+ item.artclStbltVal3+'</span></td>' +
						'<td>' +
						'<button type="button" class="btn-acctoggle" id="btnToggle_'+seqNo+'" onClick="toggleDetails('+seqNo+')">자세히</button>' +
						'</td></tr>' +
						'<tr class="acc-ele" id="dtlView_'+seqNo+'" style="display:none">' +
						'<td colspan="7">' +
						'	<table>' +
						'		<colgroup>' +
						'			<col width="30%"/><col width="*"/>' +
						'		</colgroup>' +
						'		<tr>' +
						'			<th>측정수치</th>' +
						'			<td>'+ item.msrmtVal1+'MB</td>' +
						'			<td>'+ item.msrmtVal2+'개</td>' +
						'			<td>'+ item.msrmtVal3+'개</td>' +
						'			<td></td>' +
						'		</tr>' +
						'		<tr>' +
						'			<th>판정기준</th>' +
						'			<td>'+ item.jgmtCrtrVal1+'MB '+item.jgmtCrtrTypeVal1+'</td>' +
						'			<td>'+ item.jgmtCrtrVal2+'개 '+item.jgmtCrtrTypeVal2+'</td>' +
						'			<td>'+ item.jgmtCrtrVal3+'개 '+item.jgmtCrtrTypeVal3+'</td>' +
						'			<td></td>' +
						'		</tr>' +
						'	</table>' +
						'</td>' +
						'</tr>';
					    const tableBody = document.getElementById('qltList');
					    tableBody.innerHTML += rowHtml;
				        seqNo++;
				    }
				}else{
					alert(response.data.resultData);
				} 
	        }
        }).catch(function (error) {
            console.error(error);
        });
	}
    
    //산출물품질검사정보 등록
	const insertPrdctQltInspInfo = function (){
		
		var clrcsId = document.getElementById('clrcsId').value;
    	if(clrcsId == null || clrcsId == ""){
			alert("등록된 파일이 없습니다. 파일등록 후 수행하세요.");
			return;
		}
		var prdctUsgCd = document.getElementById('prdctUsgCdVal').value;
		if(prdctUsgCd == null || prdctUsgCd == ""){
			alert("품질기준 유형을 선택해 주세요.");
			return;
		}
		
    	if(!confirm('산출물 품질검사를 수행하시겠습니까?')) return;
		
    	axios.post(contextPath +'/dgtlMgt/insertPrdctQltInspInfo.do',{
        	clrcsId: clrcsId,
        	prdctUsgCd: prdctUsgCd
		}).then(function (response) {
			if (response.status === 200) {
				if(response.data.resultCode == 200){
					var regCnt = response.data.resultData;
					if(regCnt > 0){
						alert("품질검사 데이터가 생성되었습니다.");
						//산출물품질검사정보 조회
						selectPrdctQltInspInfoList();
					}else{
						alert("생성될 파일 데이터가 없습니다.");
					}
				}else{
				alert(response.data.resultData);
			    } 
			}
	    }).catch(function (error) {
            console.error(error);
        });
	}
    
	const toggleDetails = function(seqNo){
        var detailsElement = document.getElementById('dtlView_' + seqNo);
        var buttonElement = document.getElementById('btnToggle_' + seqNo);

        if (detailsElement.style.display == 'none') {
            // 토글: 세부 정보 보이기
            detailsElement.style.display = 'table-row';
            buttonElement.textContent = '닫기';
        } else {
            // 토글: 세부 정보 감추기
            detailsElement.style.display = 'none';
            buttonElement.textContent = '자세히';
        }
    }
</script>