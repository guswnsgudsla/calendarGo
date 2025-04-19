<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

 <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>활용 사례</h2>
            <div class="breadcrumbs">
              <a href="<c:url value='/index.do'/>">메인</a>
              <span>디지털문화자원 현황과 활용 사례</span>
              <span>디지털문화자원 활용 사례</span>
              <a href="<c:url value='/cltrscprss/cnjtCaseList.do'/>"><span>활용 사례</span></a>
            </div>
          </div>
        </header>
        <section id="contents" class="contents data-wrap usage">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
                <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,##0" /></strong>개</p>
                <div class="sort">
                  <div class="fm-focus selectmenu" data-size="s">
                    <form method="get" id="srchForm" name="srchForm" >  
                     <input type="hidden" id="currentPage" name="currentPage" value="1" />
                    <!-- <select id="cont" name="cont"> -->
                      <label for="selectSearch" class="blind"></label>
                      <select id="selectSearch" name="selectSearch">
                       <option value="" selected="selected" name="selectSearch">전체검색</option>
                       <option value="bizNm" <c:if test="${srchVo.selectSearch eq 'bizNm'}">selected</c:if>>제목</option>
                      <option value="bizCn" <c:if test="${srchVo.selectSearch eq 'bizCn'}">selected</c:if>>내용</option>
                    </select>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                   <label for="search" class="blind"></label>
                   <input name="search" type="text"  class="fm-control"  id="search"  placeholder="검색어를 입력해 주세요."  value="<c:out value='${srchVo.search}'/>"/>
					<button type="submit" id = 'blindBtn'>
                   <label for="search2" class="blind"></label>
                      <span id = 'search2' class="blind">검색</span>
                    </button>
                   </form>
                  </div>
                </div>
              </div>
               <c:if test="${empty lists}">
					<div class="list-nodata">등록된 활용 사례가 없습니다.</div>
			  </c:if>
              <ul class="list-useful">
				<c:forEach var="item" items="${lists}" >
                <li>
                  <a href="<c:url value='/cltrscprss/cnjtCaseView.do?prId=${item.prId}'/>" >
                    <div class="img">
                      <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}'/>" alt=""  title = '<c:out value="${item.prTtl}" />'/>
                    </div>
                    <div class="tag-wrap">
                      <span class="tag size-small brd-color-blue"><c:out value="${item.entNm}" /></span>
                    </div>
                    <p>
                      <strong><c:out value="${item.prTtl}" /></strong>
                    </p>
                  </a>
                  <div class="btn-wrap">
                    <p><c:out value="${item.frstRegDt}" /></p>
                    <button type="button" class="view"><c:out value="${item.inqCnt}" /></button>
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
				   <c:param name="url" value="cnjtCaseList.do" />
				</c:import> 
                <!-- pagination 모바일용 -->
                <button type="button" class="btns color-gray btn-more" title ='더보기'>
                  더보기
                </button>
              </div>
              <div class="btn-wrap btn-apply">
                <button type="button" class="btns size-s color-primary apply" onclick="cnjtCaseWrite()" id = 'cnjtWtite' title = '활용 사례 등록 신청'>
                  활용 사례 등록 신청
                </button>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
      
<script>
	function cnjtCaseWrite() {
	    window.location.href = "<c:url value='/cltrscprss/cnjtCaseWrite.do'/>";
	  }
	function fnList(url, currentPage) {
	    $('#currentPage').val(currentPage.currentPage);
	    $('#srchForm').submit();
	}
	
    $(document).ready(function(){
    	  $('#selectSearch').selectmenu();
      });
	front.selectmenu("area");
	front.selectmenu("cont");
</script>      

      
          