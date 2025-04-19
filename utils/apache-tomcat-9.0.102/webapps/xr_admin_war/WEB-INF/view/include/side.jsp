<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<h1>디지털문화자산 공동활용플랫폼</h1>
<nav>
	<c:if test="${!empty menuList}">
		<c:forEach var="menuData" items="${menuList}" varStatus="status">
			<c:if test="${menuData.menuDepth == 1}">
<%--			<ul style="padding-bottom: 0px;">--%>
			<ul>
				<li>
					<p onclick="moveContentsPage('${menuData.menuId}', '${menuData.scrnUriAddr}');">${menuData.menuNm}</p>
				</li>
			</ul>
			</c:if>
			<c:if test="${menuData.menuDepth == 2}">
				<div class="depth">
					<p onclick="moveContentsPage('${menuData.menuId}','${menuData.scrnUriAddr}');">${menuData.menuNm}</p>
				</div>
			</c:if>
		</c:forEach>
	</c:if>
</nav>

<%--<nav>--%>
<%--	<ul>--%>
<%--		<li class="link <c:if test="${contentInfo.menuId eq 'MENU000001'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000001'); return false;">메인화면</a>--%>
<%--		</li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000012' or contentInfo.menuId eq 'MENU000013' or contentInfo.menuId eq 'MENU000014'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000002');">전시관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000012'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000012'); return false;">디지털 문화자원</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000013'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000013'); return false;">컬렉션</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000014'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000014'); return false;">기관</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="link <c:if test="${contentInfo.menuId eq 'MENU000003'}">active</c:if>"><a href="#" onclick="javascript:moveContentsPage('MENU000003'); return false;">디지털 문화자원 관리</a></li>--%>
<%--		<li class="link <c:if test="${contentInfo.menuId eq 'MENU000004'}">active</c:if>"><a href="#" onclick="javascript:moveContentsPage('MENU000004'); return false;">컬렉션 관리</a></li>--%>
<%--		<li class="link <c:if test="${contentInfo.menuId eq 'MENU000005'}">active</c:if>"><a href="#" onclick="javascript:moveContentsPage('MENU000005'); return false;">비정형 품질지표 관리</a></li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000015' or contentInfo.menuId eq 'MENU000016' or contentInfo.menuId eq 'MENU000017'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000006'); return false;">사용자 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000015'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000015'); return false;">포털 사용자</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000016'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000016'); return false;">기관 사용자</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000017'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000017'); return false;">관리자</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="link <c:if test="${contentInfo.menuId eq 'MENU000037'}">active</c:if>"><a href="#" onclick="javascript:moveContentsPage('MENU000037'); return false;">기관 관리</a></li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000018' or contentInfo.menuId eq 'MENU000019'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000007'); return false;">문화자원 이용 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000018'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000018'); return false;">문화자원 Q&A</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000019'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000019'); return false;">문화자원 이용요청</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000021' or contentInfo.menuId eq 'MENU000022' or contentInfo.menuId eq 'MENU000023' or contentInfo.menuId eq 'MENU000024' or contentInfo.menuId eq 'MENU000025'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000008'); return false;">커뮤니티 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000021'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000021'); return false;">홍보 채널 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000022'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000022'); return false;">포털 공지사항</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000023'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000023'); return false;">기관 공지사항</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000024'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000024'); return false;">기관 요청사항</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000025'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000025'); return false;">이벤트 관리</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000026' or contentInfo.menuId eq 'MENU000027' or contentInfo.menuId eq 'MENU000028'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000009'); return false;">통계 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000026'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000026'); return false;">이용통계</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000027'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000027'); return false;">문화정보백서</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000028'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000028'); return false;">기관 문화정보 환경조사</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000029' or contentInfo.menuId eq 'MENU000030' or contentInfo.menuId eq 'MENU000031' or orcontentInfo.menuId eq 'MENU000032' or orcontentInfo.menuId eq 'MENU000033' or contentInfo.menuId eq 'MENU000034'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000010'); return false;">설정 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000029'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000029'); return false;">권한 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000030'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000030'); return false;">메뉴 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000031'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000031'); return false;">게시판 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000032'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000032'); return false;">분류체계 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000033'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000033'); return false;">기준 정보 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000034'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000034'); return false;">스케쥴 관리 관리</a>--%>
<%--			</div>--%>
<%--		</li>--%>
<%--		<li class="<c:if test="${contentInfo.menuId eq 'MENU000035' or contentInfo.menuId eq 'MENU000036'}">active</c:if>">--%>
<%--			<a href="#" onclick="javascript:moveContentsPage('MENU000011'); return false;">수집 연계 이력 관리</a>--%>
<%--			<div class="depth">--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000035'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000035'); return false;">수집 이력 관리</a>--%>
<%--				<a href="#" class="<c:if test="${contentInfo.menuId eq 'MENU000036'}">active</c:if>" onclick="javascript:moveContentsPage('MENU000036'); return false;">연계 이력 관리</a--%>
<%--			</div>--%>
<%--		</li>--%>

