<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
     <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>나의 활용사례 등록 현황</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a> 
              <a href="<c:url value="/mypage/mypageMain.do"/>">마이페이지</a>
              <span>사용현황</span>
              <a href="<c:url value="/mypage/cnjtCasePrss.do"/>"><span>나의 활용사례 등록 현황</span></a>
            </div>
          </div>
        </header>
        <section id="contents" class="contents usage">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
                <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,##0" /></strong>개</p>
                <div class="sort">
                <form id="srchForm" name="srchForm" method="get">  
               	 	<input type="hidden" id="currentPage" name="currentPage" value="1" />
                  <div class="fm-focus selectmenu" data-size="s">
                      <label for="selectSearch" class="blind"></label>
                    <select id="cont" id="selectSearch" name="selectSearch">
                       <option value=""  selected="selected"> 전체검색 </option>
                       <option value="bizNm" <c:if test="${srchVo.selectSearch eq 'bizNm'}">selected</c:if>>제목</option>
                       <option value="bizCn" <c:if test="${srchVo.selectSearch eq 'bizCn'}">selected</c:if>>내용</option>
                    </select>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                      <label for="searchText" class="blind">검색어를 입력해 주세요.</label>
	                 <input name="search" type="text"  class="fm-control"  id="searchText"  placeholder="검색어를 입력해 주세요."  value="<c:out value='${srchVo.search}'/>"/>
                      <label for="submitBtn" class="blind"></label>
                    <button type="submit" id="submitBtn">
	                  <span class="blind">검색</span>
	                </button>
                   </form>
                  </div>
                </div>
              </div>
              <c:if test="${empty cnjtCaseList}">
					<div class="list-nodata">등록된 활용 사례가 없습니다.</div>
			  </c:if>
              <ul class="list-useful">
              <c:forEach var="item" items="${cnjtCaseList}" >
                <li>
                  <a href="<c:url value='/cltrscprss/cnjtCaseView.do?prId=${item.prId}'/>" >
                    <c:if test="${!empty item.aprvYn}">
					    <c:choose>
					        <c:when test="${item.aprvYn eq 'Y'}">
					            <!-- 'Y' (승인완료)일 때의 내용 -->
					            <span class="approval ok">승인완료</span>
					        </c:when>
					        <c:when test="${item.aprvYn eq 'N'}">
					            <!-- 'D' (승인대기중)일 때의 내용 -->
					            <span class="approval">승인대기중</span>
					        </c:when>
					        <c:when test="${item.aprvYn eq 'D'}">
					            <!-- 'N' (반려)일 때의 내용 -->
					            <span class="approval err">반려</span>
					        </c:when>
					        <c:otherwise>
					            <!-- 다른 모든 경우 -->
					            <span class="ok">대기중</span>
					        </c:otherwise>
					    </c:choose>
					</c:if>
                    <div class="img">
                      <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}'/>" alt="" />
                    </div>
                    <div class="tag-wrap">
                      <c:out value="${item.entNm}" />
                    </div>
                    <p>
                      <strong><c:out value="${item.prTtl}" /></strong>
                    </p>
                  </a>
                  <div class="btn-wrap">
                    <p><c:out value="${item.frstRegDt}" /></p>
                      <label for="viewBtn" class="blind"></label>
                    <button type="button" id="viewBtn" class="view"><c:out value="${item.inqCnt}" /></button>
                  </div>
                </li>
                </c:forEach>
              </ul>
              <div class="pagination">
                 <c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
				   <c:param name="currentPage" value="${srchVo.currentPage}" />
				   <c:param name="pagePerBlock" value="${srchVo.pagePerBlock}" />
				   <c:param name="totalPage" value="${srchVo.totalPage}" />
				   <c:param name="recordCountPerPage" value="${srchVo.recordCountPerPage}" /> 
				   <c:param name="funNm" value="fnList" />
				   <c:param name="url" value="cnjtCasePrss.do" />
				</c:import>
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
    $(document).ready(function(){
  	  $('#selectSearch').selectmenu();
    });

    /* 페이징 */
	function fnList(url, currentPage) {
	    $('#currentPage').val(currentPage.currentPage);
	    $('#srchForm').submit();
	}
 
    
    
      front.selectmenu("cont");
    </script>
      