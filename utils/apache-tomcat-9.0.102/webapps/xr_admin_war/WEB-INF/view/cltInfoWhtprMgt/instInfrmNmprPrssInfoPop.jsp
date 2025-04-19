<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">

<!-- 유형별 정보화 예산 -->
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>백서 목차 항목 - 1. 일반현황 > 1.정보화 및 정보보호 인력현황 > 3) 기관별 현황</h2>
			<button type="button" class="btnClose" onclick="closeModal()">&nbsp;X&nbsp;</button>
		</div>
	</div>
	<!-- 백서아이디 -->
	<input type='hidden' value='<c:out value="${whtprId}" />' name='whtprId' id = 'whtprId'>
	<input type='hidden' value='<c:out value="${checkParam}" />' name='checkParam' id = 'checkParam'>
	<input type='hidden'   id='insertStatus' name='insertStatus' value = 'B'> <!-- 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert --> 
	<input type='hidden'  id='buttonStatus' name='buttonStatus' value = 'C'> <!--  버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D --> 
	<input type='hidden' id = 'totInstCnt' name = 'totInstCnt'  value = ''>
	<input type='hidden' id = "infrmAvgRt" name = "infrmAvgRt"   value = "<c:out value='${instView.infrmAvgRt}'/>">
	<input type='hidden' id = "infscrAvgRt" name = "infscrAvgRt"  value = "<c:out value='${instView.infscrAvgRt}'/>"  >
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.authrtTypeCd}" />' name='authrtTypeCd'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.wrtAuthrtYn}" />' name='wrtAuthrtYn'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.mdfcnAuthrtYn}" />' name='mdfcnAuthrtYn'>
	<div class="table-wrap table-border">
		<table>
			<thead>
				<tr>
					<th colspan="2">정보화 인력 비율별 기관 수 </th>
					<th colspan="2">정보화 인력 대비 정보보호 인력 비율별 기관 수 </th>
				</tr>
				<tr>
					<th>구분</th>
					<th>기관 수</th>
					<th>구분</th>
					<th>기관 수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>평균이상 ( <div class='fm-ele' data-size="w100"><input id = 'infrm1' name = 'infrm1' value = "<c:out value='${instView.infrmAvgRt}'/>" type='text'   readonly></div>% 이상)</td>
					<td><div class='fm-ele'><input maxlength='5' type='text' value = "<c:out value='${instView.infrmAvgMrtInstCnt}'/>" id = 'infrmAvgMrtInstCnt' name = 'infrmAvgMrtInstCnt' class='' placeholder='0' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>
					<td>평균이상 ( <div class='fm-ele' data-size="w100"><input id = 'infscr1' name = 'infscr1' value = "<c:out value='${instView.infscrAvgRt}'/>" type='text' readonly></div>% 이상)</td>
					<td><div class='fm-ele'><input maxlength='5'  type='text' value = "<c:out value='${instView.infscrAvgMrtInstCnt}'/>" id = 'infscrAvgMrtInstCnt' name = 'infscrAvgMrtInstCnt' class='' placeholder='0' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>
				</tr>
				<tr>
					<td>평균미만 ( <div class='fm-ele' data-size="w100"><input id = 'infrm2' name = 'infrm2' value = "<c:out value='${instView.infrmAvgRt}'/>" type='text'  readonly></div>% 미만)</td>					<td><div class='fm-ele'><input maxlength='5' type='text' value = "<c:out value='${instView.infrmAvgUndrInstCnt}'/>" id = 'infrmAvgUndrInstCnt' name = 'infrmAvgUndrInstCnt' class='' placeholder='0' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>
					<td>평균미만 ( <div class='fm-ele' data-size="w100"><input id = 'infscr2' name = 'infscr2' value = "<c:out value='${instView.infscrAvgRt}'/>" type='text'  readonly></div>% 미만)</td>
					<td><div class='fm-ele'><input maxlength='5' type='text'  value = "<c:out value='${instView.infscrAvgUndrInstCnt}'/>" id = 'infscrAvgUndrInstCnt' name = 'infscrAvgUndrInstCnt' class='' placeholder='0' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th>총계</th>
					<td><div class='fm-ele'><input type='text' id = 'infrmSum' name = 'infrmSum' class='' placeholder='infrmSum' value='' readonly></div></td>
					<th>총계</th>
					<td><div class='fm-ele'><input type='text' id = 'infscrSum' name = 'infscrSum' class='' placeholder='infscrSum' value='' readonly></div></td>
				</tr>

			</tfoot>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" onclick="closeModal()">닫기</button>
		<button type="button" class="btns" id ='modify' >수정</button>
		<button type="button" class="btns color-orange" id = 'modifysave' >저장</button>
	</div>
	</div>
