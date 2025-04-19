<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<table border="1">
			<caption></caption>
			<colgroup>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>기관아이디</th>
					<th>기관명</th>
					<th>기관코드</th>
					<th>기관유형</th>
					<th>영역유형</th>
					<th>수집유형</th>
					<th>등록문화자산</th>
					<th>우수인증</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty instTypeCdList}">
				<c:forEach var="instTypeCdData" items="${instTypeCdList}">
				<tr>
					<td>${instTypeCdData.clsfCd}</td>
					<td>${instTypeCdData.clsfCdNm}</td>
					<td>${instTypeCdData.cdId}</td>
					<td>${instTypeCdData.cdNm}</td>
					<td>${instTypeCdData.sortSn}</td>
					<td>${instTypeCdData.cdExpln}</td>
					<td>${instTypeCdData.useYn}</td>
					<td>${instTypeCdData.useYnNm}</td>
					<td>${instTypeCdData.aprvYn}</td>
					<td>${instTypeCdData.aprvYnNm}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty instTypeCdList}">
				<tr>
					<td colspan="10">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>