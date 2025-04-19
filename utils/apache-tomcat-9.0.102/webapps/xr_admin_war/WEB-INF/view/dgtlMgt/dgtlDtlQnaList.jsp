<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<ul>
		<c:forEach var="row" items="${qnaList}">
		<li>
			<span><c:out value="${row.lastMdfcnDtV19}"/>&nbsp;<c:out value="${row.wrtrNm}"/>님이 작성</span>
			<div class="cont"><c:out value="${row.pstCn}"/></div>
			<c:if test="${not empty row.ansCn}">
			<div class="answer">
				<strong><c:out value="${row.answrNm}"/> 답변 </strong>
				<span><c:out value="${row.ansLastMdfcnDtV19}"/></span>
				<div class="cont"><c:out value="${row.ansCn}"/></div>
			</div>
			</c:if>
		</li>
		</c:forEach>
	</ul>
	<!-- page area start -->
	<div class="align_flex paging">
		<div class="pagination">
			<c:if test="${!empty qnaPageInfo}">
				<c:if test="${qnaPageInfo.paramPageNo == qnaPageInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
				</c:if>
				<c:if test="${qnaPageInfo.paramPageNo > qnaPageInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveQnaListPrevPage(); return false;">이전 페이지</a></span>
				</c:if>
				<c:forEach var="pi" begin="${qnaPageInfo.paramPageStartNo}" end="${qnaPageInfo.paramPageEndNo}">
					<c:if test="${pi == qnaPageInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pi}</a></span></c:if>
					<c:if test="${pi != qnaPageInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveQnaListPageNo('${pi}'); return false;">${pi}</a></span></c:if>
				</c:forEach>
				<c:if test="${qnaPageInfo.paramPageNo < qnaPageInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveQnaListNextPage(); return false;">다음 페이지</a></span>
				</c:if>
				<c:if test="${qnaPageInfo.paramPageNo == qnaPageInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
				</c:if>
			</c:if>
			<c:if test="${empty qnaPageInfo}">
			<span class="navi prev">이전 페이지</span>
			<span class="active"><a href="#">1</a></span>
			<span class="navi next">다음 페이지</span>
			</c:if>
		</div>
	</div>
	<!-- page area end -->
<script>
 $('#qnaPageNo').val('${srchQnaBbsInfo.paramPageNo}');
 $('#qnaPageMaxNo').val('${qnaPageInfo.paramPageMaxNo}');
 $('#qnaTotCnt').html('${qnaPageInfo.paramTotListCnt}');
 </script>