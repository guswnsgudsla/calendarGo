<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">
	<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmListSrch" id="frmListSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchInstInfo.paramPageNo}">
			<input type="hidden" id="srchInstId" name="srchInstId" value="">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select">
							<select id="srchInstTypeCd" name="srchInstTypeCd">
								<option value="" <c:if test="${srchInstInfo.paramInstTypeCd == ''}">selected</c:if>>기관유형전체</option>
								<c:if test="${!empty instTypeCmmnCdList}">
									<c:forEach var="typeCdRow" items="${instTypeCmmnCdList}">
								<option value="${typeCdRow.cdId}" <c:if test="${srchInstInfo.paramInstTypeCd == typeCdRow.cdId }">selected</c:if>>${typeCdRow.cdNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchFldTypeCd" name="srchFldTypeCd">
								<option value="" <c:if test="${srchInstInfo.paramFldTypeCd == ''}">selected</c:if>>영역유형전체</option>
								<c:if test="${!empty fldTypeCmmnCdList}">
									<c:forEach var="fldCdRow" items="${fldTypeCmmnCdList}">
								<option value="${fldCdRow.cdId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.cdNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchClcTypeCd" name="srchClcTypeCd">
								<option value="" <c:if test="${srchInstInfo.paramClcTypeCd == ''}">selected</c:if>>수집유형전체</option>
								<c:if test="${!empty clcTypeCmmnCdList}">
									<c:forEach var="clcCdRow" items="${clcTypeCmmnCdList}">
								<option value="${clcCdRow.cdId}" <c:if test="${srchInstInfo.paramClcTypeCd == clcCdRow.cdId }">selected</c:if>>${clcCdRow.cdNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchCertChk" name="srchCertChk">
								<option value="" <c:if test="${srchInstInfo.paramCertChk == ''}">selected</c:if>>우수인증전체</option>
								<option value="Y" <c:if test="${srchInstInfo.paramCertChk == 'Y'}">selected</c:if>>인증보유</option>
								<option value="N" <c:if test="${srchInstInfo.paramCertChk == 'N'}">selected</c:if>>인증미보유</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fm-ele" data-size="100p">
							<input type="text" id="srchInstNm" name="srchInstNm" value="${srchInstInfo.paramInstNm}" placeholder="기관명을 입력하세요.">
						</div>
					</div>
				</div>
				<div class="btn-wrap">
				<c:if test="${UserAuthrtInfo.menuInqAuthrtYn == 'Y' }">
					<button type="button" class="btns" id="btnSrch" name="btnSrch" onclick="javascript:getListSrch(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnSrchInit" onclick="javascript:getListSrchReset(); return false;">초기화</button>
				</c:if>
				</div>
				
			</div>
				
		</form>
	</div>
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnEntry" onclick="javascript:moveRegInstInfo(); return false;">등록</button>
		</c:if>
	</div>

	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="100px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="100px"></col>
				<col width="120px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>기관아이디</th>
					<th>기관명</th>
					<th>기관코드</th>
					<th>기관유형</th>
					<th>영역유형</th>
					<th>수집유형</th>
					<th>등록문화자산</th>
					<th>우수인증</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty instInfoList}">
				<c:forEach var="instData" items="${instInfoList}" varStatus="status">
				<tr>
					<td>${instData.instListNo}</td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<td><a href="#" onclick="javascript:moveDltInstInfo('${instData.instId}'); return false;">${instData.instId}</a></td>
					<td class="align-left"><a href="#" onclick="javascript:moveDltInstInfo('${instData.instId}'); return false;">${instData.instNm}</a></td>
					<td><a href="#" onclick="javascript:moveDltInstInfo('${instData.instId}'); return false;">${instData.instCd}</a></td>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:moveAlterAuthrtInstInfo(); return false;">${instData.instId}</a></td>
					<td class="align-left"><a href="#" onclick="javascript:moveAlterAuthrtInstInfo(); return false;">${instData.instNm}</a></td>
					<td><a href="#" onclick="javascript:moveAlterAuthrtInstInfo(); return false;">${instData.instCd}</a></td>
				</c:if>
					<td>${instData.instTypeNm}</td>
					<td>${instData.fildTypeNm}</td>
					<td>${instData.clctTypeNm}</td>
					<td>${instData.regClrcsCnt}</td>
					<td>${instData.sprrCertYnNm}</td>
					<td>${instData.frstRegDtV19}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty instInfoList}">
				<tr>
					<td colspan="10">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<div class="align_flex paging">
		<div class="left">
		</div>
		<div class="pagination">
			<c:if test="${!empty pageInfo}">
				<c:if test="${pageInfo.paramPageNo == pageInfo.paramPageStartNo}">
			<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
				</c:if>
				<c:if test="${pageInfo.paramPageNo > pageInfo.paramPageStartNo}">
			<span class="navi prev"><a href="#" onclick="javascript:moveListPrevPage(); return false;">이전 페이지</a></span>
				</c:if>
				<c:forEach var="pi" begin="${pageInfo.paramPageStartNo}" end="${pageInfo.paramPageEndNo}">
					<c:if test="${pi == pageInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pi}</a></span></c:if>
					<c:if test="${pi != pageInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListPageNo('${pi}'); return false;">${pi}</a></span></c:if>
				</c:forEach>
				<c:if test="${pageInfo.paramPageNo < pageInfo.paramPageMaxNo}">
			<span class="navi next"><a href="#" onclick="javascript:moveListNextPage(); return false;">다음 페이지</a></span>
				</c:if>
				<c:if test="${pageInfo.paramPageNo == pageInfo.paramPageMaxNo}">
			<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
				</c:if>
			</c:if>
			<c:if test="${empty pageInfo}">
			<span class="navi prev">이전 페이지</span>
			<span class="active"><a href="#">1</a></span>
			<span class="navi next">다음 페이지</span>
			</c:if>
		</div>
		<div class="right">
		</div>
	</div>

	<!-- 콘텐츠 영역 끝  -->
