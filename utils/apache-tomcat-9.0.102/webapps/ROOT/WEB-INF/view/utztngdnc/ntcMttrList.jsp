<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>공지사항</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span>공지사항</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
                <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
                <form id="srchForm" name="srchForm" method="get">
                <input type="hidden" id="currentPage" name="currentPage" value="1" />
                <div class="sort">
                  <div class="fm-focus selectmenu" data-size="s">
                    <select id="srchKey" name="srchKey">
                      <option value="" selected="selected">전체검색</option>
                      <option value="A" <c:if test="${srchVo.srchKey eq 'A'}">selected</c:if>>제목</option>
                      <option value="B" <c:if test="${srchVo.srchKey eq 'B'}">selected</c:if>>내용</option>
                    </select>
                  <label for="srchKey" class="blind">검색 유형 선택</label>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                    <input type="text" class="fm-control" id="srchValue" name="srchValue" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchValue}'/>"/>
                    <label for="srchValue" class="blind">검색어를 입력해 주세요.</label>
                    <button type="submit" id="srchButton">
                      <span class="blind">검색</span>
                    </button>
                    <label for="srchButton" class="blind">검색</label>
                  </div>
                </div>
              </div>
              <div class="notice">
                <!--
                  신규글 = new
                -->
                <div class="table-grid">
                  <div class="thead">
                    <strong>번호</strong>
                    <strong>제목</strong>
                    <strong>등록일</strong>
                    <strong>조회수</strong>
                  </div>
                <c:if test="${!empty ntcMttrList}">  
                 <c:forEach var="item" items="${ntcMttrList}" varStatus="status">
                  <div class="row">
                    <a href="<c:url value='/utztngdnc/ntcMttrDtl.do?pstId=${item.pstId}'/>" title="<c:out value="${item.pstTtl}"/>">
                      <p><c:out value="${item.pstSn}"/></p>
                      <div class="${item.newYn == 'Y' ? 'new' : ''}">
                        <c:out value="${item.pstTtl}"/>
                      </div>
                      <fmt:parseDate value="${item.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                      <p><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd" /></p>
                      <p><c:out value="${item.inqCnt}"/></p>
                    </a>
                  </div>
                 </c:forEach>
                </c:if>
               <c:if test="${empty ntcMttrList}">
               <div class="row">
	   			<div class="list-nodata">검색 결과가 없습니다.</div>
			   </div>
			   </c:if>  
                </div>
              </div>
              <div class="pagination">
               <c:import url="/WEB-INF/view/include/cmmnPaging.jsp">
                 <c:param name="currentPage" value="${ntcMttrList[0].currentPage}" />
                 <c:param name="pagePerBlock" value="${ntcMttrList[0].pagePerBlock}" />
                 <c:param name="totalPage" value="${ntcMttrList[0].totalPage}" />
                 <c:param name="recordCountPerPage" value="${ntcMttrList[0].recordCountPerPage}" />
                 <c:param name="funNm" value="fnList" />
                 <c:param name="url" value="ntcMttrList.do" />
               </c:import>
                <!-- pagination 모바일용 -->
                <button type="button" class="btns color-gray btn-more">
                  더보기
                </button>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->

    <script>
    function fnList(url, currentPage) {
	    $('#currentPage').val(currentPage.currentPage);
	    $('#srchForm').submit();
	}
	
	$(document).ready(function(){
	 	$('#srchKey').selectmenu();
	});
    </script>
