<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>FAQ</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span>FAQ</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option right">
               <form id="srchForm" name="srchForm" method="get">
               <input type="hidden" id="currentPage" name="currentPage" value="1" />
                <div class="sort">
                  <!-- <div class="fm-focus selectmenu" data-size="s">
                    <select id="category" name="category">
                      <option value="" disabled="disabled" selected="selected">
                        카테고리 선택
                      </option>
                      <option>카테고리01</option>
                      <option>카테고리02</option>
                    </select>
                  </div> -->
                  <div class="fm-focus selectmenu" data-size="s">
                    <select id="clsfCd" name="clsfCd">
                      <option value="" selected="selected">
                        전체
                      </option>
                      <c:forEach items="${bbsClsfCdList}" var="row">
                      <option value="${row.clsfCd}" ${srchVo.clsfCd eq row.clsfCd ? 'selected' : ''}>${row.clsfNm}</option>
                    </c:forEach>                    
                    </select>
                  <label for="clsfCd" class="blind">카테고리 선택</label>
                  </div>
                  <button type="submit" id="srchButton" class="btns size-s" title="조회">조회</button>
                </div>
               </form>
              </div>
              <div class="faq-wrap accordion">
                <div class="table-grid">
                  <div class="thead">
                    <strong>번호</strong>
                    <strong>주제</strong>
                    <strong>제목</strong>
                  </div>
              <c:if test="${!empty faqList}">
                  <c:forEach var="item" items="${faqList}" varStatus="status">
                  <div class="row acc-head">
                    <a href="#" title="<c:out value="${item.pstTtl}"/>">
                      <p><c:out value="${item.pstSn}"/></p>
                      <p><c:out value="${item.clsfNm}"/></p>
                      <div>
                        <c:out value="${item.pstTtl}"/>
                      </div>
                    </a>
                    <div class="acc-body">
                    <c:set var="pstCn" value="${item.pstCn}"/>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
                    </div>
                  </div>
                 </c:forEach>
              </c:if>
              <c:if test="${empty faqList}">
              <div class="row">
    			<div class="list-nodata">조회 결과가 없습니다.</div>
			  </div>
			  </c:if>
                </div>
              </div>
              <div class="pagination">
              <c:import url="/WEB-INF/view/include/cmmnPaging.jsp">
               <c:param name="currentPage" value="${faqList[0].currentPage}" />
               <c:param name="pagePerBlock" value="${faqList[0].pagePerBlock}" />
               <c:param name="totalPage" value="${faqList[0].totalPage}" />
               <c:param name="recordCountPerPage" value="${faqList[0].recordCountPerPage}" />
               <c:param name="funNm" value="fnList" />
               <c:param name="url" value="faqList.do" />
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
    //front.selectmenu("category");
      $('#clsfCd').selectmenu();

    </script>
  </body>
</html>

 