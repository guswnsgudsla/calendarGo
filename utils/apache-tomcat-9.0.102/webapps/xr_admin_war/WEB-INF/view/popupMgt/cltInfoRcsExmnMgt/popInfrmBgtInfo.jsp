<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>1.일반현황 - 2)정보화 예산 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnInfrmBgtInfo.rcsexmnId}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경 조사]</h2>
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
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">
						연도
					</th>
					<th colspan="2">국고</th>
					<th colspan="2">기금</th>
					<th rowspan="2">기타</th>
					<th rowspan="2">합계</th>
				</tr>
				<tr>
					<th>일반</th>
					<th>정보화</th>
					<th>일반</th>
					<th>정보화</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${oldPopRcsExmnInfrmBgtInfo.bgtYr} 년</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.stcfGnrlBgtAmt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.stcfInfrmBgtAmt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.fundGnrlBgtAmt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.fundInfrmBgtAmt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.etcBgtAmt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnInfrmBgtInfo.bgtSumAmt}" /></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<div class="between">
			<h2>[환경조사]</h2>
			<h3>(단위 : 백만원)</h3>
		</div>
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"</col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">연도</th>
					<th colspan="2">국고</th>
					<th colspan="2">기금</th>
					<th rowspan="2">
						기타
						<button class="btn-tooltip"
						data-tooltip="
							<b>기타 :</b>국고, 기금이외 외부지원 및 기관의 수익금을 포함
						">?</button>
					</th>
					<th rowspan="2">합계
						<button class="btn-tooltip"
						data-tooltip="
							예산은 현재 기획재정부에서 승인한 예산을 기재
						">?</button>
					</th>
				</tr>
				<tr>
					<th>일반</th>
					<th>정보화</th>
					<th>일반</th>
					<th>정보화</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><div class="fm-ele" data-size="w100"><input type="text" id="popBgtYr" name="popBgtYr" class="align-right" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.bgtYr}" style="ime-mode:disabled;" maxlength="4" placeholder="연도"/></div> 년</td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popStcfGnrlBgtAmt" name="popStcfGnrlBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.stcfGnrlBgtAmt}" style="ime-mode:disabled;" placeholder="국고 일반 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popStcfInfrmBgtAmt" name="popStcfInfrmBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.stcfInfrmBgtAmt}" style="ime-mode:disabled;" placeholder="국고 정보화 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popFundGnrlBgtAmt" name="popFundGnrlBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.fundGnrlBgtAmt}" style="ime-mode:disabled;" placeholder="기금 일반 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popFundInfrmBgtAmt" name="popFundInfrmBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.fundInfrmBgtAmt}" style="ime-mode:disabled;" placeholder="기금 정보화 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popEtcBgtAmt" name="popEtcBgtAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.etcBgtAmt}" style="ime-mode:disabled;" placeholder="기타 예산 입력"/></div></td>
					<td><div class="fm-ele" data-size="w120"><input type="text" id="popBgtSumAmt" name="popBgtSumAmt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getBgtSumAmtData()" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsExmnInfrmBgtInfo.bgtSumAmt}" style="ime-mode:disabled;" placeholder="전체 합계 예산" readonly/></div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBgtInfo" name="btnPopSaveRcsexmnInfrmBgtInfo" onclick="javascript:moveSaveRcsexmnInfrmBgtInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmBgtInfo" name="btnPopSaveRcsexmnInfrmBgtInfo" onclick="javascript:moveSaveRcsexmnInfrmBgtInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnInfrmBgtInfo" name="btnPopCloseRcsexmnInfrmBgtInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getBgtSumAmtData() {
		let stcfGnrlBgtAmt = $("#popStcfGnrlBgtAmt").val();
		let stcfInfrmBgtAmt = $("#popStcfInfrmBgtAmt").val();
		let fundGnrlBgtAmt = $("#popFundGnrlBgtAmt").val();
		let fundInfrmBgtAmt = $("#popFundInfrmBgtAmt").val();
		let etcBgtAmt = $("#popEtcBgtAmt").val();
		
		if (stcfGnrlBgtAmt == "" || stcfGnrlBgtAmt == null) {
			stcfGnrlBgtAmt = "0";
		}
		if (stcfInfrmBgtAmt == "" || stcfInfrmBgtAmt == null) {
			stcfInfrmBgtAmt = "0";
		}
		if (fundGnrlBgtAmt == "" || fundGnrlBgtAmt == null) {
			fundGnrlBgtAmt = "0";
		}
		if (fundInfrmBgtAmt == "" || fundInfrmBgtAmt == null) {
			fundInfrmBgtAmt = "0";
		}
		if (etcBgtAmt == "" || etcBgtAmt == null) {
			etcBgtAmt = "0";
		}
		let bgtSumAmt = 0;
		bgtSumAmt = parseInt(stcfGnrlBgtAmt, 10) + parseInt(stcfInfrmBgtAmt, 10) + parseInt(fundGnrlBgtAmt, 10) + parseInt(fundInfrmBgtAmt, 10) + parseInt(etcBgtAmt, 10)
		$("#popBgtSumAmt").val(bgtSumAmt);
	}
	
</script>