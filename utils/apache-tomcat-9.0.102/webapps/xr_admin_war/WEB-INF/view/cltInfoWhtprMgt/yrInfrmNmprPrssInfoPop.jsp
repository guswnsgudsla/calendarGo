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
         <h2>백서 목차 항목 - 1. 일반현황 > 1. 정보화 및 정보보호 인력현황 > 1) 연도별 현황 </h2>
         <button type="button" class="btnClose" onclick="closeModal()">&nbsp;X&nbsp;</button>
      </div>
   </div>   
   <!-- 백서아이디 -->
   <input type='hidden' value='<c:out value="${whtprId}" />' name='whtprId'>
   <input type='hidden' value='<c:out value="${checkParam}" />' name='checkParam'>
   <input type='hidden' value='<c:out value="${pblcnYr}" />' name='pblcnYr'>
   <input type='hidden' value='<c:out value="${UserAuthrtInfo.authrtTypeCd}" />' name='authrtTypeCd'>
   <input type='hidden' value='<c:out value="${UserAuthrtInfo.wrtAuthrtYn}" />' name='wrtAuthrtYn'>
   <input type='hidden' value='<c:out value="${UserAuthrtInfo.mdfcnAuthrtYn}" />' name='mdfcnAuthrtYn'>
   <input type='hidden' value='<c:out value="${UserAuthrtInfo.delAuthrtYn}" />' name='delAuthrtYn'>
   <div class="btn-wrap mt0">
    <c:if test="${UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
     <button type="button" class="btns" id="addrow">추가</button>
    </c:if>
   </div>
   <div class="table-wrap table-border">
    <div class="div-scroll" style="height: 400px; " id = "scroll">
     <table>
      <colgroup>
         <col width="/">
      </colgroup>
      <thead>
         <tr>
            <th>입력연도</th>
            <th>본부</th>
            <th>소속기관</th>
            <th>공공기관</th>
            <th>계</th>
            <th>기관수</th>
           <c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y'||UserAuthrtInfo.wrtAuthrtYn eq 'Y'||UserAuthrtInfo.delAuthrtYn eq 'Y'}">
            <th>수정/저장</th>
           </c:if>
         </tr>
      </thead>
      <tbody id="yrInfrmNmprPrssInfoList"></tbody>
     </table>
    </div>
 </div>
</div>

