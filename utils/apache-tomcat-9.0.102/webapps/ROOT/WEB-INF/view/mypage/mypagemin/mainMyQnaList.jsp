<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<c:if test="${!empty myQnaList}">
	<div class="table-grid">
		<div class="thead">
			<strong>번호</strong> <strong>제목</strong> <strong>요청기관</strong> <strong>등록일</strong>
			<strong>조회수</strong>
		</div>
		<c:forEach var="item" items="${myQnaList}">
			<div class="row">
				<a href="<c:url value='/mypage/myQnaDtl.do?pstId=${item.pstId}'/>">
					<p><c:out value="${item.pstSn}" /></p>
					<div class="${item.newYn == 'Y' ? 'new' : ''}">
						<c:choose>
					    <c:when test="${not empty item.ansCn}">
					        <strong>[답변완료]</strong>
					    </c:when>
					    <c:otherwise>
					        <strong class="unanswered">[답변대기]</strong>
					    </c:otherwise>
					  </c:choose>
				<%-- <c:choose>
					    <c:when test="${item.bbsId eq 'SQNA'}"> --%>
					        <c:out value="${item.pstTtl}"/>
				<%--  </c:when>
					    <c:otherwise>
					        <c:out value="${item.pstCn}"/>
					    </c:otherwise>
					</c:choose> --%>
					<!-- <i class="secret"><span class="blind">비밀글</span></i> -->
					</div>
					<c:choose>
						 <c:when test="${item.bbsId eq 'SQNA'}">
						  <p>한국문화정보원</p>
						  </c:when>
						 <c:otherwise>
						  <p><c:out value="${item.instNm}"/></p>
						 </c:otherwise>
						</c:choose>
					<fmt:parseDate value="${item.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt" />
					<p><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd" /></p>
					<p><c:out value="${item.inqCnt}" /></p>
				</a>
			</div>
		</c:forEach>
	</div>
</c:if>
	<c:if test="${empty myQnaList}">
		<div class="list-nodata">나의 문의내역이 없습니다.</div>
	</c:if>
