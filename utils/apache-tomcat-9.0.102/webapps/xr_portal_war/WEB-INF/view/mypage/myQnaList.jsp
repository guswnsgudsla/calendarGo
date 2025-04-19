<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>나의 문의 내역</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <a href="<c:url value="/mypage/mypageMain.do"/>">마이페이지</a>
              <span>나의 문의 내역</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents mypage qna-wrap">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
               <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
               <form id="srchForm" name="srchForm" method="get">
                <input type="hidden" id="currentPage" name="currentPage" value="1" />
                <div class="sort">
                  <div class="fm-focus selectmenu" data-size="s">
                      <label for="srchKey" class="blind"></label>
                    <select id="srchKey" name="srchKey">
                      <option value="" selected="selected">전체검색</option>
                      <option value="A" <c:if test="${srchVo.srchKey eq 'A'}">selected</c:if>>제목</option>
                      <option value="B" <c:if test="${srchVo.srchKey eq 'B'}">selected</c:if>>내용</option>
                    </select>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                      <label for="srchValue" class="blind"></label>
                    <input type="text" class="fm-control" id="srchValue" name="srchValue" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchValue}'/>"/>
                      <label for="submitBtn" class="blind"></label>
                    <button type="submit" id="submitBtn">
                      <span class="blind">검색</span>
                    </button>
                  </div>
                </div>
              </div>
              <div class="my-qna">
                <!--
                  신규글 = new
                  답변대기 = unanswered
                  비밀글 = secret
                -->
                <div class="table-grid">
                  <div class="thead">
                    <strong>번호</strong>
                    <strong>제목</strong>
                    <strong>요청기관</strong>
                    <strong>등록일</strong>
                    <strong>조회수</strong>
                  </div>
                  <c:if test="${!empty myQnaList}">
                   <c:forEach var="item" items="${myQnaList}">
                  <div class="row">
                    <a href="<c:url value='/mypage/myQnaDtl.do?pstId=${item.pstId}'/>">
                      <p><c:out value="${item.pstSn}"/></p>
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
                     <!-- 조건을 확인하여 기관명 출력 -->
			            <c:choose>
						 <c:when test="${item.bbsId eq 'SQNA'}">
						  <p>한국문화정보원</p>
						  </c:when>
						 <c:otherwise>
						  <p><c:out value="${item.instNm}"/></p>
						 </c:otherwise>
						</c:choose>
                      <fmt:parseDate value="${item.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                      <p><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd" /></p>
                      <p><c:out value="${item.inqCnt}"/></p>
                    </a>
                  </div>
                  </c:forEach>
                 </c:if>
                   <!-- myQnaList가 비어 있는 경우 -->
				  <c:if test="${empty myQnaList}">
				    <div class="row">
				     <div class="list-nodata">검색 결과가 없습니다.</div>
				    </div>
				  </c:if>
                </div>
              </div>
              <div class="pagination">
               <c:import url="/WEB-INF/view/include/cmmnPaging.jsp">
                 <c:param name="currentPage" value="${srchVo.currentPage}" />
                 <c:param name="pagePerBlock" value="${srchVo.pagePerBlock}" />
                 <c:param name="totalPage" value="${srchVo.totalPage}" />
                 <c:param name="recordCountPerPage" value="${srchVo.recordCountPerPage}" />
                 <c:param name="funNm" value="fnList" />
                 <c:param name="url" value="/mypage/myQnaList.do" />
               </c:import>
                <!-- pagination 모바일용 -->
                  <label for="moreBtn" class="blind"></label>
                <button type="button" id="moreBtn" class="btns color-gray btn-more">
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

