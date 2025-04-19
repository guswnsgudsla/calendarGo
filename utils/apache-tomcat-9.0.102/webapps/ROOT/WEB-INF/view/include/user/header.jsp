<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- Top event(S)--> 
	<c:choose>
		<c:when test="${rprsEvntVo != null}">
	  <input type="hidden" id="hdnShowTopEvt" value="T1">
		</c:when>
		<c:otherwise>
	  <input type="hidden" id="hdnShowTopEvt" value="T0">
		</c:otherwise>
	</c:choose>
	<!--  
    <c:if test="${rprsEvntVo != null and not empty rprsEvntVo.evntId}">
      <div class="top-event" id="rprsEvntDiv" style="display:none;">
        <div class="inner">
          <strong>
      <c:choose>
          <c:when test="${empty rprsEvntVo.evntId}">
            <a href="#">
          </c:when>
          <c:otherwise>
           	<c:url value="/utztngdnc/evtViewDtl.do" var="rprsEvntUrl">
          		<c:param name="evntId" value="${rprsEvntVo.evntId}" />
	      	</c:url>		                  	
            <a href="${rprsEvntUrl}">
          </c:otherwise>
      </c:choose>
            <c:out value='${rprsEvntVo.evntTtl}'/>
            </a>
          </strong>
          <button type="button" class="btn-delete" onclick="fnRemoveRprsEvnt();return false;">
            <span class="blind">이벤트 닫기</span>
          </button>
        </div>
      </div>
    </c:if>
    -->
      <!-- //Top event(E) -->
     <!-- header(S) -->
      <header>
        <div class="inner">
            <a href="<c:url value="/index.do"/>">
	          <h1 class="logo">
	            <span class="blind">
	              한국문화정보원 디지털문화자원 공동활용플랫폼
	            </span>
	          </h1>
            </a>
            <div class="utile">
              <div class="search">
                <input
                  type="text"
                  id="topSrwd"
                  name="topSrwd"
                  placeholder="검색을 원하는 키워드를 입력해주세요."
                />
                <label for="topSrwd" class="blind">검색을 원하는 키워드를 입력해주세요.</label>
                <button type="button" onClick="funSrchPage()"><span class="blind">검색</span></button>
              </div>
              <div class="user-wrap">
                <div class="user"><span class="blind">사용자</span></div>
                <div class="user-menu">
        <c:if test="${empty loginVO.id }">
                  <button type="button" onclick="location.href='<c:url value="/mbr/joinMbr.do"/>'">회원가입</button>
                  <button type="button" onclick="location.href='<c:url value="/login.do"/>'">로그인</button>
              </c:if>
        <c:if test="${not empty loginVO.id }">
                  <button type="button" onclick="location.href='<c:url value="/mypage/mypageMain.do"/>'">마이페이지</button>
                  <button type="button" onclick="location.href='<c:url value="/logout.do"/>'">로그아웃</button>
              </c:if>
                </div>
              </div>
              <a href="javascript:funSrchPage()" class="btn-search"><span class="blind">검색</span></a>
            </div>
            
          </div>
          <nav>
            <button class="btn-menu">
              <span></span><span></span><span></span>
            </button>
            <div class="gnb">
              <ul>
                <li><a href="javascript:void(0)">디지털문화자원 유형별보기</a></li>
                <li><a href="javascript:void(0)">디지털문화자원 컬렉션보기</a></li>
                <li><a href="javascript:void(0)">공동활용플랫폼 소개</a></li>
                <li>
                  <a href="javascript:void(0)">디지털문화자원 현황과 활용 사례</a>
                </li>
                <li><a href="javascript:void(0)">이용안내</a></li>
                <li><a href="javascript:void(0)">참여기관</a></li>
              </ul>
              <div class="gnb-detail">
                <div class="inner">
                  <div class="control">
                    <button type="button" class="btn-close">
                      <span class="blind">닫기</span>
                    </button>
          <c:if test="${empty loginVO.id }">
                  <button type="button" class="btn-join" onclick="location.href='<c:url value="/mbr/joinMbr.do"/>'">회원가입</button>
                  <button type="button" class="btn-login" onclick="location.href='<c:url value="/login.do"/>'">로그인</button>
                    </c:if>
          <c:if test="${not empty loginVO.id }">
                  <button type="button" class="btn-join" onclick="location.href='<c:url value="/mypage/mypageMain.do"/>'">마이페이지</button>
                  <button type="button" class="btn-login" onclick="location.href='<c:url value="/logout.do"/>'">로그아웃</button>
                </c:if>
                  </div>
                  <ul id="gnb">
                    <li>
                      <strong><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A"/>">디지털문화자원 유형별보기</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=A"/>">3D데이터에셋</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=B"/>">동영상</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=C"/>">이미지</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=D"/>">오디오</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=E"/>">텍스트</a></li>
                            <!--<li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&srchDataTypeCtgryCd=F"/>">AI학습데이터</a></li>-->
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <strong><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=B"/>">디지털문화자원 컬렉션보기</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=B"/>">컬렉션 그룹별 보기</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A&orderByKey=B"/>">신규등록 디지털문화자원 보기</a></li>
                            <li><a href="<c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A"/>">인기다운로드 디지털문화자원 보기</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <strong><a href="<c:url value="/footer/xrIntro.do"/>">공동활용플랫폼 소개</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/footer/xrIntro.do"/>">공동활용플랫폼이란?</a></li>
                            <li><a href="<c:url value="/footer/useGuide.do"/>">공동활용플랫폼 사용방법(이용안내)</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <strong><a href="<c:url value="/cltrscprss/cltRscPrss.do"/>">디지털문화자원 현황과 활용 사례</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/cltrscprss/cltRscPrss.do"/>">디지털문화자원 현황</a></li>
                            <li><a href="<c:url value="/cltrscprss/cnjtCaseList.do"/>">활용사례</a></li>
                            <li><a href="<c:url value="/cltrscprss/cnjtCaseWrite.do"/>">활용사례 등록 신청</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <strong><a href="<c:url value="/utztngdnc/ntcMttrList.do"/>">이용안내</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/utztngdnc/ntcMttrList.do"/>">공지사항</a></li>
                            <li><a href="<c:url value="/utztngdnc/faqList.do"/>">FAQ</a></li>
                            <li><a href="<c:url value="/utztngdnc/qnaList.do"/>">문의하기</a></li>
                            <li><a href="<c:url value="/utztngdnc/joinList.do"/>">관리자 승인 요청</a></li>
                            <!--  
                            <li><a href="<c:url value="/utztngdnc/evtView.do"/>">이벤트</a></li>
                            <li><a href="<c:url value="/utztngdnc/eventWinList.do"/>">당첨자 보기</a></li>
                            -->
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <strong><a href="<c:url value="/invlinst/invlInstList.do"/>">참여기관</a></strong>
                      <div class="depth">
                        <div>
                          <ul>
                            <li><a href="<c:url value="/invlinst/invlInstList.do"/>">참여기관</a></li>
                            <li><a href="#" onclick="alert('기능 준비중입니다.'); return false;">사전협의 참여기관</a></li>
                            <li><a href="#" onclick="alert('기능 준비중입니다.'); return false;">문화정보화백서 통계 참여</a></li>
                            <li><a href="<c:url value="/mbr/adminMbr.do"/>">관리자 사이트</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
          <c:if test="${not empty loginVO.id }">
                    <li>
                      <strong>마이페이지</strong>
                      <div class="depth mypage">
                        <div>
                          <em><a href="<c:url value="/mypage/dwnldPrss.do"/>">사용 현황</a></em>
                          <ul>
                            <li><a href="<c:url value="/mypage/dwnldPrss.do"/>">다운로드 현황</a></li>
                            <li><a href="<c:url value="/mypage/scrpPrss.do"/>">스크랩 현황</a></li>
                            <li><a href="<c:url value="/mypage/cnjtCasePrss.do"/>">활용사례 현황</a></li>
                          </ul>
                        </div>
                        <div>
                          <em><a href="<c:url value="/mypage/myQnaList.do"/>">나의 문의내역</a></em>
                        </div>
                        <div>
                          <em><a href="<c:url value="/mypage/itrstKwrdMng.do"/>">관심 키워드 관리</a></em>
                        </div>
                        <div>
                          <em><a href="<c:url value="/mypage/srchHstryMng.do"/>">검색 이력 관리</a></em>
                        </div>
                        <div>
                          <em><a href="<c:url value="/mypage/mbrAnxtInfoMng.do"/>">개인정보 관리</a></em>
                          <ul>
                            <li><a href="<c:url value="/mypage/mbrAnxtInfoMng.do"/>">부가 정보 관리</a></li>
                            <li><a href="<c:url value="/mypage/mbrInfoMng.do"/>">회원정보 수정 및 탈퇴</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
          </nav>
      </header>
      <!-- //header(E) -->
 
