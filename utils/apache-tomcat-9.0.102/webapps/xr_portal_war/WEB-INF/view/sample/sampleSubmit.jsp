<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일다운로드</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
</head>
<body>
	<form method="POST" action='<c:url value="/sample/doPost.do"/>'>
	Select <p>Info</p>
	<input type="checkbox" name="sel" value="01">01<br>
	<input type="checkbox" name="sel" value="02">02<br>
	<input type="checkbox" name="sel" value="03">03<br>
	<input type="checkbox" name="sel" value="04">04<br>
	<input type="checkbox" name="sel" value="05">05<br>
	<center>
		<input type="SUBMIT">
	</center>
	</form>
</body>
</html>