</div>

<script type="text/javascript">

	/**
	 *  Page 렌더링 전 작업
	 */


	/**
	 *  Page 초기화
	 *  변수 정의
	 */
	var obj = document.querySelector("do");
	var frm = document.frmInstSrch;

	/**
	 * 이벤트 핸들링
	 */
	//$("#btnSrch").click()

	// fetch함수
	// axio



	/**
	 * 동적메소드 선언
	 */

	//메소드일경우 행위 정보 (get, set, modify...)
	var getInstSrchParam = function () {

	}



	var moveDtlPage = function () {

	}


	function getListSrch() {
		let frm = document.frmListSrch;
		frm.action = contextPath + "/instMgt/instList.do";
		frm.submit();
	}

	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchInstNm.value = "";
		frm.srchInstTypeCd.value = "";
		frm.srchFldTypeCd.value = "";
		frm.srchClcTypeCd.value = "";
		frm.srchCertChk.value = "";
	}
	
	function moveAlterAuthrtInstInfo() {
		alert("보기 권한이 없어 확인이 불가능합니다.");
		return false;
	}
	
	//
	function moveDltInstInfo(paramDataString) {
		let frm = document.frmListSrch;
		frm.srchInstId.value = paramDataString;
		frm.action = contextPath + "/instMgt/instDtl.do";
		frm.submit();
	}
	
	//
	function moveRegInstInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/instMgt/instReg.do";
		frm.submit();
	}
	

	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.srchPageNo.value = paramDataInt;
		frm.action = contextPath + "/instMgt/instList.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListPrevPage() {
		let frm = document.frmListSrch;
		let nowPageNo = parseInt(frm.srchPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListNextPage() {
		let frm = document.frmListSrch;
		let maxPageNo = parseInt(${pageInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListPageNo(movePageNo);
		}
	}

</script>