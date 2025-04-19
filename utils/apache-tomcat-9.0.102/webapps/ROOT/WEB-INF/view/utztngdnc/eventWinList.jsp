<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<section class="container">
	<header>
		<div class="inner">
			<h2>이벤트</h2>
			<div class="breadcrumbs">
				<a href="<c:url value="/index.do"/>">메인</a>
				<span>이용안내</span>
				<span>이벤트</span>
				<span>당첨자 보기</span>
				<a href="<c:url value="/utztngdnc/eventWinList.do"/>"><span>목록</span></a>
			</div>
		</div>
	</header>
	<section id="contents" class="contents use-guide">
		<div class="inner">
			<div class="tab-wrap">
				<ul class="tab-menu flexible">
					<li><a href="<c:url value='/utztngdnc/evtView.do'/>" title="이벤트">이벤트</a></li>
					<li class="active"><a href="<c:url value='/utztngdnc/eventWinList.do'/>" title="당첨자 보기">당첨자 보기</a></li>
				</ul>
				<div class="inner-depth">
					<div class="tab-inner">
						<div class="list cont-bg">
							<div class="list-option between">
								<p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
								<form id="srchForm" method="get">
									<input type="hidden" id="currentPage" name="currentPage" value="1" />
									<div class="sort">
										<div class="fm-focus selectmenu" data-size="s">
											<select id="srchKey" name="srchKey">
												<option value="" selected="selected" >
													전체검색
												</option>
												<option value="A" <c:if test="${srchVo.srchKey eq 'A'}">selected</c:if>>제목</option>
												<option value="B" <c:if test="${srchVo.srchKey eq 'B'}">selected</c:if>>내용</option>
											</select>
										<label for="srchKey" class="blind">검색 유형 선택</label>
										</div>
										<div class="fm-group fm-focus fm-search">
											<input type="text" class="fm-control" id="" name="srchValue" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchValue}'/>"/>
											<label for="srchValue" class="blind">검색어를 입력해 주세요.</label>
											<button type="submit" id="srchButton">
												<span class="blind">검색</span>
											</button>
											<label for="srchButton" class="blind">검색</label>
										</div>
									</div>
								</form>
							</div>
							<div class="notice">
								<div class="table-grid">
									<div class="thead">
										<strong>번호</strong>
										<strong>제목</strong>
										<strong>등록일</strong>
										<strong>조회수</strong>
									</div>
									<c:if test="${empty eventWinner}">
									<div class="list-nodata">등록된 게시글이 없습니다.</div>
							  </c:if>
									<c:forEach var="item" items="${eventWinner}" varStatus="status">
										<div class="row">
											<a href="eventWinDtl.do?pstId=<c:out value='${item.pstId}' />" title="<c:out value="${item.pstTtl}" />">
												<p><c:out value="${item.pstSn}" /></p>
												<div class="new">
													<c:out value="${item.pstTtl}" />
												</div>
												<p><c:out value="${item.frstRegDt}" /></p>
												<p><c:out value="${item.inqCnt}" /></p>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<c:import url="/WEB-INF/view/include/cmmnPaging.jsp" >
								<c:param name="currentPage" value="${srchVo.currentPage}" />
								<c:param name="pagePerBlock" value="${srchVo.pagePerBlock}" />
								<c:param name="totalPage" value="${srchVo.totalPage}" />
								<c:param name="recordCountPerPage" value="${srchVo.recordCountPerPage}" />
								<c:param name="funNm" value="fnList" />
								<c:param name="url" value="eventWinList.do" />
							</c:import>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
	/* 페이징 */
	function fnList(url, currentPage) {
		$('#currentPage').val(currentPage.currentPage);
		$('#srchForm').submit();
	}
	$(document).ready(function(){
		$('#srchKey').selectmenu();
		$('.new').click(function(){
		})
	});
</script>