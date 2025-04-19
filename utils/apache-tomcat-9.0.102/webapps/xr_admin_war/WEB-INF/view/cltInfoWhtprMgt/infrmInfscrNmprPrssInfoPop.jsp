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
         <h2>백서 목차 항목 - 1. 일반현황 > 1. 정보화 및 정보보호 인력현황 > 2) 정보화 및 정보보호 인력 현황 </h2>
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
   <table>
      <colgroup>
         <col width="/">
      </colgroup>
      <thead>
         <tr>
            <th rowspan="2">구분</th>
            <th rowspan="2">전체인력</th>
            <th colspan="2">전체인력 대비 정보화 인력</th>
            <th colspan="2">전체인력 대비 정보보호 인력</th>
            <th rowspan="2">정보화 인력 대비 정보보호 인력</th>
           <c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y'||UserAuthrtInfo.wrtAuthrtYn eq 'Y'}"> 
            <th rowspan="2">수정/저장</th>
           </c:if> 
         </tr>
         <tr>
            <th>정보화 인력</th>
            <th>비율(%)</th>
            <th>정보보호 인력</th>
            <th>비율(%)</th>
         </tr>
      </thead>
            <tbody id="infrmInfscrNmprPrssInfoList"></tbody>
            <tr style='background-color: #f3f3f3;'>
            <td>계</td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalWholNope' name = 'totalWholNope' class='editable' placeholder='전체인력 합계' value=''  readonly></div></td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalInfrmNope' name = 'totalInfrmNope' class='editable' placeholder='정보화인력 합계' value=''  readonly></div></td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalInfrmPerlWholRatio' name = 'totalInfrmPerlWholRatio' class='editable' placeholder='비율(%)' value=''  readonly></div></td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalInfscrNope' name = 'totalInfscrNope' class='editable' placeholder='정보보호인력 합계' value='' readonly></div></td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalInfscrPerWholRatio' name = 'totalInfscrPerWholRatio' class='editable' placeholder='비율(%)' value=''   readonly></div></td>
            <td><div class='fm-ele'><input style='width:100%;' type='text' id = 'totalInfscrPerInfrmRatio' name = 'totalInfscrPerInfrmRatio' class='editable' placeholder='비율(%)' value=''  readonly></div></td>
            <c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y'||UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
            <td></td>
            </c:if>
            </tr>
         </table>
        <!-- <div class="btn-wrap align-right">
           <button type="button" class="btns color-gray" onclick="closeModal()">닫기</button>
         </div> -->
   </div>
</div>

