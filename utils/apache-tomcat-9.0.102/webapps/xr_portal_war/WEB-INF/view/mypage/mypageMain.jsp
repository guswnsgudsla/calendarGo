<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
<section class="container">
        <header>
          <div class="inner">
            <h2>마이페이지</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <a href="<c:url value="/mypage/mypageMain.do"/>"><span>마이페이지</span></a>
            </div>
          </div>
        </header>
        <section id="contents" class="contents mypage">
          <div class="inner">
            <div class="tit-wrap">
              <h3>나의 정보</h3>
            </div>
            <div class="myinfo cont-bg">
              <div>
                <em>나의 다운로드 현황</em>
                <strong><c:out value="${myUsePrssStat.dwnldCnt}" /> 건</strong>
              </div>
              <div>
                <em>나의 스크랩 현황</em>
                <strong><c:out value="${myUsePrssStat.scrpCnt}" /> 건</strong>
              </div>
              <!--  
              <div>
                <em>나의 검색 현황</em>
                <strong><c:out value="${myUsePrssStat.srchCnt}" /> 건</strong>
              </div>
              -->
              <div>
                <em>나의 활용사례 등록 현황</em>
                <strong><c:out value="${myUsePrssStat.cnjtCaseCnt}" /> 건</strong>
              </div>
            </div>
            <div class="tit-wrap">
              <h3>다운로드 현황</h3>
                <label for="downMoreBtn" class="blind"></label>
              <button type="button" id="downMoreBtn" class="btn-more" onclick="redirectDwnldPrss()">더보기</button>
            </div>
            <div class="list list-swiper cont-bg">
              <div class="choice-wrap">
                <fieldset>
                  <div class="fm-check">
                    <span class="fm-ele">
                      <input type="radio" id="dwnld01" name="dwnldCtgrySelect" value=""  checked />
                 <label for="dwnld01">전체</label>
               </span>
                <c:forEach var="item" items="${dataCtgryList}">
                    <span class="fm-ele">
                      <input type="radio" id="dwnld<c:out value='${item.ctgryId}'/>" value="<c:out value='${item.ctgryId}'/>" name="dwnldCtgrySelect"/>
                      <label for="dwnld<c:out value='${item.ctgryId}'/>"><c:out value="${item.ctgryNm}"/></label>
                    </span>
                     </c:forEach>
                  </div>
                </fieldset>
              </div>
              
           	   <!-- 다운로드 현황 start -->
           		<div id="myDwnldPrssArea"></div>
               <!-- 다운로드 현황 end -->
            </div>
				<div class="tit-wrap">
				  <h3>스크랩 현황</h3>
                    <label for="scrapMoreBtn" class="blind"></label>
				  <button type="button" id="scrapMoreBtn" class="btn-more" onclick="redirectScrpPrss()">더보기</button>
				</div>
				<div class="list list-swiper cont-bg">
				  <div class="choice-wrap">
				    <fieldset>
				      <div class="fm-check">
				        <span class="fm-ele">
				          <input type="radio" id="scrap01" name="scrpCtgrySelect" value="" checked />
				          <label for="scrap01">전체</label>
				        </span>
				        <c:forEach var="item" items="${dataCtgryList}">
				          <span class="fm-ele">
				            <input type="radio" id="scrap${item.ctgryId}" name="scrpCtgrySelect" value="${item.ctgryId}"/>
				            <label for="scrap${item.ctgryId}"><c:out value="${item.ctgryNm}"/></label>
				          </span>
				        </c:forEach>
				      </div>
				    </fieldset>
				  </div>
				  <div id="myScrpPrssArea"></div>
				</div>
	        <div class="tit-wrap">
	            <h3>활용사례등록 현황</h3>
                    <label for="statMoreBtn" class="blind"></label>
	            	<button type="button" id="statMoreBtn" class="btn-more" onclick="redirectCnjtCasePrss()">더보기</button>
	            </div>
	            <div class="list list-swiper search-history cont-bg">
				<%@ include file="mypagemin/cnjtCasePrssList.jsp" %>
	        </div>
            <!-- 나의 문의 내역(S) -->
            <div class="tit-wrap">
              <h3>나의 문의 내역</h3>
                <label for="qnaListMoreBtn" class="blind"></label>
              <button type="button" id="qnaListMoreBtn" class="btn-more" onclick="redirectMyQnaList()">더보기</button>
            </div>
             <div class="my-qna cont-bg">
				<div id="myQnaListArea"></div>
            </div>
            <!-- 나의 문의 내역(E) -->
            <div class="tit-wrap">
				  <h3>관심 키워드 현황</h3>
                    <label for="kwrdMngMoreBtn" class="blind"></label>
				  <button type="button" id="kwrdMngMoreBtn" class="btn-more" onclick="redirectItrstKwrdMng()">더보기</button>
			</div>
			<div id="myItrstKwrdArea" class="cont-bg">
			</div>
            <div class="tit-wrap">
              <h3>검색 이력 관리</h3>
                <label for="hstryMngMoreBtn" class="blind"></label>
              <button type="button" id="hstryMngMoreBtn" class="btn-more" onclick="redirectSrchHstryMng()">더보기</button>
            </div>
            <div class="list list-swiper search-history cont-bg">
              <!-- 검색어start -->
				<div id="mySrchRscArea"></div>
              <!-- 검색어end -->
            </div>
            
            <div class="tit-wrap">
              <h3>개인정보 관리</h3>
              <!--<button type="button" class="btn-more">더보기</button>-->
            </div>
            <div class="personal-info cont-bg">
              <p>
                개인정보 수정 및 탈퇴는 <br class="m-br" />문화 포털을 통해
                가능합니다.<br />부가 정보 수정은 가상융합세계에서
                <br class="m-br" />바로 변경 가능합니다.
              </p>
                <label for="modifyBtn" class="blind"></label>
              <button type="button" id="modifyBtn" class="btn-modify" onclick="location.href='https://www.culture.go.kr/mypage/mypage.do'">
                개인정보 수정하기
              </button>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
