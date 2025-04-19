<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>2.정보화사업 추진현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnInfrmBizPrgrsInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="40px"></col>
					<col width="280px"></col>
					<col width="320px"></col>
					<col width="120px;"></col>
					<col width="140px;"></col>
					<col width="140px;"></col>
					<col width="100px"></col>
					<col width="180px"></col>
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>예산 사업명</th>
						<th>세부 사업명</th>
						<th>사업 유형</th>
						<th>사업시작일</th>
						<th>사업종료일</th>
						<th>재원(국고, 기금, 기타)</th>
						<th>금액(백만원)</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach var="oldBizPrgrsData" items="${oldPopRcsExmnInfrmBizPrgrsInfoList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td style="text-align:left;">${oldBizPrgrsData.bgtBizNm}</td>
						<td style="text-align:left;">${oldBizPrgrsData.dtlBizNm}</td>
						<td>${oldBizPrgrsData.bizTypeCdCnNm}</td>
						<td>${oldBizPrgrsData.bizBgngYmdV10}</td>
						<td>${oldBizPrgrsData.bizEndYmdV10}</td>
						<td>${oldBizPrgrsData.fircsSeNm}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldBizPrgrsData.bgtAmt}"/></td>
					</tr>
			</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<div class="between">
			<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
			<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
			<h2>[환경조사]</h2>
			<button type="button" class="btns size-xsmall" id="btnPopAddInfrmBizPrgrsInfo" name="btnPopAddInfrmBizPrgrsInfo" onclick="javascript:moveAddInfrmBizPrgrsInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px"></col>
				<col width="280px"></col>
				<col width="320px"></col>
				<col width="120px;"></col>
				<col width="140px;"></col>
				<col width="140px;"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="80px"></col>
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>예산 사업명</th>
					<th>세부 사업명</th> 
					<th>사업 유형
						<button class="btn-tooltip"
						data-tooltip="
							<b>사업 유형 :</b><br>
							- 기획 : BPR/ISP, 정보기술아키텍처(EA) 수립 등<br>
							- 개발·구축 : 신규 시스템 개발, 기존 시스템 고도화, DB 구축 등<br>
							- 운영 및 유지관리 : HW, 상용SW, 개발SW(홈페이지, 모바일 앱/웹) 운영 및 유지관리 등<br>
							- 기타(시스템 구축과는 무관) : 교육훈련, 정보격차해소, 소모성 경비지출 등
						">?</button>
					</th>
					<th>사업시작일</th>
					<th>사업종료일</th>
					<th>재원<br>(국고, 기금, 기타)</th>
					<th>금액(백만원)</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="popTbodyBizPrgrs">
	<c:if test="${!empty nowPopRcsExmnInfrmBizPrgrsInfoList}">
		<c:forEach var="newBizPrgrsData" items="${nowPopRcsExmnInfrmBizPrgrsInfoList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>
						<div class="fm-ele" data-size="100p">
							<input type="hidden" id="popStts_${newBizPrgrsData.bizSn}" name="popStts" value="M">
							<input type="hidden" id="popBizSn_${newBizPrgrsData.bizSn}" name="popBizSn" value="${newBizPrgrsData.bizSn}">
							<input type="text" id="popBgtBizNm_${newBizPrgrsData.bizSn}" name="popBgtBizNm" value="${newBizPrgrsData.bgtBizNm}" placeholder="예산 사업명 입력"/>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDtlBizNm_${newBizPrgrsData.bizSn}" name="popDtlBizNm" value="${newBizPrgrsData.dtlBizNm}" placeholder="세부 사업명 입력"/></div></td>
					<td><div class="fm-focus fm-select" data-size="100p">
							<select id="popBizTypeCdCn_${newBizPrgrsData.bizSn}" name="popBizTypeCdCn">
								<option value="">선택</option>
				<c:if test="${!empty bizPrgrsCmmnCdList}">
					<c:forEach var="bizPrgrsCdData" items="${bizPrgrsCmmnCdList}">
									<option value="${bizPrgrsCdData.cdId}" <c:if test="${newBizPrgrsData.bizTypeCdCn == bizPrgrsCdData.cdId }">selected</c:if>>${bizPrgrsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele date" data-size="100p"><input type="date" id="popBizBgngYmdV10_${newBizPrgrsData.bizSn}" name="popBizBgngYmdV10" value="${newBizPrgrsData.bizBgngYmdV10}" placeholder="사업시작일 입력"/></div></td>
					<td><div class="fm-ele date" data-size="100p"><input type="date" id="popBizEndYmdV10_${newBizPrgrsData.bizSn}" name="popBizEndYmdV10" value="${newBizPrgrsData.bizEndYmdV10}" placeholder="사업종료일 입력"/></div></td>
					<td><div class="fm-focus fm-select" data-size="100p">
							<select id="popFircsSeCd_${newBizPrgrsData.bizSn}" name="popFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="bgtFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${bgtFircsCdData.cdId}" <c:if test="${newBizPrgrsData.fircsSeCd == bgtFircsCdData.cdId }">selected</c:if>>${bgtFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popBgtAmt_${newBizPrgrsData.bizSn}" name="popBgtAmt" class="align-right" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${newBizPrgrsData.bgtAmt}" style="ime-mode:disabled;" placeholder="합계 예산 입력"/></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteStatus_${newBizPrgrsData.bizSn}" name="btnPopDeleteStatus" onclick="javascript:moveDataListDelete('${newBizPrgrsData.bizSn}'); return false;">삭제</button></td>
				</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty nowPopRcsExmnInfrmBizPrgrsInfoList}">
				<tr>
					<td>1</td>
					<td>
						<div class="fm-ele" data-size="100p">
							<input type="hidden" id="popStts_1" name="popStts" value="I"/>
							<input type="hidden" id="popBizSn_1" name="popBizSn" value="0">
							<input type="text" id="popBgtBizNm_1" name="popBgtBizNm" value="" placeholder="예산 사업명 입력"/>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDtlBizNm_1" name="popDtlBizNm" value="" placeholder="세부 사업명 입력"/></div></td>
					<td><div class="fm-focus fm-select" data-size="100p">
							<select id="popBizTypeCdCn_1" name="popBizTypeCdCn">
								<option value="" selected>선택</option>
				<c:if test="${!empty bizPrgrsCmmnCdList}">
					<c:forEach var="bizPrgrsCdData" items="${bizPrgrsCmmnCdList}">
									<option value="${bizPrgrsCdData.cdId}">${bizPrgrsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele date" data-size="100p"><input type="date" id="popBizBgngYmdV10_1" name="popBizBgngYmdV10" value="" placeholder="사업시작일 입력"/></div></td>
					<td><div class="fm-ele date" data-size="100p"><input type="date" id="popBizEndYmdV10_1" name="popBizEndYmdV10" value="" placeholder="사업종료일 입력"/></div></td>
					<td><div class="fm-focus fm-select" data-size="100p">
							<select id="popFircsSeCd_1" name="popFircsSeCd">
								<option value="" selected>선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="bgtFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${bgtFircsCdData.cdId}">${bgtFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popBgtAmt_1" name="popBgtAmt" class="align-right" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="합계 예산 입력"/></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteStatus_1" name="btnPopDeleteStatus" onclick="javascript:moveDataListDelete('1'); return false;">삭제</button></td>
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
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBizPrgrsInfo" name="btnPopSaveRcsexmnInfrmBizPrgrsInfo" onclick="javascript:moveSaveRcsexmnInfrmBizPrgrsInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">	
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBizPrgrsInfo" name="btnPopSaveRcsexmnInfrmBizPrgrsInfo" onclick="javascript:moveSaveRcsexmnInfrmBizPrgrsInfo(); return false;">저장</button>
	</c:if>
	
	
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnInfrmBizPrgrsInfo" name="btnPopCloseRcsexmnInfrmBizPrgrsInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowPopRcsExmnInfrmBizPrgrsInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getSelectBizPrgrsInfo() {
		let bizPrgrsData = "";
		<c:if test="${!empty bizPrgrsCmmnCdList}">
			<c:forEach var="bizPrgrsCdData" items="${bizPrgrsCmmnCdList}">
		bizPrgrsData += "<option value=\"${bizPrgrsCdData.cdId}\">${bizPrgrsCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		return bizPrgrsData;
	}
	
	function getSelectBgtFircsInfo() {
		let bgtFircsData = "";
		<c:if test="${!empty bgtFircsCmmnCdList}">
			<c:forEach var="bgtFircsCdData" items="${bgtFircsCmmnCdList}">
			bgtFircsData += "<option value=\"${bgtFircsCdData.cdId}\">${bgtFircsCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 	
		return bgtFircsData
	}
	
	function moveDataListDelete(paramData) {
		let oldDataStt = $("#popStts_" + paramData).val();
		if (oldDataStt == "D") {
			alert("이미 삭제로 설정된 데이터입니다. ");
			return false;
		} else {
			$("#popBgtBizNm_" + paramData).attr("readonly", true);
			$("#popDtlBizNm_" + paramData).attr("readonly", true);
			$("#popBizTypeCdCn_" + paramData).attr("disabled", true);
			$("#popBizBgngYmdV10_" + paramData).attr("readonly", true);
			$("#popBizEndYmdV10_" + paramData).attr("readonly", true);
			$("#popFircsSeCd_" + paramData).attr("disabled", true);
			$("#popBgtAmt_" + paramData).attr("readonly", true);
			$("#popViewStts_" + paramData).text('D');
			$("#popStts_" + paramData).val('D');
		}
	}
	
	function moveAddInfrmBizPrgrsInfo() {
		let popTbBody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7, popNewCell8;
		let bizPrgrsData, bgtFirscData;
		
		bizPrgrsData = getSelectBizPrgrsInfo();
		bgtFirscData = getSelectBgtFircsInfo();
			
		popTbBody = $("#popTbodyBizPrgrs");
		popNewRowNumber = popTbBody[0].rows.length;
		popNewRow = popTbBody[0].insertRow(popNewRowNumber);

		popNewCell0 = popNewRow.insertCell();
		popNewCell1 = popNewRow.insertCell();
		popNewCell2 = popNewRow.insertCell();
		popNewCell3 = popNewRow.insertCell();
		popNewCell4 = popNewRow.insertCell();
		popNewCell5 = popNewRow.insertCell();
		popNewCell6 = popNewRow.insertCell();
		popNewCell7 = popNewRow.insertCell();
		popNewCell8 = popNewRow.insertCell();
		
		popViewRowNum = popTbBody[0].rows.length;
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		popNewCell0.innerHTML = nowListLen;
		popNewCell1.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\">"
		                      + "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\"/>"
		                      + "<input type=\"hidden\" id=\"popBizSn_" + popViewRowNum + "\" name=\"popBizSn\" value=\"0\">"
							  + "<input type=\"text\" id=\"popBgtBizNm_" + popViewRowNum + "\" name=\"popBgtBizNm\" value=\"\" placeholder=\"예산 사업명 입력\"/>"
							  + "</div>";
		popNewCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popDtlBizNm_" + popViewRowNum + "\" name=\"popDtlBizNm\" value=\"\" placeholder=\"세부 사업명 입력\"/></div>";
		popNewCell3.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popBizTypeCdCn_" + popViewRowNum + "\" name=\"popBizTypeCdCn\"><option value=\"\" selected>선택</option>" + bizPrgrsData + "</select></div>";
		popNewCell4.innerHTML = "<div class=\"fm-ele date\" data-size=\"100p\"><input type=\"date\" id=\"popBizBgngYmdV10_" + popViewRowNum + "\" name=\"popBizBgngYmdV10\" value=\"\" placeholder=\"사업시작일 입력\"/></div>";
		popNewCell5.innerHTML = "<div class=\"fm-ele date\" data-size=\"100p\"><input type=\"date\" id=\"popBizEndYmdV10_" + popViewRowNum + "\" name=\"popBizEndYmdV10\" value=\"\" placeholder=\"사업종료일 입력\"/></div>";
		popNewCell6.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popFircsSeCd_" + popViewRowNum + "\" name=\"popFircsSeCd\"><option value=\"\" selected>선택</option>" + bgtFirscData + "</select></div>";
		popNewCell7.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popBgtAmt_" + popViewRowNum + "\" name=\"popBgtAmt\" class=\"align-right\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"합계 예산 입력\"/></div>";
		popNewCell8.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteStatus_" + popViewRowNum + "\" name=\"btnPopDeleteStatus\" onclick=\"javascript:moveDataListDelete(\'" + popViewRowNum + "\'); return false;\">삭제</button>";
	}
	
</script>