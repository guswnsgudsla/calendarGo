<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>공동활용플랫폼 사용방법(이용안내)</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span><a href="<c:url value="/footer/xrIntro.do"/>">공동활용플랫폼 소개</a></span>
              <span>공동활용플랫폼 사용방법(이용안내)</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents useguide">
          <div class="inner">
            <div class="cont-bg">
              <div class="btn-wrap mt0 al">
                <a href="<c:url value="/files/guide/사용자매뉴얼_관리자.pdf"/>" class="btns size-s color-primary btn-download btn-icon" role="button" download="공동활용플랫폼사용자매뉴얼(관리자).pdf">사용자매뉴얼(관리자) 다운로드</a>
                <a href="<c:url value="/files/guide/디지털문화자원_등록절차안내서.pdf"/>" class="btns size-s color-primary btn-download btn-icon" role="button" download="디지털문화자원_등록절차안내서.pdf">디지털문화자원 등록절차안내서 다운로드</a>  
              </div>
              <ul>
                <li>
                  <strong><span>STEP 01</span>사이트 방문</strong>
                  <p>
                    디지털 문화자원 공동활용플랫폼에 접속해 다양한 자료를
                    검색·조회하고, 필요한 데이터는 다운로드할 수 있습니다.
                  </p>
                  <div>
                    <img
                      src="<c:url value='/assets/images/useguide01.png'/>"
                      alt="사이트 방문 이미지"
                    />
                  </div>
                </li>
                <li>
                  <strong><span>STEP 02</span>디지털 문화자원 검색</strong>
                  <p>
                    다양한 검색설정을 통해 원하는 디지털문화자원을 검색하세요.
                  </p>
                  <div>
                    <img
                      src="<c:url value='/assets/images/useguide02.png'/>"
                      alt="디지털 문화자원 검색 이미지"
                    />
                  </div>
                </li>
                <li>
                  <strong><span>STEP 03</span>디지털 문화자원 확인</strong>
                  <p>
                    선택된 디지털 문화자원의 상세한 속성과 설명을 확인하고,
                    데이터별 미리보기 기능으로 적합한 데이터인지를 확인하세요.
                  </p>
                  <div>
                    <img
                      src="<c:url value='/assets/images/useguide03.png'/>"
                      alt="디지털 문화자원 확인 이미지"
                    />
                  </div>
                </li>
                <li>
                  <strong
                    ><span>STEP 04</span>이용조건에 따라 디지털 문화자원
                    활용</strong
                  >
                  <p>
                    이용약관 및 개인 정보 이용에 동의하면 다운로드가 실행됩니다.
                  </p>
                  <div>
                    <img
                      src="<c:url value='/assets/images/useguide04.png'/>"
                      alt="디지털 문화자원 활용 이미지"
                    />
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
