<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>메뉴 목록</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="control-wrap">
		<input type="hidden" id="srchPopAuthrtId" name="srchPopAuthrtId" value="<c:out value="${srchPopInfo.paramPopAuthrtId}"/>">
		<input type="hidden" id="srchPopMenuTypeCd" name="srchPopMenuTypeCd" value="<c:out value="${srchPopInfo.paramPopMenuClsfCd}"/>">
		<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchPopInfo.paramPopPageNo}"/>">
		<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchPopInfo.paramPopPageRecordCnt}"/>">
		<div class="search">
			<div class="filter">
				<div class="row">
					<div class="fm-ele" data-size="100p">
						<input type="text" id="srchPopMenuString" name="srchPopMenuString" value="<c:out value="${srchPopInfo.paramPopMenuString}"/>" placeholder="메뉴명을 입력하세요."/>
					</div>
				</div>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btns " id="btnPopSrchListPage" name="btnPopSrchListPage" onclick="javascript:getPopListSrch(); return false;">조회</button>
				<button type="button" class="btns color-gray" id="btnPopSrchInitListPage" name="btnPopSrchInitListPage" onclick="javascript:getPopListSrchReset(); return false;">초기화</button>
			</div>
		</div>
	</div>
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="100px"></col>
				<col width="200px"></col>
				<col width="*"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>메뉴아이디</th>
					<th>메뉴명</th>
					<th>메뉴설명</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty popMenuInfoList}">
			<c:forEach var="popMenuData" items="${popMenuInfoList}" varStatus="status">
				<tr>
					<td><c:out value="${popMenuData.listMenuNo}"/></td>
					<td><c:out value="${popMenuData.menuId}"/><input type="hidden" id="popMenuId_${popMenuData.listMenuNo}" name="popMenuId" value="<c:out value="${popMenuData.menuId}"/>"></td>
					<td class="tl"><c:out value="${popMenuData.menuNm}"/><input type="hidden" id="popMenuNm_${popMenuData.listMenuNo}" name="popMenuNm" value="<c:out value="${popMenuData.menuNm}"/>"></td>
					<td><c:out value="${popMenuData.menuExplnCn}"/></td>
					<td><button type="button" id="btnAuthrtAddMenu" name="btnAuthrtAddMenu" class="btns size-xsmall" onclick="javascript:moveAddAuthrtMenuData('${popMenuData.listMenuNo}'); return false;">추가</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty popMenuInfoList}">
				<tr>
					<td colspan="10">No Data</td>
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
		let srchPopAuthrtId = $("#srchPopAuthrtId").val();
		let srchPopMenuTypeCd = $("#srchPopMenuTypeCd").val();
		let srchPopMenuString = $("#srchPopMenuString").val();
		let srchPopPageNo = $("#srchPopPageNo").val();
		let srchPopPageRecordCnt = $("#srchPopPageRecordCnt").val();
		let paramUrl = "";
		paramUrl += "/authMgt/popLayerMenuInfoList.do";
		paramUrl += "?srchPopAuthrtId=" + srchPopAuthrtId;
		paramUrl += "&srchPopMenuTypeCd=" + srchPopMenuTypeCd;
		paramUrl += "&srchPopMenuString=" + srchPopMenuString;
		paramUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;
		
		paramUrl = contextPath + paramUrl;
		$(".pop-layer").load(paramUrl);
	}
	
	// 검색폼 값을 초기화
	function getPopListSrchReset() {
		$("#srchPopMenuString").val("");
	}
	
	//선택한 페이징으로 이동
	function movePopListPageNo(paramDataInt) {
		$("#srchPopPageNo").val(paramDataInt);
		getPopListSrch();
	}
	
	// 이전페이지
	function movePopListPrevPage() {
		let popPageNo = $("#srchPopPageNo").val();
		let nowPageNo = parseInt(popPageNo, 10);
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
		let popPageNo = $("#srchPopPageNo").val();
		let maxPageNo = parseInt(${pagePopInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(popPageNo, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			movePopListPageNo(movePageNo);
		}
	}
</script>