<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">
	<!-- <button type="button" class="btns size-small" id="btnChkDuplId" name="btnChkDuplId" onclick="javascript:checkDuplInstId(); return false;">중복검사</button> -->
	<!-- info detail area start -->
	<form name="frmCodeInfo" id="frmCodeInfo" method="post" action="#">
	<div class="table-wrap write">
		<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="${srchInfo.srchWrtMode}">
		<input type="hidden" id="clsfCd" name="clsfCd" value="${crtrMasterInfo.clsfCd}">
		<table>
			<colgroup>
				<col width="200px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>코드명<span class="required">필수</span></th>
					<td class="tl pl10">
						<div class="fm-ele" data-size="w500">
							<input type="text" id="clsfNm" name="clsfNm" value="${crtrMasterInfo.clsfNm}" placeholder="코드명 입력하세요" />
						</div>
					</td>
				</tr>
				<tr>
					<th>코드설명</th>
					<td class="tl pl10">
						<div class="fm-ele" data-size="w500">
							<input type="text" id="clsfCdExpln" name="clsfCdExpln" value="${crtrMasterInfo.clsfCdExpln}" placeholder="코드상세설명을 입력하세요" />
						</div>
					</td>
					</tr>
				<tr>
					<th>사용여부<span class="required">필수</span></th>
					<td class="tl pl10">
						<div class="fm-focus fm-select">
							<select id="useYn" name="useYn">
								<option value="Y" <c:if test="${crtrMasterInfo.useYn =='Y' or crtrMasterInfo.useYn ==''}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${crtrMasterInfo.useYn =='N'}">selected</c:if>>미사용</option>
							</select>
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<!-- info detail area end -->
	
	<!-- button arae start -->
	<div class="btn-wrap align-right">
		<button type="button" id="btnList" name="btnList" class="btns color-gray" onclick="javascript:moveCodeListInfo(); return false;">목록</button>
		<button type="button" id="btnEdit" name="btnEdit" class="btns" onclick="javascript:moveRegCodeMaster(); return false;">저장</button>
	</div>
	<!-- button area end  -->

	<div class="mid-title-wrap">
		<h2>소분류코드 추가</h2>
		<div class="btn-wrap align-right">
			<button type="button" class="btns size-small" id="btnPopAddMbAplInfo" name="btnPopAddMbAplInfo" onclick="javascript:moveAddMbAplInfo('${crtrMasterInfo.clsfCd}'); return false;">추가</button>
			<!-- <button type="button" class="btns size-small" id="btnPopAddMbAplInfo" name="btnPopAddMbAplInfo" onclick="javascript:moveAddMbAplInfo(); return false;">저장</button> -->
		</div>
	</div>
	<div class="table-wrap write">
		<table>
			<colgroup>
				<col width="80px">
				<col width="120px">
				<col width="150px">
				<col width="150px">
				<col width="150px">
				<col width="100px">
				<col width="100px">
				<col width="100px">
				<col width="100px">
				<col width="100px">
				<col width="100px">
				<col width="100px">
				<%-- <col width="100px">
				<col width="100px">
				<col width="100px">
				<col width="100px"> --%>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>대분류코드</th>
					<th>코드<span class="required">필수</span></th>
					<th>코드명<span class="required">필수</span></th>
					<th>코드상세</th>
					<th>사용여부<span class="required">필수</span></th>
					<th>정렬순번<span class="required">필수</span></th>
					<th>부가정보1</th>
					<th>부가정보2</th>
					<th>부가정보3</th>
					<th>부가정보4</th>
					<th>부가정보5</th>
					<!-- <th>등록일</th>
					<th>등록자</th>
					<th>수정일</th>
					<th>수정자</th> -->
				</tr>
			</thead>
			<tbody id="codeDtlTbody">						
				<c:if test="${srchInfo.srchWrtMode == 'modify'}">
					<c:if test="${!empty crtrSubList}">
						<c:forEach var="crtrSubData" items="${crtrSubList}" varStatus="status">
						<tr>
							<td><div class="fm-ele" data-size="30px">${crtrSubData.cdIdNo}
								<input type="hidden" id="modeStauts_${crtrSubData.cdIdNo}" name="modeStauts" value="M"></div></td>
							<td><div class="fm-ele" data-size="w100">${crtrSubData.clsfCd}</div></td>
							<td><div class="fm-ele" data-size="w150"><input type="text" id="cdId_${crtrSubData.cdIdNo}" name="cdId" value="${crtrSubData.cdId}" readonly></div></td>
							<td><div class="fm-ele" data-size="w150"><input type="text" id="cdNm_${crtrSubData.cdIdNo}" name="cdNm" value="${crtrSubData.cdNm}"></div></td>
							<td><div class="fm-ele" data-size="w150"><input type="text" id="cdExpln_${crtrSubData.cdIdNo}" name="cdExpln" value="${crtrSubData.cdExpln}"></div></td>
							<td>
								<div class="fm-focus fm-select" data-size="w100" style="width: 100%;" >
									<select id="subUseYn_${crtrSubData.cdIdNo}" name="subUseYn">
										<option value="Y" <c:if test="${crtrSubData.useYn =='Y'}">selected</c:if>>사용</option>
										<option value="N" <c:if test="${crtrSubData.useYn =='N'}">selected</c:if>>미사용</option>
									</select>
								</div>
							</td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="sortSn_${crtrSubData.cdIdNo}" name="sortSn" value="${crtrSubData.sortSn}"></div></td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="anxtCn1_${crtrSubData.cdIdNo}" name="anxtCn1" value="${crtrSubData.anxtCn1}"></div></td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="anxtCn2_${crtrSubData.cdIdNo}" name="anxtCn2" value="${crtrSubData.anxtCn2}"></div></td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="anxtCn3_${crtrSubData.cdIdNo}" name="anxtCn3" value="${crtrSubData.anxtCn3}"></div></td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="anxtCn4_${crtrSubData.cdIdNo}" name="anxtCn4" value="${crtrSubData.anxtCn4}"></div></td>
							<td><div class="fm-ele" data-size="w100"><input type="text" id="anxtCn5_${crtrSubData.cdIdNo}" name="anxtCn5" value="${crtrSubData.anxtCn5}"></div></td>
						</tr>	
						</c:forEach>
					</c:if>
					<c:if test="${empty crtrSubList}">
						<tr>
							<td colspan="11">No Data</td>
						</tr>
					</c:if>
				</c:if>
			</tbody>
		</table>
	</div>

