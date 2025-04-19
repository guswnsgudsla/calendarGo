<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
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
<!--  		
		<meta property="og:url" content="">
		<meta property="og:image" content="https://www.bigdata-culture.kr<c:url value="/images/pt_logo.png" />" />
		<meta property="og:image:alt" content="디지털문화자원 공동활용플랫폼" />
-->		
		<title>디지털문화자원 공동활용플랫폼</title>
		
		<%-- 시스템 공통으로 사용하는 css --%>
		<c:import url="/WEB-INF/view/include/css.jsp" />

		<%-- 시스템 공통으로 사용하는 javascript --%>
		<c:import url="/WEB-INF/view/include/javascript.jsp" />

<script>
$(document).ready(function () {
	$('#loginBtn').click(function (event) {
        event.preventDefault();
        
        var form = $('#formLogin')[0];
        var formData = new FormData(form);
        $('#loginBtn').prop('disabled', true);

        $.ajax({
            type: 'POST',
            url: '<c:url value="/mbr/loginProc.do"/>',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                //$('#result').text(data);
                console.log('SUCCESS : ', data);
                $('#loginBtn').prop('disabled', false);
                if (data.resultCode == 200) {
                	location.href = '<c:url value="/index.do"/>';
                }
            },
            error: function (e) {
                //$('#result').text(e.responseText);
                console.log('ERROR : ', e);
                $('#loginBtn').prop('disabled', false);
            }
        });
        
    });
});
</script>		
	</head>
<body>
<!-- content_w -->
<div class="content_w fix sub_member page_login">
	<!-- contents -->
	<div id="contents" class="contents in_cover">
		<div class="h2_w">
			<h2>로그인</h2>
		</div>
		<!-- article : 로그인 -->
		<div class="article atc_login ">
			<div class="in_w">
				<div class="login_box">
					<div class="ip_box">
						<form id="formLogin" method="post">
							<div class="ip_box id_box">
								<label class="hidden" for="loginId">아이디</label>
								<input type="text" name="mbrId" placeholder="아이디를 입력해주세요." id="mbrId" value="testuser1">
							</div>
							<div class="btn_w">
								<input type="button" value="로그인" id="loginBtn" class="btn_login">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--// article : 로그인 -->
	</div>
	<!--// contents -->
</div>
<!--// content_w -->

</body>
</html>
