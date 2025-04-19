<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<c:if test="${empty dgtlClrcsClctList}">
<div class="list-nodata">검색 결과가 없습니다.</div>
</c:if>

<ul class="list-collection">
  <c:forEach var="row" items="${dgtlClrcsClctList}">  
  <li>
    <p>
      <a href="javascript:fnGoClctDtl('<c:out value='${row.exbiId}'/>')" class="btn-detail" title="상세보기">
        <strong><c:out value='${row.exbiNm}'/></strong>
      </a>
    </p>
    <p class="text">
      <a href="javascript:fnGoClctDtl('<c:out value='${row.exbiId}'/>')" class="btn-detail" title="상세보기">
        <c:out value='${row.exbiExpln}'/>
      </a>
    </p>
    <div class="swiper collection-swiper">
      <ul class="list-resource swiper-wrapper">

      <c:forEach var="imgRow" items="${row.rprsImgList}">
      	<c:if test="${not empty imgRow}">
           <c:forEach var="mapRow" items="${imgRow}" varStatus="status">
             <c:if test="${mapRow.key eq 'clrcs_id'}">
             <c:set var="clrcsId" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'rprs_img_file_strg_path_nm'}">
             <c:set var="filePath" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'rprs_img_strg_file_nm'}">
             <c:set var="fileNm" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'data_type_root_ctgry_id'}">
             <c:set var="dataCtgryId" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'data_type_root_ctgry_nm'}">
             <c:set var="dataCtgryNm" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'inst_nm'}">
             <c:set var="instNm" value="${mapRow.value}" />
             </c:if>  
             <c:if test="${mapRow.key eq 'clrcs_nm'}">
             <c:set var="clrcsNm" value="${mapRow.value}" />
             </c:if>  
           </c:forEach>
        <li class="swiper-slide">
	        <a href="javascript:fncSelectCltRscDtl('<c:out value="${clrcsId}"/>')">
            <div class="img">
              <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green"><c:out value='${dataCtgryNm}'/></span>
              <span class="tag size-small brd-color-blue"><c:out value='${instNm}'/></span>
            </div>
            <p>
              <strong><c:out value='${clrcsNm}'/></strong>
            </p>
        	</a>
        </li>
        </c:if>
     </c:forEach>
      </ul>
      <!-- <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div> -->
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
	<c:param name="url" value="dgtlCltClctList.do" />
    </c:import> 
  

<script>
      var collectionSwiper = new Swiper(".swiper.collection-swiper", {
      slidesPerView: 1,
      spaceBetween: 10,
      // navigation: {
      //       nextEl: ".collection-swiper .swiper-button-next",
      //       prevEl: ".collection-swiper .swiper-button-prev",
      //   },
      breakpoints: {
        980: {
          slidesPerView: 4,
          spaceBetween: 40,
        },
      },
    });
</script>
  
  <script>
var chkCnt = "${fn:length(dgtlClrcsClctList)}";
$(document).ready(function(){
	  if (chkCnt == 0) {
          $('#dgtlClrcsClctCnt').html("0");
      } else {
          $('#dgtlClrcsClctCnt').html("<fmt:formatNumber value='${dgtlClrcsClctList[0].totalRecord}' pattern='#,###' />");
      }
 });
          
 	  /**
 	   * 컬렉션 상세화면 이동
 	   * @param exbiId : 전시회ID
 	   */
 	  function fnGoClctDtl (exbiId) {
         let orderByKey = $('#hdnClctOrderByKey').val(); //소트기준
         let currentPage = $('#hdnClctCurrentPage' + orderByKey).val();
         let srchVal = $('#srchVal').val();
         let encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
         
 	  	 location.href = cmmnCltClctDtlUrl + "?exbiId="+exbiId+"&orderByKey="+orderByKey+"&srchVal="+encodedSrchVal;
 	  }
 </script>
  