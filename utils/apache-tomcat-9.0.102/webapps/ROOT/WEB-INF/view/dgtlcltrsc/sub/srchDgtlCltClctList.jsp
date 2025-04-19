<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<c:if test="${empty dgtlClrcsClctList}">
<div class="list-nodata">검색 결과가 없습니다.</div>
</c:if>
  <ul class="list-collection">
  <c:forEach var="row" items="${dgtlClrcsClctList}">  
  <li>
    <div class="img">
      <c:forEach var="imgRow" items="${row.rprsImgList}">
      	<c:if test="${not empty imgRow}">
           <c:forEach var="mapRow" items="${imgRow}" varStatus="status">
             <c:if test="${mapRow.key eq 'rprs_img_file_strg_path_nm'}">
             <c:set var="filePath" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'rprs_img_strg_file_nm'}">
             <c:set var="fileNm" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'data_type_root_ctgry_id'}">
             <c:set var="dataCtgryId" value="${mapRow.value}" />
             </c:if>  
           </c:forEach>
           <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
      	</c:if>
      </c:forEach>          
    </div>
    <p>
      <strong><c:out value='${row.exbiNm}'/></strong
      >
    </p>
    <div class="dim">
      <button type="button" class="btns color-primary btn-preview" onclick="fncClctPreviewPopup('<c:out value='${row.exbiId}'/>')">미리보기</button>
      <button type="button" class="btns color-white btn-detail" onclick="fncSelectClctDtl('<c:out value='${row.exbiId}'/>')">상세보기</button>
    </div>
  </li>
  </c:forEach>
</ul>
    
    <c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
	<c:param name="currentPage" value="${dgtlClrcsClctList[0].currentPage}" />
	<c:param name="pagePerBlock" value="${dgtlClrcsClctList[0].pagePerBlock}" />
	<c:param name="totalPage" value="${dgtlClrcsClctList[0].totalPage}" />
	<c:param name="recordCountPerPage" value="${dgtlClrcsClctList[0].recordCountPerPage}" /> 
	<c:param name="funNm" value="fnList" />
	<c:param name="url" value="" />
    </c:import> 
  
  
  
  <script>
var chkCnt = "${fn:length(dgtlClrcsClctList)}";
$(document).ready(function(){
	  
	  if (chkCnt == 0) {
          $('#dgtlClrcsClctCnt').html("0");
          $('#srchCntB').html("0");
      } else {
          $('#dgtlClrcsClctCnt').html("<fmt:formatNumber value='${dgtlClrcsClctList[0].totalRecord}' pattern='#,###' />");
          $('#srchCntB').html("<fmt:formatNumber value='${dgtlClrcsClctList[0].totalRecord}' pattern='#,###' />");
      }
	  
	  $('#srchValTx').html($('#srchVal').val());
 });
  </script>
  