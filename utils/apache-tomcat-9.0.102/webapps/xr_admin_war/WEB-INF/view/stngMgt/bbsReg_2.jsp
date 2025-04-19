<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="format-detection" content="telephone=no" />

    <!-- library javascript -->
    <script src="/js/jquery.3.4.1.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="/css/module.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    
    <link rel="stylesheet" href="/css/front.css" />
    <script src="/js/front.js"></script>

    <title>게시판 상세보기</title>
    <style type="text/css">
    	.instInfo {color:black;}
    	.instInfoTitle {color:black; font-weight: bold; background-color: #E8E8E8; }
    </style>
    <script>

		function goListInstInfo() {
			let frm = document.frmInfoView;
			frm.action = "/instMgt/instList.do";
			frm.submit();
		}

		function goEditInstInfo() {
			let frm = document.frmInfoView;
			frm.srchWrtMode.value = "edit";
			frm.action = "/instMgt/instReg.do";
			frm.submit();
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
      <div class="container">
        <div class="breadcrumb">
          <span>홈</span><span>설정 관리</span><span>게시판 관리</span>
        </div>
        <!-- contants(s) -->
        <div class="contants">
          <div class="tit-wrap">
            <h1>게시판 등록/수정</h1>
          </div>
          <div class="control-wrap">
				<div>
					<table border="1" style="border-top-color: black; border-top-width: 3px; margin-top: 0px;">
						<caption></caption>
						<colgroup>
							<col style="width:100px"></col>
							<col style="width:300px"></col>
							<col style="width:100px"></col>
							<col style="width:300px"></col>
						</colgroup>
						<tbody>
							<tr>
								<th class="instInfoTitle">게시판 명 <span style="color:red;">*</span></th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;padding-right: 25px;">
									<div class="fm-ele">
										<input type="text"  placeholder="게시판명을 입력하세요.">
									</div>
								</td>
								<th class="instInfoTitle">게시판 유형 <span style="color:red;">*</span></th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
								<div class="fm-focus fm-select">
									<select id="srchClcTypeCd" name="srchClcTypeCd" style="padding-left: 10px;">
										<option value="" selected>선택</option>
										<option value="">공지형</option>
										<option value="">단답형</option>
										<option value="">계층형</option>
									</select>
								</div>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">게시판 설명</th>
								<td class="instInfo" colspan="3" style="text-align: left; padding-left: 25px;">
								<textarea rows="5" cols="180">게시판 설명을 입력하세요.</textarea>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">게시판 분류</th>
								<td class="instInfo" colspan="2"  style="text-align: left; padding-left: 25px;">
										<table class="list">
										<colgroup>
											<col style="width:10%"></col>
											<col style="width:50%"></col>
											<col style="width:10%"></col>
											<col style="width:15%"></col>
											<col style="width:15%px"></col>
										</colgroup>
										<thead>
										  <tr>
										    <th>순번</th>
										    <th>게시판 분류</th>
										    <th>순번</th>
										    <th>사용여부</th>
										    <th>삭제</th>
										  </tr>
										</thead>
										<tbody>  
										  <tr style="background-color: white;">
										    <td>1</td>
										    <td>미정</td>
										    <td>1</td>
										    <td>
										    <label class="switch">
											  <input type="checkbox" id="check16">
											  <span class="slider round"></span>
											</label>
											<p class="p16">OFF</p><p class="p16" style="display:none;">ON</p>
										    </td>
										    <td>
										    <button style="background-color: white; color:red; border-color: red; ">&nbsp;X&nbsp;</button>
										    </td>
										  </tr>
										  <tr style="background-color: white;">
										    <td>2</td>
										    <td>미정</td>
										    <td>2</td>
										    <td>
										    <label class="switch">
											  <input type="checkbox" id="check17">
											  <span class="slider round"></span>
											</label>
											<p class="p17">OFF</p><p class="p17" style="display:none;">ON</p>
										    </td>
										    <td>
										    <button style="background-color: white; color:red; border-color: red; ">&nbsp;X&nbsp;</button>
										    </td>
										  </tr>
										</tbody>
										</table>
								</td>
								<td class="instInfo"  style="text-align: left; padding-left: 25px;">
									<button type="button" class="btns" style="background-color: white; color: black; ">추가</button>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">답변 사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check1">
									  <span class="slider round"></span>
									</label>
									<p class="p1">OFF</p><p class="p1" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">댓글 사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check2">
									  <span class="slider round"></span>
									</label>
									<p class="p2">OFF</p><p class="p2" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">사용 여부</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check3">
									  <span class="slider round"></span>
									</label>
									<p class="p3">OFF</p><p class="p3" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">첨부 파일 사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check4">
									  <span class="slider round"></span>
									</label>
									<p class="p4">OFF</p><p class="p4" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">파일 제한 수</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;padding-right: 25px;">
									<div class="fm-ele">
										<input type="text"  placeholder="숫자만 입력하세요(0 일 경우 제한 없음)">
									</div>
								</td>
								<th class="instInfoTitle">파일 제한 용량</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;padding-right: 25px;">
									<div class="fm-ele">
										<input type="text"  placeholder="숫자만 입력하세요(0 일 경우 제한 없음)">
									</div>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">첨부 가능 파일</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;" colspan="3">
								<label for="agree1" class="chk_box1">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
									HWP
								</label>
								<label for="agree2" class="chk_box2">
									<input type="checkbox" id="agree2" checked="checked" />
									<span class="on2"></span>
									PDF
								</label>
								<label for="agree3" class="chk_box3">
									<input type="checkbox" id="agree3" checked="checked" />
									<span class="on3"></span>
									XML
								</label>
								<label for="agree4" class="chk_box4">
									<input type="checkbox" id="agree4" checked="checked" />
									<span class="on4"></span>
									HTML
								</label>
								<label for="agree" class="chk_box5">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on5"></span>
									TXT
								</label>
								<label for="agree" class="chk_box6">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on6"></span>
									ODS
								</label>
								<label for="agree" class="chk_box7">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on7"></span>
									EXE
								</label>
								<label for="agree" class="chk_box8">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on8"></span>
									BAK
								</label>
								<label for="agree" class="chk_box9">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on9"></span>
									INI
								</label>
								<label for="agree" class="chk_box10">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on10"></span>
									XLS
								</label>
								<label for="agree" class="chk_box11">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on11"></span>
									XLSX
								</label>
								<label for="agree" class="chk_box12">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on12"></span>
									DOC
								</label>
								<label for="agree" class="chk_box13">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on13"></span>
									DOCX
								</label>
								<label for="agree" class="chk_box14">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on14"></span>
									PPT
								</label>
								<label for="agree" class="chk_box15">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on15"></span>
									PPTX
								</label>
								<label for="agree" class="chk_box16">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on16"></span>
									ZIP
								</label>
								<label for="agree" class="chk_box17">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on17"></span>
									7z
								</label>
								<label for="agree" class="chk_box18">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on18"></span>
									ALZ
								</label>
								<label for="agree" class="chk_box19">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on19"></span>
									PNG
								</label>
								<label for="agree" class="chk_box20">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on20"></span>
									JPG
								</label>
								<label for="agree" class="chk_box21">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on21"></span>
									BMP
								</label>
								<label for="agree" class="chk_box22">
									<input type="checkbox" id="agree" checked="checked" />
									<span class="on22"></span>
									RAR
								</label>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">알림사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check5">
									  <span class="slider round"></span>
									</label>
									<p class="p5">OFF</p><p class="p5" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">연결 콘텐츠 사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check6">
									  <span class="slider round"></span>
									</label>
									<p class="p6">OFF</p><p class="p6" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">공지 개시</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check7">
									  <span class="slider round"></span>
									</label>
									<p class="p7">OFF</p><p class="p7" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">공지 제한 수</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;padding-right: 25px;">
									<div class="fm-ele">
										<input type="text"  placeholder="공지 게시할 게시물 수를 입력하세요.(숫자만)">
									</div>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">공지 게시 일</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;padding-right: 25px;">
									<div class="fm-ele">
										<input type="text"  placeholder="숫자만 입력하세요(0 일 경우 제한 없음)">
									</div>
								</td>
								<th class="instInfoTitle">확인 사용</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check8">
									  <span class="slider round"></span>
									</label>
									<p class="p8">OFF</p><p class="p8" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">신규 표시</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check9">
									  <span class="slider round"></span>
									</label>
									<p class="p9">OFF</p><p class="p9" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">신규 표시 일수</th>
								<td class="instInfo" style="text-align: left; ">
									<div class="search fm-ele">
										<input type="text"  placeholder="숫자만 입력하세요"><span style="margin-top: 16px; margin-left: 3px;">일</span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">진행 상태</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check10">
									  <span class="slider round"></span>
									</label>
									<p class="p10">OFF</p><p class="p10" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">비공개</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check11">
									  <span class="slider round"></span>
									</label>
									<p class="p11">OFF</p><p class="p11" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">통합 검색</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check12">
									  <span class="slider round"></span>
									</label>
									<p class="p12">OFF</p><p class="p12" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">평점 주기</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check13">
									  <span class="slider round"></span>
									</label>
									<p class="p13">OFF</p><p class="p13" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">공감 표시</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check14">
									  <span class="slider round"></span>
									</label>
									<p class="p14">OFF</p><p class="p14" style="display:none;">ON</p>
								</td>
								<th class="instInfoTitle">비공감 표시</th>
								<td class="instInfo" style="text-align: left; padding-left: 25px;">
									<label class="switch">
									  <input type="checkbox" id="check15">
									  <span class="slider round"></span>
									</label>
									<p class="p15">OFF</p><p class="p15" style="display:none;">ON</p>
								</td>
							</tr>
							<tr>
								<th class="instInfoTitle">페이지 표시 수</th>
								<td class="instInfo" style="text-align: left; padding-right: 25px;">
									<div class="search fm-ele">
										<input type="text"  placeholder="숫자만 입력하세요(최대 10)"><span style="margin-top: 16px; margin-left: 5px;">Page</span>
									</div>
								</td>
								<th class="instInfoTitle">페이지 게시물 수</th>
								<td class="instInfo" style="text-align: left; padding-right: 25px;">
									<div class="search fm-ele">
										<input type="text"  placeholder="숫자만 입력"><span style="margin-top: 16px; margin-left: 5px;">/Page</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>	
          </div>
          <div class="btn-wrap align-right">
          	<button type="button" class="btns" id="btnList" onclick="javascript:goListInstInfo(); return false;">목록</button>
            <button type="button" class="btns" id="btnEdit" onclick="javascript:goEditInstInfo(); return false;">수정</button>
          </div>
    </div>       
        </div>
        <!-- contants(e) -->
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
		var check4 = $("#check4");
		check4.click(function(){
			$(".p4").toggle();
		});
		var check5 = $("#check5");
		check5.click(function(){
			$(".p5").toggle();
		});
		var check6 = $("#check6");
		check6.click(function(){
			$(".p6").toggle();
		});
		var check7 = $("#check7");
		check7.click(function(){
			$(".p7").toggle();
		});
		var check8 = $("#check8");
		check8.click(function(){
			$(".p8").toggle();
		});
		var check9 = $("#check9");
		check9.click(function(){
			$(".p9").toggle();
		});
		var check10 = $("#check10");
		check10.click(function(){
			$(".p10").toggle();
		});
		var check11 = $("#check11");
		check11.click(function(){
			$(".p11").toggle();
		});
		var check12 = $("#check12");
		check12.click(function(){
			$(".p12").toggle();
		});
		var check13 = $("#check13");
		check13.click(function(){
			$(".p13").toggle();
		});
		var check14 = $("#check14");
		check14.click(function(){
			$(".p14").toggle();
		});
		var check15 = $("#check15");
		check15.click(function(){
			$(".p15").toggle();
		});
		var check16 = $("#check16");
		check16.click(function(){
			$(".p16").toggle();
		});
		var check17 = $("#check17");
		check17.click(function(){
			$(".p17").toggle();
		});
	</script>
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
	<!-- 첨부파일 체크 박스 CSS -->
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
	<!-- 첨부파일 체크 박스 CSS -->
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
	<!-- 첨부파일 체크 박스 CSS -->
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
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box5 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box5 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on5 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box5 input[type="checkbox"]:checked + .on5 { background: #f86480; }
		.on5:after { content: ""; position: absolute; display: none; }
		.chk_box5 input[type="checkbox"]:checked + .on5:after { display: block; }
		.on5:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box6 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box6 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on6 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box6 input[type="checkbox"]:checked + .on6 { background: #f86480; }
		.on6:after { content: ""; position: absolute; display: none; }
		.chk_box6 input[type="checkbox"]:checked + .on6:after { display: block; }
		.on6:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box7 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box7 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on7 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box7 input[type="checkbox"]:checked + .on7 { background: #f86480; }
		.on7:after { content: ""; position: absolute; display: none; }
		.chk_box7 input[type="checkbox"]:checked + .on7:after { display: block; }
		.on7:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box8 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box8 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on8 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box8 input[type="checkbox"]:checked + .on8 { background: #f86480; }
		.on8:after { content: ""; position: absolute; display: none; }
		.chk_box8 input[type="checkbox"]:checked + .on8:after { display: block; }
		.on8:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box9 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box9 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on9 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box9 input[type="checkbox"]:checked + .on9 { background: #f86480; }
		.on9:after { content: ""; position: absolute; display: none; }
		.chk_box9 input[type="checkbox"]:checked + .on9:after { display: block; }
		.on9:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box10 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box10 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on10 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box10 input[type="checkbox"]:checked + .on10 { background: #f86480; }
		.on10:after { content: ""; position: absolute; display: none; }
		.chk_box10 input[type="checkbox"]:checked + .on10:after { display: block; }
		.on10:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box11 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box11 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on11 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box11 input[type="checkbox"]:checked + .on11 { background: #f86480; }
		.on11:after { content: ""; position: absolute; display: none; }
		.chk_box11 input[type="checkbox"]:checked + .on11:after { display: block; }
		.on11:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box12 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box12 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on12 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box12 input[type="checkbox"]:checked + .on12 { background: #f86480; }
		.on12:after { content: ""; position: absolute; display: none; }
		.chk_box12 input[type="checkbox"]:checked + .on12:after { display: block; }
		.on12:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<style type="text/css">
		.chk_box13 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box13 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on13 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box13 input[type="checkbox"]:checked + .on13 { background: #f86480; }
		.on13:after { content: ""; position: absolute; display: none; }
		.chk_box13 input[type="checkbox"]:checked + .on13:after { display: block; }
		.on13:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box14 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box14 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on14 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box14 input[type="checkbox"]:checked + .on14 { background: #f86480; }
		.on14:after { content: ""; position: absolute; display: none; }
		.chk_box14 input[type="checkbox"]:checked + .on14:after { display: block; }
		.on14:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box15 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box15 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on15 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box15 input[type="checkbox"]:checked + .on15 { background: #f86480; }
		.on15:after { content: ""; position: absolute; display: none; }
		.chk_box15 input[type="checkbox"]:checked + .on15:after { display: block; }
		.on15:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box16 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box16 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on16 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box16 input[type="checkbox"]:checked + .on16 { background: #f86480; }
		.on16:after { content: ""; position: absolute; display: none; }
		.chk_box16 input[type="checkbox"]:checked + .on16:after { display: block; }
		.on16:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box17 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box17 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on17 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box17 input[type="checkbox"]:checked + .on17 { background: #f86480; }
		.on17:after { content: ""; position: absolute; display: none; }
		.chk_box17 input[type="checkbox"]:checked + .on17:after { display: block; }
		.on17:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box18 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box18 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on18 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box18 input[type="checkbox"]:checked + .on18 { background: #f86480; }
		.on18:after { content: ""; position: absolute; display: none; }
		.chk_box18 input[type="checkbox"]:checked + .on18:after { display: block; }
		.on18:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box19 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box19 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on19 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box19 input[type="checkbox"]:checked + .on19 { background: #f86480; }
		.on19:after { content: ""; position: absolute; display: none; }
		.chk_box19 input[type="checkbox"]:checked + .on19:after { display: block; }
		.on19:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box20 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box20 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on20 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box20 input[type="checkbox"]:checked + .on20 { background: #f86480; }
		.on20:after { content: ""; position: absolute; display: none; }
		.chk_box20 input[type="checkbox"]:checked + .on20:after { display: block; }
		.on20:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box21 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box21 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on21 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box21 input[type="checkbox"]:checked + .on21 { background: #f86480; }
		.on21:after { content: ""; position: absolute; display: none; }
		.chk_box21 input[type="checkbox"]:checked + .on21:after { display: block; }
		.on21:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
	<!-- 첨부파일 체크 박스 CSS -->
	<style type="text/css">
		.chk_box22 { display: inline-block; position: relative; padding-left: 30px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	
		/* 기본 체크박스 숨기기 */
		.chk_box22 input[type="checkbox"] { display: none; }
		
		/* 선택되지 않은 체크박스 스타일 꾸미기 */
		.on22 { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; }
		
		/* 선택된 체크박스 스타일 꾸미기 */
		.chk_box22 input[type="checkbox"]:checked + .on22 { background: #f86480; }
		.on22:after { content: ""; position: absolute; display: none; }
		.chk_box22 input[type="checkbox"]:checked + .on22:after { display: block; }
		.on22:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
	</style>
  </body>
</html>