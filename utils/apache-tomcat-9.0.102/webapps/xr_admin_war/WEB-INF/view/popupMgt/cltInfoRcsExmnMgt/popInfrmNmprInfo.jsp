<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>1.일반현황 - 1)정보화 및 정보보호 인력 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsexmnInfrmNmprInfo.rcsexmnId}">
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
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">기관 전체 인원(정원)</th>
					<th colspan="3">기관 내 정보화 및 정보보호 인력</th>
				</tr>
				<tr>
					<th>정보화 인력(수)</th>
					<th>정보보호 인력(수)</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsexmnInfrmNmprInfo.wholCpctCnt}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsexmnInfrmNmprInfo.infrmNope}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsexmnInfrmNmprInfo.infscrNope}" /></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsexmnInfrmNmprInfo.infrmInfscrSumNope}" /></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<input type="hidden" id="popTypeCd" name="popTypeCd" value="${popSrchRcsExmnInfo.paramInstTypeCd}">
		<h2>[환경조사]</h2>
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">기관 전체 인원(정원)
						<button class="btn-tooltip"
						data-tooltip="
						<b>기관전체인력 :</b>
						본부·소속기관(정무직, 별정직, 특정직, 일반직 총계), 공공기관(임원, 정규직, 무기계약직 총계)
						">?</button>
					</th>
					<th colspan="3">기관 내 정보화 및 정보보호 인력</th>
				</tr>
				<tr>
					<th>정보화 인력(수)</th>
					<th>정보보호 인력(수)</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><div class="fm-ele"><input type="text" id="popWholCpctCnt" name="popWholCpctCnt" class="tr pr10"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsexmnInfrmNmprInfo.wholCpctCnt}" style="ime-mode:disabled;" placeholder="기관 전체 인원"/></div></td>
					<td><div class="fm-ele"><input type="text" id="popInfrmNope" name="popInfrmNope" class="tr pr10"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getInfrmSumNopeData()"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsexmnInfrmNmprInfo.infrmNope}" style="ime-mode:disabled;" placeholder="정보화 인력(수)"/></div></td>
					<td><div class="fm-ele"><input type="text" id="popInfscrNope" name="popInfscrNope" class="tr pr10"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); getInfrmSumNopeData()"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsexmnInfrmNmprInfo.infscrNope}" style="ime-mode:disabled;" placeholder="정보보호 인력(수)"/></div></td>
					<td><div class="fm-ele"><input type="text" id="popInfrmInfscrSumNope" name="popInfrmInfscrSumNope" class="tr pr10"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowPopRcsexmnInfrmNmprInfo.infrmInfscrSumNope}" style="ime-mode:disabled;" placeholder="정보보호 인력(수)" readonly/></div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
			<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
				<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmNmprInfo" name="btnPopSaveRcsexmnInfrmNmprInfo" onclick="javascript:moveSaveRcsexmnInfrmNmprInfo(); return false;">저장</button>
				</c:if>
			</c:if>
		</c:if>
		
		<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
			<button type="button" class="btns" id="btnPopSaveRcsexmnInfrmNmprInfo" name="btnPopSaveRcsexmnInfrmNmprInfo" onclick="javascript:moveSaveRcsexmnInfrmNmprInfo(); return false;">저장</button>
		</c:if> 
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnInfrmNmprInfo" name="btnPopCloseRcsexmnInfrmNmprInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	//합계 
	function getInfrmSumNopeData() {
		let paramPopInfrmNope = $("#popInfrmNope").val();
		let paramPopInfscrNope = $("#popInfscrNope").val();
		if (paramPopInfrmNope == "" || paramPopInfrmNope == null) {
			paramPopInfrmNope = "0";
		}
		if (paramPopInfscrNope == "" || paramPopInfscrNope == null) {
			paramPopInfscrNope = "0";
		}
		let paramPopSumInfrmNope = parseInt(paramPopInfrmNope, 10) + parseInt(paramPopInfscrNope, 10);
		$("#popInfrmInfscrSumNope").val(paramPopSumInfrmNope);
	}
</script>