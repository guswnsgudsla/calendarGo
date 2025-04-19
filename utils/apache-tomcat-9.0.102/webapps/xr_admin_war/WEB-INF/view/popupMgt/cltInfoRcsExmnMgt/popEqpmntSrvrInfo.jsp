<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>5.인프라 현황 - 2)서버 장비 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	
	<c:if test="${!empty oldPopRcsExmnEqpmntSrvrInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="40px"></col>
					<col width="90px"></col>
					<col width="135px"></col>
					<col width="135px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="80px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="200px"></col>
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2"></th>
						<th rowspan="2">구분</th>
						<th rowspan="2">품목</th>
						<th rowspan="2">품명(모델명)</th>
						<th rowspan="2">OS 및 버전</th>
						<th rowspan="2">제조사(공급사)</th>
						<th colspan="3">사양</th>
						<th rowspan="2">보유형태</th>
						<th rowspan="2">수량</th>
						<th rowspan="2">도입연도(구입시기)</th>
						<th rowspan="2">가상화유무</th>
						<th rowspan="2">도입비용(구매비용)</th>
						<th rowspan="2">임대장비유지관리비용</th>
						<th rowspan="2">용도</th>
					</tr>
					<tr>
						<th>CPU</th>
						<th>RAM</th>
						<th>HDD</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach var="oldEqpmntSrvrData" items="${oldPopRcsExmnEqpmntSrvrInfoList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${oldEqpmntSrvrData.srvrTypeNm}</td>
						<td style="text-align:left;">${oldEqpmntSrvrData.itemNm}</td>
						<td style="text-align:left;">${oldEqpmntSrvrData.mdlNm}</td>
						<td style="text-align:left;">${oldEqpmntSrvrData.osNm}</td>
						<td>${oldEqpmntSrvrData.mkrNm}</td>
						<td>${oldEqpmntSrvrData.srvrCpuNm}</td>
						<td>${oldEqpmntSrvrData.srvrMmryNm}</td>
						<td>${oldEqpmntSrvrData.strSzCn}</td>
						<td>${oldEqpmntSrvrData.keepTypeCn}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrData.srvrEqpmntCnt}"/></td>
						<td>${oldEqpmntSrvrData.itdiYr}</td>
						<td>${oldEqpmntSrvrData.vrAplcnYnNm}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrData.itdiCost}"/></td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrData.operCost}"/></td>
						<td>${oldEqpmntSrvrData.usgExpln}</td>
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
			<button type="button" class="btns size-xsmall" id="btnPopAddEqpmntSrvrInfo" name="btnPopAddEqpmntSrvrInfo" onclick="javascript:moveAddEqpmntSrvrInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll div-scroll-horizontal">
			<table class="table-small">
				<caption></caption>
				<colgroup>
					<col width="40px"></col>
					<col width="90px"></col>
					<col width="135px"></col>
					<col width="135px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="80px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="110px"></col>
					<col width="90px"></col>
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2"></th>
						<th rowspan="2">구분</th>
						<th rowspan="2">품목</th>
						<th rowspan="2">품명(모델명)</th>
						<th rowspan="2">OS 및 버전</th>
						<th rowspan="2">제조사(공급사)</th>
						<th colspan="3">사양</th>
						<th rowspan="2">보유형태</th>
						<th rowspan="2">수량</th>
						<th rowspan="2">도입연도(구입시기)</th>
						<th rowspan="2">가상화유무</th>
						<th rowspan="2">도입비용(구매비용)</th>
						<th rowspan="2">임대장비유지관리비용
							<button class="btn-tooltip"
							data-tooltip="
							<b>장비유지관리비용 :</b>서버 장비를 관리하는 데 드는 연관비용(민관, 위탁 비용을 포함)
							">?</button>
						</th>
						<th rowspan="2">용도</th>
						<th rowspan="2"></th>
					</tr>
					<tr>
						<th>CPU</th>
						<th>RAM</th>
						<th>HDD</th>
					</tr>
				</thead>
				<tbody id="popTblSrvrTbody">
			<c:if test="${!empty nowRcsExmnEqpmntSrvrInfoList}">
				<c:forEach var="nowEqpmntSrvrData" items="${nowRcsExmnEqpmntSrvrInfoList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>
							<div class="fm-focus fm-select" data-size="100p">
								<input type="hidden" id="popStts_${nowEqpmntSrvrData.srvrSn}" name="popStts" value="M">
								<input type="hidden" id="popSrvrSn_${nowEqpmntSrvrData.srvrSn}" name="popSrvrSn" value="${nowEqpmntSrvrData.srvrSn}">
								<select id="popSrvrTypeCd_${nowEqpmntSrvrData.srvrSn}" name="popSrvrTypeCd">
					<c:if test="${!empty srvrTypeCmmnCdList}">
						<c:forEach var="srvrTypeCdData" items="${srvrTypeCmmnCdList}">
									<option value="${srvrTypeCdData.cdId}" <c:if test="${nowEqpmntSrvrData.srvrTypeCd == srvrTypeCdData.cdId}">selected</c:if>>${srvrTypeCdData.cdNm}</option>
						</c:forEach>
					</c:if>
								</select>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItemNm_${nowEqpmntSrvrData.srvrSn}" name="popItemNm" value="${nowEqpmntSrvrData.itemNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popMdlNm_${nowEqpmntSrvrData.srvrSn}" name="popMdlNm" value="${nowEqpmntSrvrData.mdlNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popOsNm_${nowEqpmntSrvrData.srvrSn}" name="popOsNm" value="${nowEqpmntSrvrData.osNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popMkrNm_${nowEqpmntSrvrData.srvrSn}" name="popMkrNm" value="${nowEqpmntSrvrData.mkrNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrCpuNm_${nowEqpmntSrvrData.srvrSn}" name="popSrvrCpuNm" value="${nowEqpmntSrvrData.srvrCpuNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrMmryNm_${nowEqpmntSrvrData.srvrSn}" name="popSrvrMmryNm" value="${nowEqpmntSrvrData.srvrMmryNm}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popStrSzCn_${nowEqpmntSrvrData.srvrSn}" name="popStrSzCn" value="${nowEqpmntSrvrData.strSzCn}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popKeepTypeCn_${nowEqpmntSrvrData.srvrSn}" name="popKeepTypeCn" value="${nowEqpmntSrvrData.keepTypeCn}"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrEqpmntCnt_${nowEqpmntSrvrData.srvrSn}" name="popSrvrEqpmntCnt" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrData.srvrEqpmntCnt}" maxlength="3" style="ime-mode:disabled;" placeholder="합계 예산 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItdiYr_${nowEqpmntSrvrData.srvrSn}" name="popItdiYr" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrData.itdiYr}" maxlength="4" style="ime-mode:disabled;" placeholder="도입연도 입력"></div></td>
						<td><div class="fm-focus fm-select" data-size="100p">
								<select id="popVrAplcnYn_${nowEqpmntSrvrData.srvrSn}" name="popVrAplcnYn">
									<option value="" <c:if test="${empty nowEqpmntSrvrData.vrAplcnYn}">selected</c:if>>해당없음</option>
									<option value="Y" <c:if test="${nowEqpmntSrvrData.vrAplcnYn eq 'Y'}">selected</c:if>>O</option>
									<option value="N" <c:if test="${nowEqpmntSrvrData.vrAplcnYn eq 'N'}">selected</c:if>>X</option>
								</select>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItdiCost_${nowEqpmntSrvrData.srvrSn}" name="popItdiCost" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrData.itdiCost}" style="ime-mode:disabled;" placeholder="합계 예산 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popOperCost_${nowEqpmntSrvrData.srvrSn}" name="popOperCost" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrData.operCost}" style="ime-mode:disabled;" placeholder="합계 예산 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popUsgExpln_${nowEqpmntSrvrData.srvrSn}" name="popUsgExpln" value="${nowEqpmntSrvrData.usgExpln}"></div></td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteSrvrInfoRow_${nowEqpmntSrvrData.srvrSn}" name="btnPopDeleteSrvrInfoRow" onclick="javascript:moveDeleteEqpmntSrvrInfo('${nowEqpmntSrvrData.srvrSn}'); return false;">삭제</button></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty nowRcsExmnEqpmntSrvrInfoList}">
					<tr>
						<td>1</td>
						<td>
							<div class="fm-focus fm-select" data-size="100p">
								<input type="hidden" id="popStts_1" name="popStts" value="I">
								<input type="hidden" id="popSrvrSn_1" name="popSrvrSn" value="0">
								<select id="popSrvrTypeCd_1" name="popSrvrTypeCd">
					<c:if test="${!empty srvrTypeCmmnCdList}">
						<c:forEach var="srvrTypeCdData" items="${srvrTypeCmmnCdList}">
									<option value="${srvrTypeCdData.cdId}">${srvrTypeCdData.cdNm}</option>
						</c:forEach>
					</c:if>
								</select>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItemNm_1" name="popItemNm" value="" placeholder="품목 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popMdlNm_1" name="popMdlNm" value="" placeholder="품명(모델명) 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popOsNm_1" name="popOsNm" value="" placeholder="OS 및 버전 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popMkrNm_1" name="popMkrNm" value="" placeholder="제조사(공급사) 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrCpuNm_1" name="popSrvrCpuNm" value="" placeholder="CPU사양 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrMmryNm_1" name="popSrvrMmryNm" value="" placeholder="RAM사양 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popStrSzCn_1" name="popStrSzCn" value="" placeholder="저장장치 사양 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popKeepTypeCn_1" name="popKeepTypeCn" value="" placeholder="보유 형태 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvrEqpmntCnt_1" name="popSrvrEqpmntCnt" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" maxlength="3" placeholder="수량 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItdiYr_1" name="popItdiYr" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" maxlength="4" placeholder="도입 연도 입력"></div></td>
						<td><div class="fm-focus fm-select" data-size="100p">
								<select id="popVrAplcnYn_1" name="popVrAplcnYn">
									<option value="">해당없음</option>
									<option value="Y">O</option>
									<option value="N">X</option>
								</select>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popItdiCost_1" name="popItdiCost" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="도입 비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popOperCost_1" name="popOperCost" class="tr pl10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="유지 비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popUsgExpln_1" name="popUsgExpln" value="" placeholder="용도 입력"></div></td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteSrvrInfoRow_1" name="btnPopDeleteSrvrInfoRow" onclick="javascript:moveDeleteEqpmntSrvrInfo('1'); return false;">삭제</button></td>
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
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSrvrInfo" name="btnPopSaveRcsexmnEqpmentSrvrInfo" onclick="javascript:moveSaveRcsexmnEqpmentSrvrInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSrvrInfo" name="btnPopSaveRcsexmnEqpmentSrvrInfo" onclick="javascript:moveSaveRcsexmnEqpmentSrvrInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnEqpmentSrvrInfo" name="btnPopCloseRcsexmnEqpmentSrvrInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowRcsExmnEqpmntSrvrInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	//서버 장비 구분 가져오기
	function getSrvrTypeOptionData() {
		let srvrTypeOpionText = "";
		<c:if test="${!empty srvrTypeCmmnCdList}">
			<c:forEach var="srvrTypeCdData" items="${srvrTypeCmmnCdList}">
			srvrTypeOpionText +="<option value=\"${srvrTypeCdData.cdId}\">${srvrTypeCdData.cdNm}</option>";
			</c:forEach>
		</c:if>
		return srvrTypeOpionText;
	}
	
	function moveDeleteEqpmntSrvrInfo(paramDataNo) {
		let oldEqpmntSrvrStts = $("#popStts_" + paramDataNo).val();
		if (oldEqpmntSrvrStts == "D") {
			alert("이미 삭제로 설정되었습니다.");
			return false;
		} else {
			$("#popSrvrTypeCd_" + paramDataNo).attr("disabled", true);
			$("#popItemNm_" + paramDataNo).attr("readonly", true);
			$("#popMdlNm_" + paramDataNo).attr("readonly", true);
			$("#popOsNm_" + paramDataNo).attr("readonly", true);
			$("#popMkrNm_" + paramDataNo).attr("readonly", true);
			$("#popSrvrCpuNm_" + paramDataNo).attr("readonly", true);
			$("#popSrvrMmryNm_" + paramDataNo).attr("readonly", true);
			$("#popStrSzCn_" + paramDataNo).attr("readonly", true);
			$("#popKeepTypeCn_" + paramDataNo).attr("readonly", true);
			$("#popSrvrEqpmntCnt_" + paramDataNo).attr("readonly", true);
			$("#popItdiYr_" + paramDataNo).attr("readonly", true);
			$("#popVrAplcnYn_" + paramDataNo).attr("disabled", true);
			$("#popItdiCost_" + paramDataNo).attr("readonly", true);
			$("#popOperCost_" + paramDataNo).attr("readonly", true);
			$("#popUsgExpln_" + paramDataNo).attr("readonly", true);
			$("#popViewStts_" + paramDataNo).text("D");
			$("#popStts_" + paramDataNo).val("D");
		}
	}
	
	//
	function moveAddEqpmntSrvrInfo() {
		let popTblTBody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7, popNewCell8, popNewCell9, popNewCell10, popNewCell11, popNewCell12, popNewCell13, popNewCell14, popNewCell15, popNewCell16;
		let srvrTypeOptionDataText = getSrvrTypeOptionData();
		
		popTblTBody = $("#popTblSrvrTbody");
		popNewRowNumber = popTblTBody[0].rows.length;
		popNewRow = popTblTBody[0].insertRow(popNewRowNumber);
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
		popNewCell12 = popNewRow.insertCell();
		popNewCell13 = popNewRow.insertCell();
		popNewCell14 = popNewRow.insertCell();
		popNewCell15 = popNewRow.insertCell();
		popNewCell16 = popNewRow.insertCell();
		
		popViewRowNum = popTblTBody[0].rows.length;
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		popNewCell0.innerHTML = nowListLen;
		popNewCell1.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\">"
							  + "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\">"
							  + "<input type=\"hidden\" id=\"popSrvrSn_" + popViewRowNum + "\" name=\"popSrvrSn\" value=\"0\">"
						      + "<select id=\"popSrvrTypeCd_" + popViewRowNum + "\" name=\"popSrvrTypeCd\">" + srvrTypeOptionDataText + "</select></div>";
		popNewCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popItemNm_" + popViewRowNum + "\" name=\"popItemNm\" value=\"\" placeholder=\"품목 입력\"></div>";
		popNewCell3.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popMdlNm_" + popViewRowNum + "\" name=\"popMdlNm\" value=\"\" placeholder=\"품명(모델명) 입력\"></div>";
		popNewCell4.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popOsNm_" + popViewRowNum + "\" name=\"popOsNm\" value=\"\" placeholder=\"OS 및 버전 입력\"></div>";
		popNewCell5.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popMkrNm_" + popViewRowNum + "\" name=\"popMkrNm\" value=\"\" placeholder=\"제조사(공급사) 입력\"></div>";
		popNewCell6.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvrCpuNm_" + popViewRowNum + "\" name=\"popSrvrCpuNm\" value=\"\" placeholder=\"CPU사양 입력\"></div>";
		popNewCell7.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvrMmryNm_" + popViewRowNum + "\" name=\"popSrvrMmryNm\" value=\"\" placeholder=\"RAM사양 입력\"></div>";
		popNewCell8.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popStrSzCn_" + popViewRowNum + "\" name=\"popStrSzCn\" value=\"\" placeholder=\"저장장치 사양 입력\"></div>";
		popNewCell9.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popKeepTypeCn_" + popViewRowNum + "\" name=\"popKeepTypeCn\" value=\"\" placeholder=\"보유 형태 입력\"></div>";
		popNewCell10.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvrEqpmntCnt_" + popViewRowNum + "\" name=\"popSrvrEqpmntCnt\" class=\"tr pl10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" maxlength=\"3\" style=\"ime-mode:disabled;\" placeholder=\"수량 입력\"></div>";
		popNewCell11.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popItdiYr_" + popViewRowNum + "\" name=\"popItdiYr\" class=\"tr pl10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" maxlength=\"4\" placeholder=\"도입 연도 입력\"></div>";
		popNewCell12.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popVrAplcnYn_" + popViewRowNum + "\" name=\"popVrAplcnYn\"><option value=\"\">해당없음</option><option value=\"Y\">O</option><option value=\"N\">X</option></select></div>";
		popNewCell13.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popItdiCost_" + popViewRowNum + "\" name=\"popItdiCost\" class=\"tr pl10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"도입 비용 입력\"></div>";
		popNewCell14.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popOperCost_" + popViewRowNum + "\" name=\"popOperCost\" class=\"tr pl10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"유지 비용 입력\"></div>";
		popNewCell15.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popUsgExpln_" + popViewRowNum + "\" name=\"popUsgExpln\" value=\"\" placeholder=\"용도 입력\"></div>";
		popNewCell16.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteSrvrInfoRow_" + popViewRowNum + "\" name=\"btnPopDeleteSrvrInfoRow\" onclick=\"javascript:moveDeleteEqpmntSrvrInfo(\'" + popViewRowNum + "\'); return false;\">삭제</button>";
	}
	
</script>