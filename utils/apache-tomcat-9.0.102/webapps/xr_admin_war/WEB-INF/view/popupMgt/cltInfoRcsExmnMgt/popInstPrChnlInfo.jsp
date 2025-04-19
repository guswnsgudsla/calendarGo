<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>4.정보 서비스 현황 - 2) 기관별 SNS 홍보채널 운영 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnInstPrChnlInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px"></col>
				<col width="220px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="390px"></col>
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>SNS 채널명</th>
					<th>SNS 채널주소</th>
					<th>운영주체(자체/위탁)</th>
					<th>서비스 목적</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach var="oldInstPrChnlData" items="${oldPopRcsExmnInstPrChnlInfoList}" varStatus="status">	
				<tr>
					<td>${status.count}</td>
					<td>${oldInstPrChnlData.chnlTypeNm}</td>
					<td style="text-align:left;">${oldInstPrChnlData.chnlAddr}</td>
					<td>${oldInstPrChnlData.operMnbdTypeNm}</td>
					<td style="text-align:left;">${oldInstPrChnlData.srvcPrpsExpln}</td>
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
		<div class="between">
			<h2>[환경조사]</h2>
			<button type="button" class="btns size-xsmall" id="btnPopAddInstPrChnlInfo" name="btnPopAddInstPrChnlInfo" onclick="javascript:moveAddInstPrChnlInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px"></col>
				<col width="220px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="300px"></col>
				<col width="90px"></col>
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>SNS 채널명</th>
					<th>SNS 채널주소</th>
					<th>운영주체(자체/위탁)</th>
					<th>서비스 목적</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="popInstPrChnlTbody">
	<c:if test="${!empty nowPopRcsExmnInstPrChnlInfoList}">
		<c:forEach var="nowInstPrChnlData" items="${nowPopRcsExmnInstPrChnlInfoList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><div class="fm-focus fm-select" data-size="100p">
							<input type="hidden" id="popStts_${nowInstPrChnlData.chnlSn}" name="popStts" value="M">
							<input type="hidden" id="popChnlSn_${nowInstPrChnlData.chnlSn}" name="popChnlSn" value="${nowInstPrChnlData.chnlSn}">
							<select id="popChnlTypeCd_${nowInstPrChnlData.chnlSn}" name="popChnlTypeCd">
								<option value="" <c:if test="${nowInstPrChnlData.chnlTypeCd == ''}">selected</c:if>>선택</option>
				<c:if test="${!empty instPrChnlTypeCmmnCdList}">
					<c:forEach var="instPrChnlCdData" items="${instPrChnlTypeCmmnCdList}">
								<option value="${instPrChnlCdData.cdId}" <c:if test="${nowInstPrChnlData.chnlTypeCd == instPrChnlCdData.cdId}">selected</c:if>>${instPrChnlCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popChnlAddr_${nowInstPrChnlData.chnlSn}" name="popChnlAddr" value="${nowInstPrChnlData.chnlAddr}"></div></td>
					<td>
						<div class="fm-focus fm-select" data-size="100p">
							<select id="popOperMnbdTypeCd_${nowInstPrChnlData.chnlSn}" name="popOperMnbdTypeCd">
								<option value="" <c:if test="${nowInstPrChnlData.operMnbdTypeCd == ''}">selected</c:if>>선택</option>
				<c:if test="${!empty instOperMnbdCmmnCdList}">
					<c:forEach var="instOperMndbCdData" items="${instOperMnbdCmmnCdList}">
								<option value="${instOperMndbCdData.cdId}" <c:if test="${nowInstPrChnlData.operMnbdTypeCd == instOperMndbCdData.cdId}">selected</c:if>>${instOperMndbCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcPrpsExpln_${nowInstPrChnlData.chnlSn}" name="popSrvcPrpsExpln" value="${nowInstPrChnlData.srvcPrpsExpln}"></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteInstPrChnlInfoRow_${nowInstPrChnlData.chnlSn}" name="btnPopDeleteInstPrChnlInfoRow" onclick="javascript:moveDeleteInstPrChnlInfo('${nowInstPrChnlData.chnlSn}'); return false;">삭제</button></td>
				</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty nowPopRcsExmnInstPrChnlInfoList}">
				<tr>
					<td>1</td>
					<td><div class="fm-focus fm-select" data-size="100p">
						    <input type="hidden" id="popStts_1" name="popStts" value="I">
						    <input type="hidden" id="popChnlSn_1" name="popChnlSn" value="0">
							<select id="popChnlTypeCd_1" name="popChnlTypeCd">
								<option value="">선택</option>
				<c:if test="${!empty instPrChnlTypeCmmnCdList}">
					<c:forEach var="instPrChnlCdData" items="${instPrChnlTypeCmmnCdList}">
								<option value="${instPrChnlCdData.cdId}">${instPrChnlCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popChnlAddr_1" name="popChnlAddr" value=""></div></td>
					<td>
						<div class="fm-focus fm-select" data-size="100p">
							<select id="popOperMnbdTypeCd_1" name="popOperMnbdTypeCd">
								<option value="">선택</option>
				<c:if test="${!empty instOperMnbdCmmnCdList}">
					<c:forEach var="instOperMndbCdData" items="${instOperMnbdCmmnCdList}">
								<option value="${instOperMndbCdData.cdId}">${instOperMndbCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcPrpsExpln_1" name="popSrvcPrpsExpln" value=""></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteInstPrChnlInfoRow_1" name="btnPopDeleteInstPrChnlInfoRow" onclick="javascript:moveDeleteInstPrChnlInfo('1'); return false;">삭제</button></td>
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
		<button type="button" class="btns" id="btnPopSaveRcsexmnInstPrChnlInfo" name="btnPopSaveRcsexmnInstPrChnlInfo" onclick="javascript:moveSaveRcsexmnInstPrChnlInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInstPrChnlInfo" name="btnPopSaveRcsexmnInstPrChnlInfo" onclick="javascript:moveSaveRcsexmnInstPrChnlInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnInstPrChnlInfo" name="btnPopCloseRcsexmnInstPrChnlInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowPopRcsExmnInstPrChnlInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getPrChnlDataResult() {
		let prChnlData = "";
		<c:if test="${!empty instPrChnlTypeCmmnCdList}">
			<c:forEach var="instPrChnlCdData" items="${instPrChnlTypeCmmnCdList}">
			prChnlData += "<option value=\"${instPrChnlCdData.cdId}\">${instPrChnlCdData.cdNm}</option>";
			</c:forEach>
		</c:if>
		return prChnlData;
	}
	
	function getOperMnbdDataResult() {
		let operMnbdData = "";
		<c:if test="${!empty instOperMnbdCmmnCdList}">
			<c:forEach var="instOperMndbCdData" items="${instOperMnbdCmmnCdList}">
		operMnbdData += "<option value=\"${instOperMndbCdData.cdId}\">${instOperMndbCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		
		return operMnbdData;
	}
	
	function moveDeleteInstPrChnlInfo(paramData) {
		let oldInstPrChnlStts = $("#popStts_" + paramData).val();
		if (oldInstPrChnlStts == "D") {
			alert("이미 삭제로 설정된 데이터입니다.");
			return false;
		} else {
			$("#popChnlTypeCd_" + paramData).attr("disabled", true);
			$("#popChnlAddr_" + paramData).attr("readonly", true);
			$("#popOperMnbdTypeCd_" + paramData).attr("disabled", true);
			$("#popSrvcPrpsExpln_" + paramData).attr("readonly", true);
			$("#popViewStts_" + paramData).text("D");
			$("#popStts_" + paramData).val("D");
		}
	}
	
	function moveAddInstPrChnlInfo() {
		let popTblTbody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5;
		let prChnlDataValue, operMnbdDataValue;
		
		prChnlDataValue = getPrChnlDataResult();
		operMnbdDataValue = getOperMnbdDataResult();
		
		popTblTbody = $("#popInstPrChnlTbody");
		popNewRowNumber = popTblTbody[0].rows.length;
		popNewRow = popTblTbody[0].insertRow(popNewRowNumber);
		popNewCell0 = popNewRow.insertCell();
		popNewCell1 = popNewRow.insertCell();
		popNewCell2 = popNewRow.insertCell();
		popNewCell3 = popNewRow.insertCell();
		popNewCell4 = popNewRow.insertCell();
		popNewCell5 = popNewRow.insertCell();
		
		popViewRowNum = popTblTbody[0].rows.length;
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		popNewCell0.innerHTML = nowListLen;
		popNewCell1.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\">"
							  + "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\">"
							  + "<input type=\"hidden\" id=\"popChnlSn_" + popViewRowNum + "\" name=\"popChnlSn\" value=\"0\">"
							  + "<select id=\"popChnlTypeCd_" + popViewRowNum + "\" name=\"popChnlTypeCd\"><option value=\"\">선택</option>" + prChnlDataValue + "</select></div>";
		popNewCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popChnlAddr_" + popViewRowNum + "\" name=\"popChnlAddr\" value=\"\"></div>";
		popNewCell3.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popOperMnbdTypeCd_" + popViewRowNum + "\" name=\"popOperMnbdTypeCd\"><option value=\"\">선택</option>" + operMnbdDataValue + "</select></div>";
		popNewCell4.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcPrpsExpln_" + popViewRowNum + "\" name=\"popSrvcPrpsExpln\" value=\"\"></div>";
		popNewCell5.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteInstPrChnlInfoRow_" + popViewRowNum + "\" name=\"btnPopDeleteInstPrChnlInfoRow\" onclick=\"javascript:moveDeleteInstPrChnlInfo(\'" + popViewRowNum + "\'); return false;\">삭제</button>";
		
	}
	
</script>