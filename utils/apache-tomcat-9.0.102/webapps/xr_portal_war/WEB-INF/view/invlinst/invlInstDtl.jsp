<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- container(S) -->
<section class="container">
  <header>
    <div class="inner">
      <h2>참여기관보기</h2>
      <h3>
        <c:out value="${invlInstDetail.instNm}"/>
        <c:if test="${not empty invlInstDetail.sprrCertYn && invlInstDetail.sprrCertYn eq 'Y' }">
        (우수인증기관)
        </c:if>
        
      </h3>
      <div class="breadcrumbs">
        <a href="/index.do">메인</a>
        <span>참여기관</span>
        <span onclick="location.href='<c:url value='/invlinst/invlInstList.do'/>'" style="cursor:pointer;">참여기관보기</span>
        <span>상세</span>
      </div>
    </div>
  </header>
  <section id="contents" class="contents institution">
    <c:if test="${not empty mngrRcmdtnList}">
    <div class="inst-swiper">
      <div class="swiper">
        <div class="swiper-wrapper">
         <c:forEach var="row" items="${mngrRcmdtnList }">
           <div class="swiper-slide">
              <div class="img">
               <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${row.rprsImgFileStrgPathNm}&fileNm=${row.rprsImgStrgFileNm}&dataCtgryId=${row.dataTypeRootCtgryId}'/>" alt="" class="clrcsIdElement" data-clrcsId="${row.clrcsId }"/>
             </div>
             <div class="dim">
               <div class="tag-wrap">
                 <span class="tag color-green"><c:out value="${row.dataTypeRootCtgryNm }"/></span>
                 <span class="tag brd-color-white"><c:out value="${row.instNm }"/></span>
               </div>
               <strong><c:out value="${row.clrcsNm }"/></strong>
               <div class="hitting">
                 <span class="view"><c:out value="${row.inqCnt}"/></span>
                 <span class="download"> <c:out value="${row.dwnldCnt}"/> </span>
                 <span class="like"> <c:out value="${row.rcmdtnCnt}"/> </span>
               </div>
               <label for="clrcsIdElement" class="blind"></label>
               <button type="button" id="clrcsIdElement" class="clrcsIdElement" data-clrcsId="${row.clrcsId }">상세보기</button>
             </div>
           </div>
         </c:forEach>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    </c:if>
    <div class="inner">
      <div class="resource-board cont-bg">
        <div>
          <h4>참여기관정보</h4>
          <dl>
            <dt>해당기관명</dt>
            <dd><c:out value="${invlInstDetail.instNm}"/></dd>
            <dt>신규 등록일</dt>
            <dd><c:out value="${invlInstDetail.lastMdfcnDt}"/></dd>
            <dt>최초 등록일</dt>
            <dd><c:out value="${invlInstDetail.frstRegDt}"/></dd>
            <dt>총 디지털문화자원수</dt>
            <dd><fmt:formatNumber value="${invlInstDetail.totalRlsCnt }" pattern="#,###" />개</dd>
          </dl>
        </div>
        <div>
          <h4>데이터 유형별 등록 디지털문화자원 현황</h4>
          <dl>
          <c:forEach var="row" items="${invlInstDetailStatus }">
             <dt><c:out value="${row.ctgryNm}"/></dt>
             <dd><fmt:formatNumber value="${row.rscCnt}" pattern="#,###"/>개</dd>
          </c:forEach>
          </dl>
        </div>
         
        <div>
          <h4>공통분류별 등록 디지털문화자원 현황</h4>
          <dl>
          <c:forEach var="row" items="${instCntsRegPrssList}">
             <dt><c:out value="${row.ctgryNm}"/></dt>
             <dd><fmt:formatNumber value="${row.rscCnt}" pattern="#,###"/>개</dd>
          </c:forEach>
          </dl>
        </div>
       
      </div>
      <div class="list list-swiper cont-bg">
        <h4>최신 등록 디지털문화자원 보기</h4>
        <div class="swiper list-resource item-swiper">
          <div class="swiper-wrapper">
            <c:forEach var="row" items="${invlInstDetailDate }">
             <div class="swiper-slide clrcsIdElement" data-clrcsId="${row.clrcsId }">
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
             </div>
            </c:forEach>
          </div>
        </div>
        <h4>가장 많이 다운로드받은 디지털문화자원</h4>
        <div class="swiper list-resource item-swiper">
          <div class="swiper-wrapper">
           <c:forEach var="row" items="${invlInstDetailDnCnt }">
             <div class="swiper-slide clrcsIdElement" data-clrcsId="${row.clrcsId }">
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
                    <label for="dwnView" class="blind"></label>
		            <button type="button" id="dwnView" class="view"><fmt:formatNumber value="${row.inqCnt}" pattern="#,###"/></button>
                    <label for="dwnDownload" class="blind"></label>
		            <button type="buftton" id="dwnDownload" class="download"><fmt:formatNumber value="${row.dwnldCnt}" pattern="#,###"/></button>
                    <label for="dwnLike" class="blind"></label>
		            <button type="button" id="dwnLike" class="like"><fmt:formatNumber value="${row.rcmdtnCnt}" pattern="#,###"/></button>
               </div>
             </div>
           </c:forEach>
          </div>
        </div>
      </div>

      <input type="hidden" id="hdnClctOrderByKey" value="A">
      <input type="hidden" id="hdnClctCurrentPageA" value="1">
      <input type="hidden" id="hdnClctCurrentPageB" value="1">
      <input type="hidden" id="hdnClctCurrentPageC" value="1">

      <div class="list cont-bg">
        <h4>해당 기관 전체 디지털문화자원 보기</h4>
        <div class="tab-wrap type02">
          <div class="list-option">
            <ul class="tab-menu flexible" id="clctListTab">
              <!-- TODO 메뉴 활성화 active -->
              <li class="active" data-value="B">
                <a href="javascript:void(0)" >다운로드순</a>
              </li>
              <li data-value="A"><a href="javascript:void(0)" >최신순</a></li>
              <li data-value="C"><a href="javascript:void(0)" >인기순</a></li>
            </ul>
            <!-- 정렬순 모바일용 -->
            <div class="selectmenu">
              <label for="resourceSort" class="blind"></label>
              <select name="resourceSort" id="resourceSort">
                <option value="">다운로드순</option>
                <option value="">최신순</option>
                <option value="">인기순</option>
              </select>
            </div>
            <div class="posts-number">
              총 <strong><fmt:formatNumber value="${invlInstDetail.totalRlsCnt }" pattern="#,###" /></strong> 개
            </div>
          </div>
          <div id="result"></div>
        </div>
      </div>
    </div>
  </section>
