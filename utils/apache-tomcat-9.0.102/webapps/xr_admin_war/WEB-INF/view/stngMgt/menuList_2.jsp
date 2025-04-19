<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="format-detection" content="telephone=no" />

<!-- library javascript -->
<script src="/js/jquery.3.4.1.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/css/module.css" />
<link rel="stylesheet" href="/css/front.css" />
<script src="/js/front.js"></script>
<title>메뉴 목록</title>
<style>
    div  {
	        width:  100%;
	        height:  300px;
	        border:  1px solid  #000;
	    
}

    div.left  {
	        width:  50%;
	        float:  left;
	        box-sizing:  border-box;
	        background:   #ff0;
	    
}

    div.right  {
	        width:  50%;
	        float:  right;
	        box-sizing:  border-box;
	        background:   #0ff;
	    
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- 메뉴 영역 -->
		<aside>
			<h1>디지털문화자산 공동활용플랫폼</h1>
			<nav>
				<ul>
					<li><a href="#">DASHBOARD</a></li>
					<li><a href="#">전시관리</a></li>
					<li><a href="#">디지털문화자원 관리</a></li>
					<li><a href="#">컬렉션 관리</a></li>
					<li><a href="#">비정형품질지표관리</a></li>
					<li><a href="#">사용자관리</a></li>
					<li><a href="#">문화자원 이용관리</a></li>
					<li><a href="#">커뮤니티 관리</a></li>
					<li><a href="#">통계 관리</a></li>
					<li><a href="#">설정 관리</a></li>
				</ul>
			</nav>
		</aside>
		<!-- 메뉴 영역 종료 -->
		<div class="container">
			<!-- 본문 메뉴 네비게이션 -->
			<div class="breadcrumb">
				<span>홈</span><span>설정 관리</span><span>메뉴 관리</span>
			</div>
			<div class="contants">
				<!-- 콘텐츠 영역 -->
				<div class="tit-wrap">
					<h1>메뉴 목록</h1>
				</div>
				<div class="btn-wrap align-right" >
					<button type="button" class="btns">등록</button>
					<button type="button" class="btns">수정</button>
					<button type="button" class="btns">삭제</button>
					<button type="button" class="btns">이력조회</button>
				</div>
				<div style="float: left; width: 30%;">
					<div class="tit-wrap">
					<h2><b>메뉴 목록</b></h2>
					</div>
					<div class="control-wrap">
						<!-- 트리메뉴-->
						<ul id="treeMenu">
						  <li>
						    <a href="#subMenu1" class="open">- 가가가</a>
						    <ul id="subMenu1" style="margin-top: 10px;">
						      <li><a href="#"><span>┖> </span>가가가 - 가가가</a></li>
						      <li><a href="#"><span>┖> </span>가가가 - 다다다</a></li>
						      <li><a href="#"><span>┖> </span>가가가 - 다다다</a></li>
						    </ul>
						  </li>
						  <li>
						    <a href="#subMenu2" class="open">- 나나나</a>
						    <ul id="subMenu2" style="margin-top: 10px;">
						      <li><a href="#"><span>┖> </span>나나나 - 가가가</a></li>
						      <li><a href="#"><span>┖> </span>나나나 - 다다다</a></li>
						      <li><a href="#"><span>┖> </span>나나나 - 다다다</a></li>
						    </ul>
						  </li>
						  <li>
						    <a href="#subMenu3" class="open">- 다다다</a>
						    <ul id="subMenu3" style="margin-top: 10px;">
						      <li><a href="#"><span>┖> </span>다다다 - 가가가</a></li>
						      <li><a href="#"><span>┖> </span>다다다 - 나나나</a></li>
						      <li><a href="#"><span>┖> </span>다다다 - 다다다</a></li>
						    </ul>
						  </li>
						</ul>
					</div>
				</div>
				<div style="float: left; width: 60%; margin-left: 80px;">
					<div class="tit-wrap">
					<h2><b>메뉴 상세 조회</b></h2>
					<div class="control-wrap" style="padding: 10px;">
						<div class="search fm-ele" >
							<span>메뉴 명 : 권한 목록</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">메뉴 상세 : 권한 목록에 대한 List 화면</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">메뉴 사용 여부 : 사용</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">연결 화면 명 : 메뉴 목록</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">연결 화면 URI : /web/menu/list.jsp</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">등록일 : 2023/09/19</span>
						</div>
						<div class="search fm-ele">
							<span style=" padding-top: 10px;">등록자 : 이태호(admin)</span>
						</div>
						<div class="search fm-ele">
							<span style=" padding-top: 10px;">수정일 : 2023/09/20</span>
						</div>
						<div class="search fm-ele">
							<span style="padding-top: 10px;">수정자 : 진민수(admin1)</span>
						</div>
					</div>
					</div>
				</div>
				<!-- 콘텐츠 영역 끝  -->
			</div>
		</div>
	</div>
	<!-- 트리 메뉴를 위한 스타일 및 JS -->
	<style>
	*{padding:0; margin:0;}
	ul{list-style:none;}
	img{border:0 none; vertical-align:top;}
	a{text-decoration:none; color:#555;}
	a:hover{text-decoration:underline;}
	
	#treeMenu{margin:30px 0 0 30px;}
	#treeMenu li{line-height:18px; padding:0 0 10px 20px; position:relative; background: no-repeat 4px top; font-size:13px;}
	#treeMenu li.end{ no-repeat 4px 0;}
	#treeMenu li button{width:9px; height:9px; border:0 none; display:block; position:absolute; left:0; top:3px; overflow:hidden; text-indent:-9999em;}
	#treeMenu li button.open{ no-repeat 0 0;}
	#treeMenu li button.close{ no-repeat 0 0;}
	</style>
	<script type="text/javascript">
	var opener = $("a.open");
	var nested = $("a.open").parent().find("li");
	var nestedCont = $("li > ul > li").parent();
	var that;
	
	var tree = {
	  init : function () {
	    nestedCont.hide();
	    $("li:last-child").addClass("end");
	    $("a.open").each( function () {
	      $(opener).click(function ( target ) {
	       tree.click(this);
	      });
	     return false;
	    })
	  },
	  click : function ( _tar ) {
	   that = _tar;
	   $(that).next().show();
	   $(that).prev().toggleClass("close");
	   $(that).toggleClass("close");
	   if (!$(that).hasClass("close")) {
	     $(that).next().hide();      
	   }
	  }
	 }
	 tree.init();
	</script>
</body>
</html>