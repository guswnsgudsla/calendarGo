<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<%--
<c:import url="/WEB-INF/view/include/paging.jsp" >
	<c:param name="currentPage" value="${searchVO.currentPage }" />
	<c:param name="pagePerBlock" value="${searchVO.pagePerBlock }" />
	<c:param name="totalPage" value="${searchVO.totalPage }" />
</c:import>
 --%>

<c:set var="currentPage" value="${param.currentPage }" />
<c:set var="pagePerBlock" value="${param.pagePerBlock }" />
<c:set var="totalPage" value="${param.totalPage }" />

<c:set var="totalBlock" value="${pf:calculDivideCeil(totalPage, pagePerBlock) }" />
<c:set var="block" value="${pf:calculDivideCeil(currentPage, pagePerBlock) }" />

<c:set var="firstPage" value="${(block-1) * pagePerBlock }" />
<c:set var="lastPage" value="${block * pagePerBlock }" />

<c:if test="${totalBlock <= block }">
	<c:set var="lastPage" value="${totalPage }" />
</c:if>

<c:if test="${lastPage > 0 }">
	<div class="pagination">
		<c:if test="${block > 1 }">
			<span class="navi last"><a href="#!" onclick="<c:out value="${param.funNm }"/>('<c:out value="${param.url}"/>', {'currentPage' : '1'});">처음</a></span>
			<span class="navi before"><a href="#!" onclick="<c:out value="${param.funNm }"/>('<c:out value="${param.url}"/>', {'currentPage' : '<c:out value="${currentPage - 1}"/>'});">이전</a></span>
		</c:if>
		<c:forEach var="nowPage" begin="${firstPage+1 }" end="${lastPage }" step="1">
		<c:choose>
			<c:when test="${currentPage == nowPage }">
				<span class="active">
			</c:when>
			<c:otherwise>
				<span class="">
			</c:otherwise>
			<a href="#!" onclick="<c:out value="${param.funNm }"/>('<c:out value="${param.url}"/>', {'currentPage' : '<c:out value="${nowPage}"/>'});" ><c:out value="${nowPage}"/></a>
			</span>
		</c:choose>
	</c:forEach>
	<c:if test="${block < totalBlock }">
		<span class="navi next"><a href="#!" onclick="<c:out value="${param.funNm }"/>('<c:out value="${param.url}"/>', {'currentPage' : '<c:out value="${lastPage + 1}"/>'});">다음</a></span>
		<span class="navi last"><a href="#!" onclick="<c:out value="${param.funNm }"/>('<c:out value="${param.url}"/>', {'currentPage' : '<c:out value="${totalPage}"/>'});">마지막</a></span>
	</c:if>
			<!-- pagination 모바일용
			<button
			  type="button"
			  class="btns color-gray btn-more"
			>
			  더보기
			</button>-->
	</div>
</c:if>