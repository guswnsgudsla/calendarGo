<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>1.일반현황 - 3)정보화 예산 세부내역</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnBgtDtlInfo.rcsexmnId}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th>연도</th>
					<th>구분</th>
					<th>기획</th>
					<th>개발/구축</th>
					<th>운영/관리보수</th>
					<th>자산취득</th>
					<th>기타(정보화정책지원 등)</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">2022년</td>
					<td>사업금액</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.plngBgtAmt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.devCnstBgtAmt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.operMngBgtAmt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.astAcqsBgtAmt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.etcBgtAmt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnBgtDtlInfo.sumBgtAmt}"/></td>
				</tr>
				<tr>
					<td>재원구분</td>
					<td>${oldPopRcsExmnBgtDtlInfo.plngFircsSeNm}</td>
					<td>${oldPopRcsExmnBgtDtlInfo.devCnstFircsSeNm}</td>
					<td>${oldPopRcsExmnBgtDtlInfo.operMngFircsSeNm}</td>
					<td>${oldPopRcsExmnBgtDtlInfo.astAcqsFircsSeNm}</td>
					<td>${oldPopRcsExmnBgtDtlInfo.etcFircsSeNm}</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<h2>[환경조사]</h2>
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th>연도</th>
					<th>구분</th>
					<th>기획
						<button class="btn-tooltip"
						data-tooltip="
						<b>기획 :</b>BPR/ISP, 정보기술아키텍처(EA) 수립 등
						">?</button>
					</th>
					<th>개발/구축
						<button class="btn-tooltip"
						data-tooltip="
						<b>개발/구축 :</b>신규 시스템 개발, 기존 시스템 고도화, DB 구축 등
						">?</button>
					</th>
					<th>운영/관리보수
						<button class="btn-tooltip"
						data-tooltip="
						<b>운영/관리보수 :</b>HW, 상용SW, 개발SW(홈페이지, 모바일 앱/웹) 운영 및 유지관리 등
						">?</button>
					</th>
					<th>자산취득</th>
					<th>기타(정보화정책지원 등)
						<button class="btn-tooltip"
						data-tooltip="
						<b>기타 :</b>교육훈련, 정보격차해소, 소모성 경비지출 등
						">?</button>
					</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2"><div class="fm-ele" data-size="w120" style="width:70%"><input type="text" id="popBgtYr" name="popBgtYr" class="align-right" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.bgtYr}" style="ime-mode:disabled;" maxlength="4" placeholder="연도"/></div> 년</td>
					<td>예산금액</br>(단위:백만원)</td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popPlngBgtAmt" name="popPlngBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setSumBgtAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.plngBgtAmt}" style="ime-mode:disabled;" placeholder="기획 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popDevCnstBgtAmt" name="popDevCnstBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setSumBgtAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.devCnstBgtAmt}" style="ime-mode:disabled;" placeholder="개발구축 에산 입력"/></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popOperMngBgtAmt" name="popOperMngBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setSumBgtAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.operMngBgtAmt}" style="ime-mode:disabled;" placeholder="운영관리 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popAstAcqsBgtAmt" name="popAstAcqsBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setSumBgtAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.astAcqsBgtAmt}" style="ime-mode:disabled;" placeholder="자산취득 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popEtcBgtAmt" name="popEtcBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setSumBgtAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.etcBgtAmt}" style="ime-mode:disabled;" placeholder="기타 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="100p"><input type="text" id="popSumBgtAmt" name="popSumBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnBgtDtlInfo.sumBgtAmt}" style="ime-mode:disabled;" placeholder="합계 예산 입력" readonly/></div></td>
				</tr>
				<tr>
					<td>재원구분
						<button class="btn-tooltip"
						data-tooltip="
						<b>재원구분 :</b>국고, 기금, 기타로 작성
						">?</button>
					</td>
					<td><div class="fm-focus fm-select" data-size="w120" style="width:100%">
							<select id="popPlngFircsSeCd" name="popPlngFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="plngFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${plngFircsCdData.cdId}" <c:if test="${nowPopRcsExmnBgtDtlInfo.plngFircsSeCd == plngFircsCdData.cdId }">selected</c:if>>${plngFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-focus fm-select" data-size="w120" style="width:100%">
							<select id="popDevCnstFircsSeCd" name="popDevCnstFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="devCnstFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${devCnstFircsCdData.cdId}" <c:if test="${nowPopRcsExmnBgtDtlInfo.devCnstFircsSeCd == devCnstFircsCdData.cdId }">selected</c:if>>${devCnstFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-focus fm-select" data-size="w120" style="width:100%">
							<select id="popOperMngFircsSeCd" name="popOperMngFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="operMngFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${operMngFircsCdData.cdId}" <c:if test="${nowPopRcsExmnBgtDtlInfo.operMngFircsSeCd == operMngFircsCdData.cdId }">selected</c:if>>${operMngFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-focus fm-select" data-size="w120" style="width:100%">
							<select id="popAstAcqsFircsSeCd" name="popAstAcqsFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="astAcqsFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${astAcqsFircsCdData.cdId}" <c:if test="${nowPopRcsExmnBgtDtlInfo.astAcqsFircsSeCd == astAcqsFircsCdData.cdId }">selected</c:if>>${astAcqsFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td><div class="fm-focus fm-select" data-size="w120" style="width:100%">
							<select id="popEtcFircsSeCd" name="popEtcFircsSeCd">
								<option value="">선택</option>
				<c:if test="${!empty bgtFircsCmmnCdList}">
					<c:forEach var="etcFircsCdData" items="${bgtFircsCmmnCdList}">
									<option value="${etcFircsCdData.cdId}" <c:if test="${nowPopRcsExmnBgtDtlInfo.etcFircsSeCd == etcFircsCdData.cdId }">selected</c:if>>${etcFircsCdData.cdNm}</option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBgtDtlInfo" name="btnPopSaveRcsexmnInfrmBgtDtlInfo" onclick="javascript:moveSaveRcsexmnInfrmBgtDtlInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBgtDtlInfo" name="btnPopSaveRcsexmnInfrmBgtDtlInfo" onclick="javascript:moveSaveRcsexmnInfrmBgtDtlInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnInfrmBgtDtlInfo" name="btnPopCloseRcsexmnInfrmBgtDtlInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function setSumBgtAmtData() {
		let plngBgtAmt = $("#popPlngBgtAmt").val();
		let devCnstBgtAmt = $("#popDevCnstBgtAmt").val();
		let operMngBgtAmt = $("#popOperMngBgtAmt").val();
		let astAcqsBgtAmt = $("#popAstAcqsBgtAmt").val();
		let etcBgtAmt = $("#popEtcBgtAmt").val();
		
		if (plngBgtAmt == "" || plngBgtAmt == null) {
			plngBgtAmt = "0";
		}
		if (devCnstBgtAmt == "" || devCnstBgtAmt == null) {
			devCnstBgtAmt = "0";
		}
		if (operMngBgtAmt == "" || operMngBgtAmt == null) {
			operMngBgtAmt = "0";
		}
		if (astAcqsBgtAmt == "" || astAcqsBgtAmt == null) {
			astAcqsBgtAmt = "0";
		}
		if (etcBgtAmt == "" || etcBgtAmt == null) {
			etcBgtAmt = "0";
		}
		
		let sumBgtAmt = 0;
		sumBgtAmt = parseInt(plngBgtAmt, 10) + parseInt(devCnstBgtAmt, 10) + parseInt(operMngBgtAmt, 10) + parseInt(astAcqsBgtAmt, 10) + parseInt(etcBgtAmt, 10);
		$("#popSumBgtAmt").val(sumBgtAmt);
		
	}
	
	
</script>