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
              <strong><c:out value="${dgtlClrcsClctDtl.exbiNm}"/></strong>

              <div class="inst-swiper">
                <div class="swiper">
                  <div class="swiper-wrapper">
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
                          <c:if test="${mapRow.key eq 'data_type_root_ctgry_nm'}">
                          <c:set var="dataTypeRootCtgryNm" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'inst_nm'}">
                          <c:set var="instNm" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'clrcs_nm'}">
                          <c:set var="clrcsNm" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'inq_cnt'}">
                          <c:set var="inqCnt" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'dwnld_cnt'}">
                          <c:set var="dwnldCnt" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'rcmdtn_cnt'}">
                          <c:set var="rcmdtnCnt" value="${mapRow.value}" />
                          </c:if>  
                          <c:if test="${mapRow.key eq 'clrcs_id'}">
                          <c:set var="clrcsId" value="${mapRow.value}" />
                          </c:if>  
                        </c:forEach>
                        <div class="swiper-slide">
                          <div class="img">
                            <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="">
                          </div>
			              <div class="dim">
			               <div class="tag-wrap">
			                 <span class="tag color-green"><c:out value="${dataTypeRootCtgryNm }"/></span>
			                 <span class="tag brd-color-white"><c:out value="${instNm }"/></span>
			               </div>
			               <strong><c:out value="${clrcsNm }"/></strong>
			               <div class="hitting">
			                 <span class="view"><c:out value="${inqCnt}"/></span>
			                 <span class="download"> <c:out value="${dwnldCnt}"/> </span>
			                 <span class="like"> <c:out value="${rcmdtnCnt}"/> </span>
			               </div>
			               <label for="clrcsIdElement" class="blind"></label>
			               <button type="button" id="clrcsIdElement" class="clrcsIdElement" data-clrcsId="${clrcsId }">상세보기</button>
			              </div>
                        </div>
                        </c:if> 
                      </c:forEach>  
                      
                    </div>
                    <div class="swiper-pagination"></div>
                    
                </div>
              </div>
              <div class="info">
                <%-- <div class="item tit">
                  <strong><c:out value="${dgtlClrcsClctDtl.exbiNm}"/></strong>
                </div> --%>
                <div class="item exp">
                  <p>
                    <c:set var="exbiExpln" value="${pf:nl2br(dgtlClrcsClctDtl.exbiExpln)}" />
   					        <c:out value="${exbiExpln}" escapeXml="false"/>
                  </p>
                </div>
              </div>
            </div>

            <c:if test="${not empty dgtlClrcsClctDtl.contsCnjtEfctExplnCn}"> 
            <div class="collection-wrap">
              <strong>활용사례</strong>
              <div class="info">
                <div class="item exp">
                  <p>
                    <c:set var="contsCnjtEfctExplnCn" value="${pf:nl2br(dgtlClrcsClctDtl.contsCnjtEfctExplnCn)}" />
   					        <c:out value="${contsCnjtEfctExplnCn}" escapeXml="false"/>
                  </p>
                </div>
              </div>
            </div>
            </c:if>

            <div class="list cont-bg" id="listTop">
              <div class="tab-wrap type02">
                <div class="list-option">
                  <!-- <ul class="tab-menu flexible" id="dgtlClrcsRscListTab">
                    <li data-value="A" class="active"><a href="javascript:void(0)">다운로드순</a></li>
                    <li data-value="B"><a href="javascript:void(0)">최신순</a></li>
                    <li data-value="C"><a href="javascript:void(0)">인기순</a></li>
                  </ul> -->
                  <!-- 정렬순 모바일용 -->
                  <!-- <div class="selectmenu">
                    <select name="rscSort" id="rscSort" title="정렬순서 선택">
                      <option value="A">다운로드순</option>
                      <option value="B">최신순</option>
                      <option value="C">인기순</option>
                    </select>
                  </div> -->
                  <p><strong>컬렉션 구성 문화자원</strong></p>

                  <div class="posts-number">
                    총 <strong id="dgtlClrcsRscCnt"></strong> 개
                  </div>
                </div>

                <div class="inner-depth" id="rscListArea">
                </div>

              </div>
            </div>

            <!-- 이전 다음 -->
            <div class="collection-paging">
              <div class="cont-bg one-collection">
                <h3>이전 컬렉션</h3>
	            <c:choose>
		          <c:when test="${empty prevClctDtl}">
		          <h3>이전 컬렉션이 없습니다.</h3>
			      </c:when>
			      <c:otherwise>
			    <a href="javascript:fnGoClctDtl('<c:out value='${prevClctDtl.exbiId}'/>')" class="btn-detail" title="상세보기"></a>  
                <div>
                  <div class="img">
		      <c:forEach var="imgRow" items="${prevClctDtl.rprsImgList}">
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
              		<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.clrcsNm}'/>"> 
		         </c:if>
		       </c:forEach>
                  </div>
                  <div class="cont">
                    <strong><c:out value='${prevClctDtl.exbiNm}'/></strong>
                    <p>
                    <c:out value='${prevClctDtl.exbiExpln}'/>
                    </p>
                  </div>
                </div>
			      </c:otherwise>
		      	</c:choose>
              </div>
              <div class="cont-bg one-collection">
                <h3>다음 컬렉션</h3>
	            <c:choose>
		          <c:when test="${empty nextClctDtl}">
		          <h3>다음 컬렉션이 없습니다.</h3>
			      </c:when>
			      <c:otherwise>
			    <a href="javascript:fnGoClctDtl('<c:out value='${nextClctDtl.exbiId}'/>')" class="btn-detail" title="상세보기"></a>  
                <div>
                  <div class="img">
		      <c:forEach var="imgRow" items="${nextClctDtl.rprsImgList}">
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
              		<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.clrcsNm}'/>"> 
		         </c:if>
		       </c:forEach>
                  </div>
                  <div class="cont">
                    <strong><c:out value='${nextClctDtl.exbiNm}'/></strong>
                    <p>
                    <c:out value='${nextClctDtl.exbiExpln}'/>
                    </p>
                  </div>
                </div>
			      </c:otherwise>
		      	</c:choose>
              </div>

            </div>
            <!-- //이전 다음 -->

          </div>
        </section>
      </section>
      <!-- //container(E) -->
    
    <form id="srchForm" name="srchForm">
	  <input type="hidden" id="srchVal" value="<c:out value='${dgtlClrcsClctVo.srchVal}'/>">
	  <input type="hidden" id="hdnOrderByKey" value="<c:out value='${dgtlClrcsClctVo.orderByKey}'/>">
	  <input type="hidden" id="hdnCurrentPageA" value="1">
	  <input type="hidden" id="hdnCurrentPageB" value="1">
	  <input type="hidden" id="hdnCurrentPageC" value="1">
	  <input type="hidden" id="hdnExbiId" value="<c:out value='${dgtlClrcsClctDtl.exbiId}'/>">
	</form>

  <script>
    var swiper = new Swiper(".inst-swiper .swiper", {
      <c:if test="${not empty mngrRcmdtnList && fn:length(mngrRcmdtnList) ge 2 }">
      loop: true,
      initialSlide: 2,
      </c:if>
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 0,
        modifier: 0,
        scale: 0,
        slideShadows: true,
      },
      breakpoints: {
        980: {
          coverflowEffect: {
            rotate: 0,
            stretch: 506,
            depth: 50,
            modifier: 1,
            scale: 0.9,
            slideShadows: true,
          },
        },
      },
      pagination: {
        el: ".inst-swiper .swiper-pagination",
        clickable: true,
      },
    });
    var resourceSwiper = new Swiper(".swiper.item-swiper", {
      slidesPerView: 1,
      spaceBetween: 10,
      breakpoints: {
        980: {
          slidesPerView: 4,
          spaceBetween: 40,
        },
      },
    });
  </script>

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

	      // 상세보기 페이지 이동
	      $('.clrcsIdElement').click(function() {
	          const clrcsid = $(this).data('clrcsid');
	          window.location.href="<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do'/>" + "?clrcsId=" + clrcsid
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
    
	  /**
	   * 컬렉션 상세화면 이동
	   * @param exbiId : 전시회ID
	   */
	  function fnGoClctDtl (exbiId) {
       let orderByKey = $('#hdnOrderByKey').val(); //소트기준
       let srchVal = $('#srchVal').val();
       let encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
       
	  	 location.href = cmmnCltClctDtlUrl + "?exbiId="+exbiId+"&orderByKey="+orderByKey+"&srchVal="+encodedSrchVal;
	  }
    </script>