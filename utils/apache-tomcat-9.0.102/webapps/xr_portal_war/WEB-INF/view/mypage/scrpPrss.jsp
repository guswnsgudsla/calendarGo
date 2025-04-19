<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>나의 스크랩 현황</h2>
            <div class="breadcrumbs">
				<a href="<c:url value="/index.do"/>">메인</a>
				<a href="<c:url value="/mypage/mypageMain.do"/>">마이페이지</a>
                <span>사용현황</span>
                <a href="<c:url value="/mypage/scrpPrss.do"/>"><span>스크랩 현황</span></a>
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
                    <label for="srchDataTypeCtgryId" class="blind"></label>
                    <select id="srchDataTypeCtgryId" name="srchDataTypeCtgryId">
                     <option value=""  selected="selected">디지털문화자원 구분 선택</option>
                        <c:forEach var="item" items="${dataCtgryList}">
                           <option value="<c:out value='${item.ctgryId}'/>" <c:if test="${srchVo.srchDataTypeCtgryId eq item.ctgryId}">selected</c:if> > <c:out value="${item.ctgryNm}" /></option>
                        </c:forEach>
                     </select>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                    <label for="srchVal" class="blind"></label>
                    <input type="text" class="fm-control" id="srchVal" name="srchVal" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchVal}'/>"/>
                    <label for="srchDataTypeCtgryId" class="blind"></label>
                    <label for="submitBtn" class="blind"></label>
                    <button type="submit" id="submitBtn">
                      <span class="blind">검색</span>
                    </button>
                     </form>
                  </div>
                </div>
              </div>
              <c:if test="${empty myScrpRscList}">
		    	 <div class="list-nodata">스크랩 현황이 없습니다.</div>
			  </c:if>
              <ul class="list-resource">
			   <c:forEach var="item" items="${myScrpRscList}">
                <li>
                  <a href="<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do?clrcsId=${item.clrcsId}'/>">
                    <div class="img">
                      <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}&dataCtgryId=${item.dataTypeRootCtgryId}'/>" alt="" />
                    </div>
                    <div class="tag-wrap">
                      <span class="tag size-small color-green"><c:out value="${item.dataTypeRootCtgryNm}" /></span>
                      <span class="tag size-small brd-color-blue"><c:out value="${item.instNm}" /></span>
                    </div>
                    <p><strong><c:out value="${item.clrcsNm}" /></strong></p>
                  </a>
                  <div class="btn-wrap">
                    <label for="viewBtn" class="blind"></label>
                    <button type="button" id="viewBtn" class="view"><c:out value="${item.inqCnt}" /></button>
                    <label for="downloadBtn" class="blind"></label>
                    <button type="button" id="downloadBtn" class="download"><c:out value="${item.dwnldCnt}" /></button>
                    <!-- <label for="likeBtn" class="blind"></label>
                    <button type="button" id="likeBtn" class="like"><c:out value="${item.rcmdtnCnt}" /></button> -->
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
			   			<c:param name="url" value="scrpPrss.do" />
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
		  front.selectmenu("area");
  		  /* front.selectmenu("cont"); */
  
  /* 페이징 */
	function fnList(url, currentPage) {
	    $('#currentPage').val(currentPage.currentPage);
	    $('#srchForm').submit();
	}
	
	$(document).ready(function(){
		$('#srchDataTypeCtgryId').selectmenu();
    });
</script>