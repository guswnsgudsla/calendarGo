<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap table-border">
		<div class="title between">
			<h2>4.정보 서비스현황 -1) 모바일앱/웹 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnMbAplInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px;"></col>
				<col width="120px;"></col>
				<col width="*"></col>
				<col width="460px"></col>
				<col width="300px"></col>
				<col width="120px"></col>
				<col width="260px;"></col>
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th colspan="2">모바일 앱/웹 명칭</th>
					<th>모바일 웹 주소</th>
					<th>모바일 OS(IOS, 안드로이드)</th>
					<th>개발연도</th>
					<th>개발예산(백만원)</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="oldMbAplData" items="${oldPopRcsExmnMbAplInfoList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${oldMbAplData.aplTypeNm}</td>
					<td style="text-align:left;"><c:out value='${oldMbAplData.aplNm}'/></td>
					<td style="text-align:left;"><c:out value='${oldMbAplData.aplWebUrlAddr}'/></td>
					<td style="text-align:left;"><c:out value='${oldMbAplData.osNm}'/></td>
					<td><c:out value='${oldMbAplData.devYr}'/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldMbAplData.devBgtAmt}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<div class="between mt20">
			<h2>[환경조사]</h2>
			<button type="button" class="btns size-xsmall" id="btnPopAddMbAplInfo" name="btnPopAddMbAplInfo" onclick="javascript:moveAddMbAplInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px;"></col>
				<col width="120px;"></col>
				<col width="*"></col>
				<col width="460px"></col>
				<col width="300px"></col>
				<col width="120px"></col>
				<col width="160px;"></col>
				<col width="100px;"></col>
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th colspan="2">모바일 앱/웹 명칭</th>
					<th>모바일 웹 주소</th>
					<th>모바일 OS(IOS, 안드로이드)
						<button class="btn-tooltip"
						data-tooltip="
						<b>모바일 OS :</b>안드로이드, IOS 등을 명시
						">?</button>
					</th>
					<th>개발연도</th>
					<th>개발예산(백만원)</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="popMbAplTbody">
		<c:if test="${!empty nowPopRcsExmnMbAplInfoList}">
			<c:forEach var="nowMbAplData" items="${nowPopRcsExmnMbAplInfoList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><div class="fm-focus fm-select" data-size="100p">
						<input type="hidden" id="popStts_${nowMbAplData.aplSn}" name="popStts" value="M">
						<input type="hidden" id="popAplSn_${nowMbAplData.aplSn}" name="popAplSn" value="${nowMbAplData.aplSn}">
						<select id="popAplTypeCd_${nowMbAplData.aplSn}" name="popAplTypeCd">
							<option value="">선택</option>
				<c:if test="${!empty aplTypeCmmnCdList}">
					<c:forEach var="aplTypeCdData" items="${aplTypeCmmnCdList}">
							<option value="${aplTypeCdData.cdId}" <c:if test="${nowMbAplData.aplTypeCd == aplTypeCdData.cdId}">selected</c:if>>${aplTypeCdData.cdNm}</option>
					</c:forEach>
				</c:if>
						</select>
					</div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popAplNm_${nowMbAplData.aplSn}" name="popAplNm" value="${nowMbAplData.aplNm}"></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popAplWebUrlAddr_${nowMbAplData.aplSn}" name="popAplWebUrlAddr" value="${nowMbAplData.aplWebUrlAddr}"></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popOsNm_${nowMbAplData.aplSn}" name="popOsNm" value="${nowMbAplData.osNm}"></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDevYr_${nowMbAplData.aplSn}" name="popDevYr" value="${nowMbAplData.devYr}" maxlength="4"></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDevBgtAmt_${nowMbAplData.aplSn}" name="popDevBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowMbAplData.devBgtAmt}" style="ime-mode:disabled;" placeholder="합계 예산 입력"/></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteMbAplInfoRow_${nowMbAplData.aplSn}" name="btnPopDeleteMbAplInfoRow" onclick="javascript:moveDeleteMbAplInfo('${nowMbAplData.aplSn}'); return false;">삭제</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty nowPopRcsExmnMbAplInfoList}">
				<tr>
					<td>1</td>
					<td><div class="fm-focus fm-select" data-size="100p">
						<input type="hidden" id="popStts_1" name="popStts" value="I">
						<input type="hidden" id="popAplSn_1" name="popAplSn" value="0">
						<select id="popAplTypeCd_1" name="popAplTypeCd">
							<option value="">선택</option>
				<c:if test="${!empty aplTypeCmmnCdList}">
					<c:forEach var="aplTypeCdData" items="${aplTypeCmmnCdList}">
							<option value="${aplTypeCdData.cdId}">${aplTypeCdData.cdNm}</option>
					</c:forEach>
				</c:if>
						</select>
					</div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popAplNm_1" name="popAplNm" value=""></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popAplWebUrlAddr_1" name="popAplWebUrlAddr" value=""></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popOsNm_1" name="popOsNm" value=""></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDevYr_1" name="popDevYr" value="" maxlength="4"></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDevBgtAmt_1" name="popDevBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="개발 예산 입력"/></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteMbAplInfoRow_1" name="btnPopDeleteMbAplInfoRow" onclick="javascript:moveDeleteMbAplInfo('1'); return false;">삭제</button></td>
				</tr>
		</c:if>
			</tbody>
		</table>
		</div>
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnMbAplInfo" name="btnPopSaveRcsexmnMbAplInfo" onclick="javascript:moveSaveRcsexmnMbAplInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnMbAplInfo" name="btnPopSaveRcsexmnMbAplInfo" onclick="javascript:moveSaveRcsexmnMbAplInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnMbAplInfo" name="btnPopCloseRcsexmnMbAplInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowPopRcsExmnMbAplInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getAplTypeCdData() {
		let aplTypeData = "";
		<c:if test="${!empty aplTypeCmmnCdList}">
			<c:forEach var="aplTypeCdData" items="${aplTypeCmmnCdList}">
		aplTypeData += "<option value=\"${aplTypeCdData.cdId}\">${aplTypeCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		return aplTypeData;
	}
	
	function moveDeleteMbAplInfo(paramAplNo) {
		let oldMbAplStts = $("#popStts_" + paramAplNo).val();
		if (oldMbAplStts == "D") {
			alert("이미 삭제로 설정된 데이터입니다.");
			return false;
		} else {
			$("#popAplTypeCd_" + paramAplNo).attr("disabled", true);
			$("#popAplNm_" + paramAplNo).attr("readonly", true);
			$("#popAplWebUrlAddr_" + paramAplNo).attr("readonly", true);
			$("#popOsNm_" + paramAplNo).attr("readonly", true);
			$("#popDevYr_" + paramAplNo).attr("readonly", true);
			$("#popDevBgtAmt_" + paramAplNo).attr("readonly", true);
			$("#popViewStts_" + paramAplNo).text("D");
			$("#popStts_" + paramAplNo).val("D");
		}
	}
	
	function moveAddMbAplInfo() {
		let popTblBody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7;
		let popApyTypeData;
		
		popApyTypeData = getAplTypeCdData();
		
		popTblBody = $("#popMbAplTbody");
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
		
		popViewRowNum = popTblBody[0].rows.length;
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		popNewCell0.innerHTML = nowListLen;
		popNewCell1.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\">"
							  + "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\">"
							  + "<input type=\"hidden\" id=\"popAplSn_" + popViewRowNum + "\" name=\"popAplSn\" value=\"0\">"
							  + "<select id=\"popAplTypeCd_" + popViewRowNum + "\" name=\"popAplTypeCd\"><option value=\"\">선택</option>" + popApyTypeData + "</select></div>";
		popNewCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popAplNm_" + popViewRowNum + "\" name=\"popAplNm\" value=\"\"></div>";
		popNewCell3.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popAplWebUrlAddr_" + popViewRowNum + "\" name=\"popAplWebUrlAddr\" value=\"\"></div>";
		popNewCell4.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popOsNm_" + popViewRowNum + "\" name=\"popOsNm\" value=\"\"></div>";
		popNewCell5.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popDevYr_" + popViewRowNum + "\" name=\"popDevYr\" value=\"\" maxlength=\"4\"></div>";
		popNewCell6.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popDevBgtAmt_" + popViewRowNum + "\" name=\"popDevBgtAmt\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"개발 예산 입력\"/></div>";
		popNewCell7.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteMbAplInfoRow_" + popViewRowNum + "\" name=\"btnPopDeleteMbAplInfoRow\" onclick=\"javascript:moveDeleteMbAplInfo(\'" + popViewRowNum + "\'); return false;\">삭제</button>";
	}
	
</script>