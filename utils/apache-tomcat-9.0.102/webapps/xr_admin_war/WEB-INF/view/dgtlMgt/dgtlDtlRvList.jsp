<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="review-list">
		<ul>
			<c:forEach var="row" items="${rvList}">
			<li>
				<div>
					<div class="star">
						<!-- defult : 0, half : 0.5, full : 1 -->
						<span class="<c:if test='${row.rtngScr >= 1 }'>full</c:if>"></span>
						<span class="<c:if test='${row.rtngScr >= 2 }'>full</c:if>"></span>
						<span class="<c:if test='${row.rtngScr >= 3 }'>full</c:if>"></span>
						<span class="<c:if test='${row.rtngScr >= 4 }'>full</c:if>"></span>
						<span class="<c:if test='${row.rtngScr == 5 }'>full</c:if>"></span>

					</div>
					<em><c:out value="${row.wrtrNm}"/></em>
				</div>
				<span>(<c:out value="${row.lastMdfcnDtV19}"/>)</span>
				<div class="cont"><c:out value="${row.pstCn}"/></div>
			</li>
			</c:forEach>
		</ul>
		<!-- page area start -->
		<div class="align_flex paging">
			<div class="pagination">
				<c:if test="${!empty rvPageInfo}">
					<c:if test="${rvPageInfo.paramPageNo == rvPageInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
					</c:if>
					<c:if test="${rvPageInfo.paramPageNo > rvPageInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="javascript:moveRvListPrevPage(); return false;">이전 페이지</a></span>
					</c:if>
					<c:forEach var="pi" begin="${rvPageInfo.paramPageStartNo}" end="${rvPageInfo.paramPageEndNo}">
						<c:if test="${pi == rvPageInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pi}</a></span></c:if>
						<c:if test="${pi != rvPageInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveRvListPageNo('${pi}'); return false;">${pi}</a></span></c:if>
					</c:forEach>
					<c:if test="${rvPageInfo.paramPageNo < rvPageInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="javascript:moveRvListNextPage(); return false;">다음 페이지</a></span>
					</c:if>
					<c:if test="${rvPageInfo.paramPageNo == rvPageInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
					</c:if>
				</c:if>
				<c:if test="${empty rvPageInfo}">
				<span class="navi prev">이전 페이지</span>
				<span class="active"><a href="#">1</a></span>
				<span class="navi next">다음 페이지</span>
				</c:if>
			</div>
		</div>
		<!-- page area end -->
	</div>
<script>
 $('#rvPageNo').val('${srchRvBbsInfo.paramPageNo}');
 $('#rvPageMaxNo').val('${rvPageInfo.paramPageMaxNo}');
 $('#rvTotCnt').html('${rvPageInfo.paramTotListCnt}');
 </script>