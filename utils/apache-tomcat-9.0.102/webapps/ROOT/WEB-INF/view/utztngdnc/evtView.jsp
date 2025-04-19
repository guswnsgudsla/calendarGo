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
				<a href="<c:url value="/utztngdnc/evtView.do"/>"><span>목록</span></a>
			</div>
		</div>
	</header>
	<section id="contents" class="contents use-guide">
		<div class="inner">
			<div class="tab-wrap">
				<ul class="tab-menu flexible">
					<li class="active"><a href="<c:url value='/utztngdnc/evtView.do'/>" title="이벤트">이벤트</a></li>
					<li><a href="<c:url value='/utztngdnc/eventWinList.do'/>" title="당첨자 보기">당첨자 보기</a></li>
				</ul>
				<div class="inner-depth">
					<div class="tab-inner">
						<div class="list event-wrap cont-bg">
							<div class="list-option between">
								<p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
								<form id="srchForm"  name="srchForm" method="get">
								 <input type="hidden" id="currentPage" name="currentPage" value="1" />
								 	<div class="sort">
										<div class="fm-focus selectmenu" data-size="s">
											<select id="evntSttsKey" name="evntSttsKey">
												<option value="" selected="selected"> 전체상태 </option>
												<option value="A" <c:if test="${srchVo.evntSttsKey eq 'A'}">selected</c:if>>진행중</option>
												<option value="B" <c:if test="${srchVo.evntSttsKey eq 'B'}">selected</c:if>>종료</option>
											</select>
										<label for="evntSttsKey" class="blind">이벤트 상태 선택</label>
										</div>
										<div class="fm-focus selectmenu" data-size="s">
											<select id="srchKey" name="srchKey">
												<option id ='srchKey' value="" selected="selected"> 전체검색 </option>
												<option value="A" <c:if test="${srchVo.srchKey eq 'A'}">selected</c:if>>제목</option>
												<option value="B" <c:if test="${srchVo.srchKey eq 'B'}">selected</c:if>>내용</option>
											</select>
										<label for="srchKey" class="blind">검색 유형 선택</label>
										</div>
										<div class="fm-group fm-focus fm-search">
											<input type="text" class="fm-control" id="srchValue" name="srchValue"  placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchValue}'/>"/>
											<label for="srchValue" class="blind">검색어를 입력해 주세요.</label>
											<button type="submit" id="srchButton">
												<span class="blind">검색</span>
											</button>
											<label for="srchButton" class="blind">검색</label>
										</div>
									</div>
								</form>
							</div>
							<c:if test="${empty evtView}">
									<div class="list-nodata">등록된 이벤트가 없습니다.</div>
							  </c:if>
							<ul>
								<c:forEach var="item" items="${evtView}">
									<li>
										<a href="<c:url value='/utztngdnc/evtViewDtl.do?evntId=${item.evntId}'/>">
											<div class="img">
												<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}'/>" alt="" title="<c:out value="${item.evntTtl}"/>"/>
											</div>
											<div>
												<strong>
													<c:choose>
														<c:when test="${item.evntSttsCd eq 'E01'}">
													        [예정중]
													    </c:when>
													    <c:when test="${item.evntSttsCd eq 'E02'}">
													        [진행중]
													    </c:when>
													    <c:when test="${item.evntSttsCd eq 'E03'}">
													        [종료]
													    </c:when>
													    <c:otherwise>
													       [대기중]
													    </c:otherwise>
													</c:choose> <c:out value="${item.evntTtl}"/>
												</strong>
											</div>
											<p>
												<%--<span>이벤트 기간 : 2023.02.14 ~ 2023.02.29</span>--%>
												<span>이벤트 기간 : <c:out value="${item.eventPeriod}"/></span>
												<span>당첨자 발표 : <c:out value="${item.slctnNtcYmd}"/></span>
											</p>
										</a>
									</li>
								</c:forEach>
							</ul>
							<c:import url="/WEB-INF/view/include/cmmnPaging.jsp" >
								<c:param name="currentPage" value="${srchVo.currentPage}" />
								<c:param name="pagePerBlock" value="${srchVo.pagePerBlock}" />
								<c:param name="totalPage" value="${srchVo.totalPage}" />
								<c:param name="recordCountPerPage" value="${srchVo.recordCountPerPage}" />
								<c:param name="funNm" value="fnList" />
								<c:param name="url" value="evtView.do" />
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
		$('#evntSttsKey').selectmenu();
		$('#srchKey').selectmenu();
	});
</script>