</form>
</div>
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">

function moveRegCodeMaster() {
	
	let frm = document.frmCodeInfo;	
	let chkRegExpChar = /[\{\}\[\]\/?.,;:||\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	
	// if (cms_txt_is_empty(true, frm.clsfCd)) { alert("코드를 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.clsfNm)) { alert("코드명을 입력해 주십시오."); return false;}	
	// if (frm.chkDuplClsfCd.value == "N") { alert("코드 중복검사를 진행해 주십시오."); return false;}
	
	popTblBody = $("#codeDtlTbody");
	popNewRowNumber = popTblBody[0].rows.length;
	
	if(popNewRowNumber < 1){
		alert("소분류 코드정보를 입력해 주십시오.");
		return false;
	}
	
	//소분류 체크
	if (typeof($("input[name=cdId]")) != "undefined") {
			if (typeof($("input[name=cdId]").length) != "undefined" ) {
				for (let ci = 0; ci < $("input[name=cdId]").length; ci++) {
					if ($("input[name=cdId").eq(ci).val() =="") {
						alert("소분류 코드를 입력해 주십시오.");
						return false;
					}else{
						if (chkRegExpChar.test($("input[name=cdId").eq(ci).val())) {
							alert("특수문자는 입력하실 수 없습니다.");
							return false;
						}else{
							//if ($("input[name=clsfStts]").eq(ci).val() != "D") {
								for (let ki = 0; ki < $("input[name=cdId]").length; ki++ ) {
									if((ci != ki) && ($("input[name=cdId]").eq(ci).val() == $("input[name=cdId]").eq(ki).val())){
										alert("중복된 소분류 코드가 존재합니다.");
										return false;
									}
								}
								
								if ($("input[name=cdNm]").eq(ci).val() =="") {
									alert("소분류 코드명을 입력해 주십시오.");
									return false;
								}
								/*
								else {
									if (chkRegExpChar.test($("input[name=cdNm]").eq(ci).val())) {
										alert("특수문자는 입력하실 수 없습니다. Nm" + ci);
										return false;
									}
								}
								*/
								if ($("input[name=sortSn]").eq(ci).val() == "") { alert("정렬 순번을 입력해 주십시오."); return false;}
							//}
						}
					} 
				}
			}
	}			
	
	if (confirm("저장 하시겠습니까?")) {
		frm.action= contextPath + "/crtrInfoMgt/saveClsfCdInfo.do";
		frm.submit();
	}
}
/* 
function checkDuplClsfCd() {
	let frm = document.frmCodeInfo;
	if (cms_txt_is_empty(true, frm.clsfCd)) {
		alert("코드를 입력해 주세요");
		return false;
	} else {
		//대분류 코드 중복검사여부 초기화
		frm.chkDuplClsfCd.value = "N";
		
		$.ajax({
			type : "GET",
			url : "/crtrInfoMgt/checkDuplClsfCdInfo.do",
			async : true,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : {
				"checkMode" : "checkClsfCd",
				"checkData" : frm.clsfCd.value
			},
			success : function(rtnData) {
				if (rtnData == "Y") {
					alert(frm.clsfCd.value + "는 이미 등록된 기관아이디입니다.");
					return false;
				} else {
					frm.chkDuplClsfCd.value = "Y";
					alert("중복이 아닙니다. 계속 진행 하십시오.");
				}
			}, 
			error : function(request, status, error) {
				console.log(error);
			}
		});
		
	}
	
} */

//추가 버튼
function moveAddMbAplInfo(clsfCd) {	
	let popTblBody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7, popNewCell8, popNewCell9, popNewCell10, popNewCell11;	
	let popApyTypeData;
	// let clsfCd;
	
	//clsfCd =$("#clsfCd").val();
	popTblBody = $("#codeDtlTbody");
	
	popNewRowNumber = popTblBody[0].rows.length;
	popNewRow = popTblBody[0].insertRow(popNewRowNumber);
		
	popNewCell0 = popNewRow.insertCell();
	popNewCell1 = popNewRow.insertCell();
	popNewCell2 = popNewRow.insertCell();
	popNewCell3 = popNewRow.insertCell();
	popNewCell4 = popNewRow.insertCell();
	popNewCell5 = popNewRow.insertCell();
	popNewCell6 = popNewRow.insertCell();
	popNewCell7 = popNewRow.insertCell();
	popNewCell8 = popNewRow.insertCell();
	popNewCell9 = popNewRow.insertCell();
	popNewCell10 = popNewRow.insertCell();
	popNewCell11 = popNewRow.insertCell();
	
	popViewRowNum = popTblBody[0].rows.length;
	
	popNewCell0.innerHTML  = "<div></div>";
	popNewCell1.innerHTML  = "<div class=\"fm-ele\" data-size=\"w120\">"+clsfCd+"</div><input type=\"hidden\" id=\"modeStauts_" + popViewRowNum + "\" name=\"modeStauts\" value=\"I\">";
	popNewCell2.innerHTML  = "<div class=\"fm-ele\" data-size=\"w150\"><input type=\"text\" id=\"cdId_" + popViewRowNum + "\" name=\"cdId\" value=\"\"></div>";
	popNewCell3.innerHTML  = "<div class=\"fm-ele\" data-size=\"w150\"><input type=\"text\" id=\"cdNm_" + popViewRowNum + "\" name=\"cdNm\" value=\"\"></div>";
	popNewCell4.innerHTML  = "<div class=\"fm-ele\" data-size=\"w150\"><input type=\"text\" id=\"cdExpln_" + popViewRowNum + "\" name=\"cdExpln\" value=\"\"></div>";
	popNewCell5.innerHTML  = "<div class=\"fm-focus fm-select\" data-size=\"w100\"><select id=\"subUseYn_" + popViewRowNum + "\" name=\"subUseYn\" class=\"\"><option value=\"Y\" selected>사용</option><option value=\"N\" >사용안함</option></select></div>";	
	popNewCell6.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"sortSn_" + popViewRowNum + "\" name=\"sortSn\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\"  onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\"></div>";
	popNewCell7.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"anxtCn1_" + popViewRowNum + "\" name=\"anxtCn1\" value=\"\"></div>";
	popNewCell8.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"anxtCn2_" + popViewRowNum + "\" name=\"anxtCn2\" value=\"\"></div>";
	popNewCell9.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"anxtCn3_" + popViewRowNum + "\" name=\"anxtCn3\" value=\"\"></div>";
	popNewCell10.innerHTML = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"anxtCn4_" + popViewRowNum + "\" name=\"anxtCn4\" value=\"\"></div>";
	popNewCell11.innerHTML = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"anxtCn5_" + popViewRowNum + "\" name=\"anxtCn5\" value=\"\"></div>";
}

//목록으로
function moveCodeListInfo(){
	 let frm = document.frmCodeInfo;
	 frm.action= contextPath+"/crtrInfoMgt/crtrInfoList.do";
	 frm.submit();
}
</script>