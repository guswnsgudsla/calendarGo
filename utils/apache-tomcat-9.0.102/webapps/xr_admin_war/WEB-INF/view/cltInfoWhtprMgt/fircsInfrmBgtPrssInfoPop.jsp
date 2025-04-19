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
         <h2>백서 목차 항목 - 1. 일반현황 > 2. 정보화 예산 현황 > 1) 재원별 정보화 예산</h2>
			<button type="button" class="btnClose" onclick="closeModal()">&nbsp;X&nbsp;</button>
		</div>
	</div>
	<!-- 백서아이디 -->
	<input type='hidden' value='<c:out value="${whtprId}" />' name='whtprId' id = 'whtprId'>
	<input type='hidden' value='<c:out value="${checkParam}" />' name='checkParam' id = 'checkParam'>
	<input type='hidden' value='<c:out value="${pblcnYr}" />' name='pblcnYr'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.authrtTypeCd}" />' name='authrtTypeCd'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.wrtAuthrtYn}" />' name='wrtAuthrtYn'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.mdfcnAuthrtYn}" />' name='mdfcnAuthrtYn'>
    <input type='hidden' value='<c:out value="${UserAuthrtInfo.delAuthrtYn}" />' name='delAuthrtYn'>
	<div class="table-wrap table-border">
		<div class="between">
			<span>(기준 : 만원)</span>
		   <c:if test="${UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<button type="button" class="btns" id="addrow">추가</button>
		   </c:if>
			<!-- <button type="button" class="btns color-gray" onclick="closeModal()">닫기</button> -->
		</div>
	 <div class="div-scroll"  style="height: 400px" id = "scroll">
	 <table>
		<colgroup>
			<col width="/">
		</colgroup>
		<thead>
			<tr>
				<th>구분연도</th>
				<th>국고예산금액</th>
				<th>기금예산금액</th>
				<th>기타예산금액</th>
				<th>예산합계금액</th>
			   <c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y'||UserAuthrtInfo.wrtAuthrtYn eq 'Y'||UserAuthrtInfo.delAuthrtYn eq 'Y'}">
				<th>수정/저장</th>
			   </c:if>
			</tr>
		</thead>
			<tbody id="typeInfrmBgtPrssInfoList"></tbody>
   	 </table>
    </div>
  </div>
</div>

