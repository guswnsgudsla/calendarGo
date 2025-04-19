<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>컬렉션 조회</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
		
	</div>
	
	<div class="control-wrap">
		<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
		<input type="hidden" id="srchPopDispId" name="srchPopDispId" value="<c:out value="${srchPopInfo.paramPopDispId}"/>">
		<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchPopInfo.paramPopPageNo}"/>">
		<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchPopInfo.paramPopPageRecordCnt}"/>">
		<div class="search">
			<div class="filter">
				<div class="row">
					<div class="fm-focus fm-select">
						<select id="srchPopDgtlClcDiv" name="srchPopDgtlClcDiv" >
							<option value="ID" <c:if test="${srchPopInfo.paramPopDgtlClcDiv == 'ID'}">selected</c:if>>컬렉션 ID</option>
							<option value="NM" <c:if test="${srchPopInfo.paramPopDgtlClcDiv == 'NM'}">selected</c:if>>컬렉션 명</option>
						</select>
					</div>
					<div class="fm-ele" >
						<input type="text" id="srchPopDgtlClcString" name="srchPopDgtlClcString" value="<c:out value="${srchPopInfo.paramPopDgtlClcString}"/>" placeholder="검색어를 입력하세요.">
					</div>
					<div class="fm-focus fm-select">
						<select id="srchPopInstDiv" name="srchPopInstDiv" >
							<option value="ID" <c:if test="${srchPopInfo.paramPopInstDiv == 'ID'}">selected</c:if>>기관 ID</option>
							<option value="NM" <c:if test="${srchPopInfo.paramPopInstDiv == 'NM'}">selected</c:if>>기관 명</option>
						</select>
					</div>
					<div class="fm-ele" >
						<input type="text" id="srchPopInstString" name="srchPopInstString" value="<c:out value="${srchPopInfo.paramPopInstString}"/>" placeholder="검색어를 입력하세요.">
					</div>
				</div>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btns" id="btnSrch" onclick="javascript:getPopListSrch(); return false;">조회</button>
				<button type="button" class="btns color-gray" id="btnSrchInit" onclick="javascript:getPopListSrchReset(); return false;">초기화</button>
			</div>
		</div>
	</div>
	
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="100px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="100px"></col>
				<col width="120px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>컬렉션 ID</th>
					<th>컬렉션 명</th>
					<th>기관</th>
					<th>문화자원 수</th>
					<th>전시여부</th>
					<th>추가</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty popExhItemList}">
			<c:forEach var="popExhData" items="${popExhItemList}" varStatus="status">
				<tr>
					<td>${popExhData.listPopNo}</td>
					<td>${popExhData.exbiId}<input type="hidden" id="hdnExhItemId_${popExhData.exbiId}" name="hdnExhItemId_${popExhData.exbiId}" value="<c:out value="${popExhData.exbiId}"/>"></td>
					<td>${popExhData.exbiNm}<input type="hidden" id="hdnExhItemNm_${popExhData.exbiId}" name="hdnExhItemNm_${popExhData.exbiId}" value="<c:out value="${popExhData.exbiNm}"/>"></td>
					<td>${popExhData.instNm}<input type="hidden" id="hdnExhItemInstNm_${popExhData.exbiId}" name="hdnExhItemInstNm_${popExhData.exbiId}" value="<c:out value="${popExhData.instNm}"/>"></td>
					<td><fmt:formatNumber value="${popExhData.exbiClrcsCnt}"/><input type="hidden" id="hdnExhItemCnt_${popExhData.exbiId}" name="hdnExhItemCnt_${popExhData.exbiId}" value="<c:out value="${popExhData.exbiClrcsCnt}"/>"></td>
					<td>
						<div class="switch-button" data-size="w100" style="height: 30px;">
							<span><input type="radio" id="rlsYnY_${popExhData.exbiId}" name="rlsYn_${popExhData.exbiId}" value="Y" <c:if test="${popExhData.exbiRlsYn == 'Y'}">checked</c:if> disabled/><label for="rlsYnY_${popExhData.exbiId}">Yes</label></span>
							<span><input type="radio" id="rlsYnN_${popExhData.exbiId}" name="rlsYn_${popExhData.exbiId}" value="N" <c:if test="${popExhData.exbiRlsYn == 'N'}">checked</c:if> disabled/><label for="rlsYnN_${popExhData.exbiId}">No</label></span>
						</div>
					</td>
					<td><button type="button" id="btnAddExhItem" name="btnAddExhItem" class="btns size-xsmall" onclick="javascript:moveAddExhDgtlClcData('${popExhData.exbiId}'); return false;">추가</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty popExhItemList}">
				<tr>
					<td colspan="7">No Data</td>
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
		
		let srchPopDispId = $("#srchPopDispId").val();
		let srchPopPageNo = $("#srchPopPageNo").val();
		let srchPopPageRecordCnt = $("#srchPopPageRecordCnt").val();
		let srchPopDgtlClcDiv = $("#srchPopDgtlClcDiv").val();
		let srchPopDgtlClcString = $("#srchPopDgtlClcString").val();
		let srchPopInstDiv = $("#srchPopInstDiv").val();
		let srchPopInstString = $("#srchPopInstString").val();
		let paramUrl = "";
		paramUrl += "/exhMgt/popLayerExhDgtlClcList.do";
		paramUrl += "?srchPopDispId=" + srchPopDispId;
		paramUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;
		paramUrl += "&srchPopDgtlClcDiv=" + srchPopDgtlClcDiv;
		paramUrl += "&srchPopDgtlClcString=" + srchPopDgtlClcString;
		paramUrl += "&srchPopInstDiv=" + srchPopInstDiv;
		paramUrl += "&srchPopInstString=" + srchPopInstString;
		paramUrl = contextPath + paramUrl;
		
		$(".pop-layer").load(paramUrl);
	}
	
	// 검색폼 값을 초기화
	function getPopListSrchReset() {
		$("#srchPopDgtlClcDiv").val("ID");
		$("#srchPopDgtlClcString").val("");
		$("#srchPopInstDiv").val("ID");
		$("#srchPopInstString").val("");
	}
	
	//선택한 페이징으로 이동
	function movePopListPageNo(paramDataInt) {
		$("#srchPopPageNo").val(paramDataInt)
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