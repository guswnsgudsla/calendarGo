<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%--<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>--%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/tiles-jsp.tld" prefix="tiles" %>

<%--<%@ taglib prefix="tiles" tagdir="/WEB-INF/tags/taglib/tiles-jsp.tld" %> &lt;%&ndash; tiles &ndash;%&gt;--%>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>디지털문화자원 공동활용플랫폼 관리자</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi, viewport-fit=cover" />

	<link rel="shortcut icon" href="<c:url value="/image/favicon.ico" />" >

	<link rel="stylesheet" href="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/styles/shCore.css"/>">
	<link rel="stylesheet" href="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/styles/shThemeRDark.css"/>">



	<!-- library javascript -->
	<script src="<c:url value="/js/jquery.3.4.1.min.js"/>"></script>
	<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/moment.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/daterangepicker.js"/>"></script>
	<script src="<c:url value="/js/lib/axios.min.js"/>"></script>
	<script src="<c:url value="/js/lib/tus.js"/>"></script>
	<script src="<c:url value="/js/lib/sockjs.min.js"/>"></script>
	<script src="<c:url value="/js/lib/stomp.min.js"/>"></script>
	<script src="<c:url value="/js/lib/select2.min.js"/>"></script>
	<script src="<c:url value="/js/lib/three.min.js"/>"></script>
<%--	<script src="/js/lib/three.module.min.js"></script>--%>
<%--	<script src="/js/lib/o3dv.min.js"></script>--%>
	<script src="<c:url value="/js/customViewer.js"/>"></script>

	<script type="text/javascript" src="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/scripts/shCore.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/scripts/shBrushJScript.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/scripts/shBrushCss.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/plugin/syntaxhighlighter_3.0.83/scripts/shBrushXml.js"/>"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="<c:url value="/css/reset.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/jquery-ui.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/module.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/front.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/daterangepicker.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/select2.min.css"/>">
<%--	<link rel="stylesheet" href="/css/contents.css">--%>

	<script src="<c:url value="/js/front.js"/>"></script>
	<script src="<c:url value="/js/cmmn.js"/>"></script>

</head>
<body>
<div class="wrapper">
	
	<aside>
		<tiles:insertAttribute name="side" />
	</aside>
	<section class="header">
		<tiles:insertAttribute name="header" />
	</section>
	<div class="container">
		<div class="breadcrumb">
			<c:if test="${contentInfo.menuDepthFrstNm != '' and contentInfo.menuDepthFrstNm != null}">
			<a href="#" onclick="return false;">home</a></span>
			<a href="#" onclick="return false;"><c:if test="${contentInfo.menuDepthFrstNm == '' or contentInfo.menuDepthFrstNm == null}"></c:if><c:if test="${contentInfo.menuDepthFrstNm != ''}">${contentInfo.menuDepthFrstNm}</c:if></a>
			<a href="#" onclick="return false;"><c:if test="${contentInfo.menuDepthScndNm == '' or contentInfo.menuDepthScndNm == null}"></c:if><c:if test="${contentInfo.menuDepthScndNm != ''}">${contentInfo.menuDepthScndNm}</c:if></a>
			</c:if>
		</div>
		<div class="tit-wrap">
			<h1><c:if test="${contentInfo.menuTitle == '' or contentInfo.menuTitle == null}"></c:if>
				<c:if test="${contentInfo.menuTitle != ''}">${contentInfo.menuTitle}</c:if>
			</h1>
		</div>
		<tiles:insertAttribute name="body" />
	</div>
</div>
</body>
</html>
<script>
	const cmmnEditorFileUpUrl = "<c:url value='/cmmn/editorFileUp.do'/>";
    var contextPath = "<c:url value='/' />".replace(/\/$/, '');
    const apiUrl = "<c:out value='${fileUrl}'/>";


    // 페이지 로드 시 타이머 시작
    window.onload = function() {
        var remainingTime = ${sessionScope.remainingTime}; // 서버에서 전달된 시간
        var display = document.getElementById("timer");

        startTimer(remainingTime, display);
    };

    // 타이머 함수
    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;

        var interval = setInterval(function () {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                clearInterval(interval);
                display.textContent = "00:00";
            }
        }, 1000);
    }
</script>
