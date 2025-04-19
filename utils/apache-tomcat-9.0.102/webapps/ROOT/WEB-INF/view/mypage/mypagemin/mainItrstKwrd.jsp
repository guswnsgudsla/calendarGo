<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty myItrstKwrdList}">
	<div class="list-nodata keyword">관심 키워드가 없습니다.</div>
</c:if>

<c:if test="${!empty myItrstKwrdList}">
	<div class="keyword-tag">
		<c:forEach var="item" items="${myItrstKwrdList}">
			<span class="tag size-latge"> <c:out value="${item.kwrdNm}" />
				<label for="btn-delete" class="blind"></label>
				<button type="button" id="btn-delete" class="btn-delete" onclick="deleteKeyword(${item.kwrdSn})">
					<span class="blind">삭제</span>
				</button>
			</span>
		</c:forEach>
	</div>
</c:if>