<script>
$(document).ready(function() {
	$('#topSrwd').on('keydown', function(event) {
	    if (event.key === 'Enter') {
	    	funSrchPage();
	    }
	});

    <c:if test="${rprsEvntVo != null and not empty rprsEvntVo.evntId}">
    /*
	const showEvtObj = fncGetItemWithExpireTime("kcisa.xrportal.showevt");
	if (showEvtObj == null) {
		if ($("#hdnShowTopEvt").val() === "T1") {
			document.getElementById('rprsEvntDiv').style.display = 'block';
		}
	}
	*/
	</c:if>
});

function Zoom_min(){
	var base = Number($('.zoom_size').html());
	eval(base -= 5);
	//console.log("min : "+base);
	$('.zoom_size').html(base);
	$('body').css('zoom',base +'%');
	if(base < 70){
		alert("더 이상 축소할 수 없습니다.");
		$('.zoom_size').html(70);
		$('body').css('zoom',70 +'%');
	}
}

function Zoom_pls(){
	var base = Number($('.zoom_size').html());
	eval(base += 5);
	//console.log("pls : "+base);
	$('.zoom_size').html(base);
	$('body').css('zoom',base +'%');
	if(base > 190){
		$('.zoom_size').html(100);
		$('body').css('zoom',100 +'%');
	}
}

function funSrchPage(){
	location.href = "<c:url value='/dgtlcltrsc/srchDgtlCltRsc.do'/>" + "?srchVal="+encodeURIComponent($('#topSrwd').val());
}

function funSrchPageWithTag(srchTagVal){
	location.href = "<c:url value='/dgtlcltrsc/srchDgtlCltRsc.do'/>" + "?srchVal="+encodeURIComponent("#"+srchTagVal);
}

function fnRemoveRprsEvnt(){
	fncSetItemWithExpireTime("kcisa.xrportal.showevt", "0", 86400000);
	document.getElementById('rprsEvntDiv').style.display = 'none';
}
</script>
