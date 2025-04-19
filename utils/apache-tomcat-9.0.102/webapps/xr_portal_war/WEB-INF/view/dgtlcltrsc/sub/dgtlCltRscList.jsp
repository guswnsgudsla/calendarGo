<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<c:if test="${empty dgtlClrcsRscList}">
<div class="list-nodata">검색 결과가 없습니다.</div>
</c:if>
<ul class="list-resource">
   <c:forEach var="row" items="${dgtlClrcsRscList}">  
   <li>
     <a href="javascript:fncSelectCltRscDtl('${row.clrcsId}')">
       <div class="img">
         <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${row.rprsImgFileStrgPathNm}&fileNm=${row.rprsImgStrgFileNm}&dataCtgryId=${row.dataTypeRootCtgryId}'/>" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
       </div>
       <div class="tag-wrap">
         <span class="tag size-small color-green"><c:out value="${row.dataTypeRootCtgryNm}"/></span>
         <span class="tag size-small brd-color-blue"><c:out value="${row.instNm}"/></span>
       </div>
       <p>
         <strong><c:out value='${row.clrcsNm}'/></strong>
       </p>
     </a>
     <div class="btn-wrap">
       <button type="button" class="view"><fmt:formatNumber value='${row.inqCnt}' pattern="#,###" /></button>
       <button type="button" class="download"><fmt:formatNumber value='${row.dwnldCnt}' pattern="#,###" /></button>
       <!-- <button type="button" class="like"><fmt:formatNumber value='${row.rcmdtnCnt}' pattern="#,###" /></button> -->
     </div>
   </li>
   </c:forEach>
 </ul>
    <c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
	<c:param name="currentPage" value="${dgtlClrcsRscList[0].currentPage}" />
	<c:param name="pagePerBlock" value="${dgtlClrcsRscList[0].pagePerBlock}" />
	<c:param name="totalPage" value="${dgtlClrcsRscList[0].totalPage}" />
	<c:param name="recordCountPerPage" value="${dgtlClrcsRscList[0].recordCountPerPage}" /> 
	<c:param name="funNm" value="fnList" />
	<c:param name="url" value="dgtlCltRscList.do" />
    </c:import> 

  <script>
var chkCnt = "${fn:length(dgtlClrcsRscList)}";

$(document).ready(function(){
	  
	  if (chkCnt == 0) {
          $('#dgtlClrcsRscCnt').html("0");
      } else {
          $('#dgtlClrcsRscCnt').html("<fmt:formatNumber value='${dgtlClrcsRscList[0].totalRecord}' pattern='#,###' />");
      }
 });
  </script>
  