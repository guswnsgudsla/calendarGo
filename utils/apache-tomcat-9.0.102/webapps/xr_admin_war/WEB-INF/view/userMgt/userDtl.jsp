<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>


<div class=contants>
	
	<!-- info detail area start -->
	<div class="table-wrap write">
		<form name="frmUserDtl" id="frmUserDtl" method="post" action="#">
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
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${srchUserInfo.paramTabPstnId}"/>">
			<input type="hidden" id="srchTabCntnHstryListPageNo" name="srchTabCntnHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabCntnHstryListPageNo}"/>">
			<input type="hidden" id="srchTabAprvHstryListPageNo" name="srchTabAprvHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabAprvHstryListPageNo}"/>">
		</form>
	
		<table>
			<colgroup>
				<col width="200px">
				<col width="">
				<col width="200px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th>사용자아이디</th>
					<td><c:out value="${pf:getMaskingID(userInfo.userId)}" /></td>
					<th>사용자명</th>
					<td><c:out value="${pf:getMaskingName(userInfo.userNm)}" /></td>
				</tr>
				<tr>
					<th>사용자별칭</th>
					<td><c:out value="${userInfo.userNcm}"/></td>
					<th>권한명</th>
					<td><c:out value="${userInfo.authrtNm}"/></td>
				</tr>
				<tr>
					<th>기관명</th>
					<td><c:out value="${userInfo.instNm}"/>(<c:out value="${userInfo.instCd}"/>)</td>
					<th>사용자유형</th>
					<td><c:out value="${userInfo.userTypeCdNm}"/></td>
				</tr>
				<tr>
					<th>사용자상태</th>
					<td><c:out value="${userInfo.userSttsCdNm}"/></td>
					<th>전화번호</th>
					<td><c:out value="${userInfo.telno}"/></td>
				</tr>
				<tr>
					<th>모바일번호</th>
					<td><c:out value="${userInfo.mbNo}"/></td>
					<th>이메일주소</th>
					<td><c:out value="${userInfo.emlAddr}"/></td>
				</tr>
			<c:if test="${userInfo.aprvYn == 'Y'}">	
				<tr>
					<th>신청일시</th>
					<td><c:out value="${userInfo.frstRegDtV19}"/></td>
					<th>승인여부</th>
					<td><c:out value="${userInfo.aprvYnNm}"/></td>
				</tr>
			</c:if>	
			</tbody>
		</table>
	</div>
	<!-- info detail area end -->
	
	<!-- button arae start -->
	<div class="btn-wrap align-right">
		<button type="button" id="btnList" name="btnList" class="btns color-gray" onclick="javascript:moveListUserInfo(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y' and UserAuthrtInfo.delAuthrtYn == 'Y'}">
			<c:if test="${userInfo.aprvYn != 'Y'}">
		<button type="button" id="btnAprvChk" name="btnAprvChk" class="btns" onclick="javascript:movePopUserAprv(); return false;">승인 결정</button>
			</c:if>
		</c:if>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<button type="button" id="btnEdit" name="btnEdit" class="btns" onclick="javascript:moveEditUserInfo(); return false;">수정</button>
		</c:if>
		
	</div>
	<!-- button area end  -->
	<!-- tab area start -->
	<div class="tab-wrap as-tab-wrap">
		<ul class="tab-menu">
			<li id="tabCntnMenu" <c:if test="${srchUserInfo.paramTabPstnId == 'CNTN'}">class="active"</c:if>><a href="#" onclick="javascript:goMoveUserTab('CNTN'); return false;">접속이력</a></li>
			<li id="tabAprvMenu" <c:if test="${srchUserInfo.paramTabPstnId == 'APRV'}">class="active"</c:if>><a href="#" onclick="javascript:goMoveUserTab('APRV'); return false;">승인이력</a></li>
		</ul>
		<div class="inner-depth">
			<div class="tab-inner" id="tabCntnArea" <c:if test="${srchUserInfo.paramTabPstnId == 'APRV'}">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="200px">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>로그인 일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty userCntnHstryList}">
					<c:forEach var="userCntnHstryData" items="${userCntnHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${userCntnHstryData.cntnListNo}"/></td>
								<td><c:out value="${userCntnHstryData.cntnDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty userCntnHstryList}">
							<tr>
								<td colspan="2">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				<div class="pagination">
					<c:if test="${!empty pageUserCntnHstryInfo}">
						<c:if test="${pageUserCntnHstryInfo.paramPageNo == pageUserCntnHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageUserCntnHstryInfo.paramPageNo > pageUserCntnHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListCntnPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pci" begin="${pageUserCntnHstryInfo.paramPageStartNo}" end="${pageUserCntnHstryInfo.paramPageEndNo}">
							<c:if test="${pci == pageUserCntnHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;"><c:out value="${pci}"/></a></span></c:if>
							<c:if test="${pci != pageUserCntnHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListCntnPageNo('<c:out value="${pci}"/>'); return false;"><c:out value="${pci}"/></a></span></c:if>
						</c:forEach>
						<c:if test="${pageUserCntnHstryInfo.paramPageNo < pageUserCntnHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListCntnNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageUserCntnHstryInfo.paramPageNo == pageUserCntnHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageUserCntnHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
			<div class="tab-inner" id="tabAprvArea" <c:if test="${srchUserInfo.paramTabPstnId == 'CNTN'}">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="200px">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>승인여부</th>
								<th>사유</th>
								<th>승인자</th>
								<th>승인일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty userAprvHstryList}">
					<c:forEach var="userAprvHstryData" items="${userAprvHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${userAprvHstryData.aprvListNo}"/></td>
								<td><c:out value="${userAprvHstryData.aprvYnNm}"/></td>
								<td><c:out value="${userAprvHstryData.rjctCn}"/></td>
								<td><c:out value="${userAprvHstryData.autzrId}"/>(<c:out value="${userAprvHstryData.autzrNm}"/>)</td>
								<td><c:out value="${userAprvHstryData.aprvDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty userAprvHstryList}">
							<tr>
								<td colspan="5">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				
				<div class="pagination">
					<c:if test="${!empty pageUserAprvHstryInfo}">
						<c:if test="${pageUserAprvHstryInfo.paramPageNo == pageUserAprvHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageUserAprvHstryInfo.paramPageNo > pageUserAprvHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListAprvPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pai" begin="${pageUserAprvHstryInfo.paramPageStartNo}" end="${pageUserAprvHstryInfo.paramPageEndNo}">
							<c:if test="${pai == pageUserAprvHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pai}</a></span></c:if>
							<c:if test="${pai != pageUserAprvHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListAprvPageNo('${pai}'); return false;">${pai}</a></span></c:if>
						</c:forEach>
						<c:if test="${pageUserAprvHstryInfo.paramPageNo < pageUserAprvHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListAprvNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageUserAprvHstryInfo.paramPageNo == pageUserAprvHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageUserAprvHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
		</div>
	</div>
	<!-- tab area end -->
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:70%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script type="text/javascript">
	
	function movePopUserAprv() {
		let paramPopUrl = "";
		let paramUserId = $("#srchUserId").val();
		let paramInstId = "${userInfo.instId}";
		let paramUserTypeCd = $("#srchUserTypeCd").val();
		paramPopUrl += "/userMgt/popLayerAprvInfo.do";
		paramPopUrl += "?srchPopUserId=" + paramUserId;
		paramPopUrl += "&srchPopUserTypeCd=" + paramUserTypeCd;

		paramPopUrl = contextPath + paramPopUrl;
		
		$(".pop-layer").load(paramPopUrl);
		admin.modalsShow('modals'); 
	}
	
	//승인 내역 
	function moveSaveAprvUserInfo() {
		let paramPopUserId = $("#srchPopUserId").val();
		let paramPopInstId = $("#srchPopInstId").val();
		let paramPopUserAprvYn = "N";
		if ($("#popAprvYnY").is(":checked")) {
			paramPopUserAprvYn = "Y"
		}
		let paramPopAuthrtId = $("#popUserAuthrtId").val();
		let paramPopRjctCn = $("#popRjctCn").val();
		
		if($("#popAprvYnY").is(":checked")){
			if (paramPopAuthrtId == "") {
				alert("권한을 선택해 주십시오.");
				$("#popUserAuthrtId").focus();
				return false;
			}
		}
		
		if (paramPopRjctCn == "") {
			alert("이유를 입력해 주십시오.");
			$("#popUserAuthrtId").focus();
			return false;
		}
		
		if (confirm("저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath +"/userMgt/popUserAprvReg.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"chkPopAprvYn" : paramPopUserAprvYn,
					"chkPopUserId" : paramPopUserId,
					"chkPopInstId" : paramPopInstId,
					"chkPopAuthrtId" : paramPopAuthrtId,
					"chkPopAprvCn" : paramPopRjctCn
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert("승인 설정이 저장되었습니다.");
						moveReloadUserInfo();
						return false;
					} else {
						alert("데이터 이상으로 저장되지 못했습니다. 관리자에게 문의하십시오.");
						return false;
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			moveReloadUserInfo();
			return false;
		}
	}
	
	function moveReloadUserInfo() {
		let frmU = document.frmUserDtl;
		frmU.action = contextPath +"/userMgt/userDtl.do";
		frmU.submit();
	}
	
	function goMoveUserTab(paramTab) {
		$("#srchTabPstnId").val(paramTab);
		if (paramTab == "CNTN") {
			$("#tabCntnMenu").addClass("on");
			$("#tabAprvMenu").removeClass("on");
			$("#tabCntnArea").show();
			$("#tabAprvArea").hide();
			
		} else if (paramTab == "APRV") {
			$("#tabCntnMenu").removeClass("on");
			$("#tabAprvMenu").addClass("on");
			$("#tabCntnArea").hide();
			$("#tabAprvArea").show();
		}
	}
	
	function moveEditUserInfo() {
		let frmU = document.frmUserDtl;
		frmU.srchWrtMode.value = "edit";
		frmU.action = contextPath +"/userMgt/userReg.do";
		frmU.submit();
	}
	
	function moveListUserInfo() {
		let frmU = document.frmUserDtl;
		frmU.action = contextPath +"/userMgt/userList.do";
		frmU.submit();
	}
	
	//접속이력 Tab page 이동
	//선택한 페이징으로 이동
	function moveListCntnPageNo(paramDataInt) {
		let frm = document.frmUserDtl;
		frm.srchTabCntnHstryListPageNo.value = paramDataInt;
		frm.action = contextPath +"/userMgt/userDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListCntnPrevPage() {
		let frm = document.frmUserDtl;
		let nowPageNo = parseInt(frm.srchTabCntnHstryListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListCntnPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListCntnNextPage() {
		let frm = document.frmUserDtl;
		let maxPageNo = parseInt(${pageUserCntnHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabCntnHstryListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListCntnPageNo(movePageNo);
		}
	}
	

	//승인이력 Tab page이동
	//선택한 페이징으로 이동
	function moveListAprvPageNo(paramDataInt) {
		let frm = document.frmUserDtl;
		frm.srchTabAprvHstryListPageNo.value = paramDataInt;
		frm.action = "/userMgt/userDtl.d";
		frm.submit();
	}
	
	// 이전페이지
	function moveListAprvPrevPage() {
		let frm = document.frmUserDtl;
		let nowPageNo = parseInt(frm.srchTabAprvHstryListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListAprvPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListAprvNextPage() {
		let frm = document.frmUserDtl;
		let maxPageNo = parseInt(${pageUserAprvHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabAprvHstryListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListAprvPageNo(movePageNo);
		}
	}
</script>