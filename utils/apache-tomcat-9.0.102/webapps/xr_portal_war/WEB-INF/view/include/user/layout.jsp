<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/tiles-jsp.tld" prefix="tiles"%> <%-- tiles --%>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximun-scale=1.0, user-scalable=no">
		
		<!-- Meta Tag -->
		<link rel="shortcut icon" href="<c:url value="/assets/images/favicon.ico" />" >
		<meta property="keywords" content="디지털문화자원">
		<meta property="title" content="디지털문화자원 공동활용플랫폼">
		<meta property="description" content="한국문화정보원이 운영하는 디지털문화자원 공동활용플랫폼은 정부 및 공공기관과 국내 민간기업을 포괄하는 가상융합세계 생태계 조성을 위해 가상융합세계 콘텐츠 제작 지원 생태계를 조성하고 있습니다.">
		
		<!-- Sns -->
		<meta property="og:type" content="website">
		<meta property="og:title" content="디지털문화자원 공동활용플랫폼" />
		<meta property="og:description" content="한국문화정보원이 운영하는 디지털문화자원 공동활용플랫폼은 정부 및 공공기관과 국내 민간기업을 포괄하는 가상융합세계 생태계 조성을 위해 가상융합세계 콘텐츠 제작 지원 생태계를 조성하고 있습니다." />
		<meta property="og:site_name" content="XR">
		<title>디지털문화자원 공동활용플랫폼</title>
		
		<%-- 시스템 공통으로 사용하는 css --%>
		<c:import url="/WEB-INF/view/include/css.jsp" />

		<%-- 시스템 공통으로 사용하는 javascript --%>
		<c:import url="/WEB-INF/view/include/javascript.jsp" />
		
	</head>
	
	<c:set var="bodyClass" value="" />
	<c:choose>
		<c:when test="${fn:contains(currentURI, '/user/main')}">
			<c:set var="bodyClass" value="main" />	
		</c:when>
		<c:otherwise>
			<c:set var="bodyClass" value="sub" />
		</c:otherwise>
	</c:choose>
				
	<body>
	    <!-- skip(S) -->
	    <div class="skip-navigation">
	      <h2>스킵 네비게이션</h2>
	      <a href="#contents">본문으로 가기</a>
	      <a href="#gnb">메뉴로 가기</a>
	    </div>
	    <!-- //skip(E) -->
  		
	    <!-- wrapper(S) -->
	    <div class="wrapper">
			<!-- header -->
			<tiles:insertAttribute name="header" />
			<!-- //header -->
				 
			<!--page start -->
			<c:choose>
				<c:when test="${fn:contains(currentURI, '/error.do')}">
					<c:catch var="exception">
						<tiles:insertAttribute name="body" />
					</c:catch>
					<c:if test="${not empty exception }"></c:if>
				
				</c:when>
				<c:when test="${fn:contains(currentURI, '/main/main')}"><!-- 메인 -->
					<!-- content_w -->
					<div class="content_w fix">
						<!-- contents -->
						<div id="contents" class="contents">
							<c:catch var="exception">
								<tiles:insertAttribute name="body" />
							</c:catch>
							<c:if test="${not empty exception }"></c:if>	
						 </div>
				      	 <!--// contents -->				
				    </div>
				    <!--// content_w -->
				</c:when>
				<c:otherwise> <!-- 서브 -->
					<c:catch var="exception">
						<tiles:insertAttribute name="body" />
					</c:catch>
					<c:if test="${not empty exception }"></c:if>	
				</c:otherwise>
			</c:choose>
			 <!--page end -->
			
			<!-- footer -->
			<tiles:insertAttribute name="footer" />
			<!-- //footer -->
			
		    <!-- 다운로드 팝업 -->
		    <section id="dwnldLayer" class="wrap-layer-popup layer-download">
		      <div class="dimmed"></div>
		      <div class="pop-layer">
		        <header>
		          <h1>다운로드</h1>
		          <button class="btn-close" onclick="front.layerClose('dwnldLayer')">
		            <span class="blind">닫기</span>
		          </button>
		        </header>
		        <section id="dwnldExecConts" class="contents">
		          <div class="title">
		            <div class="tag-wrap">
		              <span class="tag color-green">동영상</span>
		              <span class="tag brd-color-blue">국립국악원</span>
		            </div>
		            <strong>서초동 청사 30주년 기념 민속악단 공연</strong>
		            <button
		              type="button"
		              class="btns size-s color-primary btn-download"
					  onclick="#!">
		              전체 다운로드
		            </button>
		          </div>
		          <div class="contents-list">
		            <strong>obj Original Format</strong>
		            <ul>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button
		                  type="button"
		                  class="btn-download"
		                  onclick="#!"
		                >
		                  다운로드
		                </button>
		              </li>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button
		                  type="button"
		                  class="btn-download"
		                  onclick="#!"
		                >
		                  다운로드
		                </button>
		              </li>
		            </ul>
		            <strong>USDZ Converted Format</strong>
		            <ul>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button type="button" class="btn-download"
								onclick="#!"
						>다운로드</button>
		              </li>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button type="button" class="btn-download">다운로드</button>
		              </li>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button type="button" class="btn-download">다운로드</button>
		              </li>
		              <li>
		                <p>파일1_basecolor.mp4<span>278MB</span></p>
		                <button type="button" class="btn-download">다운로드</button>
		              </li>
		            </ul>
		          </div>
		        </section>
		      </div>
		    </section>
    		<!-- //다운로드 팝업 -->

		    <form id="dwnldNoteForm" name="dwnldNoteForm" >
		    <!-- 다운로드 유의사항 팝업 -->
		    <section id="dwnldNoteLayer" class="wrap-layer-popup layer-download-note">
		      <div class="dimmed"></div>
		      <div class="pop-layer">
		        <header>
		          <h1>이용 약관 및 개인 정보이용 동의</h1>
		          <button
		            class="btn-close"
		            onclick="front.layerClose('dwnldNoteLayer')"
		          >
		            <span class="blind">닫기</span>
		          </button>
		        </header>
		        <section id="dwnldNoteConts" class="contents">
		          <div class="title">
		            <div class="tag-wrap">
		              <span class="tag color-green">동영상</span>
		              <span class="tag brd-color-blue">국립국악원</span>
		            </div>
		            <strong>서초동 청사 30주년 기념 민속악단 공연</strong>
		          </div>
		          <div class="about">
		            <table>
		              <colgroup>
		                <col width="150px" />
		                <col width="*" />
		              </colgroup>
		              <tr>
		                <th>해당기관</th>
		                <td>국립중앙박물관</td>
		              </tr>
		              <tr>
		                <th>활용목적</th>
		                <td>
		                  <div class="fm-check">
		                    <span class="fm-ele">
		                      <input type="radio" id="purpose-1" name="purpose" />
		                      <label for="purpose-1">상업적 활용</label>
		                    </span>
		                    <span class="fm-ele">
		                      <input type="radio" id="purpose-2" name="purpose" />
		                      <label for="purpose-2">교육/학습적 활용</label>
		                    </span>
		                    <span class="fm-ele">
		                      <input type="radio" id="purpose-3" name="purpose" />
		                      <label for="purpose-3">업무적 활용</label>
		                    </span>
		                    <span class="fm-ele">
		                      <input type="radio" id="purpose-4" name="purpose" />
		                      <label for="purpose-4">개인적 활용</label>
		                    </span>
		                    <span class="fm-ele">
		                      <input type="radio" id="purpose-5" name="purpose" />
		                      <label for="purpose-5">직접입력</label>
		                    </span>
		                  </div>
		                  <div class="fm-group" data-size="xl">
		                    <div class="fm-focus">
		                      <input
		                        type="text"
		                        id=""
		                        class="fm-control"
		                        placeholder="세부목적을 입력해주세요."
		                      />
		                    </div>
		                  </div>
		                </td>
		              </tr>
		              <tr>
		                <th>이용조건</th>
		                <td>
		                  <img
		                    src="<c:url value='/assets/images/logo_open.png'/>"
		                    alt="공공누리 OPEN로고"
		                  />
		                  출처표시
		                </td>
		              </tr>
		              <tr>
		                <th>이용약관</th>
		                <td>
		                  공공저작물 다운로드 시 개인정보 (회원가입 정보) 활용과
		                  공공저작물 이용조건에 동의 하셔야 합니다. 개인정보활용 목적은
		                  공공저작물 활용용도 분석과 더 나은 공공저작물 서비스를
		                  위함입니다. 활용되는 개인정보는 공공누리 개인정보처리방침에
		                  따라 관리됩니다. 다운로드된 공공저작물은 공공누리 유형에 맞는
		                  이용조건으로 사용하셔야 합니다.
		                  <button type="button" class="btns btn-terms">
		                    이용약관 전체보기
		                  </button>
		                </td>
		              </tr>
		            </table>
		            <div class="fm-check">
		              <span class="fm-ele">
		                <input type="checkbox" id="agree" name="agree" />
		                <label for="agree"
		                  >공공누리 이용약관 및 개인정보이용 동의 내용을 숙지하고
		                  동의합니다.</label
		                >
		              </span>
		            </div>
		            <div class="btn-wrap">
		              <button
		                type="button"
		                class="btns size-s color-primary btn-download"
		              >
		                다운로드
		              </button>
		            </div>
		          </div>
		        </section>
		      </div>
		    </section>
    		<!-- //다운로드 유의사항 팝업 -->
			</form>
		    <!-- 미리보기 팝업 -->
		    <section id="clctPreviewLayer" class="wrap-layer-popup layer-preview">
		      <div class="dimmed"></div>
		      <div class="pop-layer">
		        <header>
		          <h1>컬렉션 미리보기</h1>
		          <button class="btn-close" onclick="front.layerClose('clctPreviewLayer')">
		            <span class="blind">닫기</span>
		          </button>
		        </header>
		        <section id="clctPreviewConts" class="contents">
		          <ul class="list-resource">
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item01.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p>
		                  <strong
		                    >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사
		                    중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사 중원
		                    중문</strong
		                  >
		                </p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item02.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p>
		                  <strong
		                    >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사
		                    중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사 중원
		                    중문</strong
		                  >
		                </p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item03.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p>
		                  <strong
		                    >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사
		                    중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사 중원
		                    중문</strong
		                  >
		                </p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item04.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p><strong>미륵사 중원 중문</strong></p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item05.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p>
		                  <strong
		                    >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사
		                    중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사 중원
		                    중문</strong
		                  >
		                </p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		            <li>
		              <a href="#">
		                <div class="img">
		                  <img src="<c:url value='/assets/images/temp/list_item01.png'/>" alt="" />
		                </div>
		                <div class="tag-wrap">
		                  <span class="tag size-small color-green">동영상</span>
		                  <span class="tag size-small brd-color-blue">국립국악원</span>
		                </div>
		                <p>
		                  <strong
		                    >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사
		                    중원 중문 미륵사 중원 중문 미륵사 중원 중문 미륵사 중원
		                    중문</strong
		                  >
		                </p>
		              </a>
		              <div class="btn-wrap">
		                <button type="button" class="view">123</button>
		                <button type="button" class="download">24,128</button>
		                <button type="button" class="like">123,456</button>
		              </div>
		            </li>
		          </ul>
		          <div class="btn-wrap">
		            <button type="button" class="btns color-primary btn-collection">
		              컬렉션 상세보기
		            </button>
		          </div>
		        </section>
		      </div>
		    </section>
		    <!-- //미리보기 팝업 -->
 	
			<iframe name="hidden_iframe" id="hidden_iframe" title="숨겨진 프레임" src="about:blank" style="display: none !important; "></iframe>
		</div>
    <script>
    const cmmnDwnldExecUrl = "<c:url value='/dgtlcltrsc/dwnldExecPopup.do'/>";
    const cmmnDwnldNoteUrl = "<c:url value='/dgtlcltrsc/dwnldNotePopup.do'/>";
    const cmmnClctPreviewUrl = "<c:url value='/dgtlcltrsc/clctGroupPreviewPopup.do'/>";
    const cmmnShowContsUrl = "<c:url value='/dgtlcltrsc/selectRprsPrdctFileList.do'/>";
    const cmmnEditorFileUpUrl = "<c:url value='/cmmn/editorFileUp.do'/>";
    const cmmnCltRscDtlUrl = "<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do'/>";
    const cmmnCltClctDtlUrl = "<c:url value='/dgtlcltrsc/dgtlCltClctGroupDtl.do'/>";
    const cmmnLoadingImgUrl = "<c:url value='/assets/images/loading.png'/>";
    const cmmnLoadingBgUrl = "<c:url value='/assets/images/bg_loading.png'/>";
    const apiUrl = "<c:out value='${tusSvrUrl}'/>/download";
    const apiRgnUrl = "<c:out value='${tusSvrUrl}'/>/region";
    const baseUrl = "<c:out value='${tusSvrUrl}'/>/";
    const cmmnUid = "<c:out value='${loginVO.id}'/>/";
    </script>
		
	</body>

</html>