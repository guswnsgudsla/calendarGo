<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="contants">
	<div class="table-wrap write">
		<form id="frmInfoWrite" name="frmInfoWrite" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchUserInfo.hdnMenuParam}"/>">
			<input type="hidden" id="paramPageNo" name="paramPageNo" value="<c:out value="${srchUserInfo.paramPageNo}"/>">
			<input type="hidden" id="srchUserTypeCd" name="srchUserTypeCd" value="<c:out value="${srchUserInfo.paramSrchUserTypeCd}"/>">
			<input type="hidden" id="srchUserInfoDiv" name="srchUserInfoDiv" value="<c:out value="${srchUserInfo.paramSrchUserInfoDiv}"/>">
			<input type="hidden" id="srchUserInfoString" name="srchUserInfoString" value="<c:out value="${srchUserInfo.paramSrchUserInfoString}"/>">
			<input type="hidden" id="srchInstInfoDiv" name="srchInstInfoDiv" value="<c:out value="${srchUserInfo.paramSrchInstInfoDiv}"/>">
			<input type="hidden" id="srchInstInfoString" name="srchInstInfoString" value="<c:out value="${srchUserInfo.paramSrchInstInfoString}"/>">
			<input type="hidden" id="srchUserAuthrtId" name="srchUserAuthrtId" value="<c:out value="${srchUserInfo.paramSrchUserAuthrtId}"/>">
			<input type="hidden" id="srchUserSttCd" name="srchUserSttCd" value="<c:out value="${srchUserInfo.paramSrchUserSttCd}"/>">
			<input type="hidden" id="srchUserAprvCd" name="srchUserAprvCd" value="<c:out value="${srchUserInfo.paramSrchUserAprvCd}"/>">
			<input type="hidden" id="srchUserId" name="srchUserId" value="<c:out value="${srchUserInfo.paramUserId}"/>">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="<c:out value="${srchUserInfo.paramWrtMode}"/>">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${srchUserInfo.paramTabPstnId}"/>">
			<input type="hidden" id="srchTabCntnHstryListPageNo" name="srchTabCntnHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabCntnHstryListPageNo}"/>">
			<input type="hidden" id="srchTabAprvHstryListPageNo" name="srchTabAprvHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabAprvHstryListPageNo}"/>">
			<input type="hidden" id="chkDuplUserIdYn" name="chkDuplUserIdYn" value="<c:out value="${srchUserInfo.chkDuplUserIdYn}"/>">
		<table>
			<colgroup>
				<col width="200px">
				<col width="">
				<col width="200px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th>사용자아이디<span class="required">필수</span></th>
					<td>
					<c:if test="${srchUserInfo.paramWrtMode eq 'entry'}">
						<div class="fm-ele with-btn">
							<input type="text" id="userId" name="userId" value="${userInfo.userId}" maxlength="20" placeholder="사용자아이디를 입력하세요" />
							<button type="button" class="btns" id="btnChkDuplId" name="btnChkDuplId" onclick="javascript:checkDuplUserId(); return false;" style="padding: 0 20px;">중복검사</button>
						</div>
					</c:if>
					<c:if test="${srchUserInfo.paramWrtMode eq 'edit'}">
						<input type="hidden" id="userId" name="userId" value="<c:out value="${userInfo.userId}"/>">
						<input type="hidden" id="userTypeCd" name="userTypeCd" value="<c:out value="${userInfo.userTypeCd}"/>">
						<span><c:out value="${userInfo.userId}"/></span>
					</c:if>
					</td>
					<th>사용자명<span class="required">필수</span></th>
					<td>
						<div class="fm-ele">
							<input type="text" id="userNm" name="userNm" value="<c:out value="${userInfo.userNm}"/>" placeholder="사용자명을 입력하세요" />
						</div>
					</td>
				</tr>
				<tr>
					<th>사용자별칭</th>
					<td>
						<div class="fm-ele">
							<input type="text" id="userNcm" name="userNcm" value="<c:out value="${userInfo.userNcm}"/>" placeholder="사용자별칭을 입력하세요" />
						</div>
					</td>
					<th>권한<span class="required">필수</span></th>
					<td>
						<div class="fm-focus fm-select">
							<select id="authrtId" name="authrtId" class="" title="권한정보">
								<option value="" <c:if test="${userInfo.authrtId == '' }">selected</c:if>>선택</option>
				<c:if test="${!empty userAuthrtIdList}">
					<c:forEach var="authrtData" items="${userAuthrtIdList}">
								<option value="<c:out value="${authrtData.authrtId}"/>" <c:if test="${userInfo.authrtId == authrtData.authrtId }">selected</c:if>><c:out value="${authrtData.authrtNm}"/></option>
					</c:forEach>
				</c:if>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>기관</th>
					<td>
						<input type="hidden" id="instId" name="instId" value="<c:out value="${userInfo.instId}"/>" readonly>
						<c:if test="${srchUserInfo.paramWrtMode eq 'entry'}">
						<div class="fm-ele with-btn">
							<input type="text" id="instNm" name="instNm" value="<c:out value="${userInfo.instNm}"/>">
							<button type="button" id="btnPopInst" name="btnPopInst" class="btns" onclick="javascript:chkUserInstId(); return false;">기관조회</button>
						</div>
						</c:if>
						<c:if test="${srchUserInfo.paramWrtMode eq 'edit'}">
						<c:out value="${userInfo.instNm}"/>(<c:out value="${userInfo.instCd}"/>)
						</c:if>
					</td>
					<th>사용자유형</th>
					<td><c:out value="${userInfo.userTypeCdNm}"/>
					</td>
				</tr>
				<tr>
					<th>사용자상태<span class="required">필수</span></th>
					<td>
						<c:if test="${srchUserInfo.paramWrtMode eq 'entry'}">
						<div class="fm-focus fm-select" data-size="w200">
							<select id="userSttsCd" name="userSttsCd" class="" title="상태정보">
								<option value="" <c:if test="${userInfo.userSttsCd == '' }">selected</c:if>>선택</option>
							<c:if test="${!empty userSttcTypeCmmnCdList}">
								<c:forEach var="sttCdRow" items="${userSttcTypeCmmnCdList}">
								<option value="<c:out value="${sttCdRow.cdId}"/>" <c:if test="${userInfo.userSttsCd == sttCdRow.cdId }">selected</c:if>><c:out value="${sttCdRow.cdNm}"/></option>
								</c:forEach>
							</c:if>
							</select>
						</div>
						</c:if>
						<c:if test="${srchUserInfo.paramWrtMode eq 'edit'}">
							<div class="fm-focus fm-select" data-size="w200">
								<select id="userSttsCd" name="userSttsCd" class="" title="상태정보">
									<option value="" <c:if test="${userInfo.userSttsCd == '' }">selected</c:if>>선택</option>
								<c:if test="${!empty userSttcTypeCmmnCdList}">
									<c:forEach var="sttCdRow" items="${userSttcTypeCmmnCdList}">
									<option value="<c:out value="${sttCdRow.cdId}"/>" <c:if test="${userInfo.userSttsCd == sttCdRow.cdId }">selected</c:if>><c:out value="${sttCdRow.cdNm}"/></option>
									</c:forEach>
								</c:if>
								</select>
							</div>
						</c:if>
					</td>
					<th>전화번호</th>
					<td><div class="fm-ele"><input type="text" id="telno" name="telno" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="<c:out value="${userInfo.telno}"/>" maxlength="11" style="ime-mode:disabled;" placeholder="사용자 전화번호를 입력하세요" /></div></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td class=""><div class="fm-ele"><input type="text" id="mbNo" name="mbNo" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="<c:out value="${userInfo.mbNo}"/>" maxlength="11" style="ime-mode:disabled;" placeholder="휴대전화 번호를 입력하세요" /></div></td>
					<th>이메일주소<span class="required">필수</span></th>
					<td><div class="fm-ele"><input type="text" id="emlAddr" name="emlAddr" value="${userInfo.emlAddr}" placeholder="이메일을 입력하세요" /></div></td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" id="btnRtrCn" name="btnRtrCn" class="btns color-gray" onclick="javascript:movePrevPage(); return false;">취소</button>
		<button type="button" id="btnList" name="btnList" class="btns color-gray" onclick="javascript:moveListPage(); return false;">목록</button>
		<button type="button" id="btnStrg" name="btnStrg" class="btns" onclick="javascript:setUserSave(); return false;">저장</button>
	</div>
