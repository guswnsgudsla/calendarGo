<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>권한관리 메뉴 팝업</title>
	</head>
<body >
			<div class="contants" style="">
				<!-- 콘텐츠 영역 -->
				<div style="background-color: #376092; color: white; padding: 5px; text-align: left;">
					<span style="margin-right: 985px;;">
					권한 메뉴 관리 팝업
					</span>
					<button type="button" class="closeBtn" style="color:white; border-color: white; ">&nbsp;X&nbsp;</button>
				</div>
				<div class="control-wrap" style="background-color: white; border: none;">
						<div class="search fm-ele" style="width:60%; ">
							<span style="width:19%; padding-top: 10px;  background-color: #EBEBEB;">메뉴 명 :</span>
							<input type="text" placeholder="메뉴 명을 입력하세요.">
						</div>
						<div class="fm-ele" style="width:60%; margin-left: 25px;">
						<div class="search fm-ele" style="padding-left: 0px; justify-content: start;">
							<span style="float: left;padding: 10px;background-color: #EBEBEB;">메뉴 유형 : </span>
								<div class="fm-focus fm-select">
									<select id="" name="" class="" title="권한 유형" style="padding-left: 10px;">
	                            		<option value="" selected="selected">기관 관리자</option>
	                            		<option value="" >포털 사용자</option>
	                            		<option value="" >슈퍼 관리자</option>
	                        		</select>
	                        	</div>
	                        	<span style="margin-left:10px; padding: 10px; background-color: #EBEBEB; ">사용 유무 : </span>
								<div class="fm-focus fm-select">
									<select id="" name="" class="" title="사용 여부" style="padding-left: 10px;">
	                            		<option value="" selected="selected">사용</option>
	                            		<option value="" >미사용</option>
	                            		<option value="" >전체</option>
	                        		</select>
	                        	</div>
							</div>
						</div>
					</div>
				<div style="margin-top: 20px; margin-right:10px; text-align: right;" >
					<button type="button" class="btns" id="" onclick="javascript:goInstSrchParam(); return false;">조회</button>
					<button type="button" class="btns" id="" onclick="javascript:goEntryInstInfo(); return false;">추가</button>
				</div>
				
				<table class="list" style="padding: 15px; padding-top:5px; padding-bottom:0px; border:none;">
					<caption></caption>
					<colgroup>
						<col width="50px"></col>
						<col width="*"></col>
						<col width="*"></col>
						<col width="*"></col>
						<col width="*"></col>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>메뉴 명</th>
							<th>메뉴 설명</th>
							<th>메뉴 유형</th>
							<th>메뉴 추가</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree5" class="chk_box5" style="margin-left: 12px;">
									<input type="checkbox" id="agree5" checked="checked" />
									<span class="on5"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
								</label>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항 게시판</td>
							<td>기관 관리자</td>
							<td >
								<label for="agree1" class="chk_box1" style="margin-left: 12px;">
									<input type="checkbox" id="agree1" checked="checked" />
									<span class="on1"></span>
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
				<div style="text-align: center;margin: 25px; ">
					<button type="button" class="btns closeBtn" >닫기</button>
				</div>
				<!-- 콘텐츠 영역 끝  -->
			</div>
		</div>
<script type="text/javascript">
	$('.closeBtn').click(function(){
		$(".modal").css("display","none");
	});
</script>
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

<script>
//체크박스 jquery 함수
	var check1 = $("#check1");
	check1.click(function(){
		$(".p1").toggle();
	});

</script>
</body>
</html>