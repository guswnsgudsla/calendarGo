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

	<link rel="shortcut icon" href="<c:url value="/image/favicon.ico" />" >
	
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
				<div class="logo-wrap">
					<h1><span class="logo">디지털문화자산 공동활용플랫폼</span> 관리자</h1>
					
				</div>
				<form id="loginForm" action="<c:url value='/login'/>" method="post">
					<div class="fm-ele">
						<label for="username" class="fm-label">아이디</label>
						<input type="text" id="username" name="username" placeholder="아이디를 입력해 주세요." />
					</div>
					<div class="fm-ele">
						<label for="password" class="fm-label">비밀번호</label>
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요." />
					</div>
					<div class="btn-wrap">
						<button type="submit" class="btns" >로그인</button>
					</div>
					<div class="foot">
						문화포털 사이트에 가셔서 <br />회원가입 / 아이디 및 비밀번호 찾기를<br /> 수행해 주세요
					</div>
				</form>
			</div>
		</div>
		<!-- contants(e) -->
	</div>
</div>
</html>