</section>
<!-- //container(E) -->
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
  front.selectmenu("resourceSort");
  
  $(document).ready(function () {
    const instId = new URLSearchParams(window.location.search).get('instId');

    $("#result").load("<c:url value='/invlinst/invlInstinner.do'/>" + "?instId=" + instId);

    // 탭 메뉴 클릭 이벤트
    $('#clctListTab li').click(function() {
        // 클릭한 li에 active 클래스 추가
        $(this).addClass('active').siblings().removeClass('active');
        $('#result').empty();
        $('#hdnClctOrderByKey').val($(this).data('value'));
        funSelectInvlClctList();
    });

    // 상세보기 페이지 이동
    $('.clrcsIdElement').click(function() {
        const clrcsid = $(this).data('clrcsid');
        window.location.href="<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do'/>" + "?clrcsId=" + clrcsid
    });
  });
  
  // 페이징 이벤트
  function fnList(url, currentPage) {
    var orderByKey = $('#hdnClctOrderByKey').val();
    $('#hdnClctCurrentPage' + orderByKey).val(currentPage.currentPage);
    funSelectInvlClctList();
  }
  
  //참여기관 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
  function funSelectInvlClctList(){
    const url = window.location.href.replace('#!', '');
    const urlParam = url.split("?")[1];

    var orderByKey = $('#hdnClctOrderByKey').val(); //소트기준
    var currentPage = $('#hdnClctCurrentPage' + orderByKey).val() ?? "";

    var queryString = urlParam + "&orderByKey=" + orderByKey+
            "&currentPage=" + currentPage;
    $("#result").load("<c:url value='/invlinst/invlInstinner.do'/>" + "?"+queryString);
  }
</script>
