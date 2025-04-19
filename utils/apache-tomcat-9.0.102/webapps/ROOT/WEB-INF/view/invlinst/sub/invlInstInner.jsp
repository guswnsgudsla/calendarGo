<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="inner-depth">
  <ul class="list-resource">
    <c:forEach var="row" items="${invlInstDetailList }">  
      <li class="clrcsIdElement" data-clrcsId="${row.clrcsId }">
          <a href="javascript:;">
            <div class="img">
              <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${row.rprsImgFileStrgPathNm}&fileNm=${row.rprsImgStrgFileNm}&dataCtgryId=${row.dataTypeRootCtgryId}'/>" alt="" />
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green"><c:out value="${row.dataTypeRootCtgryNm }"/></span>
              <span class="tag size-small brd-color-blue"><c:out value="${row.instNm }"/></span>
            </div>
            <p>
              <strong
                ><c:out value="${row.clrcsNm }"/></strong
              >
            </p>
          </a>
          <div class="btn-wrap">
            <label for="view" class="blind"></label>
            <button type="button" id="view" class="view"><fmt:formatNumber value="${row.inqCnt}" pattern="#,###"/></button>
            <label for="download" class="blind"></label>
            <button type="button" id="download" class="download"><fmt:formatNumber value="${row.dwnldCnt}" pattern="#,###"/></button>
            <label for="like" class="blind"></label>
            <button type="button" id="like" class="like"><fmt:formatNumber value="${row.rcmdtnCnt}" pattern="#,###"/></button>
          </div>
        </li>
    </c:forEach>
  </ul>
  </div>
  <c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
    <c:param name="currentPage" value="${invlInstDetailList[0].currentPage}" />
    <c:param name="pagePerBlock" value="${invlInstDetailList[0].pagePerBlock}" />
    <c:param name="totalPage" value="${invlInstDetailList[0].totalPage}" />
    <c:param name="recordCountPerPage" value="${invlInstDetailList[0].recordCountPerPage}" /> 
    <c:param name="funNm" value="fnList" />
    <c:param name="url" value="/invlinst/invlInstinner.do" />
  </c:import>  
</div>
<script>
  
  $(document).ready(function () {
      
      $('.clrcsIdElement').click(function() {
          const clrcsIdValue = $(this).data('clrcsid');
          window.location.href="<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do'/>" + "?clrcsId=" + clrcsIdValue
      });
  });

</script>