<script>
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

      
$(document).ready(function() {
   
    // 초기 로드 시 콘텐츠 로드
    var defaultCategoryId = $('input[type="radio"][name="scrpCtgrySelect"]:checked').val();
    var defaultDwnldCategoryId = $('input[type="radio"][name="dwnldCtgrySelect"]:checked').val();
    $("#myScrpPrssArea").load("<c:url value='/mypage/mainScrpPrss.do'/>" + "?ctgryId=" + defaultCategoryId ); // 스크랩 현황 페이지 로드
    $("#myItrstKwrdArea").load("<c:url value='/mypage/mainItrstKwrd.do'/>");	// 관심 키워드 현황 페이지 로드
    $("#myDwnldPrssArea").load("<c:url value='/mypage/mainDwnldPrss.do'/>" + "?ctgryId=" + defaultDwnldCategoryId); // 다운로드 현황 페이지 로드
    $("#mySrchRscArea").load("<c:url value='/mypage/mainSrchPrss.do'/>");   // 검색이력관리 페이지 로드
    $("#myQnaListArea").load("<c:url value='/mypage/mainMyQnaList.do'/>");   // 나의 문의내역 페이지 로드

    
    // 스크랩 현황 라디오 버튼 변경 시 해당 내용 로드
   $('input[type="radio"][name="scrpCtgrySelect"]').change(function() {
        var selectedValue = $(this).val();
        
        
        $("#myScrpPrssArea").load("<c:url value='/mypage/mainScrpPrss.do'/>" + "?ctgryId=" + selectedValue);
    });
    
   // 다운로드 현황 라디오 버튼 변경 시 해당 내용 로드
   $('input[type="radio"][name="dwnldCtgrySelect"]').change(function() {
        var selectedValue = $(this).val();

        
        $("#myDwnldPrssArea").load("<c:url value='/mypage/mainDwnldPrss.do'/>" + "?ctgryId=" + selectedValue);
    });
});

//키워드 삭제
function deleteKeyword(kwrdSn) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url:  '<c:url value="/mypage/delItrstKwrd.do"/>',
            data: { kwrdSn: kwrdSn },
            success: function(response) {
                location.reload();
            },
            error: function(error) {
                console.error("에러 : ", error);
            }
        });
    }
}

//활용사례 더보기 이동
function redirectCnjtCasePrss() {
    window.location.href = "<c:url value='/mypage/cnjtCasePrss.do'/>";
}
//다운로드 더보기 이동
function redirectDwnldPrss() {
    window.location.href = "<c:url value='/mypage/dwnldPrss.do'/>";
}
//검색이력관리 더보기 이동
function redirectSrchHstryMng() {
    window.location.href = "<c:url value='/mypage/srchHstryMng.do'/>";
}
//관심키워드 현황 더보기 이동
function redirectItrstKwrdMng() {
    window.location.href = "<c:url value='/mypage/itrstKwrdMng.do'/>";
}
//스크랩 현황 더보기 이동
function redirectScrpPrss() {
    window.location.href = "<c:url value='/mypage/scrpPrss.do'/>";
}
//나의 문의내역 더보기 이동
function redirectMyQnaList() {
    window.location.href = "<c:url value='/mypage/myQnaList.do'/>";
}

</script>
    
