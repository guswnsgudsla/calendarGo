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
         <h2>백서 목차 항목 - 1. 일반현황 > 2. 정보화 예산 현황 > 2) 유형별 정보화 예산</h2>
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
   <div class="table-wrap table-border">
      <div class="between">
         <span>(기준 : 만원)</span>
        <c:if test="${UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
         <button type="button" class="btns" id="addrow">추가</button>
        </c:if> 
         <!-- <button type="button" class="btns color-gray" onclick="closeModal()">닫기</button> -->
      </div>
  <div class="div-scroll" style="height: 400px" id="scroll">    
   <table>
      <colgroup>
         <col width="/">
      </colgroup>
      <thead>
         <tr>
            <th>구분연도</th>
            <th>기획</th>
            <th>개발구축</th>
            <th>운영관리보수</th>
            <th>자산취득</th>
            <th>기타</th>
            <th>합계</th>
           <c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y'||UserAuthrtInfo.wrtAuthrtYn eq 'Y'||UserAuthrtInfo.delAuthrtYn eq 'Y'}">
            <th>수정/저장</th>
           </c:if> 
         </tr>
      </thead>
            <colgroup>
               <col width="/">
            </colgroup>
            <tbody id="typeInfrmBgtPrssInfoList"></tbody>
         </table>
      </div>
		<br>      
		<br>      
      <table>
         <thead>
         <tr>
            <th>구분연도</th>
            <th>기획</th>
            <th>개발구축</th>
            <th>운영관리보수</th>
            <th>자산취득</th>
            <th>기타</th>
            <th  colspan="2">합계</th>
         </tr>
      </thead>
         <tr>
            <td>
               <div class='fm-ele'>
                    <input style='width:100%; text-align:center; border: none; background-color: transparent;' type='text' id='totalSeYr' name='totalSeYr' class='editable' placeholder='구분연도' value='' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input  style='width:70% ' type='text' id='totalPlngBgtAmt' name='totalPlngBgtAmt' class='editable' placeholder='기획합계' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalDevCnstBgtAmt' name='totalDevCnstBgtAmt' class='editable' placeholder='개발구축합계' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalOperMngRprmBgtAmt' name='totalOperMngRprmBgtAmt' class='editable' placeholder='운영관리합계' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalAstAcqsBgtAmt' name='totalAstAcqsBgtAmt' class='editable' placeholder='자산취득합계' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalEtcBgtAmt' name='totalEtcBgtAmt' class='editable'  placeholder='기타합계' readonly>
               </div>
            </td>
            <td  colspan="2">
               <div class='fm-ele'>
                  <input style='width:100%;text-align:center; ' type='text' id='totalBgtSumAmt' name='totalBgtSumAmt' class='editable' placeholder='연도합계' readonly>
               </div>
            </td>
         </tr>
         <tr>
            <td>
               <div class='fm-ele'>
                  비율(%)
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalPlngBgtRto' name='totalPlngBgtRto' class='editable' placeholder='기획비율' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalDevCnstBgtRto' name='totalDevCnstBgtRto' class='editable' placeholder='개발구축비율' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalOperMngRprmBgtRto' name='totalOperMngRprmBgtRto' class='editable' placeholder='운영관리비율' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalAstAcqsBgtRto' name='totalAstAcqsBgtRto' class='editable' placeholder='자산취득비율' readonly>
               </div>
            </td>
            <td>
               <div class='fm-ele'>
                  <input style='width:70% ' type='text' id='totalEtcBgtRto' name='totalEtcBgtRto' class='editable'  placeholder='기타비율' readonly>
               </div>
            </td>
            <td colspan="2">
                <div class='fm-ele align-center'>
                    <input style='width:100%;' type='text' id='totalBgtSumRto' name='totalBgtSumRto' class='editable align-center' placeholder='합계비율' readonly>
                </div>
            </td>
         </tr>
      </table>
   </div>
