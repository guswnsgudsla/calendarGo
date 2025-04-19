<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximun-scale=1.0, user-scalable=no">
		
		<!-- Meta Tag -->
		<link rel="shortcut icon" href="https://www.bigdata-culture.kr<c:url value="/images/marketc.ico" />" >
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
	
	<body>
    <!-- wrapper(S) -->
    <div class="wrapper">

      <!-- container(S) -->
      <section class="container">
        <header>
        </header>
        <section id="contents" class="contents add-information">
          <div class="inner">
            <p>
              요청하신 페이지를 찾을 수 없습니다.
            </p>
            <div class="information">
              <strong>
				찾으시려는 페이지는 주소를 잘못 입력하였거나
				페이지 주소의 변경 또는 삭제등의 이유로 페이지를 찾을 수 없습니다.<br>
				입력하신 페이지의 주소와 경로가 정확한지 한번 더 확인 후 이용하시기 바랍니다.	
              </strong>
              <div class="btn-wrap">
	            <a href="<c:url value="/index.do"/>">
                <button type="button" class="btns color-primary">
                  홈페이지로 가기
                </button>
                </a>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
	</div>
    </body>
</html>