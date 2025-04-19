<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>컬렉션 상세보기</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <a href="#">디지털문화자원</a>
              <span>컬렉션 상세보기</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents resource">
          <div class="inner">
            <div class="collection-wrap">
              <div class="img">
                <c:forEach var="imgRow" items="${dgtlClrcsClctDtl.rprsImgList}">
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
		           <div>
		           <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="">
		           </div> 
		           </c:if>
		        </c:forEach>      
              </div>
              <div class="info">
                <div class="item tit">
                  <strong><c:out value="${dgtlClrcsClctDtl.exbiNm}"/></strong>
                </div>
                <div class="item exp">
                  <p>
                    <!-- 설명 영역 -->
                  </p>
                </div>
              </div>
            </div>
            <div class="list cont-bg" id="listTop">
              <div class="tab-wrap type02">
                <div class="list-option">
                  <ul class="tab-menu flexible" id="dgtlClrcsRscListTab">
                    <li data-value="A" class="active"><a href="javascript:void(0)">다운로드순</a></li>
                    <li data-value="B"><a href="javascript:void(0)">최신순</a></li>
                    <li data-value="C"><a href="javascript:void(0)">인기순</a></li>
                  </ul>
                  <!-- 정렬순 모바일용 -->
                  <div class="selectmenu">
                    <select name="rscSort" id="rscSort" title="정렬순서 선택">
                      <option value="A">다운로드순</option>
                      <option value="B">최신순</option>
                      <option value="C">인기순</option>
                    </select>
                  </div>
                  <div class="posts-number">
                    총 <strong id="dgtlClrcsRscCnt"></strong> 개
                  </div>
                </div>

                <div class="inner-depth" id="rscListArea">
                </div>

              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
    
    <form id="srchForm" name="srchForm">
	  <input type="hidden" id="hdnOrderByKey" value="A">
	  <input type="hidden" id="hdnCurrentPageA" value="1">
	  <input type="hidden" id="hdnCurrentPageB" value="1">
	  <input type="hidden" id="hdnCurrentPageC" value="1">
	  <input type="hidden" id="hdnExbiId" value="<c:out value='${dgtlClrcsClctDtl.exbiId}'/>">
	</form>

    <script>
      $(document).ready(function(){
    	  
    	  funSelectDgtlClrcsRscList();   //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
    	  
    	  //자원 정렬 탭
    	  $('#dgtlClrcsRscListTab li').click(function() {
    		$(this).addClass('active').siblings().removeClass('active');	  
    		$("#rscListArea").empty();
    		$('#hdnOrderByKey').val($(this).data('value')); 
    		funSelectDgtlClrcsRscList(); //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
    	  });
    	  
    	  //모바일 소트
    	  $("#rscSort").selectmenu();  //자원
    	  
    	  //모바일 자원소트 세렉트박스
		  $('#rscSort').on('selectmenuchange', function(event, ui) {
	          $("#rscListArea").empty();
    		  $('#hdnOrderByKey').val($(this).val()); 
    		  funSelectDgtlClrcsRscList(); //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
		  });   
	          
     });
      
     //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
     function funSelectDgtlClrcsRscList(){
    
       var exbiId = $('#hdnExbiId').val();
       var orderByKey = $('#hdnOrderByKey').val();
       var currentPage = $('#hdnCurrentPage' + orderByKey).val();
         
	   var queryString = "exbiId=" + exbiId+
	   "&orderByKey=" + orderByKey+
	   "&currentPage=" + currentPage;
    
       $("#rscListArea").load("<c:url value='/dgtlcltrsc/dgtlCltRscList.do'/>" + "?" + queryString);
     } 
     
    //페이징 선택시 호출
    function fnList(url, currentPage){
    	var orderByKey = $('#hdnOrderByKey').val();
       	$('#hdnCurrentPage' + orderByKey).val(currentPage.currentPage);
       	fncTopMvmnScrl('listTop');//스크롤 이동
       	funSelectDgtlClrcsRscList();
    }
    </script>