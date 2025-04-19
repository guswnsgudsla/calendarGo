<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>
<style type="text/css">
	.instInfo {color:black;}
	.instInfoTitle {color:black; font-weight: bold; background-color: #E8E8E8; }
</style>

<div class="contants">
	
	<div class="table-wrap write">
		<form name="frmInfoView" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchInstInfo.paramPageNo}">
			<input type="hidden" id="srchInstId" name="srchInstId" value="${srchInstInfo.paramInstId}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchInstNm" name="srchInstNm" value="${srchInstInfo.paramInstNm}">
			<input type="hidden" id="srchInstTypeCd" name="srchInstTypeCd" value="${srchInstInfo.paramInstTypeCd}">
			<input type="hidden" id="srchFldTypeCd" name="srchFldTypeCd" value="${srchInstInfo.paramFldTypeCd}">
			<input type="hidden" id="srchClcTypeCd" name="srchClcTypeCd" value="${srchInstInfo.paramClcTypeCd}">
			<input type="hidden" id="srchCertChk" name="srchCertChk" value="${srchInstInfo.paramCertChk}">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="${srchInstInfo.paramTabPstnId}">
			<input type="hidden" id="srchTabUserListPageNo" name="srchTabUserListPageNo" value="${srchInstInfo.paramTabUserListPageNo}">
			<input type="hidden" id="srchTabUserRecordCnt" name="srchTabUserRecordCnt" value="${srchInstInfo.paramTabUserRecordCnt}">
			<input type="hidden" id="srchTabDclrcsListPageNo" name="srchTabDclrcsListPageNo" value="${srchInstInfo.paramTabDclrcsListPageNo}">
			<input type="hidden" id="srchTabDclrcsRecordCnt" name="srchTabDclrcsRecordCnt" value="${srchInstInfo.paramTabDclrcsRecordCnt}">
			<input type="hidden" id="srchTabDgtlClcListPageNo" name="srchTabDgtlClcListPageNo" value="${srchInstInfo.paramTabDgtlClcListPageNo}">
			<input type="hidden" id="srchTabDgtlClcRecordCnt" name="srchTabDgtlClcRecordCnt" value="${srchInstInfo.paramTabDgtlClcRecordCnt}">
		</form>
	
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:100px"></col>
				<col style="width:300px"></col>
				<col style="width:100px"></col>
				<col style="width:300px"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>기관 명</th>
					<td colspan="3">${instInfo.instNm}</td>
				</tr>
				<tr>
					<th>기관아이디</th>
					<td >${instInfo.instId}</td>
					<th>기관 코드</th>
					<td >${instInfo.instCd}</td>
				</tr>
				<tr>
					<th>기관 유형</th>
					<td >${instInfo.instTypeNm}</td>
					<th>영역 유형</th>
					<td >${instInfo.fildTypeNm}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td >${instInfo.instTelno}</td>
					<th>팩스번호</th>
					<td >${instInfo.instFxno}</td>
				</tr>
				<tr>
					<th>기관 설명</th>
					<td colspan="3">${instInfo.instExpln}</td>
				</tr>
				<tr>
					<th>기관 대표이미지</th>
					<td colspan="3">
						<c:if test="${!empty instAtchFileList}">
							<c:forEach var="atchFileData" items="${instAtchFileList}" varStatus="status">
								<c:url var="url" value="/cmmn/downloadFile.do">
									<c:param name="filePath" value="${atchFileData.fileStrgPathNm}" />
									<c:param name="fileNm" value="${atchFileData.strgFileNm}" />
									<c:param name="orgnlFileNm" value="${atchFileData.orgnlAtchFileNm}" />
								</c:url>
								<p><a href="${url}">
									<c:out value="${atchFileData.orgnlAtchFileNm}" /> (<c:out value="${atchFileData.fileSz}"/>)
								</a></p>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>누리집 주소</th>
					<td>${instInfo.hmpgAddr}</td>
					<th>지역</th>
					<td>${instInfo.rgnNm}</td>
				</tr>
				<tr>
					<th>수집 유형</th>
					<td >${instInfo.clctTypeNm}</td>
					<th>수집 주기</th>
					<td >${instInfo.clctCyclNm}</td>
				</tr>
				<tr>
					<th>우수 인증</th>
					<td >${instInfo.sprrCertYnNm} (${instInfo.sprrCertYmdV10})</td>
					<th>우수 인증 승인자</th>
					<td >${instInfo.sprrAtnsrNm} (${instInfo.sprrAtnsrId})</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td >${instInfo.frstRegDtV19}</td>
					<th>등록자</th>
					<td >${instInfo.frstRgtrNm} (${instInfo.frstRgtrId})</td>
				</tr>
				<tr>
					<th>기관 공개</th>
					<td >${instInfo.rlsYnNm} (${instInfo.rlsDtV19})</td>
					<th>폐지</th>
					<td >${instInfo.ablYnNm} (${instInfo.ablYmdV10})</td>
				</tr>
				<tr>
					<th>보유 문화자원</th>
					<td >${instInfo.regClrcsCnt}</td>
					<th>컬렉션</th>
					<td >${instInfo.regExbiCnt}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListInstInfo(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnMoveEditPage" name="btnMoveEditPage" onclick="javascript:moveEditInstInfo(); return false;">수정</button>
		</c:if>
	</div>
	
	<div class="tab-wrap as-tab-wrap"><!-- 탭 액션 class=as-tab-wrap 추가 -->
		<ul class="tab-menu">
			<li id="tabInstUSR" <c:if test="${srchInstInfo.paramTabPstnId eq 'USR'}">class="active"</c:if>><a href="#" onclick="javascript:moveInsDtlTapChange('USR'); return false;">기관담당자</a></li>
			<li id="tabInstDCR" <c:if test="${srchInstInfo.paramTabPstnId eq 'DCR'}">class="active"</c:if>><a href="#" onclick="javascript:moveInsDtlTapChange('DCR'); return false;">디지털 문화자원</a></li>
			<li id="tabInstEXH" <c:if test="${srchInstInfo.paramTabPstnId eq 'EXH'}">class="active"</c:if>><a href="#" onclick="javascript:moveInsDtlTapChange('EXH'); return false;">컬렉션</a></li>
		</ul>
		
		<div class="inner-depth">
			<div class="tab-inner" id="tabInstUserList">
				<div class="table-wrap">
					<table class="list">
						<caption></caption>
						<colgroup>
							<col width="50px"></col>
							<col width="150px"></col>
							<col width="200px;"></col>
							<col width="*"></col>
							<col width="100px"></col>
							<col width="100px;"></col>
							<col width="200px;"></col>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>담당자 아이디</th>
								<th>담당자 명</th>
								<th>담당자 별칭</th>
								<th>권한</th>
								<th>승인</th>
								<th>신청일시</th>
							</tr>
						</thead>
						<tbody>
					<c:if test="${!empty instUserInfoList}">
						<c:forEach var="instUserData" items="${instUserInfoList}" varStatus="status">
							<tr>
								<td>${instUserData.userListNo}</td>
								<td><c:out value="${pf:getMaskingID(instUserData.userId)}" /></td>
								<td><c:out value="${pf:getMaskingName(instUserData.userNm)}" /></td>
								<td>${instUserData.userNcm}</td>
								<td>${instUserData.userTypeCdNm}</td>
								<td>${instUserData.aprvYnNm}</td>
								<td>${instUserData.frstRegDtV19}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty instUserInfoList}">
							<tr>
								<td colspan="7">No Data</td>
							</tr>
					</c:if>
						</tbody>
					</table>
					
					<div class="pagination">
					<c:if test="${!empty pageUserInfo}">
						<c:if test="${pageUserInfo.paramPageNo == pageUserInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageUserInfo.paramPageNo > pageUserInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="javascript:moveListPrevPage('USR'); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pui" begin="${pageUserInfo.paramPageStartNo}" end="${pageUserInfo.paramPageEndNo}">
							<c:if test="${pui == pageUserInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pui}</a></span></c:if>
							<c:if test="${pui != pageUserInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListPageNo('USR', '${pui}'); return false;">${pui}</a></span></c:if>
						</c:forEach>
						<c:if test="${pageUserInfo.paramPageNo < pageUserInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="javascript:moveListNextPage('USR'); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageUserInfo.paramPageNo == pageUserInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageUserInfo}">
						<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						<span class="active"><a href="#" onclick="return false;">1</a></span>
						<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
					</c:if>
					</div>
				</div>
			</div>
			<div class="tab-inner" id="tabInstDcrInfoList">
				<div class="table-wrap">
					<table class="list">
						<caption></caption>
						<colgroup>
							<col width="50px"></col>
							<col width="170px;"></col>
							<col width="*"></col>
							<col width="100px"></col>
							<col width="100px"></col>
							<col width="100px;"></col>
							<col width="100px;"></col>
							<col width="100px"></col>
							<col width="180px"></col>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>문화자원 아이디</th>
								<th>문화자원 명</th>
								<th>국적</th>
								<th>시대</th>
								<th>재질</th>
								<th>산출물 수</th>
								<th>조회수</th>
								<th>등록일시</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${!empty instDclrcsInfoList}">
							<c:forEach var="instDclrcsData" items="${instDclrcsInfoList}" varStatus="status">
							<tr>
								<td>${instDclrcsData.listClrcsNo}</td>
								<td>${instDclrcsData.clrcsId}</td>
								<td>${instDclrcsData.clrcsNm}</td>
								<td>${instDclrcsData.clrcsNtnNm}</td>
								<td>${instDclrcsData.clrcsTageNm}</td>
								<td>${instDclrcsData.clrcsMtrNm}</td>
								<td>${instDclrcsData.clrcsPrdctCnt}</td>
								<td>${instDclrcsData.inqCnt}</td>
								<td>${instDclrcsData.frstRegDtV19}</td>
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty instDclrcsInfoList}">
							<tr>
								<td colspan="9">No Data</td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<div class="pagination">
						<c:if test="${!empty pageDclrcsInfo}">
							<c:if test="${pageDclrcsInfo.paramPageNo == pageDclrcsInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
							</c:if>
							<c:if test="${pageDclrcsInfo.paramPageNo > pageDclrcsInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="javascript:moveListPrevPage('DCR'); return false;">이전 페이지</a></span>
							</c:if>
							<c:forEach var="pdi" begin="${pageDclrcsInfo.paramPageStartNo}" end="${pageDclrcsInfo.paramPageEndNo}">
								<c:if test="${pdi == pageDclrcsInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pdi}</a></span></c:if>
								<c:if test="${pdi != pageDclrcsInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListPageNo('DCR', '${pdi}'); return false;">${pdi}</a></span></c:if>
							</c:forEach>
							<c:if test="${pageDclrcsInfo.paramPageNo < pageDclrcsInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="javascript:moveListPrevPage('DCR'); return false;">다음 페이지</a></span>
							</c:if>
							<c:if test="${pageDclrcsInfo.paramPageNo == pageDclrcsInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
							</c:if>
						</c:if>
						<c:if test="${empty pageDclrcsInfo}">
							<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
							<span class="active"><a href="#">1</a></span>
							<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</div>
				</div>
			</div>
			<div class="tab-inner" id="tabInstDcInfoList">
				<div class="table-wrap">
					<table class="list">
						<caption></caption>
						<colgroup>
							<col width="50px"></col>
							<col width="100px"></col>
							<col width="*"></col>
							<col width="100px"></col>
							<col width="100px"></col>
							<col width="200px;"></col>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>컬렉션 아이디</th>
								<th>컬렉션 명</th>
								<th>문화자원 수</th>
								<th>공개</th>
								<th>등록 일시</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${!empty instDgtlClcInfoList}">
							<c:forEach var="instDgtlClcData" items="${instDgtlClcInfoList}" varStatus="status">
							<tr>
								<td>${instDgtlClcData.dgtlClcListNo}</td>
								<td>${instDgtlClcData.exbiId}</td>
								<td>${instDgtlClcData.exbiNm}</td>
								<td>${instDgtlClcData.relCnt}</td>
								<td>${instDgtlClcData.rlsYnNm}</td>
								<td>${instDgtlClcData.frstRegDtV19}</td>
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty instDgtlClcInfoList}">
							<tr>
								<td colspan="6">No Data</td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<div class="pagination">
						<c:if test="${!empty pageDgtlClcInfo}">
							<c:if test="${pageDgtlClcInfo.paramPageNo == pageDgtlClcInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
							</c:if>
							<c:if test="${pageDgtlClcInfo.paramPageNo > pageDgtlClcInfo.paramPageStartNo}">
						<span class="navi prev"><a href="#" onclick="javascript:moveListPrevPage('EXH'); return false;">이전 페이지</a></span>
							</c:if>
							<c:forEach var="pdci" begin="${pageDgtlClcInfo.paramPageStartNo}" end="${pageDgtlClcInfo.paramPageEndNo}">
								<c:if test="${pdci == pageDgtlClcInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pdci}</a></span></c:if>
								<c:if test="${pdci != pageDgtlClcInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListPageNo('EXH', '${pdci}'); return false;">${pdci}</a></span></c:if>
							</c:forEach>
							<c:if test="${pageDgtlClcInfo.paramPageNo < pageDgtlClcInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="javascript:moveListNextPage('EXH'); return false;">다음 페이지</a></span>
							</c:if>
							<c:if test="${pageDgtlClcInfo.paramPageNo == pageDgtlClcInfo.paramPageMaxNo}">
						<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
							</c:if>
						</c:if>
						<c:if test="${empty pageDgtlClcInfo}">
							<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
							<span class="active"><a href="#" onclick="return false;">1</a></span>
							<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