<script>
  $(document).ready(function () {
	  
   var wrtAuthrtYn = $('input[name="wrtAuthrtYn"]').val();  //작성권한
   var mdfcnAuthrtYn = $('input[name="mdfcnAuthrtYn"]').val();  //수정권한 
   var delAuthrtYn = $('input[name="delAuthrtYn"]').val();  //삭제권한
   /* 유형별 정보화 예산 리스트(S) */
   //백서 발행 연도
   var pblcnYr = $('input[name="pblcnYr"]').val();
   
   //백서 아이디
   var whtprId = $('input[name="whtprId"]').val();
   //백서팝업코드
   var checkParam = $('input[name="checkParam"]').val();
    $.ajax({
      type: 'POST',
      url: contextPath+"/cltInfoWhtprMgt/yrInfrmNmprPrssInfoList.do",
      dataType: 'json',
      data: { whtprId: whtprId,
         checkParam: checkParam,
         },
         
      success: function (data) {
        //게시글 넣기전 초기화
        $("#yrInfrmNmprPrssInfoList").empty();
        //data가 없을때 기본으로 하나 생성
      if (data.length === 0) {
    	  var buttonsHtml = "";
  	     // authrtTypeCd 값이 USERTY0001일 경우에만 버튼 HTML 문자열 생성
  	     if (wrtAuthrtYn === 'Y') {
  	         buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>등록</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button></td><button type='button' id = 'rowDelete'  class='btns size-xsmall color-red'>삭제</button></td>";
  	     }
         /* 숫자만 입력 onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' */
          var html = "<tr class='newRow'>"
              + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='입력연도' value='' maxlength='4' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div><span>년</span></td>"
              + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'hqNope' name = 'hqNope' class='editable' placeholder='본부' value='' maxlength='10' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'ogdpInstNope' name = 'ogdpInstNope' class='editable' placeholder='소속기관' value='' maxlength='10' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'pblcInstNope' name = 'pblcInstNope' class='editable' placeholder='공공기관' value='' maxlength='10' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'totalSum' name = 'totalSum' class='editable' placeholder='예산합계' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
              + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'instCnt' name = 'instCnt' class='editable' placeholder='기관수' value='' maxlength='10' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div><span>개 기관</span></td>"
              + buttonsHtml 
              + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='B'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
              + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='D'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
              + "</tr>";
              
            $("#yrInfrmNmprPrssInfoList").append(html);
            toggleButtons($("#yrInfrmNmprPrssInfoList tr:last"), 'C');
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
            + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='입력연도'  maxlength='4' value='" + item.seYr + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div>년</td>"
            + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'hqNope' name = 'hqNope' class='editable' placeholder='본부' maxlength='10' value='" + item.hqNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'ogdpInstNope' name = 'ogdpInstNope' class='editable' placeholder='소속기관' maxlength='10' value='" + item.ogdpInstNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'pblcInstNope' name = 'pblcInstNope' class='editable' placeholder='공공기관' maxlength='10' value='" + item.pblcInstNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'totalSum' name = 'totalSum' class='editable' placeholder='예산합계' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'instCnt' name = 'instCnt' class='editable' placeholder='기관수' maxlength='10' value='" + item.instCnt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div>개 기관</td>"
            + buttonsHtml 
            + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='A'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
            + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='C'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
            + "</tr>";
            
          //yrInfrmNmprPrssInfoList에 넣기  
          $("#yrInfrmNmprPrssInfoList").append(html);
            //위 동작 끝나면 toggleButtons 호출하고 buttonStatus값 C로 초기화 (위치조정필요)
          toggleButtons($("#yrInfrmNmprPrssInfoList tr:last"), 'C');
            
          calculateValue();  
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
        + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='입력연도' maxlength='4' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div><span>년</span></td>"
        + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'hqNope' name = 'hqNope' class='editable' placeholder='본부' maxlength='10' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div></td>"
        + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'ogdpInstNope' name = 'ogdpInstNope' class='editable' placeholder='소속기관' maxlength='10' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'pblcInstNope' name = 'pblcInstNope' class='editable' placeholder='공공기관' maxlength='10' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele' data-size='100p'><input type='text' id = 'totalSum' name = 'totalSum' class='editable' placeholder='예산합계'  value='' readonly  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele' data-size='w100'><input type='text' id = 'instCnt' name = 'instCnt' class='editable' placeholder='기관수' maxlength='10' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div><span>개 기관</span></td>"
        + "<td><button type='button' id = 'modify' class='btns'>등록</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button><button type='button' id = 'rowDelete'  class='btns size-xsmall color-red'>삭제</button></td>"
        + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='B'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
        + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='D'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
        + "</tr>";
        
      $("#yrInfrmNmprPrssInfoList").append(html);
      
      //위 동작 끝나면 toggleButtons 호출하고 buttonStatus값 D로 초기화 (위치조정필요)
     toggleButtons($("#yrInfrmNmprPrssInfoList tr:last"), 'D');
  
      // 추가버튼 누르면 스크롤을 맨 아래로 이동
     $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
    });
    /* 추가버튼(E) */
    
    //수정버튼 클릭시
    $(document).on('click', '#modify', function () {
       
       //행선택
        var row = $(this).closest('tr');
       
        //수정버튼 누르면 readonly 제거
        //row.find('#seYr').prop('readonly', false);
        row.find('#hqNope').prop('readonly', false);
        row.find('#ogdpInstNope').prop('readonly', false);
        row.find('#pblcInstNope').prop('readonly', false);
        row.find('#instCnt').prop('readonly', false);
        
        //buttonStatus 값 변경(버튼 show/hide)
        row.find('#buttonStatus').val('D');
         //전달
        toggleButtons(row, 'D');
      
      });
    
    //저장버튼 누르면 동작 생성
    $(document).off('click', '#modifysave').on('click', '#modifysave', function () {
       
      //행선택
    var row = $(this).closest('tr');
     //insertStatus 가져오기
    var insertStatus = row.find('#insertStatus').val();
    
    var paramSeYr = row.find('input[name="seYr"]').val();
    var hqNope = row.find('input[name="hqNope"]').val();
    var ogdpInstNope = row.find('input[name="ogdpInstNope"]').val();
    var pblcInstNope = row.find('input[name="pblcInstNope"]').val();
    var instCnt = row.find('input[name="instCnt"]').val();
    var totalSum = row.find('input[name="totalSum"]').val();
    var whtprId = '${whtprId}';
    var checkParam = '${checkParam}';
    
    /*  저장버튼 클릭시 insert/update (S) */
      //동작 하기전 값 체크
         if (
       paramSeYr.trim() === "" ||
       hqNope.trim() === "" ||
       ogdpInstNope.trim() === "" ||
       pblcInstNope.trim() === "" ||
       instCnt.trim() === "" ||
       totalSum.trim() === "" 
   ) {
       alert("입력한 값을 확인해 주세요.");
       return;
   }
      
      
      
    /* A = update, B = insert */
    if (insertStatus === 'B') {
         //신규등록 insert
       var insertValue = confirm("등록 하시겠습니까?");    
       
       if (insertValue) {
          /* 연도 유효성 체크 (S) */
      var isDuplicate = false;
      
      // 각 행의 seYr 값과 비교하여 중복 확인
         $("#yrInfrmNmprPrssInfoList input[name='seYr']").each(function () {
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
         
         if (isDuplicate) {
             alert(paramSeYr + "년은 이미 등록되어 있습니다.");
             return;
         }
    
         // 입력 연도가 pblcnYr보다 큰지 확인
         if (parseInt(paramSeYr) > parseInt(pblcnYr)) {
        	 alert("입력 년도는 해당 백서의 발행년도인 "+pblcnYr+"년을 초과하여 입력할 수 없습니다.");
             return;
         }
         
         /* 연도 유효성 체크 (E) */
         
          /* 데이터 등록 (S) */
        $.ajax({
            type: 'POST',
            url: contextPath+"/cltInfoWhtprMgt/whtprPopInsert.do",
          data: {
                 paramSeYr: paramSeYr,
                 hqNope: hqNope,
                 ogdpInstNope: ogdpInstNope,
                 pblcInstNope: pblcInstNope,
                 instCnt: instCnt,
                 whtprId: whtprId,
                 checkParam: checkParam
          },
            success: function (response) {
                // 성공 시 처리
                alert('등록이 완료되었습니다.', response);
                row.find('#insertStatus').val('A');
                row.find('#buttonStatus').val('C');
                moveOpenPopWhtprInfo(checkParam, pblcnYr);
            },
            error: function (status) {
                // 실패 시 처리
                alert('등록이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.');
            }
        });     
        /* 데이터 등록 (E) */
       }
       
       
    } else if (insertStatus === 'A') {
       
        var updateValue = confirm("저장 하시겠습니까?");
      
       //저장여부 확인
        if (updateValue) {
           /* 업데이트 (S) */
           $.ajax({
               type: 'POST',
               url: contextPath+"/cltInfoWhtprMgt/whtprPopSave.do",
             data: {
                    paramSeYr: paramSeYr,
                    hqNope: hqNope,
                    ogdpInstNope: ogdpInstNope,
                    pblcInstNope: pblcInstNope,
                    instCnt: instCnt,
                    whtprId: whtprId,
                    checkParam: checkParam
             },
               success: function (response) {
                   // 성공 시 처리
                   alert('수정이 완료되었습니다.', response);
               },
               error: function (status) {
                   // 실패 시 처리
                   alert('수정이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.');
               }
           });     
           /* 업데이트 (E) */
        }
    }
    /* insert/update (E) */
    
        row.find('#seYr').prop('readonly', true);
        row.find('#hqNope').prop('readonly', true);
        row.find('#ogdpInstNope').prop('readonly', true);
        row.find('#pblcInstNope').prop('readonly', true);
        row.find('#instCnt').prop('readonly', true);
        
        //buttonStatus 값 변경(버튼 show/hide)
        row.find('#buttonStatus').val('C');
        //전달
        toggleButtons(row, 'C');
      
      });
    
    /* delete (S) */
    //삭제버튼
	$(document).off('click', '#rowDelete').on('click', '#rowDelete', function () {
        var row = $(this).closest('tr');
      
        var whtprId = '${whtprId}';
        var checkParam = '${checkParam}';
        var seYr = row.find('input[name="seYr"]').val();
        
        var userConfirmed = confirm("삭제 하시겠습니까?");
        if (userConfirmed) {
          
      /* Delete Ajax (S) */
           $.ajax({
             type: 'GET',
             url: contextPath+"/cltInfoWhtprMgt/deleteWhtprPop.do",
             data: {whtprId: whtprId, seYr: seYr, checkParam: checkParam},
             success: function (data, textStatus, xhr) {
                 // 성공 시 처리
             alert("삭제되었습니다.");
             row.remove();
         
             },
             error: function (xhr, textStatus, errorThrown) {
                 // 실패 시 처리
                 alert("삭제 실패");
         
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
    $(document).on('input', '#yrInfrmNmprPrssInfoList input[class^="editable"]', function () {
       calculateValue();
    });


    function calculateValue() {
        //값 초기화   
        var totalSum = 0;

        // 각 행에 대한 계산
        $('#yrInfrmNmprPrssInfoList tr').each(function () {
            var hqNope = parseFloat($(this).find('input[name="hqNope"]').val()) || 0;
            var ogdpInstNope = parseFloat($(this).find('input[name="ogdpInstNope"]').val()) || 0;
            var pblcInstNope = parseFloat($(this).find('input[name="pblcInstNope"]').val()) || 0;

            var rowTotal = hqNope + ogdpInstNope + pblcInstNope;

            $(this).find('input[name="totalSum"]').val(rowTotal.toFixed());
        });
    }
    
  });
  
  // 모달창 닫는 함수
  function closeModal() {
    admin.modalsClose('modals');
    location.reload();
  }

</script>