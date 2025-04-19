<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>권한 변경 이력</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="table-wrap">
		<form name="frmPopListSrch" id="frmPopListSrch" method="post" action="#">
			<input type="hidden" id="srchPopAuthrtId" name="srchPopAuthrtId" value="<c:out value="${srchPopAuthInfo.paramAuthrtId}"/>">
			<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchPopAuthInfo.paramPageNo}"/>">
			<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchPopAuthInfo.paramRecordCnt}"/>">
		</form>
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="100px"></col>
				<col width="*"></col>
				<col width="150px"></col>
				<col width="100px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>변경유형</th>
					<th>권한명</th>
					<th>권한유형</th>
					<th>사용여부</th>
					<th>변경자</th>
					<th>변경일자</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty popAuthrtChgHstryList}">
			<c:forEach var="popAuthrtChgData" items="${popAuthrtChgHstryList}" varStatus="status">
				<tr>
					<td><c:out value="${popAuthrtChgData.listChgHstryNo}"/></td>
					<td><c:out value="${popAuthrtChgData.chgHstryTypeNm}"/></td>
					<td><c:out value="${popAuthrtChgData.authrtNm}"/></td>
					<td><c:out value="${popAuthrtChgData.authrtTypeNm}"/></td>
					<td><c:out value="${popAuthrtChgData.useYnNm}"/></td>
					<td><c:out value="${popAuthrtChgData.rgtrNcm}"/>(<c:out value="${popAuthrtChgData.rgtrId}"/>)</td>
					<td><c:out value="${popAuthrtChgData.regDtV19}"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty popAuthrtChgHstryList}">
				<tr>
					<td colspan="7">No Data</td>
				</tr>
		</c:if>	
			</tbody>
		</table>
	</div>
	
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
	
	<!-- <div class="btn-wrap align-right">
		<button type="button" class="btns size-small color-gray" id="btnPopLayerClose" name="btnPopLayerClose" onclick="javascript:moveClosePopupList(); return false;">닫기</button>
	</div> -->
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
	function getPopListSrch() {
		let srchPopAuthrtId = $("#srchPopDispId").val();
		let srchPopPageNo = $("#srchPopPageNo").val();
		let srchPopPageRecordCnt = $("#srchPopPageRecordCnt").val();
		let paramUrl = "";
		paramUrl += "/authMgt/popLayerAuthrtChgHstry.do";
		paramUrl += "?srchPopAuthrtId=" + srchPopAuthrtId;
		paramUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;
		
		paramUrl = contextPath + paramUrl;
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