<script>
  $(document).ready(function () {
	var authrtTypeCd = $('input[name="authrtTypeCd"]').val(); 
    var wrtAuthrtYn = $('input[name="wrtAuthrtYn"]').val();  //작성권한
    var mdfcnAuthrtYn = $('input[name="mdfcnAuthrtYn"]').val();  //수정권한 
    var delAuthrtYn = $('input[name="delAuthrtYn"]').val();  //삭제권한
	/* 유형별 정보화 예산 리스트(S) */
	//백서 아이디
	var whtprId = $('input[name="whtprId"]').val();
	//백서팝업코드
	var checkParam = $('input[name="checkParam"]').val();
    $.ajax({
      type: 'POST',
      url: contextPath + '/cltInfoWhtprMgt/fircsInfrmBgtPrssInfoList.do',
      dataType: 'json',
      data: { whtprId: whtprId,
    	  checkParam: checkParam
    	  },
    	  
      success: function (data) {
    	 //게시글 넣기전 초기화
        $("#typeInfrmBgtPrssInfoList").empty();
        //data가 없을때 기본으로 하나 생성
      if (data.length === 0) {
    	  var buttonsHtml = "";
   	     // wrtAuthrtYn 값이 Y일 경우에만 버튼 HTML 문자열 생성
   	     if (wrtAuthrtYn === 'Y') {
   	         buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>수정</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button><button type='button' id = 'rowDelete'  class='btns size-xsmall color-red'>삭제</button></td>";
   	     }
          var html = "<tr class='newRow'>"
              + "<td><div class='fm-ele'><input maxlength='4' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'stcfBgtAmt' name = 'stcfBgtAmt' class='editable' placeholder='국고예산금액' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'fundBgtAmt' name = 'fundBgtAmt' class='editable' placeholder='기금예산금액' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='예산합계' value=''readonly></div></td>"
              + buttonsHtml
              + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='B'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
              + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='D'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
              + "</tr>";
            $("#typeInfrmBgtPrssInfoList").append(html);
            toggleButtons($("#typeInfrmBgtPrssInfoList tr:last"), 'D');
        } else {
        //반복 포이치       	
        $.each(data, function (index, item) {
        	  var buttonsHtml = "";
              // 수정 권한과 삭제 권한 모두 있는 경우
              if (mdfcnAuthrtYn === 'Y' && delAuthrtYn === 'Y') {
                  buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>수정</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button><button type='button' id = 'rowDelete' class='btns size-xsmall color-red'>삭제</button></td>";
              }
              // 수정 권한은 있지만 삭제 권한은 없는 경우
              else if (mdfcnAuthrtYn === 'Y' && delAuthrtYn === 'N') {
                  buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>수정</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button></td>";
              }
              // 수정 권한은 없지만 삭제 권한은 있는 경우
              else if (mdfcnAuthrtYn === 'N' && delAuthrtYn === 'Y') {
                  buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>수정</button><button type='button' id = 'rowDelete' class='btns size-xsmall color-red'>삭제</button></td>";
              }
              else if (wrtAuthrtYn === 'N' && mdfcnAuthrtYn === 'N' && delAuthrtYn === 'N') {
            	  buttonsHtml = ""
              }
              else{
            	  buttonsHtml="<td></td>"
              }        	
          var html = "<tr>"
            + "<td><div class='fm-ele'><input maxlength='4' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value='" + item.seYr + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'stcfBgtAmt' name = 'stcfBgtAmt' class='editable' placeholder='국고예산금액' value='" + item.stcfBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'fundBgtAmt' name = 'fundBgtAmt' class='editable' placeholder='기금예산금액' value='" + item.fundBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타예산' value='" + item.etcBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='예산합계' value='" + item.bgtSumAmt + "'readonly></div></td>"
            + buttonsHtml
            + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='A'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
            + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='C'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
            + "</tr>";
            
          //typeInfrmBgtPrssInfoList에 넣기
          $("#typeInfrmBgtPrssInfoList").append(html);
       	  //위 동작 끝나면 toggleButtons 호출하고 buttonStatus값 C로 초기화
          toggleButtons($("#typeInfrmBgtPrssInfoList tr:last"), 'C');
        });
      }
      },
      error: function (error) {
      }
    });
    /* 유형별 정보화 예산 리스트(E) */
	/* 추가버튼(S) */
    $("#addrow").on("click", function () {  
      var html = "<tr class='newRow'>"
        + "<td><div class='fm-ele'><input maxlength='4' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'stcfBgtAmt' name = 'stcfBgtAmt' class='editable' placeholder='국고예산금액' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'fundBgtAmt' name = 'fundBgtAmt' class='editable' placeholder='기금예산금액' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='예산합계' value='' readonly  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><button type='button' id = 'modify' class='btns size-xsmall'>수정</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button><button type='button' id = 'rowDelete'  class='btns size-xsmall color-red'>삭제</button></td>"
        + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='B'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
        + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='D'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
        + "</tr>";
        
      $("#typeInfrmBgtPrssInfoList").append(html);
      
  	 //위 동작 끝나면 toggleButtons 호출하고 buttonStatus값 D로 초기화 (위치조정필요)
     toggleButtons($("#typeInfrmBgtPrssInfoList tr:last"), 'D');
  
  	 // 추가버튼 누르면 스크롤을 맨 아래로 이동
     $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
    });
    /* 추가버튼(E) */
    
    //수정버튼 클릭시
    $(document).on('click', '#modify', function () {
    	
    	//행선택
        var row = $(this).closest('tr');
    	
        //수정버튼 누르면 readonly 제거
        row.find('#stcfBgtAmt').prop('readonly', false);
        row.find('#fundBgtAmt').prop('readonly', false);
        row.find('#etcBgtAmt').prop('readonly', false);
        
     	//buttonStatus 값 변경(버튼 show/hide)
        row.find('#buttonStatus').val('D');
      	//전달
        toggleButtons(row, 'D');
      
      });
    
    //저장버튼 누르면 동작 생성
    $(document).on('click', '#modifysave', function () {
    	
   	//행선택
    var row = $(this).closest('tr');
  	//insertStatus 가져오기
    var insertStatus = row.find('#insertStatus').val();

    var paramSeYr = row.find('input[name="seYr"]').val();
    var stcfBgtAmt = row.find('input[name="stcfBgtAmt"]').val();
    var fundBgtAmt = row.find('input[name="fundBgtAmt"]').val();
    var etcBgtAmt = row.find('input[name="etcBgtAmt"]').val();
    var bgtSumAmt = row.find('input[name="bgtSumAmt"]').val();
    var whtprId = '${whtprId}';
    var checkParam = '${checkParam}';
    var pblcnYr = '${pblcnYr}';
    
	 /*  저장버튼 클릭시 insert/update (S) */
   	//동작 하기전 값 체크
	   	if (
	    paramSeYr.trim() === "" ||
	    stcfBgtAmt.trim() === "" ||
	    fundBgtAmt.trim() === "" ||
	    etcBgtAmt.trim() === "" ||
	    bgtSumAmt.trim() === "" 
	) {
	    alert("입력한 값을 확인해 주세요.");
	    return;
	}
   	
    /* A = update, B = insert */
    if (insertStatus === 'B') {
   		//신규등록 insert
    	var insertMoney = confirm("등록 하시겠습니까?");    
    	
    	if (insertMoney) {
    		/* 연도 유효성 체크 (S) */
		var isDuplicate = false;
		
		// 각 행의 seYr 값과 비교하여 중복 확인
			$("#typeInfrmBgtPrssInfoList input[name='seYr']").each(function () {
			    var existingSeYr = $(this).val();
			    
			    /* 신규 추가된 row 스킵 */
			    if ($(this).closest('tr').hasClass('newRow')) {
			        return true; // continue
			    }
			    
			    if (existingSeYr.trim().toLowerCase() === paramSeYr.trim().toLowerCase()) {
			        isDuplicate = true;
			        return false;
			    }
			});
			
		
			// 입력 연도가 pblcnYr보다 큰지 확인
	         if (parseInt(paramSeYr) > parseInt(pblcnYr)) {
	        	 alert("백서의 발행년도인 "+ pblcnYr +"년을 초과하여 입력할 수 없습니다.");
	             return;
	         }
		
			if (isDuplicate) {
			    alert(paramSeYr + "년은 이미 등록되어 있습니다.");
			    return;
			}
    
   		/* 연도 유효성 체크 (E) */
   		
       	/* 데이터 등록 (S) */
        $.ajax({
            type: 'POST',
            url: contextPath + '/cltInfoWhtprMgt/whtprPopInsert.do',
		    data: {
			        paramSeYr: paramSeYr,
			        stcfBgtAmt: stcfBgtAmt,
			        fundBgtAmt: fundBgtAmt,
			        etcBgtAmt: etcBgtAmt,
			        bgtSumAmt: bgtSumAmt,
			        whtprId: whtprId,
			        checkParam: checkParam
		    },
            success: function (response) {
                // 성공 시 처리
                alert('수정이 완료되었습니다.', response);
                row.find('#insertStatus').val('A');
                row.find('#buttonStatus').val('C');
                moveOpenPopWhtprInfo(checkParam, pblcnYr);
            },
            error: function (status) {
                // 실패 시 처리
                console.error('에러 발생:', status);
                alert('서버 담당자에게 문의 바랍니다.');
            }
        });     
        /* 데이터 등록 (E) */
       }
    	
    	
    } else if (insertStatus === 'A') {
    	
        var updateMoney = confirm("저장 하시겠습니까?");
		
    	//저장여부 확인
        if (updateMoney) {
        	/* 업데이트 (S) */
	        $.ajax({
	            type: 'POST',
	            url: contextPath + '/cltInfoWhtprMgt/whtprPopSave.do',
			    data: {
				        paramSeYr: paramSeYr,
				        stcfBgtAmt: stcfBgtAmt,
				        fundBgtAmt: fundBgtAmt,
				        etcBgtAmt: etcBgtAmt,
				        bgtSumAmt: bgtSumAmt,
				        whtprId: whtprId,
				        checkParam: checkParam
			    },
	            success: function (response) {
	                // 성공 시 처리
	                alert('수정이 완료되었습니다.', response);
	                row.find('#buttonStatus').val('C');
	                toggleButtons(row, 'C');
	                
	            },
	            error: function (status) {
	                // 실패 시 처리
	                console.error('에러 발생:', status);
	                alert('서버 담당자에게 문의 바랍니다.');
	            }
	        });     
	        /* 업데이트 (E) */
        }
    }
    /* insert/update (E) */
    
        row.find('#seYr').prop('readonly', true);
        row.find('#stcfBgtAmt').prop('readonly', true);
        row.find('#fundBgtAmt').prop('readonly', true);
        row.find('#etcBgtAmt').prop('readonly', true);
        row.find('#bgtSumAmt').prop('readonly', true);
        
      });
    /* delete (S) */
    //삭제버튼
    $(document).on('click', '#rowDelete', function () {
        var row = $(this).closest('tr');
		
        var whtprId = '${whtprId}';
        var checkParam = '${checkParam}';
        var seYr = row.find('input[name="seYr"]').val();
        
		//값 확인        
        console.log("whtprId = " + whtprId);
        console.log("seYr = " + seYr);

        var userConfirmed = confirm("삭제 하시겠습니까?");
        if (userConfirmed) {
 			console.log("삭제!");
 			
		/* Delete Ajax (S) */
 			 $.ajax({
			    type: 'GET',
			    url: contextPath + '/cltInfoWhtprMgt/deleteWhtprPop.do',
			    data: {whtprId: whtprId, seYr: seYr, checkParam: checkParam},
			    success: function (data, textStatus, xhr) {
			        // 성공 시 처리
			    alert("삭제되었습니다.");
			    row.remove();
			
			    },
			    error: function (xhr, textStatus, errorThrown) {
			        // 실패 시 처리
			        alert("담당자에게 문의바랍니다.");
			
			        // 응답 코드 확인
			    }
			});

 		/* Delete Ajax (E) */
 			
        }
    });
    /* delete (E) */
    
	// buttonStatus 에 따라서 버튼 show/hide
    function toggleButtons(row, buttonStatus, insertStatus) {
        if (buttonStatus === 'C') {
            row.find('#modify').show();
            row.find('#modifysave').hide();
            row.find('#rowDelete').hide();
        } else if (buttonStatus === 'D') {
            row.find('#modify').hide();
            row.find('#modifysave').show();
            row.find('#rowDelete').show();
        }
    }
	//input에 값이 입력될대마다.
    $(document).on('input', '#typeInfrmBgtPrssInfoList input[class^="editable"]', function () {
    	calculateTotalRowMoney();
    });

	function calculateTotalRowMoney() {
		//값 초기화	
	    var totalRowMoney = 0;

	    // 각 행에 대한 계산
	   $('#typeInfrmBgtPrssInfoList tr').each(function () {
	        var stcfBgtAmt = parseFloat($(this).find('input[name="stcfBgtAmt"]').val()) || 0;
	        var fundBgtAmt = parseFloat($(this).find('input[name="fundBgtAmt"]').val()) || 0;
	        var etcBgtAmt = parseFloat($(this).find('input[name="etcBgtAmt"]').val()) || 0;

	        var rowTotal = stcfBgtAmt + fundBgtAmt + etcBgtAmt;

	        $(this).find('input[name="bgtSumAmt"]').val(rowTotal.toFixed());

	        totalRowMoney += rowTotal;
	    });
	    
	    // 전체 합계 업데이트
	    //totalRowMoney.toFixed())는 해당 요소의 텍스트 내용을 지정한 값으로 설정
	    $('#totalRowMoney').text(totalRowMoney.toFixed());
	}
    
  });
  
  // 모달창 닫는 함수
  function closeModal() {
    admin.modalsClose('modals');
    location.reload();
  }

</script>
