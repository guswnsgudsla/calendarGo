<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>디지털문화자원 공동활용플랫폼 관리자</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi, viewport-fit=cover" />

	<!-- library javascript -->
	<script src="<c:url value='/js/jquery.3.4.1.min.js' />"></script>
	<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/js/lib/axios.min.js' />"></script>

	<!-- css -->
	<link rel="stylesheet" href="<c:url value='/css/reset.css'/>" />
	<link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/css/module.css'/>" />
	<link rel="stylesheet" href="<c:url value='/css/front.css'/>" />

	<script src="<c:url value='/js/front.js'/>"></script>
	<script src="<c:url value='/js/cmmn.js'/>"></script>

</head>

<div class="wrapper login">
	<div class="container">
		<!-- contants(s) -->
		<div class="contants">
			<div class="login-wrap">
				<h1>디지털문화자산 공동활용플랫폼</h1>
				<div class="fm-ele" >
					<c:out value="${errType }"></c:out> 에러가 발생하였습니다. <br />관리자에게 문의 부탁드립니다.
				</div>

				<div class="btn-wrap">
					<button class="btns size-xsmall" onclick="window.history.back()">이전화면</button>
				</div>
			</div>
		</div>
		<!-- contants(e) -->
	</div>
</div>
</html>