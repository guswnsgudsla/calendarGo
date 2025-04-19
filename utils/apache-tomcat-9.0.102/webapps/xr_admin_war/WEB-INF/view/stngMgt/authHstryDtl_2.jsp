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
		<title>권한 관리 변경 이력 상세 조회</title>
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
				<span>홈</span><span>설정 관리</span><span>권한 관리</span>
			</div>
			<div class="contants">
				<!-- 콘텐츠 영역 -->
				<div  class="tit-wrap">
					<h1>권한 관리 변경 이력 상세 조회</h1>
				</div>
				<div class="control-wrap"  >
					<table style="border: 0; margin-left: 25px; ">
						<tr>
							<td style="border: 0; text-align: left;">등록일 : 2023/09/19</td>
							<td style="border: 0; text-align: left;">등록자 : 이태호(admin)</td>
							<td style="border: 0; text-align: left;">수정일 : 2023/09/20</td>
							<td style="border: 0; text-align: left;">수정자 : 진민수(admin1)</td>
						</tr>
						<tr>
							<td style="border: 0; text-align: left;">권한 명: 기관관리자 권한그룹</td>
							<td style="border: 0; text-align: left;">권한 유형 : 기관 관리자</td>
							<td style="border: 0; text-align: left;">사용 여부 : 사용</td>
						</tr>
						<tr>
							<td colspan="2" style="border: 0; text-align: left;">권한 상세 : 각 기관 관리자용 메뉴 및 권한 매핑 List 입니다.</td>
						</tr>
					</table>
				</div>
				<div style="margin-top: 20px; margin-bottom:20px; text-align: right;" >
					<div style="float:left; font-size: 3.2rem; font-weight: 700; color: #000;">
						<h1>기관관리자 권한그룹 매핑 메뉴 목록</h1>
					</div>
					<div style="float:right; margin-bottom:20px;" >
						<button type="button" class="btns" id="" onclick="">이력 목록</button>
						<button type="button" class="btns" id="" onclick="">권한 목록</button>
					</div>
				</div>
				<table class="list" >
					<caption></caption>
					<colgroup>
						<col width="10px"></col>
						<col width="*px"></col>
						<col width="*px"></col>
						<col width="*px"></col>
						<col width="*px"></col>
						<col width="*px"></col>
						<col width="*px"></col>
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2" colspan="2">순번</th>
							<th rowspan="2" colspan="2">메뉴 명</th>
							<th rowspan="2" colspan="2">메뉴 설명</th>
							<th colspan="4">권한</th>
							
						</tr>
						<tr>
							<th>등록</th>
							<th>수정</th>
							<th>삭제</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2">1</td>
							<td colspan="2">공지사항</td>
							<td colspan="2">공지사항 게시판</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
							<td>
								<label for="agree2" class="chk_box2" style="margin-left: 12px;">
									<input type="checkbox" id="agree2" checked="checked" />
									<span class="on2"></span>
								</label>
							</td>
							<td>
								<label for="agree3" class="chk_box3" style="margin-left: 12px;">
									<input type="checkbox" id="agree3" checked="checked" />
									<span class="on3"></span>
								</label>
							</td>
							<td>
								<label for="agree4" class="chk_box4" style="margin-left: 12px;">
									<input type="checkbox" id="agree4" checked="checked" />
									<span class="on4"></span>
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="pagination">
					<span class="navi prev"><a>이전 페이지</a></span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next"><a>다음 페이지</a></span>
				</div>
				
				<!-- 콘텐츠 영역 끝  -->
			</div>
		</div>
	</div>
<!-- 첨부파일 체크 박스 CSS -->
<style type="text/css">
	.chk_box1 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

	/* 기본 체크박스 숨기기 */
	.chk_box1 input[type="checkbox"] { display: none; }
	
	/* 선택되지 않은 체크박스 스타일 꾸미기 */
	.on1 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
	
	/* 선택된 체크박스 스타일 꾸미기 */
	.chk_box1 input[type="checkbox"]:checked + .on1 { background: #f86480; }
	.on1:after { content: ""; position: absolute; display: none; }
	.chk_box1 input[type="checkbox"]:checked + .on1:after { display: block; }
	.on1:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
</style>
<style type="text/css">
	.chk_box2 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

	/* 기본 체크박스 숨기기 */
	.chk_box2 input[type="checkbox"] { display: none; }
	
	/* 선택되지 않은 체크박스 스타일 꾸미기 */
	.on2 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
	
	/* 선택된 체크박스 스타일 꾸미기 */
	.chk_box2 input[type="checkbox"]:checked + .on2 { background: #f86480; }
	.on2:after { content: ""; position: absolute; display: none; }
	.chk_box2 input[type="checkbox"]:checked + .on2:after { display: block; }
	.on2:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
</style>
<style type="text/css">
	.chk_box3 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

	/* 기본 체크박스 숨기기 */
	.chk_box3 input[type="checkbox"] { display: none; }
	
	/* 선택되지 않은 체크박스 스타일 꾸미기 */
	.on3 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
	
	/* 선택된 체크박스 스타일 꾸미기 */
	.chk_box3 input[type="checkbox"]:checked + .on3 { background: #f86480; }
	.on3:after { content: ""; position: absolute; display: none; }
	.chk_box3 input[type="checkbox"]:checked + .on3:after { display: block; }
	.on3:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
</style>
<style type="text/css">
	.chk_box4 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

	/* 기본 체크박스 숨기기 */
	.chk_box4 input[type="checkbox"] { display: none; }
	
	/* 선택되지 않은 체크박스 스타일 꾸미기 */
	.on4 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
	
	/* 선택된 체크박스 스타일 꾸미기 */
	.chk_box4 input[type="checkbox"]:checked + .on4 { background: #f86480; }
	.on4:after { content: ""; position: absolute; display: none; }
	.chk_box4 input[type="checkbox"]:checked + .on4:after { display: block; }
	.on4:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
</style>
<script>
//체크박스 jquery 함수
	var check1 = $("#check1");
	check1.click(function(){
		$(".p1").toggle();
	});
	var check2 = $("#check2");
	check2.click(function(){
		$(".p2").toggle();
	});
	var check3 = $("#check3");
	check3.click(function(){
		$(".p3").toggle();
	});
	var check3 = $("#check4");
	check3.click(function(){
		$(".p4").toggle();
	});
</script>
</body>
</html>