</div>

<script>
  $(document).ready(function () {
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
      url: contextPath + '/cltInfoWhtprMgt/typeInfrmBgtPrssInfoList.do',
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
   	     // authrtTypeCd 값이 USERTY0001일 경우에만 버튼 HTML 문자열 생성
   	     if (wrtAuthrtYn === 'Y') {
   	         buttonsHtml = "<td><button type='button' id = 'modify' class='btns size-xsmall'>등록</button><button type='button' id = 'modifysave' class='btns size-xsmall'>저장</button></td><button type='button' id = 'rowDelete'  class='btns size-xsmall color-red'>삭제</button></td>";
   	     }
          var html = "<tr class='newRow'>"
              + "<td><div class='fm-ele'><input maxlength='4' style='width:70% ' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'plngBgtAmt' name = 'plngBgtAmt' class='editable' placeholder='기획' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'devCnstBgtAmt' name = 'devCnstBgtAmt' class='editable' placeholder='개발구축' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'operMngRprmBgtAmt' name = 'operMngRprmBgtAmt' class='editable' placeholder='운영관리' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'astAcqsBgtAmt' name = 'astAcqsBgtAmt' class='editable' placeholder='자산취득' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
              + "<td><div class='fm-ele'><input style='width:70% ' type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='합계' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
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
            + "<td><div class='fm-ele'><input maxlength='4' style='width:70% ' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value='" + item.seYr + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'plngBgtAmt' name = 'plngBgtAmt' class='editable' placeholder='기획' value='" + item.plngBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'devCnstBgtAmt' name = 'devCnstBgtAmt' class='editable' placeholder='개발구축' value='" + item.devCnstBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'operMngRprmBgtAmt' name = 'operMngRprmBgtAmt' class='editable' placeholder='운영관리' value='" + item.operMngRprmBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'astAcqsBgtAmt' name = 'astAcqsBgtAmt' class='editable' placeholder='자산취득' value='" + item.astAcqsBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타예산' value='" + item.etcBgtAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + "<td><div class='fm-ele'><input style='width:70% ' type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='합계' value='" + item.bgtSumAmt + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
            + buttonsHtml
            + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='A'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
            + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='C'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
            + "</tr>";
            
          //typeInfrmBgtPrssInfoList에 넣기  
          $("#typeInfrmBgtPrssInfoList").append(html);
            //위 동작 끝나면 toggleButtons 호출하고 buttonStatus값 C로 초기화
          toggleButtons($("#typeInfrmBgtPrssInfoList tr:last"), 'C');
            
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
        + "<td><div class='fm-ele'><input maxlength='4' style='width:70% ' type='text' id = 'seYr' name = 'seYr' class='editable' placeholder='구분연도' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'plngBgtAmt' name = 'plngBgtAmt' class='editable' placeholder='기획예산' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' ></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'devCnstBgtAmt' name = 'devCnstBgtAmt' class='editable' placeholder='개발구축예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'operMngRprmBgtAmt' name = 'operMngRprmBgtAmt' class='editable' placeholder='운영관리예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'astAcqsBgtAmt' name = 'astAcqsBgtAmt' class='editable' placeholder='자산취득예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input maxlength='10' style='width:70% ' type='text' id = 'etcBgtAmt' name = 'etcBgtAmt' class='editable' placeholder='기타예산' value=''  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
        + "<td><div class='fm-ele'><input style='width:70% ' type='text' id = 'bgtSumAmt' name = 'bgtSumAmt' class='editable' placeholder='예산합계' value='' readonly  onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'></div></td>"
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
        row.find('#plngBgtAmt').prop('readonly', false);
        row.find('#devCnstBgtAmt').prop('readonly', false);
        row.find('#operMngRprmBgtAmt').prop('readonly', false);
        row.find('#astAcqsBgtAmt').prop('readonly', false);
        row.find('#etcBgtAmt').prop('readonly', false);
        
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
    var plngBgtAmt = row.find('input[name="plngBgtAmt"]').val();
    var devCnstBgtAmt = row.find('input[name="devCnstBgtAmt"]').val();
    var operMngRprmBgtAmt = row.find('input[name="operMngRprmBgtAmt"]').val();
    var astAcqsBgtAmt = row.find('input[name="astAcqsBgtAmt"]').val();
    var etcBgtAmt = row.find('input[name="etcBgtAmt"]').val();
    var bgtSumAmt = row.find('input[name="bgtSumAmt"]').val();
    var whtprId = '${whtprId}';
    var checkParam = '${checkParam}';
    var pblcnYr = '${pblcnYr}';
    
    /*  저장버튼 클릭시 insert/update (S) */
      //동작 하기전 값 체크
         if (
       paramSeYr.trim() === "" ||
       plngBgtAmt.trim() === "" ||
       devCnstBgtAmt.trim() === "" ||
       operMngRprmBgtAmt.trim() === "" ||
       astAcqsBgtAmt.trim() === "" ||
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
                 plngBgtAmt: plngBgtAmt,
                 devCnstBgtAmt: devCnstBgtAmt,
                 operMngRprmBgtAmt: operMngRprmBgtAmt,
                 astAcqsBgtAmt: astAcqsBgtAmt,
                 etcBgtAmt: etcBgtAmt,
                 bgtSumAmt: bgtSumAmt,
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
            error: function (xhr, textStatus, errorThrown,Status) {
                //alert('에러 발생: ' + xhr.responseJSON.errorMessage);
                alert('다시 시도해주세요.' );
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
                    plngBgtAmt: plngBgtAmt,
                    devCnstBgtAmt: devCnstBgtAmt,
                    operMngRprmBgtAmt: operMngRprmBgtAmt,
                    astAcqsBgtAmt: astAcqsBgtAmt,
                    etcBgtAmt: etcBgtAmt,
                    bgtSumAmt: bgtSumAmt,
                    whtprId: whtprId,
                    checkParam: checkParam
             },
               success: function (response) {
                   // 성공 시 처리
                   alert('수정이 완료되었습니다.', response);
               },
               error: function (status) {
                   // 실패 시 처리
                   alert('담당자에게 문의 바랍니다.');
               }
           });     
           /* 업데이트 (E) */
        }
    }
    /* insert/update (E) */
    
        row.find('#seYr').prop('readonly', true);
        row.find('#plngBgtAmt').prop('readonly', true);
        row.find('#devCnstBgtAmt').prop('readonly', true);
        row.find('#operMngRprmBgtAmt').prop('readonly', true);
        row.find('#astAcqsBgtAmt').prop('readonly', true);
        row.find('#etcBgtAmt').prop('readonly', true);
        
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
     
   //값 확인        
     var userConfirmed = confirm("삭제 하시겠습니까?");
     if (userConfirmed) {
   /* Delete Ajax (S) */
        $.ajax({
          type: 'GET',
          url: contextPath + '/cltInfoWhtprMgt/deleteWhtprPop.do',
          data: {whtprId: whtprId, seYr: seYr, checkParam: checkParam},
          success: function (data, textStatus, xhr) {
              // 성공 시 처리
          alert("삭제되었습니다.");
          row.remove();
          calculateValue();
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
    $(document).on('input', '#typeInfrmBgtPrssInfoList input[class^="editable"]', function () {
       calculateTotalRowMoney();
    });

   function calculateTotalRowMoney() {
      //값 초기화   
       var totalRowMoney = 0;

       // 각 행에 대한 계산
       $('#typeInfrmBgtPrssInfoList tr').each(function () {
           var plngBgtAmt = parseFloat($(this).find('input[name="plngBgtAmt"]').val()) || 0;
           var devCnstBgtAmt = parseFloat($(this).find('input[name="devCnstBgtAmt"]').val()) || 0;
           var operMngRprmBgtAmt = parseFloat($(this).find('input[name="operMngRprmBgtAmt"]').val()) || 0;
           var astAcqsBgtAmt = parseFloat($(this).find('input[name="astAcqsBgtAmt"]').val()) || 0;
           var etcBgtAmt = parseFloat($(this).find('input[name="etcBgtAmt"]').val()) || 0;

           var rowTotal = plngBgtAmt + devCnstBgtAmt + operMngRprmBgtAmt + astAcqsBgtAmt + etcBgtAmt;

           $(this).find('input[name="bgtSumAmt"]').val(rowTotal.toFixed());

           totalRowMoney += rowTotal;
       });

       // 전체 합계 업데이트
       //totalRowMoney.toFixed())는 해당 요소의 텍스트 내용을 지정한 값으로 설정
       $('#totalRowMoney').text(totalRowMoney.toFixed());
   }

   
      //input에 값이 입력될대마다.
    $(document).on('input', '#typeInfrmBgtPrssInfoList input[class^="editable"]', function () {
       calculateValue();
    });

    
   
   function calculateValue() {
       var totalPlngBgtAmt = 0, totalDevCnstBgtAmt = 0, totalOperMngRprmBgtAmt = 0, totalAstAcqsBgtAmt = 0, totalEtcBgtAmt = 0, totalBgtSumAmt = 0, totalPlngBgtRto = 0, totalDevCnstBgtRto = 0, totalOperMngRprmBgtRto = 0, totalAstAcqsBgtRto = 0, totalEtcBgtRto = 0, totalBgtSumRto = 0;
       var minYear = Infinity, maxYear = -Infinity;
       $('#typeInfrmBgtPrssInfoList tr').each(function () {
           var plngBgtAmt = parseFloat($(this).find('input[name="plngBgtAmt"]').val()) || 0;
           var devCnstBgtAmt = parseFloat($(this).find('input[name="devCnstBgtAmt"]').val()) || 0;
           var operMngRprmBgtAmt = parseFloat($(this).find('input[name="operMngRprmBgtAmt"]').val()) || 0;
           var astAcqsBgtAmt = parseFloat($(this).find('input[name="astAcqsBgtAmt"]').val()) || 0;
           var etcBgtAmt = parseFloat($(this).find('input[name="etcBgtAmt"]').val()) || 0;
           var bgtSumAmt = parseFloat($(this).find('input[name="bgtSumAmt"]').val()) || 0;
           
           bgtSumAmt = plngBgtAmt + devCnstBgtAmt + operMngRprmBgtAmt + astAcqsBgtAmt + etcBgtAmt;

           $(this).find('input[name="bgtSumAmt"]').val(bgtSumAmt.toFixed());
           
           // 입력값 비율 계산 (분모가 0일 경우 결과를 0으로 출력)
           var plngBgtRto = (bgtSumAmt ? (plngBgtAmt / bgtSumAmt * 100).toFixed(2) : 0);
           var devCnstBgtRto = (bgtSumAmt ? (devCnstBgtAmt / bgtSumAmt * 100).toFixed(2) : 0);
           var operMngRprmBgtRto = (bgtSumAmt ? (operMngRprmBgtAmt / bgtSumAmt * 100).toFixed(2) : 0);
           var astAcqsBgtRto = (bgtSumAmt ? (astAcqsBgtAmt / bgtSumAmt * 100).toFixed(2) : 0);
           var etcBgtRto = (bgtSumAmt ? (etcBgtAmt / bgtSumAmt * 100).toFixed(2) : 0);
           var bgtSumRto = (bgtSumAmt ? (bgtSumAmt / bgtSumAmt * 100).toFixed(2) : 0);

//

           // 계산 된 비율로 값 업데이트 
           $(this).find('input[name="plngBgtRto"]').val(plngBgtRto + '%');
           $(this).find('input[name="devCnstBgtRto"]').val(devCnstBgtRto + '%');
           $(this).find('input[name="operMngRprmBgtRto"]').val(operMngRprmBgtRto + '%');
           $(this).find('input[name="astAcqsBgtRto"]').val(astAcqsBgtRto + '%');
           $(this).find('input[name="etcBgtRto"]').val(etcBgtRto + '%');
           $(this).find('input[name="bgtSumRto"]').val(bgtSumRto + '%');
           

           // '계' 포함된 마지막 행의 총합 계산
           totalPlngBgtAmt += plngBgtAmt;
           totalDevCnstBgtAmt += devCnstBgtAmt;
           totalOperMngRprmBgtAmt += operMngRprmBgtAmt;
           totalAstAcqsBgtAmt += astAcqsBgtAmt;
           totalEtcBgtAmt += etcBgtAmt;
           totalBgtSumAmt += bgtSumAmt;
          
           // 연도 범위 계산
           var seYr = parseInt($(this).find('input[name="seYr"]').val());
           if (!isNaN(seYr)) {
               if (seYr < minYear) minYear = seYr;
               if (seYr > maxYear) maxYear = seYr;
           }
//
       });
       // '계' 포함된 마지막 행의 총합 없데이트
       $('input#totalPlngBgtAmt').val(totalPlngBgtAmt);
       $('input#totalDevCnstBgtAmt').val(totalDevCnstBgtAmt);
       $('input#totalOperMngRprmBgtAmt').val(totalOperMngRprmBgtAmt);
       $('input#totalAstAcqsBgtAmt').val(totalAstAcqsBgtAmt);
       $('input#totalEtcBgtAmt').val(totalEtcBgtAmt);
       $('input#totalBgtSumAmt').val(totalBgtSumAmt); 


       // '계' 포함된 마지막 행의 비율 계산 (분모가 0일 경우 계산결과를 0으로 출력)
       var totalPlngBgtRto = (totalBgtSumAmt ? (totalPlngBgtAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       var totalDevCnstBgtRto = (totalBgtSumAmt ? (totalDevCnstBgtAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       var totalOperMngRprmBgtRto = (totalBgtSumAmt ? (totalOperMngRprmBgtAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       var totalAstAcqsBgtRto = (totalBgtSumAmt ? (totalAstAcqsBgtAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       var totalEtcBgtRto = (totalBgtSumAmt ? (totalEtcBgtAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       var totalBgtSumRto = (totalBgtSumAmt ? (totalBgtSumAmt / totalBgtSumAmt * 100).toFixed(2) : 0);
       
       
       // '계' 포함된 마지막 행의 비율 업데이트
       $('input#totalPlngBgtRto').val(totalPlngBgtRto + '%');
       $('input#totalDevCnstBgtRto').val(totalDevCnstBgtRto + '%');
       $('input#totalOperMngRprmBgtRto').val(totalOperMngRprmBgtRto + '%');
       $('input#totalAstAcqsBgtRto').val(totalAstAcqsBgtRto + '%');
       $('input#totalEtcBgtRto').val(totalEtcBgtRto + '%');
       $('input#totalBgtSumRto').val(totalBgtSumRto + '%');
       
       // 연도 범위 설정
       if (minYear !== Infinity && maxYear !== -Infinity) {
           if (minYear === maxYear) {
               // 하나의 연도만 존재하는 경우
               $('input#totalSeYr').val(minYear + "년 합계");
           } else {
               // 여러 연도가 존재하는 경우
               $('input#totalSeYr').val(minYear + " ~ " + maxYear + "년합계");
           }
       } else {
           $('input#totalSeYr').val(""); // 값이 없을 경우 필드를 비움
       }
   }
   
  });
  
  // 모달창 닫는 함수
  function closeModal() {
    admin.modalsClose('modals');
    location.reload();
  }

</script>