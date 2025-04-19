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
      한 시대의 전환이 시작된 시기, 조선 초기 제작된 특이형상 도자기를 전국 각 박물관의 소장품에서 선정하였습니다.
      품격 있는 장중한 형태와 뛰어난 그림, 문양이 어우러져 화려함의 극치를 뽐내는 도자기들을 보다보면, 형상과 특징이 함께 변모되는 흐름이 느껴지는 것과 동시에 조선 초기, 역사적 과도기의 불안함을 안고 살아가는 선대들의 마음상태를 함께 느낄 수 있습니다.
        </a>
    </p>
    <div class="swiper collection-swiper">
      <ul class="list-resource swiper-wrapper">

        <li class="swiper-slide">
          <!-- <a href="javascript:void(0)"> -->
            <div class="img">
              <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green">ㅇㅇ</span>
              <span class="tag size-small brd-color-blue">ㅇㅇ</span>
            </div>
            <p>
              <strong>자원명</strong>
            </p>
          <!-- </a> -->
        </li>
        <li class="swiper-slide">
          <!-- <a href="javascript:void(0)"> -->
            <div class="img">
              <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green">ㅇㅇ</span>
              <span class="tag size-small brd-color-blue">ㅇㅇ</span>
            </div>
            <p>
              <strong>자원명</strong>
            </p>
          <!-- </a> -->
        </li>
        <li class="swiper-slide">
          <!-- <a href="javascript:void(0)"> -->
            <div class="img">
              <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green">ㅇㅇ</span>
              <span class="tag size-small brd-color-blue">ㅇㅇ</span>
            </div>
            <p>
              <strong>자원명</strong>
            </p>
          <!-- </a> -->
        </li>

      </ul>
    </div>

    <!-- <div class="img">
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
    </div> -->
    <!-- <div class="dim">
      <button type="button" class="btns color-primary btn-preview" onclick="fncClctPreviewPopup('<c:out value='${row.exbiId}'/>')">미리보기</button>
      <button type="button" class="btns color-white btn-detail" onclick="fnGoClctDtl('<c:out value='${row.exbiId}'/>')">상세보기</button>
    </div> -->
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
          $('#srchCntB').html("0");
      } else {
          $('#dgtlClrcsClctCnt').html("<fmt:formatNumber value='${dgtlClrcsClctList[0].totalRecord}' pattern='#,###' />");
          $('#srchCntB').html("<fmt:formatNumber value='${dgtlClrcsClctList[0].totalRecord}' pattern='#,###' />");
      }
	  
	  $('#srchValTx').html($('#srchVal').val());
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
  