</div>
<script>
$(document).ready(function () {
	
	//페이지 로드시 % 형식 적용
	formatInputValuesOnLoad();
	//페이지 로드시 버튼 상태에 따라서 수정 및 등록 버튼 show/hide
	toggleButtons();
	  
		
    //정보화 인력 비율별 기관 수 합
    updateInfrmSum();
    //정보화 인력 대비 정보보호 인력 비율별 기관 수 합
    updateInfscrSum();
    // updateInfrmSum의 값과 updateInfscrSum의 값이 비교 후 값이 같으면 전체 기관수 값 넣음 
    updateSumValues();
	  
    $('#infrmAvgMrtInstCnt, #infrmAvgUndrInstCnt').on('input', updateInfrmSum);
    // 정보화 인력 대비 정보보호 인력 비율별 기관 수 합
    $('#infscrAvgMrtInstCnt, #infscrAvgUndrInstCnt').on('input', updateInfscrSum);
    
	// 수정버튼 클릭시
    $(document).on('click', '#modify', function () {
        // 수정 버튼 클릭 시 buttonStatus를 'A'로 변경
        buttonStatus = 'D';
        $('input[name="buttonStatus"]').val(buttonStatus);
        //readonly false
        $('#infrm1, #infrm2, #infscr1, #infscr2, #infrmAvgMrtInstCnt, #infscrAvgMrtInstCnt, #infrmAvgUndrInstCnt, #infscrAvgUndrInstCnt').prop('readonly', false);
        toggleButtons();
    });
	// 저장버튼 클릭시
    $(document).on('click', '#modifysave', function () {
        // 저장 버튼 클릭 시 buttonStatus를 'B'로 변경
        //buttonStatus = 'C';
        //$('input[name="buttonStatus"]').val(buttonStatus);
        
		/* 전체 기관 수 */
	    var totInstCnt = $('#totInstCnt').val();
	   	/* 정보화 인력 비율별 기관 % */
	    var infrmAvgRt = $('#infrmAvgRt').val();
	   	/* 정보화 인력 대비 정보보호 인력 비율별 기관% */
	    var infscrAvgRt = $('#infscrAvgRt').val();
	   	/* 정보화 인력 비율별 기관 수 평균이상 */
	    var infrmAvgMrtInstCnt = $('#infrmAvgMrtInstCnt').val();
	    /* 정보화 인력 비율별 기관 수 평균이하 */
	    var infrmAvgUndrInstCnt = $('#infrmAvgUndrInstCnt').val();
	   	/* 정보화 인력 대비 정보보호 인력 비율별 기관 수 평균이상 */
	    var infscrAvgMrtInstCnt = $('#infscrAvgMrtInstCnt').val();
	    /* 정보화 인력 대비 정보보호 인력 비율별 기관 수 평균이하 */
	    var infscrAvgUndrInstCnt = $('#infscrAvgUndrInstCnt').val();
	    
	    var checkParam = $('#checkParam').val();
	    var whtprId = $('#whtprId').val();
	    
	    /* 저장버튼 클릭시 insert/update (S) */
	    // 동작 하기전 값 체크
	    if (infrmAvgRt.trim() === "" || infscrAvgRt.trim() === "" || infrmAvgMrtInstCnt.trim() === "" || infrmAvgUndrInstCnt.trim() === "" || infscrAvgMrtInstCnt.trim() === "" || infscrAvgUndrInstCnt.trim() === "" ) {
	        alert("입력한 값을 확인 해주세요.");
	        return;
	    } 
	    
	    // totInstCnt 값 체크
	    if (totInstCnt.trim() === "") {
	        alert("정보화 인력 비율별 기관 수의 합과 정보화 인력 대비 정보보호 인력 비율별 기관 수 합이 같아야 합니다.");
	        return;
	    }
	    
	    
	var insertStatusValue = $('input[name="insertStatus"]').val();
	
	/* A = update, B = insert */
	if (insertStatusValue === 'B') {
	    // 신규 등록 insert
	    var insertData = confirm("등록 하시겠습니까?");
	    	
	    if (insertData) {
	    	
		    $.ajax({
		        type: 'POST',
		        url:  contextPath + '/cltInfoWhtprMgt/whtprPopInsert.do',
			    data: {
				        checkParam: checkParam,
				        whtprId: whtprId,
				        totInstCnt: totInstCnt,
				        infrmAvgRt: infrmAvgRt,
				        infrmAvgMrtInstCnt: infrmAvgMrtInstCnt,
				        infrmAvgUndrInstCnt: infrmAvgUndrInstCnt,
				        infscrAvgRt: infscrAvgRt,
				        infscrAvgMrtInstCnt: infscrAvgMrtInstCnt,
				        infscrAvgUndrInstCnt: infscrAvgUndrInstCnt
				        
			    },
		        success: function (status) {
		            // 성공 시 처리
		            alert('등록이 완료되었습니다.', status);
		            
		            $('#infrm1, #infrm2, #infscr1, #infscr2, #infrmAvgMrtInstCnt, #infscrAvgMrtInstCnt, #infrmAvgUndrInstCnt, #infscrAvgUndrInstCnt').prop('readonly', true);
		            
		            buttonStatus = 'C';
		            $('input[name="buttonStatus"]').val(buttonStatus);
		            toggleButtons();
		        },
		        error: function (status) {
		            // 실패 시 처리
		            alert('담당자에게 문의 바랍니다.');
		        }
		    });  
	    }
	} else if (insertStatusValue === 'A') {
	    var updateData = confirm("저장 하시겠습니까?");
	    
	    // 저장 여부 확인
	    if (updateData) {
	    	
		    $.ajax({
	        type: 'POST',
	        url:  contextPath +'/cltInfoWhtprMgt/whtprPopSave.do',
		    data: {
		        checkParam: checkParam,
		        whtprId: whtprId,
		        totInstCnt: totInstCnt,
		        infrmAvgRt: infrmAvgRt,
		        infrmAvgMrtInstCnt: infrmAvgMrtInstCnt,
		        infrmAvgUndrInstCnt: infrmAvgUndrInstCnt,
		        infscrAvgRt: infscrAvgRt,
		        infscrAvgMrtInstCnt: infscrAvgMrtInstCnt,
		        infscrAvgUndrInstCnt: infscrAvgUndrInstCnt
		    },
	        success: function (status) {
	            // 성공 시 처리
	            alert('수정이 완료되었습니다.', status);
	            
	            $('#infrm1, #infrm2, #infscr1, #infscr2, #infrmAvgMrtInstCnt, #infscrAvgMrtInstCnt, #infrmAvgUndrInstCnt, #infscrAvgUndrInstCnt').prop('readonly', true);
	            
	            buttonStatus = 'C';
	            $('input[name="buttonStatus"]').val(buttonStatus);
	            toggleButtons();
	            
	        },
	        error: function (status) {
	            // 실패 시 처리
	            alert('담당자에게 문의 바랍니다.');
	        }
	    });  
	    
	        
	    }
	}
    });
	
 	//초기 buttonStatus 값에 따라 버튼 상태 설정
    toggleButtons();
	//버튼 보이고 숨기기
    function toggleButtons() {
        var buttonStatus = $('input[name="buttonStatus"]').val();

        if (buttonStatus === 'C') {
            $('#modify').show();
            $('#modifysave').hide();
        } else if (buttonStatus === 'D') {
            $('#modify').hide();
            $('#modifysave').show();
        } else if (buttonStatus === 'E') {
            // 'E' 상태일 때 모든 버튼 숨기기
            $('#modify, #modifysave').hide();
        }
    }
    
    // 정보화 인력 비율별 기관 수의 총합과 정보화 인력 대비 정보보호 인력 비율별 기관 수의 총합이 같을 때 전체 기관 수 생성
    $('#infrmAvgMrtInstCnt, #infrmAvgUndrInstCnt, #infscrAvgMrtInstCnt, #infscrAvgUndrInstCnt').on('input', function () {
        updateSumValues();
    });
    
    
	  $('#infrm1, #infrm2, #infscr1, #infscr2').on('input', function () {
	        var value = $(this).val();

	        // 정수 또는 소수점 이하 두 자리까지만 허용
	        if (/^\d+(\.\d{0,2})?$/.test(value)) {
	            // 소수점 처리
	            var floatValue = parseFloat(value);
	            if (isNaN(floatValue) || floatValue < 0) {
	                $(this).val('');
	            } else if (floatValue > 100) {
	                // 100을 넘는 경우 100으로 고정
	                $(this).val('100');
	            } else {
	                // 소수점 이하 두 자리까지 허용, 소수점 이하가 없는 경우 .00 추가하지 않음
	                var formattedValue = value.includes('.') ? value : floatValue % 1 === 0 ? floatValue.toFixed(0) : floatValue.toFixed(2);
	                // 입력이 .00인 경우 .00 제거
	                $(this).val(formattedValue.endsWith('.00') ? formattedValue.slice(0, -3) : formattedValue);
	            }
	        } else {
	            // 올바르지 않은 형식의 경우 값 초기화
	            $(this).val('');
	        }
	    });
	  
	  $('#infrm1').on('input', function () {
	        // infrm1의 값 가져오기
	        var infrm1Value = $(this).val();
	        // infrm1의 값이 유효한지 확인
	        if (/^\d+(\.\d{0,2})?$/.test(infrm1Value)) {
	            // 유효한 경우 infrm2의 값을 업데이트
	            $('#infrm2').val(infrm1Value);
	            $('#infrmAvgRt').val(infrm1Value);
	        } else {
	            // 올바르지 않은 형식의 경우 값 초기화
	            $('#infrm2').val('');
	            $('#infrmAvgRt').val('');
	        }
	    });
	  $('#infrm2').on('input', function () {
	        // infrm1의 값 가져오기
	        var infrm2Value = $(this).val();
	        // infrm1의 값이 유효한지 확인
	        if (/^\d+(\.\d{0,2})?$/.test(infrm2Value)) {
	            // 유효한 경우 infrm2의 값을 업데이트
	            $('#infrm1').val(infrm2Value);
	            $('#infrmAvgRt').val(infrm2Value);
	        } else {
	            // 올바르지 않은 형식의 경우 값 초기화
	            $('#infrm1').val('');
	            $('#infrmAvgRt').val('');
	        }
	    });
	  $('#infscr1').on('input', function () {
	        // infrm1의 값 가져오기
	        var infscr1Value = $(this).val();
	        // infrm1의 값이 유효한지 확인
	        if (/^\d+(\.\d{0,2})?$/.test(infscr1Value)) {
	            // 유효한 경우 infrm2의 값을 업데이트
	            $('#infscr2').val(infscr1Value);
	            $('#infscrAvgRt').val(infscr1Value);
	        } else {
	            // 올바르지 않은 형식의 경우 값 초기화
	            $('#infscr2').val('');
	            $('#infscrAvgRt').val('');
	        }
	    });
	  $('#infscr2').on('input', function () {
	        // infrm1의 값 가져오기
	        var infscr2Value = $(this).val();
	        // infrm1의 값이 유효한지 확인
	        if (/^\d+(\.\d{0,2})?$/.test(infscr2Value)) {
	            // 유효한 경우 infrm2의 값을 업데이트
	            $('#infscr1').val(infscr2Value);
	            $('#infscrAvgRt').val(infscr2Value);
	        } else {
	            // 올바르지 않은 형식의 경우 값 초기화
	            $('#infscr1').val('');
	            $('#infscrAvgRt').val('');
	        }
	    });
	  
	
});