<script>
  $(document).ready(function () {
     
   var authrtTypeCd = $('input[name="authrtTypeCd"]').val();  
   var wrtAuthrtYn = $('input[name="wrtAuthrtYn"]').val();  
   var mdfcnAuthrtYn = $('input[name="mdfcnAuthrtYn"]').val();  
   var delAuthrtYn = $('input[name="delAuthrtYn"]').val();  
   /* 유형별 정보화 예산 리스트(S) */
   // 백서 발행 연도
   var pblcnYr = $('input[name="pblcnYr"]').val();

   // 백서 아이디
   var whtprId = $('input[name="whtprId"]').val();
   // 백서팝업코드
   var checkParam = $('input[name="checkParam"]').val();

   // 기관유형코드 정보: 데이터 유무 및 일련번호 설정 초기화
    var instTypePresence = {
      'INSTTY0001': { hasType: false, prssSn: 1 },
      'INSTTY0002': { hasType: false, prssSn: 2 },
      'INSTTY0003': { hasType: false, prssSn: 3 }
    };
   // 기관유형코드를 기관명과 매핑
    var instTypeLabels = {
     'INSTTY0001': '본부',
     'INSTTY0002': '소속기관',
     'INSTTY0003': '공공기관'
   };

   $.ajax({
     type: 'POST',
     url: contextPath+'/cltInfoWhtprMgt/infrmInfscrNmprPrssInfoList.do',
     dataType: 'json',
     data: {
       whtprId: whtprId,
       checkParam: checkParam,
     },
     success: function (data) {
       // 게시글 넣기전 초기화
       $("#infrmInfscrNmprPrssInfoList").empty();

       // 받아온 데이터에서 각 기관유형코드의 존재 여부를 체크 후 존재하면 값을 true로 변경
       $.each(data, function (index, item) {
        if (instTypePresence[item.instTypeCd]) {
            instTypePresence[item.instTypeCd].hasType = true;
            //instTypePresence[item.instTypeCd].prssSn = item.prssSn;
          }

         // 기존 데이터 처리
         var InfrmPerlWholRatio = ((item.infrmNope / item.wholNope) * 100).toFixed(2);
         var InfscrPerWholRatio = ((item.infscrNope / item.wholNope) * 100).toFixed(2);
         var InfscrPerInfrmRatio = ((item.infscrNope / item.infrmNope) * 100).toFixed(2);
         var instTypeLabel = instTypeLabels[item.instTypeCd] || item.instTypeCd; // 기본값으로 코드를 사용
         var buttonsHtml = "";
  	     // mdfcnAuthrtYn 값이 Y일 경우에만 버튼 HTML 문자열 생성
  	     if (mdfcnAuthrtYn === 'Y') {
		    buttonsHtml = "<td><button type='button' id='modify' class='btns size-xsmall'>수정</button><button type='button' id='modifysave' class='btns size-xsmall'>저장</button></td>";
		} else if (wrtAuthrtYn === 'N' && mdfcnAuthrtYn === 'N') {
		    buttonsHtml = "";
		} else {
		    buttonsHtml = "<td></td>";
		}


          var html = "<tr>"
              + "<td>" + instTypeLabel + "</td>"
              + "<input type='hidden' id = 'instTypeCd' name = 'instTypeCd' class='editable' value='" + item.instTypeCd + "' readonly>"
              + "<input type='hidden' id = 'prssSn' name = 'prssSn' class='editable' value='" + item.prssSn + "' readonly>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'wholNope' name = 'wholNope' class='editable' placeholder='전체 인력 수' maxlength='10' value='" + item.wholNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'infrmNope' name = 'infrmNope' class='editable' placeholder='정보화 인력 수' maxlength='10' value='" + item.infrmNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfrmPerlWholRatio' name = 'InfrmPerlWholRatio' class='editable' placeholder='비율(%)' value='" + InfrmPerlWholRatio + "%' readonly></div></td>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'infscrNope' name = 'infscrNope' class='editable' placeholder='정보보호 인력수' maxlength='10' value='" + item.infscrNope + "' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;' readonly></div></td>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfscrPerWholRatio' name = 'InfscrPerWholRatio' class='editable' placeholder='비율(%)' value='" + InfscrPerWholRatio + "%' readonly></div></td>"
              + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfscrPerInfrmRatio' name = 'InfscrPerInfrmRatio' class='editable' placeholder='비율(%)' value='" + InfscrPerInfrmRatio + "%' readonly></div></td>"
              + buttonsHtml
              + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='A'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
              + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='C'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
              + "</tr>";

         $("#infrmInfscrNmprPrssInfoList").append(html);
         toggleButtons($("#infrmInfscrNmprPrssInfoList tr:last"), 'C');
         
         calculateValue();
       });

       // ajax 호출 후 최신화한 instTypePresence 정보로 instTypeCd 값이 없을 경우 빈 데이터 행 추가
        $.each(instTypePresence, function (instTypeCd, details) {
          if (!details.hasType) {
            var emptyHtml = createEmptyRow(instTypeCd, details.prssSn);
            insertRowInPosition(instTypeCd, emptyHtml);
            
          }
        });

        // createEmptyRow를 통해 만들어진 텍스트 emptyHtml을 특정 위치에 삽입
           function insertRowInPosition(instTypeCd, emptyHtml) {
             var position;
             switch(instTypeCd) {
               case 'INSTTY0001':
                 position = 0; // 본부: 첫 번째 위치
                 break;
               case 'INSTTY0002':
                 position = 1; // 공공기관: 두 번째 위치
                 break;
               case 'INSTTY0003':
                 position = 2; //소속기관: 세 번째 위치
                 break;
               default: //디폴트
                 position = $('#infrmInfscrNmprPrssInfoList tr').length; // 마지막 위치
             }

             if(position === 0) { 
               $('#infrmInfscrNmprPrssInfoList').prepend(emptyHtml); // 맨 앞에 삽입
               
             } else {
               $('#infrmInfscrNmprPrssInfoList tr').eq(position - 1).after(emptyHtml); // 지정된 위치에 삽입
             }
               // 새로 추가된 행에 대해 버튼 상태 조정
             toggleButtons($("#infrmInfscrNmprPrssInfoList tr").eq(position), 'C');
           }
     }
     ,
     error: function (error) {
     }
   });
   /* 유형별 정보화 예산 리스트(E) */

   //emptyHtml에 들어갈 텍스트를 생성
   function createEmptyRow(instTypeCd, prssSn) {
     var instTypeLabel = instTypeLabels[instTypeCd] || instTypeCd; // instTypeLabels는 전역으로 정의된 레이블 매핑을 사용   
     var buttonsHtml = "";
     var readOnlyHtml = "";
  // buttonsHtml 설정
     if (wrtAuthrtYn === 'Y') {
         buttonsHtml = "<td><button type='button' id='modify' class='btns size-xsmall'>등록</button><button type='button' id='modifysave' class='btns size-xsmall'>저장</button></td>";
         readOnlyHtml = ""
     } else {
         if (mdfcnAuthrtYn === 'N') {
             buttonsHtml = "";
             readOnlyHtml = "readonly";
         } else {
             buttonsHtml = "<td></td>";
             readOnlyHtml = "readonly";
         }
     }
     return "<tr>"
      + "<td><div class='fm-ele'><span id='instTypeLabel'>" + instTypeLabel + "</span></div></td>"
      + "<input type='hidden' id='instTypeCd' name='instTypeCd' class='editable' value='" + instTypeCd + "'>"
      + "<input type='hidden' id='prssSn' name='prssSn' class='editable' value='" + prssSn + "'>"      
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'wholNope' name = 'wholNope' class='editable' placeholder='전체인력 수' maxlength='10' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'"+readOnlyHtml+"></div></td>"
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'infrmNope' name = 'infrmNope' class='editable' placeholder='정보화 인력 수' maxlength='10' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'"+readOnlyHtml+"></div></td>"
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfrmPerlWholRatio' name = 'InfrmPerlWholRatio' class='editable' placeholder='비율(%)' value='' readonly></div></td>"
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'infscrNope' name = 'infscrNope' class='editable' placeholder='정보보호 인력 수' maxlength='10' value='' onkeypress='cms_input_only_number()' onblur='cms_input_only_remove_char(event)' onkeydown='cms_input_only_number_check(event)' onkeyup='cms_input_only_remove_char(event)'  style='ime-mode:disabled;'"+readOnlyHtml+"></div></td>"
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfscrPerWholRatio' name = 'InfscrPerWholRatio' class='editable' placeholder='비율(%)' value='' readonly></div></td>"
      + "<td><div class='fm-ele'><input style='width:100%;' type='text' id = 'InfscrPerInfrmRatio' name = 'InfscrPerInfrmRatio' class='editable' placeholder='비율(%)' value='' readonly></div></td>"
      + buttonsHtml
      + "<input type='hidden' id = 'insertStatus' name = 'insertStatus' value='B'>" /* 기존에 있던 데이터인지 추가 버튼으로 생성된 row인지 확인을 위한 input A = update, B = insert */
      + "<input type='hidden' id = 'buttonStatus' name = 'buttonStatus' value='D'>" /* 버튼 상태에 따라 저장/수정 show/hide 기본상태(수정불가) = C, 수정가능 = D */
      + "</tr>";

   }

    
    //수정버튼 클릭시
    $(document).on('click', '#modify', function () {
       
       //행선택
        var row = $(this).closest('tr');
       
        //수정버튼 누르면 readonly 제거
        //row.find('#seYr').prop('readonly', false);
        row.find('#wholNope').prop('readonly', false);
        row.find('#infrmNope').prop('readonly', false);
        row.find('#infscrNope').prop('readonly', false);
        
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
    
    var paramPrssSn = row.find('input[name="prssSn"]').val();
    var instTypeCd = row.find('input[name="instTypeCd"]').val();
    var wholNope = row.find('input[name="wholNope"]').val();
    var infrmNope = row.find('input[name="infrmNope"]').val();
    var infscrNope = row.find('input[name="infscrNope"]').val();
    var whtprId = '${whtprId}';
    var checkParam = '${checkParam}';
    
    /*  저장버튼 클릭시 insert/update (S) */
      //동작 하기전 값 체크
         if (
       instTypeCd.trim() === "" ||
       wholNope.trim() === "" ||
       infrmNope.trim() === "" ||
       infscrNope.trim() === ""
   ) {
       alert("입력한 값을 확인해 주세요.");
       return;
   }
   
    // 정보화 인력과 정보보호 인력의 합이 전체인력을 초과하는지 값 체크
      var totalInfrmInfscrNope = parseFloat(infrmNope) + parseFloat(infscrNope);
      if (totalInfrmInfscrNope > parseFloat(wholNope)) {
        alert("정보화 인력과 정보보호 인력의 합은 전체인력을 초과할 수 없습니다.");
        return;
    }      
     
      
    /* A = update, B = insert */
    if (insertStatus === 'B') {
         //신규등록 insert
       var insertMoney = confirm("등록 하시겠습니까?");    
       
       if (insertMoney) {
         
          /* 데이터 등록 (S) */
        $.ajax({
            type: 'POST',
            url: contextPath+'/cltInfoWhtprMgt/whtprPopInsert.do',
          data: {
                 paramPrssSn: paramPrssSn,
                 instTypeCd: instTypeCd,
                 wholNope: wholNope,
                 infrmNope: infrmNope,
                 infscrNope: infscrNope,
                 whtprId: whtprId,
                 checkParam: checkParam
          },
            success: function (response) {
                // 성공 시 처리
                alert('등록이 완료되었습니다.', response);
                row.find('#insertStatus').val('A');
                row.find('#buttonStatus').val('C');
                row.find('#modify').text('수정');
/*                 moveOpenPopWhtprInfo('INFRMINFSCRNMPR', pblcnYr); */
            },
            error: function (status) {
                // 실패 시 처리
                alert('등록이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.');
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
               url: contextPath+'/cltInfoWhtprMgt/whtprPopSave.do',
             data: {
                   paramPrssSn: paramPrssSn,
                   instTypeCd: instTypeCd,
                   wholNope: wholNope,
                   infrmNope: infrmNope,
                   infscrNope: infscrNope,
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
    
        row.find('#wholNope').prop('readonly', true);
        row.find('#infrmNope').prop('readonly', true);
        row.find('#infscrNope').prop('readonly', true);
        
        //buttonStatus 값 변경(버튼 show/hide)
        row.find('#buttonStatus').val('C');
        //전달
        toggleButtons(row, 'C');
      
      });
    
 
    
   // buttonStatus 에 따라서 버튼 show/hide
    function toggleButtons(row, buttonStatus, insertStatus) {
        if (buttonStatus === 'C') {
            row.find('#modify').show();
            row.find('#modifysave').hide();
        } else if (buttonStatus === 'D') {
            row.find('#modify').hide();
            row.find('#modifysave').show();
        }
    }
    
    
   //input에 값이 입력될대마다.
    $(document).on('input', '#infrmInfscrNmprPrssInfoList input[class^="editable"]', function () {
       calculateValue();
    });


   /*  입력 값에 따라 합계 및 비율 계산하는 함수 (S) */
    function calculateValue() {
        var totalWholNope = 0, totalInfrmNope = 0, totalInfscrNope = 0;

        $('#infrmInfscrNmprPrssInfoList tr').each(function () {
            var wholNope = parseFloat($(this).find('input[name="wholNope"]').val()) || 0;
            var infrmNope = parseFloat($(this).find('input[name="infrmNope"]').val()) || 0;
            var infscrNope = parseFloat($(this).find('input[name="infscrNope"]').val()) || 0;

            // 입력값 비율 계산 (분모가 0일 경우 결과를 0으로 출력)
            var InfrmPerlWholRatio = (wholNope ? (infrmNope / wholNope * 100).toFixed(2) : 0);
            var InfscrPerWholRatio = (wholNope ? (infscrNope / wholNope * 100).toFixed(2) : 0);
            var InfscrPerInfrmRatio = (infrmNope ? (infscrNope / infrmNope * 100).toFixed(2) : 0);


            // 계산 된 비율로 값 업데이트 
            $(this).find('input[name="InfrmPerlWholRatio"]').val(InfrmPerlWholRatio + '%');
            $(this).find('input[name="InfscrPerWholRatio"]').val(InfscrPerWholRatio + '%');
            $(this).find('input[name="InfscrPerInfrmRatio"]').val(InfscrPerInfrmRatio + '%');

            // '계' 포함된 마지막 행의 총합 계산
            totalWholNope += wholNope;
            totalInfrmNope += infrmNope;
            totalInfscrNope += infscrNope;
        });

        // '계' 포함된 마지막 행의 총합 없데이트
        $('input#totalWholNope').val(totalWholNope);
        $('input#totalInfrmNope').val(totalInfrmNope);
        $('input#totalInfscrNope').val(totalInfscrNope);

        // '계' 포함된 마지막 행의 비율 계산 (분모가 0일 경우 계산결과를 0으로 출력)
        var totalInfrmPerlWholRatio = (totalWholNope ? (totalInfrmNope / totalWholNope * 100).toFixed(2) : 0);
        var totalInfscrPerWholRatio = (totalWholNope ? (totalInfscrNope / totalWholNope * 100).toFixed(2) : 0);
        var totalInfscrPerInfrmRatio = (totalInfrmNope ? (totalInfscrNope / totalInfrmNope * 100).toFixed(2) : 0);
        
        // '계' 포함된 마지막 행의 비율 업데이트
        $('input#totalInfrmPerlWholRatio').val(totalInfrmPerlWholRatio + '%');
        $('input#totalInfscrPerWholRatio').val(totalInfscrPerWholRatio + '%');
        $('input#totalInfscrPerInfrmRatio').val(totalInfscrPerInfrmRatio + '%');
    }
    /*  입력 값에 따라 합계 및 비율 계산하는 함수 (E) */
    
  });
  
  // 모달창 닫는 함수
  function closeModal() {
    admin.modalsClose('modals');
    location.reload();
  }

</script>
