<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class=contants>
	<form name="frmCodeDtlInfo" id="frmCodeDtlInfo" method="post" action="#">
	<!-- info detail area start -->
	<div class="table-wrap view">
		<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
		<input type="hidden" id="clsfCd" name="clsfCd" value="${crtrMasterInfo.clsfCd}">
		<table>
			<colgroup>
				<col width="200px">
				<col width="">
				<col width="200px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th>코드</th>
					<td>${crtrMasterInfo.clsfCd}</td>
					<th>코드명</th>
					<td>${crtrMasterInfo.clsfNm}</td>
				</tr>
				<tr>
					<th>코드설명</th>
					<td>${crtrMasterInfo.clsfCdExpln}</td>
					<th>사용여부</th>
					<td>${crtrMasterInfo.useYn}</td>
				</tr>
				<tr>
					<th>등록자</th>
					<td>${crtrMasterInfo.frstRgtrId}</td>
					<th>등록일</th>
					<td>${crtrMasterInfo.frstRegDt}</td>
				</tr>
				<tr>
					<th>수정자</th>
					<td>${crtrMasterInfo.lastMdfrId}</td>
					<th>수정일</th>
					<td>${crtrMasterInfo.lastMdfcnDt}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- info detail area end -->
	
	<!-- button arae start -->
	<div class="btn-wrap align-right">
		<button type="button" id="btnList" name="btnList" class="btns color-gray" onclick="javascript:moveCodeListInfo(); return false;">목록</button>
		<button type="button" id="btnEdit" name="btnEdit" class="btns" onclick="javascript:moveEditUserInfo(); return false;">수정</button>
	</div>
	<!-- button area end  -->


	<div class="mid-title-wrap">
		<h2>소분류코드 목록</h2>
		<div class="btn-wrap align-right">
			<button type="button" class="btns size-small" id="btnPopAddMbAplInfo" name="btnPopAddMbAplInfo" onclick="javascript:moveAddCodeInfo('${crtrMasterInfo.clsfCd}'); return false;">추가</button>
			<button type="button" class="btns size-small" id="btnPopSaveMbAplInfo" name="btnPopSaveMbAplInfo" onclick="javascript:moveSaveCodeInfo(); return false;">저장</button>
		</div>
	</div>
	<div class="table-wrap view">
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
					<th>대분류코드<span class="required">필수</span></th>
					<th>코드<span class="required">필수</span></th>
					<th>코드명<span class="required">필수</span></th>
					<th>코드상세</th>
					<th>사용여부<span class="required">필수</span></th>
					<th>정렬순서<span class="required">필수</span></th>
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
				<c:if test="${!empty crtrSubList}">
					<c:forEach var="crtrSubListData" items="${crtrSubList}" varStatus="status">
							<tr>
								<td>${crtrSubListData.cdIdNo}</td>
								<td>${crtrSubListData.clsfCd}</td>
								<td>${crtrSubListData.cdId}</td>
								<td>${crtrSubListData.cdNm}</td>
								<td>${crtrSubListData.cdExpln}</td>
								<td>${crtrSubListData.useYn}</td>
								<td>${crtrSubListData.sortSn}</td>
								<td>${crtrSubListData.anxtCn1}</td>
								<td>${crtrSubListData.anxtCn2}</td>
								<td>${crtrSubListData.anxtCn3}</td>
								<td>${crtrSubListData.anxtCn4}</td>
								<td>${crtrSubListData.anxtCn5}</td>
								<%-- <td>${crtrSubListData.frstRgtrId}</td>
								<td>${crtrSubListData.frstRegDt}</td>
								<td>${crtrSubListData.lastMdfrId}</td>
								<td>${crtrSubListData.lastMdfcnDt}</td> --%>
								
							</tr>
					</c:forEach>
				</c:if>
					<c:if test="${empty crtrSubList}">
						<tr>
							<td colspan="12">No Data</td>
						</tr>
					</c:if>
			</tbody>
		</table>
	</div>
</form>
</div>
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">

function moveSaveCodeInfo(){
	let frm = document.frmCodeDtlInfo;
	
	let chkRegExpChar = /[\{\}\[\]\/?.,;:||\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	
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
		frm.action= contextPath+"/crtrInfoMgt/addClsfCdInfo.do";
		frm.submit();
	}
}
//추가 버튼
function moveAddCodeInfo(clsfCd) {	
	let popTblBody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7, popNewCell8, popNewCell9, popNewCell10, popNewCell11;	
	let popApyTypeData;
	
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
	
	popNewCell0.innerHTML  = "<div width=\"50px\"></div>";
	popNewCell1.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\">"+clsfCd+"</div>";
	popNewCell2.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"cdId_" + popViewRowNum + "\" name=\"cdId\" value=\"\"></div>";
	popNewCell3.innerHTML  = "<div class=\"fm-ele\" data-size=\"w100\"><input type=\"text\" id=\"cdNm_" + popViewRowNum + "\" name=\"cdNm\" value=\"\"></div>";
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
	 let frm = document.frmCodeDtlInfo;
	 frm.action= contextPath+"/crtrInfoMgt/crtrInfoList.do";
	 frm.submit();
 }
 
 //수정화면으로
 function moveEditUserInfo(){
	 let frm = document.frmCodeDtlInfo;
	 frm.srchWrtMode.value ='modify';
	 frm.action= contextPath+"/crtrInfoMgt/crtrInfoReg.do";
	 frm.submit();
 }
</script>