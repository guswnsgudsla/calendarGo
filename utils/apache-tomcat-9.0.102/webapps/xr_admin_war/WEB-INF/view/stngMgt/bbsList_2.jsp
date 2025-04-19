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
		<title>게시판 목록</title>
		<script>

		function goInstSrchParam() {
			let frm = document.frmInstSrch;
			frm.action = "/instMgt/instList.do";
			frm.submit();
		}
		
		function goInstSrchParamReset() {
			let frm = document.frmInstSrch;
			frm.srchInstNm.value = "";
			frm.srchInstTypeCd.value = "";
			frm.srchFldTypeCd.value = "";
			frm.srchClcTypeCd.value = "";
			frm.srchCertChk.value = "";
		}
		
		function goListPageMove(paramDataInt) {
			let frm = document.frmInstSrch;
			frm.srchPageNo.value = paramDataInt;
			frm.action = "/instMgt/instList.do";
			frm.submit();
		}
		
		//
		function goViewInstInfo(paramDataString) {
			let frm = document.frmInstSrch;
			frm.srchInstId.value = paramDataString;
			frm.action = "/instMgt/instDtl.do";
			frm.submit();
		}
		
		//
		function goEntryInstInfo() {
			let frm = document.frmInstSrch;
			frm.srchWrtMode.value = "entry";
			frm.action = "/instMgt/instReg.do";
			frm.submit();
		}
		
		// 이전페이지
		function goListPrevMove() {
			let frm = document.frmInstSrch;
			let nowPageNo = parseInt(frm.srchPageNo.value, 10);
			let movePageNo = nowPageNo - 1;
			if (movePageNo <= 0) {
				window.alert("이동할 이전 페이지가 존재하지 않습니다.");
				return false;
			} else {
				goListPageMove(movePageNo);
			}
		}
		
		// 다음페이지
		function goListNextMove() {
			let frm = document.frmInstSrch;
			let maxPageNo = parseInt(${pageInfo.paramPageMaxNo}, 10);
			let nowPageNo = parseInt(frm.srchPageNo.value, 10);
			if (nowPageNo == maxPageNo) {
				window.alert("이동할 다음 페이지가 존재하지 않습니다.");
				return false;
			} else {
				let movePageNo = nowPageNo + 1;
				goListPageMove(movePageNo);
			}
			
		}

		</script>
<!-- 토글버튼(Yes or No)를 위한 스타일 및 JS 작업부분 -->
<style type="text/css">
	/* The switch - the box around the slider */
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	p {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
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
				<span>홈</span><span>설정 관리</span><span>게시판 관리</span>
			</div>
			<div class="contants">
				<!-- 콘텐츠 영역 -->
				<div  class="tit-wrap">
					<h1>게시판 목록</h1>
				</div>
				<div class="control-wrap">
						<div class="search">
							<div class="fm-ele">
								<input type="text" id="srchInstNm" name="srchInstNm" value="${srchInstInfo.paramInstNm}" placeholder="기관명을 입력하세요.">
							</div>
							<button type="button" class="btns" id="btnSrch" onclick="javascript:goInstSrchParam(); return false;">조회</button>
						</div>
						<div class="control">
							<div class="simple">
								<div class="fm-focus fm-select">
									<select id="srchClcTypeCd" name="srchClcTypeCd" style="padding-left: 10px;">
										<option value="" selected>게시판 아이디</option>
										<option value="">게시판 명</option>
									</select>
								</div>
								<div class="fm-focus fm-select">
									<select id="srchClcTypeCd" name="srchClcTypeCd" style="padding-left: 10px;">
										<option value="" selected>게시판 유형</option>
										<option value="">공지형</option>
										<option value="">단답형</option>
										<option value="">계층형</option>
									</select>
								</div>
								<div class="fm-focus fm-select">
									<select id="srchClcTypeCd" name="srchClcTypeCd" style="padding-left: 10px;">
										<option value="" selected>전체</option>
										<option value="">사용</option>
										<option value="">중지</option>
									</select>
								</div>
							</div>
						</div>
				</div>
				
				<div class="tag-wrap">
					<button type="button" class="btns" id="btnSrchInit" onclick="javascript:goInstSrchParamReset(); return false;">초기화</button>
				</div>
				<div class="list-option top between">
					<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
					<button type="button" class="btns" id="btnEntry" onclick="javascript:goEntryInstInfo(); return false;">등록</button>
				</div>
				
				<table class="list">
					<caption></caption>
					<colgroup>
						<col width="50px"></col>
						<col width="150px"></col>
						<col width="*"></col>
						<col width="120px"></col>
						<col width="120px"></col>
						<col width="120px"></col>
						<col width="120px"></col>
						<col width="120px"></col>
						<col width="100px"></col>
						<col width="200px"></col>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>게시판 ID</th>
							<th>게시판 명</th>
							<th>게시판 유형</th>
							<th>게시판 분류</th>
							<th>통합 검색</th>
							<th>공지 게시</th>
							<th>사용</th>
							<th>우수인증</th>
							<th>등록 일시</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a>BBS00000001</a></td>
							<td style="text-align: left;"><a>기관 공지사항</a></td>
							<td>공지형</td>
							<td>
								<button type="button" class="btns">관리</button>
							</td>
							<td>
								<label class="switch">
								  <input type="checkbox" id="check1">
								  <span class="slider round"></span>
								</label>
								<p class="p1">OFF</p><p class="p1" style="display:none;">ON</p>
							</td>
							<td>
								<label class="switch">
								  <input type="checkbox" id="check2">
								  <span class="slider round"></span>
								</label>
								<p class="p2">OFF</p><p class="p2" style="display:none;">ON</p>
							</td>
							<td>
								<label class="switch">
								  <input type="checkbox" id="check3">
								  <span class="slider round"></span>
								</label>
								<p class="p3">OFF</p><p class="p3" style="display:none;">ON</p>
							</td>
							<td>슈퍼관리자</td>
							<td>2023-09-13 10:01:59</td>
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
</script>
</body>
</html>