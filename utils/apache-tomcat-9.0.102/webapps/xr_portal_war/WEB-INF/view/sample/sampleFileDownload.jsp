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
    <c:url value="/cmmn/downloadFile.do" var="url">
    <c:param name="filePath" value="C:\xr\FileUpn\20231103" />
    <c:param name="fileNm" value="4E16E144837F4CBF839AF5B708D6A7D0" />
    <c:param name="orgnlFileNm" value="sample.jpg" />
    </c:url>
    <a href="${url}">파일 다운로드</a>
</body>
</html>