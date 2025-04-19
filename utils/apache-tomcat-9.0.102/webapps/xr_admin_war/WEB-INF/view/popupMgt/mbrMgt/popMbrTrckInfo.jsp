<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>산출물 추적 이력</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="table-wrap">
		<form name="frmPopListSrch" id="frmPopListSrch" method="post" action="#">
			<input type="hidden" id="srchTrckId" name="srchTrckId" value="<c:out value="${srchPopInfo.paramPrdctTrckId}"/>">
			<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchPopInfo.paramPopPageNo}"/>">
			<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchPopInfo.paramPopPageRecordCnt}"/>">
		</form>
		<h2></h2>
		<table>
			<caption></caption>
			<colgroup>
				<col width="200px;"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>산출물명</th>
					<td class="tl pl10"><c:out value="${prdctTrckInfo.clrcsNm}"/></td>
				</tr>
				<tr>
					<th>사용URL</th>
					<td class="tl pl10"><c:out value="${prdctTrckInfo.contsUseUrlAddr}"/></td>
				</tr>
			</tbody>
		</table>
		<table class="table-small">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="200px"></col>
				<col width="*"></col>
				<col width="200px;"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>추적일련번호</th>
					<th>상태</th>
					<th>추적일시</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty popPrdctTrckList}">
			<c:forEach var="popTrckData" items="${popPrdctTrckList}" varStatus="status">
				<tr>
					<td><c:out value="${popTrckData.listTrckNo}"/></td>
					<td><c:out value="${popTrckData.trckSn}"/></td>
					<td><c:out value="${popTrckData.nmlYnNm}"/></td>
					<td><c:out value="${popTrckData.trckDtV19}"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty popPrdctTrckList}">
				<tr>
					<td colspan="4" class="tc">No Data</td>
				</tr>
		</c:if>
			</tbody>
		</table>
	</div>
	<div class="align_flex center">
		<div class="pagination">
		<c:if test="${!empty pagePopInfo}">
			<c:if test="${pagePopInfo.paramPageNo == pagePopInfo.paramPageStartNo}">
			<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
			</c:if>
			<c:if test="${pagePopInfo.paramPageNo > pagePopInfo.paramPageStartNo}">
			<span class="navi prev"><a href="#" onclick="javascript:movePopListPrevPage(); return false;">이전 페이지</a></span>
			</c:if>
			<c:forEach var="pi" begin="${pagePopInfo.paramPageStartNo}" end="${pagePopInfo.paramPageEndNo}">
			<c:if test="${pi == pagePopInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pi}</a></span></c:if>
			<c:if test="${pi != pagePopInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:movePopListPageNo('${pi}'); return false;">${pi}</a></span></c:if>
			</c:forEach>
			<c:if test="${pagePopInfo.paramPageNo < pagePopInfo.paramPageMaxNo}">
			<span class="navi next"><a href="#" onclick="javascript:movePopListNextPage(); return false;">다음 페이지</a></span>
			</c:if>
			<c:if test="${pagePopInfo.paramPageNo == pagePopInfo.paramPageMaxNo}">
			<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
			</c:if>
		</c:if>
		<c:if test="${empty pagePopInfo}">
			<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
			<span class="active"><a href="#">1</a></span>
			<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
		</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
	function getPopListSrch() {
		
		let srchTrckId = $("#srchTrckId").val();
		let srchPopPageNo = $("#srchPopPageNo").val();
		let srchPopPageRecordCnt = $("#srchPopPageRecordCnt").val();
		let paramUrl = "";
		paramUrl += "/mbrMgt/popLayerTrckInfo.do";
		paramUrl += "?srchTrckId=" + srchTrckId;
		paramUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;
		paramUrl = contextPath +  paramUrl;
		$(".pop-layer").load(paramUrl);
	}
	
	//선택한 페이징으로 이동
	function movePopListPageNo(paramDataInt) {
		let frm = document.frmPopListSrch;
		frm.srchPopPageNo.value = paramDataInt;
		getPopListSrch();
	}
	
	// 이전페이지
	function movePopListPrevPage() {
		let frm = document.frmPopListSrch;
		let nowPageNo = parseInt(frm.srchPopPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			movePopListPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function movePopListNextPage() {
		let frm = document.frmPopListSrch;
		let maxPageNo = parseInt(${pagePopInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchPopPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			movePopListPageNo(movePageNo);
		}
	}
</script>