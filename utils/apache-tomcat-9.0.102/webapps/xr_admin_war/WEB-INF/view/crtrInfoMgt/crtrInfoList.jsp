<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">
	<!-- page title area strt -->
	<!-- page title area end -->
	<!-- search area start -->
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${paramCrtrInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${paramCrtrInfo.paramRecordCnt}">
			<input type="hidden" id="paramClsfCd" name="paramClsfCd" value="">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<strong class="tit">조회기간</strong>
						<div class="fm-ele date" data-size="w200">
							<input type="date" id="paramFromDate" name="paramFromDate" value="${paramCrtrInfo.paramFromDate}" placeholder="시작 일자"/>
						</div>
						<span>~</span>
						<div class="fm-ele date" data-size="w200">
							<input type="date" id="paramtoDate" name="paramtoDate" value="${paramCrtrInfo.paramtoDate}" placeholder="종료 일자"/>
						</div>
						<strong class="tit">코드 사용여부</strong>
						<div class="fm-focus fm-select">
							<select id="paramUseYn" name="paramUseYn" class="" title="코드 사용유무조회">
								<option value="" <c:if test="${paramCrtrInfo.paramUseYn == '' }">selected</c:if>>전체</option>
								<option value="Y" <c:if test="${paramCrtrInfo.paramUseYn == 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${paramCrtrInfo.paramUseYn == 'N'}">selected</c:if>>미사용</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w400">
							<input type="text" id="paramClsfNm" name="paramClsfNm" value="${paramCrtrInfo.paramClsfNm}" placeholder="코드명을 입력하세요." />
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" id="btnUserSrch" name="btnUserSrch" class="btns" onclick="javascript:getListSrch(); return false;">검색</button>
					<button type="button" id="btnUserSrchRst" name="btnUserSrchRst" class="btns color-gray" onclick="javascript:getListSrchReset(); return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<!-- search area end -->
	<!-- list count area & regist button area -->
	<!-- <div class="btn-wrap align-right"> -->
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b>건</strong>
		<button type="button" class="btns" id="btnEntry" onclick="javascript:moveRegCodeInfo(); return false;">등록</button>
	</div>	
	<!-- list area start  -->
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="*"></col>
				<col width="100px"></col>
				<col width="120px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>코드</th>
					<th>코드명</th>
					<th>코드설명</th>
					<th>사용여부</th>
					<th>변경이력</th>
					<th>등록일</th>
					<th>등록자</th>
					<th>수정일</th>
					<th>수정자</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty crtrInfoList}">
				<c:forEach var="crtrInfoData" items="${crtrInfoList}" varStatus="status">
					<tr>
						<td>${crtrInfoData.clsfListNo}</td>
						<td><a href="#" onclick="javascript:moveDltInfo('${crtrInfoData.clsfCd}'); return false;">${crtrInfoData.clsfCd}</a></td>
						<td><a href="#" onclick="javascript:moveDltInfo('${crtrInfoData.clsfCd}'); return false;">${crtrInfoData.clsfNm}</a></td>
						<td>${crtrInfoData.clsfCdExpln}</td>
						<td>${crtrInfoData.useYn}</td>
						<td><button type="button" id="btnUp_${crtrInfoData.clsfCd}" name="btnUp" class="btns size-xsmall" onclick="javascript:goPopHisory('${crtrInfoData.clsfCd}'); return false;">이력</button></td>
						<td>${crtrInfoData.frstRegDt}</td>
						<td><c:out value="${pf:getMaskingID(crtrInfoData.frstRgtrId)}" /></td>
						<td>${crtrInfoData.lastMdfcnDt}</td>
						<td><c:out value="${pf:getMaskingID(crtrInfoData.lastMdfrId)}" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty crtrInfoList}">
				<tr>
					<td colspan="10">No Data</td>
				</tr>
			</c:if>	
			</tbody>
		</table>
	</div>
	<!-- list area end -->
	
	<!-- page area start -->
	<div class="align_flex paging">
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
	</div>
	<!-- page area end -->
</div>
<div class="modals" id="modals">
    <div class="pop-layer" id="historyPop" style="width:60%;">
    </div>
</div>
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">
	 
	//검색 
	function getListSrch() {		
		let frm = document.frmListSrch;
		frm.action = contextPath+ "/crtrInfoMgt/crtrInfoList.do";
		frm.submit();
	}
	
	//초기화
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.paramClsfNm.value = "";
		frm.paramFromDate.value = "";
		frm.paramtoDate.value = "";
		frm.paramUseYn.value = "";
	}
	
	//상세
	function moveDltInfo(clsfCd) {
		let frm = document.frmListSrch;
		frm.paramClsfCd.value = clsfCd;
		frm.action = contextPath+"/crtrInfoMgt/crtrInfoDtl.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.srchPageNo.value = paramDataInt;
		frm.action = contextPath+"/crtrInfoMgt/crtrInfoList.do";
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
	
	function moveRegCodeInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = 'entry';
		frm.action = contextPath+"/crtrInfoMgt/crtrInfoReg.do";
		frm.submit();
	}
	
	function goPopHisory(clsfCd){
		
		let paramUrl = contextPath+'/crtrInfoMgt/clsfCdHstryInfo.do';
		let paramClsfCd = clsfCd;
		
		paramUrl += "?paramClsfCd=" + paramClsfCd;
		$('#historyPop').load(paramUrl);
		admin.modalsShow('modals');
		
	}
	
</script>