<script>
	/**
	 *  Page 렌더링 전 작업
	 */
	
	
	/**
	 * Page 초기화
	 * 변수 정의
	 */
	
	
	 /**
	 * 이벤트 핸들링
	 */
	 //버튼 이벤트
	
	/*
	$("#btnMoveListPage").click(moveListInstInfo);
	$("#btnMoveEditPage").click(moveEditInstInfo);
	*/

	function moveListInstInfo() {
		let frm = document.frmInfoView;
		frm.action = contextPath + "/instMgt/instList.do";
		frm.submit();
	}

	function moveEditInstInfo() {
		let frm = document.frmInfoView;
		frm.srchWrtMode.value = "edit";
		frm.action = contextPath + "/instMgt/instReg.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramTabId, paramDataInt) {
		let frm = document.frmInfoView;
		frm.srchTabPstnId = paramTabId;
		if (paramTabId == "USR") {
			frm.srchTabUserListPageNo.value = paramDataInt;
		} else if (paramTabId == "DCR") {
			frm.srchTabDclrcsListPageNo.value = paramDataInt;
		} else if (paramTabId == "EXH") {
			frm.srchTabDgtlClcListPageNo.value = paramDataInt;
		}
		frm.action = contextPath + "/instMgt/instDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListPrevPage(paramTabId) {
		let frm = document.frmInfoView;
		let nowPageNo = 1;
		let movePageNo = 0;
		if (paramTabId == "USR") {
			nowPageNo = parseInt(frm.srchTabUserListPageNo.value, 10);
		} else if (paramTabId == "DCR") {
			nowPageNo = parseInt(frm.srchTabDclrcsListPageNo.value, 10);
		} else if (paramTabId == "EXH") {
			nowPageNo = parseInt(frm.srchTabDgtlClcListPageNo.value, 10);
		}
		movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListPageNo(paramTabId, movePageNo);
		}
	}
	
	// 다음페이지
	function moveListNextPage(paramTabId) {
		let frm = document.frmInfoView;
		let maxPageNo = 1;
		let nowPageNo = 1;
		if (paramTabId == "USR") {
			maxPageNo = parseInt(${pageUserInfo.paramPageMaxNo}, 10);
			nowPageNo = parseInt(frm.srchTabUserListPageNo.value, 10);
		} else if (paramTabId == "DCR") {
			maxPageNo = parseInt(${pageDclrcsInfo.paramPageMaxNo}, 10);
			nowPageNo = parseInt(frm.srchTabDclrcsListPageNo.value, 10);
		} else if (paramTabId == "EXH") {
			maxPageNo = parseInt(${pageDgtlClcInfo.paramPageMaxNo}, 10);
			nowPageNo = parseInt(frm.srchTabDgtlClcListPageNo.value, 10);
		}
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListPageNo(paramTabId, movePageNo);
		}
	}
	
	function moveInsDtlTapChange(paramInstTabId) {
		let oldInstTabPstnId = $("#srchTabPstnId").val();
		if (oldInstTabPstnId != "") {
			$("#tabInst" + oldInstTabPstnId).removeClass("active");
		}
		
		if (paramInstTabId != "") {
			$("#tabInst" + paramInstTabId).addClass("active");
		}
		$("#srchTabPstnId").val(paramInstTabId);
	}
	
	
</script>