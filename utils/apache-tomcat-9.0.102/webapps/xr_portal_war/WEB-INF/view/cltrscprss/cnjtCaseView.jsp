<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
  <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>활용 사례</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>디지털문화자원 현황과 활용 사례</span>
              <span>디지털문화자원 활용 사례</span>
              <span>활용 사례</span>
              <span>상세</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide data-view">
          <div class="inner">
            <div class="cont-bg">
              <div class="view-wrap">
                <div class="title">
                  <div>
                    <c:out value="${cnjtCaseView.prTtl}" />
                  </div>
                  <p>
                    <span><c:out value="${cnjtCaseView.frstRegDt}" /></span>
                    <span>작성자 : <c:out value="${pf:getMaskingID(cnjtCaseView.frstRgtrId)}" /></span>
                    <span>조회수 : <c:out value="${cnjtCaseView.inqCnt}" /></span>
                  </p>
                </div>
                <!-- editer 영역 = class="content"으로 하시면 됩니다. -->
                <div class="content">
                <c:if test="${!empty cnjtCaseView.rprsImgFileStrgPathNm and !empty cnjtCaseView.rprsImgStrgFileNm}">
					    <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${cnjtCaseView.rprsImgFileStrgPathNm}&fileNm=${cnjtCaseView.rprsImgStrgFileNm}'/>" alt="" width="auto" height="auto" />
				</c:if>
                  <div class="cont">
					<c:set var="bizCn" value="${cnjtCaseView.bizCn}" />
    				<c:set var="bizCn" value="${pf:nl2br(bizCn)}" />
   					<c:out value="${bizCn}" escapeXml="false"/>                  
   					</div>
                <dl class="agency">
                  <dt>활용 디지털문화자원</dt>
                  <dd class="step">
                    <span><c:out value="${cnjtCaseView.utztnDataCn}" /></span>
                  </dd>
                </dl>
                <dl class="agency">
                  <dt>제공기관</dt>
                  <dd><c:out value="${cnjtCaseView.pvsnInstNm}" /></dd>
                  <dt>기업명</dt>
                  <dd>
                    <c:out value="${cnjtCaseView.entNm}" />
                  </dd>
                  <dt>웹사이트</dt>
                  <dd>
                    <a href="<c:out value="${cnjtCaseView.entHmpg}" />" target="_blank"><c:out value="${cnjtCaseView.entHmpg}" /></a>
                  </dd>
                  <dt>이메일</dt>
                  <dd><c:out value="${cnjtCaseView.rgtrEmlAddr}" /></dd>
                </dl>
                <dl class="agency">
                  <dt>승인상태</dt>
                  <dd>
                    <!-- 승인대기중 approval, 승인완료 ok, 반려 err -->
                   <c:if test="${!empty cnjtCaseView.aprvYn}">
				    <c:choose>
				        <c:when test="${cnjtCaseView.aprvYn eq 'Y'}">
				            <span class="approval ok">승인완료</span>
				        </c:when>
				        <c:when test="${cnjtCaseView.aprvYn eq 'N'}">
				            <span class="approval">승인대기중</span>
				        </c:when>
				        <c:when test="${cnjtCaseView.aprvYn eq 'D'}">
				            <span class="approval err">반려</span>
				            반려사유 : <c:out value="${cnjtCaseView.rjctCn}" />
				        </c:when>
				        <c:otherwise>
				            <span class="approval">대기중</span>
				        </c:otherwise>
				    </c:choose>
				   </c:if>
                  </dd>
                </dl>
              </div>
              <div class="btn-wrap btn-apply">
                <label for="listGo" class="blind"></label>
                <button id = 'listGo' type="button" class="btns size-s color-primary" onclick="ListHistoryBack()">
                  목록
                </button>
                <label for="writeGo" class="blind"></label>
                <button id = 'writeGo' type="button" class="btns size-s color-primary apply" onclick="cnjtCaseWrite()">
                  활용 사례 등록 신청
                </button>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
<script>
	//활용사례 신청버튼
	function cnjtCaseWrite() {
	    window.location.href = "<c:url value='/cltrscprss/cnjtCaseWrite.do'/>";
	}
	//목록버튼
    function ListHistoryBack(){
    
    window.location.href = "javascript:history.back()";
    
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
	
	//이전 URL 값 담기
	var previousRequest = document.referrer;
    
    // 마이페이지 메인이나 나의 활용사례 등록 현황 타고 상세 안갈때 숨김처리
   if (!previousRequest.includes("/cnjtCasePrss.do") && !previousRequest.includes("/mypage/mypageMain.do")) {
    // 해당 부분 보이기
    $(".agency dt:contains('승인상태')").parent().hide();
}

    
	
</script>      
      
      