</div>

<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">

	//아이디 중복 검사
	function checkDuplUserId() {
		let frm = document.frmInfoWrite;
		if (cms_txt_is_empty(true, frm.userId)) {
			alert("사용자 아이디를 입력해 주세요");
			return false;
		} else {
			//사용자아이디 중복검사여부 초기화
			frm.chkDuplUserIdYn.value = "N";
			
			$.ajax({
				type : "GET",
				url : contextPath + "/userMgt/checkDuplUserInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkMode" : "checkUserId",
					"checkData" : frm.userId.value,
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert(frm.instId.value + "는 이미 등록된 사용자아이디입니다.");
						return false;
					} else {
						frm.chkDuplUserIdYn.value = "Y";
						alert("중복이 아닙니다. 계속 진행 하십시오.");
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	}
	
	//기관조회
	function chkUserInstId() {
		let frm = document.frmInfoWrite;
		frm.instId.value = "";
		if (cms_txt_is_empty(true, frm.instNm)) {
			alert("기관명을 입력해 주세요");
			return false;
		} else {
			$.ajax({
				type : "GET",
				url : contextPath + "/instMgt/getInstInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkMode" : "checkInstId",
					"checkData" : frm.instNm.value,
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(frm.instNm.value + "라는 기관은 등록되어 있지 않습니다.");
						frm.instNm.value = "";
						return false;
					} else {
						frm.instId.value = rtnData;
						alert("" + frm.instNm.value + "의 소속으로 설정합니다.");
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	}
	
	//이전 페이지로 이동
	function movePrevPage() {
		history.back();
	}
	
	//목록으로 이동
	function moveListPage() {
		let frm = document.frmInfoWrite;
		frm.action = contextPath + "/userMgt/userList.do";
		frm.submit();
	}
	
	//저장
	function setUserSave() {
		let frm = document.frmInfoWrite;
		
		//유효성 체크
		if (cms_txt_is_empty(true, frm.userId)) { alert("사용자아이디를 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frm.userNm)) { alert("사용자명을 입력해 주십시오."); return false;}
		if (frm.chkDuplUserIdYn.value == "N") { alert("사용자 아이디 중복검사를 진행해 주십시오."); return false;}
		
		//if (cms_txt_is_empty(true, frm.userNcm)) { alert("사용자별칭을 입력해 주십시오."); return false;}
		if (cms_select_is_empty(true, frm.authrtId)) { alert("권한을 선택해 주십시오."); return false;}
		if ("${srchUserInfo.paramWrtMode}" == "entry") { 
			if (cms_select_is_empty(true, frm.userSttsCd)) { alert("사용자 상태를 선택해 주십시오."); return false;}
		}
		
		//if (cms_txt_is_empty(true, frm.telno)) { alert("전화번호를 입력해 주십시오."); return false;}
		//if (cms_txt_is_empty(true, frm.mbNo)) { alert("휴대폰번호를 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frm.emlAddr)) { alert("이메일주소를 입력해 주십시오."); return false;}
		if (!cms_txt_is_email(true, frm.emlAddr)) { alert("이메일 형식이 올바르지 않습니다."); return false;}
		
		if (confirm("저장하시겠습니까?")) {
			frm.action = contextPath + "/userMgt/userSave.do"
			frm.submit();
		}
	}
</script>