<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>기관 조회</h2>
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
						<select id="srchPopInstDiv" name="srchPopInstDiv">
							<option value="ID" <c:if test="${srchPopInfo.paramPopInstDiv == 'ID'}">selected</c:if>>기관 ID</option>
							<option value="NM" <c:if test="${srchPopInfo.paramPopInstDiv == 'NM'}">selected</c:if>>기관 명</option>
						</select>
					</div>
					<div class="fm-focus fm-select">
						<select id="srchPopInstTypeCd" name="srchPopInstTypeCd" >
							<option value="" <c:if test="${srchPopInfo.paramPopInstTypeCd == ''}">selected</c:if>>기관유형전체</option>
								<c:if test="${!empty popInstTypeCmmnCdList}">
									<c:forEach var="typeCdRow" items="${popInstTypeCmmnCdList}">
								<option value="<c:out value="${typeCdRow.cdId}"/>" <c:if test="${srchPopInfo.paramPopInstTypeCd == typeCdRow.cdId }">selected</c:if>><c:out value="${typeCdRow.cdNm}"/></option>
									</c:forEach>
								</c:if>
						</select>
					</div>
					<div class="fm-focus fm-select">
						<select id="srchPopFildTypeCd" name="srchPopFildTypeCd" >
							<option value="" <c:if test="${srchPopInfo.paramPopFildTypeCd == ''}">selected</c:if>>영역유형전체</option>
								<c:if test="${!empty popFldTypeCmmnCdList}">
									<c:forEach var="fildCdRow" items="${popFldTypeCmmnCdList}">
							<option value="<c:out value="${fildCdRow.cdId}"/>" <c:if test="${srchPopInfo.paramPopFildTypeCd == fildCdRow.cdId }">selected</c:if>><c:out value="${fildCdRow.cdNm}"/></option>
									</c:forEach>
								</c:if>
						</select>
					</div>
					<div class="fm-focus fm-select">
						<select id="srchPopClctTypeCd" name="srchPopClctTypeCd" >
							<option value="" <c:if test="${srchInstInfo.paramPopClctTypeCd == ''}">selected</c:if>>수집유형전체</option>
								<c:if test="${!empty popClcTypeCmmnCdList}">
									<c:forEach var="clctCdRow" items="${popClcTypeCmmnCdList}">
							<option value="<c:out value="${clctCdRow.cdId}"/>" <c:if test="${srchPopInfo.paramPopClctTypeCd == clctCdRow.cdId }">selected</c:if>><c:out value="${clctCdRow.cdNm}"/></option>
									</c:forEach>
								</c:if>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="fm-ele" data-size="100p">
						<input type="text" id="srchPopInstString" name="srchPopInstString" value="<c:out value="${srchPopInfo.paramPopInstString}"/>" placeholder="검색어를 입력하세요."/>
					</div>
				</div>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btns" id="btnPopSrchListPage" name="btnPopSrchListPage" onclick="javascript:getPopListSrch(); return false;">조회</button>
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
				<col width="*"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>기관 ID</th>
					<th>기관 명</th>
					<th>기관코드</th>
					<th>기관유형</th>
					<th>영역유형</th>
					<th>수집유형</th>
					<th>문화자산</th>
					<th>컬렉션</th>
					<th>추가</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty popExhItemList}">
			<c:forEach var="popExhData" items="${popExhItemList}" varStatus="status">
				<tr>
					<td><c:out value="${popExhData.listPopNo}"/></td>
					<td><c:out value="${popExhData.instId}"/><input type="hidden" id="hdnExhItemId_${popExhData.instId}" name="hdnExhItemId_${popExhData.instId}" value="<c:out value="${popExhData.instId}"/>"></td>
					<td><c:out value="${popExhData.instNm}"/><input type="hidden" id="hdnExhItemInstNm_${popExhData.instId}" name="hdnExhItemNm_${popExhData.instId}" value="<c:out value="${popExhData.instNm}"/>"></td>
					<td><c:out value="${popExhData.instCd}"/><input type="hidden" id="hdnExhItemInstCd_${popExhData.instId}" name="hdnExhItemInstCd_${popExhData.instId}" value="<c:out value="${popExhData.instCd}"/>"></td>
					<td><c:out value="${popExhData.instTypeNm}"/><input type="hidden" id="hdnExhItemInstTypeNm_${popExhData.instId}" name="hdnExhItemInstTypeNm_${popExhData.instId}" value="<c:out value="${popExhData.instTypeNm}"/>"></td>
					<td><c:out value="${popExhData.fildTypeNm}"/><input type="hidden" id="hdnExhItemFildTypeNm_${popExhData.instId}" name="hdnExhItemFildTypeNm_${popExhData.instId}" value="<c:out value="${popExhData.fildTypeNm}"/>"></td>
					<td><c:out value="${popExhData.clctTypeNm}"/><input type="hidden" id="hdnExhItemClctTypeNm_${popExhData.instId}" name="hdnExhItemClctTypeNm_${popExhData.instId}" value="<c:out value="${popExhData.clctTypeNm}"/>"></td>
					<td><fmt:formatNumber value="${popExhData.instClrcsCnt}"/><input type="hidden" id="hdnExhItemInstClrcsCnt_${popExhData.instId}" name="hdnExhItemInstClrcsCnt_${popExhData.instId}" value="<c:out value="${popExhData.instClrcsCnt}"/>"></td>
					<td><fmt:formatNumber value="${popExhData.instExbiCnt}"/><input type="hidden" id="hdnExhItemInstExbiNm_${popExhData.instId}" name="hdnExhItemInstExbiNm_${popExhData.instId}" value="<c:out value="${popExhData.instExbiCnt}"/>"></td>
					<td><button type="button" id="btnAddExhItem" name="btnAddExhItem" class="btns size-xsmall" onclick="javascript:moveAddExhInstData('${popExhData.instId}'); return false;">추가</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty popExhItemList}">
				<tr>
					<td colspan="6">No Data</td>
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
		let srchPopInstDiv = $("#srchPopInstDiv").val();
		let srchPopInstString = $("#srchPopInstString").val();
		let srchPopInstTypeCd = $("#srchPopInstTypeCd").val();
		let srchPopFildTypeCd = $("#srchPopFildTypeCd").val();
		let srchPopClctTypeCd = $("#srchPopClctTypeCd").val();
		let paramUrl = "";
		paramUrl += "/exhMgt/popLayerExhInstList.do";
		paramUrl += "?srchPopDispId=" + srchPopDispId;
		paramUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;
		paramUrl += "&srchPopInstDiv=" + srchPopInstDiv;
		paramUrl += "&srchPopInstString=" + srchPopInstString;
		paramUrl += "&srchPopInstTypeCd=" + srchPopInstTypeCd;
		paramUrl += "&srchPopFildTypeCd=" + srchPopFildTypeCd;
		paramUrl += "&srchPopClctTypeCd=" + srchPopClctTypeCd;
		
		paramUrl = contextPath + paramUrl;
		$(".pop-layer").load(paramUrl);
	}
	
	// 검색폼 값을 초기화
	function getPopListSrchReset() {
		$("#srchPopInstDiv").val("ID");
		$("#srchPopInstString").val("");
		$("#srchPopInstTypeCd").val("");
		$("#srchPopFildTypeCd").val("");
		$("#srchPopClctTypeCd").val("");
	}
	
	//선택한 페이징으로 이동
	function movePopListPageNo(paramDataInt) {
		$("#srchPopPageNo").val(paramDataInt);
		getPopListSrch();
	}
	
	// 이전페이지
	function movePopListPrevPage() {
		let pageNo = $("#srchPopPageNo").val();
		let nowPageNo = parseInt(pageNo, 10);
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
		let pageNo = $("#srchPopPageNo").val();
		let maxPageNo = parseInt(${pagePopInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(pageNo, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			movePopListPageNo(movePageNo);
		}
	}

</script>