function formatInputValuesOnLoad() {
    $('#infrm1, #infrm2, #infscr1, #infscr2, #infrmAvgRt, #infscrAvgRt').each(function () {
        var value = $(this).val();

        if (/^\d+(\.\d{0,2})?$/.test(value)) {
            var floatValue = parseFloat(value);
            var formattedValue = value.includes('.') ? value : floatValue % 1 === 0 ? floatValue.toFixed(0) : floatValue.toFixed(2);

            $(this).val(formattedValue.endsWith('.00') ? formattedValue.slice(0, -3) : formattedValue);
        } else {
            $(this).val('');
        }
    });
    
    var avgMrtInstCnt = $('#infrmAvgMrtInstCnt').val();
    var avgUndrInstCnt = $('#infrmAvgUndrInstCnt').val();
    var infscrAvgMrtInstCnt = $('#infscrAvgMrtInstCnt').val();
    var infscrAvgUndrInstCnt = $('#infscrAvgUndrInstCnt').val();
	
    //저장시 insert 나 update를 위한 값 변경
    if (avgMrtInstCnt && avgUndrInstCnt && infscrAvgMrtInstCnt && infscrAvgUndrInstCnt) {
        $('input[name="insertStatus"]').val('A');
    }
  
    // insertStatus와 wrtAuthrtYn의 값을 JavaScript 변수로 저장
    var insertStatus = $('#insertStatus').val();
    var wrtAuthrtYn = $('input[name="wrtAuthrtYn"]').val();  //작성권한
    var mdfcnAuthrtYn = $('input[name="mdfcnAuthrtYn"]').val();  //수정권한 
    // 조건에 따라 버튼을 숨기거나 보이게 처리
    if ((insertStatus === 'A' && mdfcnAuthrtYn !== 'Y') || (insertStatus === 'B' && wrtAuthrtYn !== 'Y')) {
    	
    	$('input[name="buttonStatus"]').val('E');
	}
}


	
	
