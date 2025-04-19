<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>사용자 승인관리</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="200px"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>사용자아이디</th>
					<td class="tl pl10">${userPopInfo.userId}
						<input type="hidden" id="srchPopUserId" name="srchPopUserId" value="<c:out value="${userPopInfo.userId}"/>">
					</td>
				</tr>
				<tr>
					<th>승인/반려<span class="required">필수</span></th>
					<td class="tl pl10">
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="popAprvYnY" name="popAprvYn" value="Y" <c:if test="${userPopInfo.aprvYn == 'Y'}">checked</c:if>/><label for="popAprvYnY">승인</label></span>
							<span><input type="radio" id="popAprvYnN" name="popAprvYn" value="N" <c:if test="${userPopInfo.aprvYn != 'Y'}">checked</c:if>/><label for="popAprvYnN">반려</label></span>
						</div>
					</td>
				</tr>
				<tr>
					<th>기관</th>
					<td class="tl pl10"><c:out value="${userPopInfo.instNm}"/>
						<input type="hidden" id="srchPopInstId" name="srchPopInstId" value="<c:out value="${userPopInfo.instId}"/>">
					</td>
				</tr>
				<div>
				<tr>
					<th>권한<span class="required">필수</span></th>
					<td class="tl pl10">
						<c:if test="${!empty userPopAuthrtIdList}">
							<div class="fm-focus fm-select" data-size="w200" >
							<c:if test="${userPopInfo.aprvYn == 'Y'}">
								<select id="popUserAuthrtId" name="popUserAuthrtId" class="" title="권한정보">
									<option value="">선택</option>
									<c:forEach var="popAuthrtData" items="${userPopAuthrtIdList}">
													<option value="<c:out value="${popAuthrtData.authrtId}"/>"><c:out value="${popAuthrtData.authrtNm}"/></option>
									</c:forEach>
								</select>
							</c:if>	
							<c:if test="${userPopInfo.aprvYn != 'Y'}">
								<select id="popUserAuthrtId" name="popUserAuthrtId" class="" title="권한정보" disabled="disabled">
									<option value="">선택</option>
									<c:forEach var="popAuthrtData" items="${userPopAuthrtIdList}">
													<option value="<c:out value="${popAuthrtData.authrtId}"/>"><c:out value="${popAuthrtData.authrtNm}"/></option>
									</c:forEach>
								</select>
							</c:if>	
							</div>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>이유<span class="required">필수</span></th>
					<td class="tl pl10">
						<div class="fm-textarea">
							<textarea id="popRjctCn" name="popRjctCn" cols="50" rows="5" placeholder="승인 또는 반려사항 입력"></textarea>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns size-small" id="btnPopAprvUserInfo" name="btnPopAprvUserInfo" onclick="javascript:moveSaveAprvUserInfo(); return false;">저장</button>
		<button type="button" class="btns size-small color-gray" id="btnClosePopAprvUserInfo" name="btnClosePopAprvUserInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button>
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	document.getElementById('popAprvYnY').addEventListener('click', function(){
	    $("#popUserAuthrtId").attr("disabled", false);
	});
	document.getElementById('popAprvYnN').addEventListener('click', function(){
		$("#popUserAuthrtId").attr("disabled", true);
	});
	
</script>