<%--	</ul>--%>
<%--</nav>--%>
<form id="frmMoveMenuInfo" name="frmMoveMenuInfo" method="post" action="#">
	<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value=""> 
</form>
<script>
//SyntaxHighlighter
SyntaxHighlighter.all();



function moveContentsPage(menuId, url) {
	let frmM = document.frmMoveMenuInfo;

    frmM.action = contextPath +url;

	

	//디지털 문화자원
	if (menuId == "MENU000002") {
		//전시관리 중 디지털 문화자원
		frmM.hdnMenuParam.value = "RCS";
	}

	//비정형품질지표관리
	if (menuId == "MENU000005") {
		//전시관리 중 디지털 문화자원
		frmM.method = "GET";
	}
	
	//전시관리
	if (menuId == "MENU000012") {
		//전시관리 중 디지털 문화자원
		frmM.hdnMenuParam.value = "RCS";
	}
	//컬렉션
	if (menuId == "MENU000013") {
		//전시관리 중 컬렉션
		frmM.hdnMenuParam.value = "CLC";
	}
	
	//기관
	if (menuId == "MENU000014") {
		//전시관리 중 기관
		frmM.hdnMenuParam.value = "INST";
	}
	

	//기관 사용자
	if (menuId == "MENU000016") {
		//사용자 관리 중 기관 사용자
		frmM.hdnMenuParam.value = "IU";
	}
	//관리자
	if (menuId == "MENU000017") {
		//사용자 관리 중 관리자
		frmM.hdnMenuParam.value = "MU";
	}
	//문화자원 이용관리
	if (menuId == "MENU000007") {
		//문화자원 이용관리
		frmM.hdnMenuParam.value = "QNA";
		frmM.method = "GET";
	}
	//문화자원 Q&A
	if (menuId == "MENU000019") {
		//문화자원 이용관리 중 문화자원 Q&A
		frmM.hdnMenuParam.value = "QNA";
		frmM.method = "GET";
	}

	//포털 공지사항
	if (menuId == "MENU000022") {
		//커뮤니티 중 포털 공지사항
		frmM.hdnMenuParam.value = "NTC";
		frmM.method = "GET";
	}
	//기관 공지사항
	if (menuId == "MENU000023" || menuId == "MENU000008") {
		//커뮤니티 중 기관 공지사항
		frmM.hdnMenuParam.value = "BBS0000001";
		frmM.method = "GET";
	}
	//기관 요청사항
	if (menuId == "MENU000024") {
		//커뮤니티 중 기관 요청사항
		frmM.hdnMenuParam.value = "BBS0000002";
		frmM.method = "GET";
	}
	//이벤트 관리
	if (menuId == "MENU000025") {
		//커뮤니티 중 이벤트관리
		frmM.hdnMenuParam.value = "";
		frmM.action = contextPath + "/evntMgt/evntList.do";
	}


	//권한 관리
	if (menuId == "MENU000029") {
		frmM.hdnMenuParam.value = "";
		frmM.action = contextPath + "/authMgt/authList.do";
	}

	//분류체계 관리
	//if (menuId == "MENU000032") {
		//설정 관리 중 분류체계 관리
		//alert("준비중입니다.");
		//return false;
		//frmM.hdnMenuParam.value = "";
		//frmM.action = "";
		//frmM.submit();
	//}
	//기준 정보 관리
	if (menuId == "MENU000033") {
		//설정 관리 중 기준 정보 관리
		frmM.hdnMenuParam.value = "";
		frmM.action = contextPath + "/crtrInfoMgt/crtrInfoList.do";
	}
	//스케쥴 관리
	if (menuId == "MENU000034") {
		//설정 관리 중 스케쥴 관리
		// alert("준비중입니다.");
		// return false;
		//frmM.hdnMenuParam.value = "";
		//frmM.action = "";
		//frmM.submit();
	}

	//연계 이력 관리
	/*
	if (menuId == "MENU000036") {
		//수집 연계 이력 관리 중 연계 이력 관리
		alert("준비중입니다.");
		return false;
		//frmM.hdnMenuParam.value = "";
		//frmM.action = "";
		//frmM.submit();
	}
	*/
	
	//기관관리
	if (menuId == "MENU000037") {
		//기관 관리
		frmM.hdnMenuParam.value = "";
		frmM.action = contextPath + "/instMgt/instList.do";
	}
	
	//FAQ관리
	if (menuId == "MENU000053") {
		frmM.hdnMenuParam.value = "FAQ";
		frmM.method = "GET";
	}

	//승인 요청 게시판
	if (menuId == "MENU000068") {
		frmM.hdnMenuParam.value = "JOIN";
		frmM.method = "GET";
	}
	
	
	frmM.submit();
	
}

</script>
