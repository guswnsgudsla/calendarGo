<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>조사자 정보 입력</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="table-wrap write">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<h2>[환경조사 조사자 정보]</h2>
		<table>
			<caption></caption>
			<colgroup>
				<col width="200px"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>기관명</th>
					<td><div class="fm-ele" data-size="w400"><input type="text" id="popInstNm" name="popInstNm" value="${popRcsExmnExmnrInfo.instNm}" readonly></div></td>
				</tr>
				<tr>
					<th>부서명<span class="required">필수</span></th>
					<td><div class="fm-ele" data-size="w400"><input type="text" id="popDeptNm" name="popDeptNm" value="${popRcsExmnExmnrInfo.deptNm}" placeholder="조사자부서를 입력하세요"></div></td>
				</tr>
				<tr>
					<th>조사자<span class="required">필수</span></th>
					<td><div class="fm-ele" data-size="w400"><input type="text" id="popExmnrNm" name="popExmnrNm" value="${popRcsExmnExmnrInfo.exmnrNm}" placeholder="조사자명을 입력하세요"></div></td>
				</tr>
				<tr>
					<th>전화<span class="required">필수</span></th>
					<td><div class="fm-ele" data-size="w400"><input type="text" id="popExmnrTelno" name="popExmnrTelno" value="${popRcsExmnExmnrInfo.exmnrTelno}"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" mxalnegth="11" placeholder="조사자 전화번호를 입력하세요"></div></td>
				</tr>
				<tr>
					<th>이메일<span class="required">필수</span></th>
					<td><div class="fm-ele" data-size="w400"><input type="text" id="popExmnrEmlAddr" name="popExmnrEmlAddr" value="${popRcsExmnExmnrInfo.exmnrEmlAddr}" placeholder="조사자 이메일주소를 입력하세요"></div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnExmnrInfo" name="btnPopSaveRcsexmnExmnrInfo" onclick="javascript:moveSaveRcsexmnExmnrInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnExmnrInfo" name="btnPopSaveRcsexmnExmnrInfo" onclick="javascript:moveSaveRcsexmnExmnrInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCLoseRcsexmnExmnrInfo" name="btnPopCLoseRcsexmnExmnrInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	
</script>