//정보화 인력 비율별 기관 수 합
function updateInfrmSum() {
    var avgMrtValue = parseFloat($('#infrmAvgMrtInstCnt').val()) || 0;
    var avgUndrValue = parseFloat($('#infrmAvgUndrInstCnt').val()) || 0;
    var sumValue = avgMrtValue + avgUndrValue;

    $('#infrmSum').val(sumValue.toFixed());
}
//정보화 인력 대비 정보보호 인력 비율별 기관 수 합
function updateInfscrSum() {
    var avgMrtValue = parseFloat($('#infscrAvgMrtInstCnt').val()) || 0;
    var avgUndrValue = parseFloat($('#infscrAvgUndrInstCnt').val()) || 0;
    var sumValue = avgMrtValue + avgUndrValue;

    $('#infscrSum').val(sumValue.toFixed());
}
	

// infrmSum 값이 infscrSum 값과 동일할 때 totInstCnt에 동일한 값을 넣어줌
function updateSumValues() {
    var infrmSumValue = parseFloat($('#infrmSum').val()) || 0;
    var infscrSumValue = parseFloat($('#infscrSum').val()) || 0;

    if (infrmSumValue === infscrSumValue) {
        $('#totInstCnt').val(infrmSumValue.toFixed());
    } else {
        $('#totInstCnt').val('');
    }
}


    // 모달창 닫는 함수
    function closeModal() {
        admin.modalsClose('modals');
        location.reload();
    }
</script>
