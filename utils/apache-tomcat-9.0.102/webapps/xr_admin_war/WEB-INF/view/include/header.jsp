<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="util">
	<span>${username}</span>|<span>${instId}</span>|<span>프로필보기</span>|<span><a href="<c:url value='/logout'/>" style="color: white;">로그아웃</a></span><span id="timer"></span>
</div>
