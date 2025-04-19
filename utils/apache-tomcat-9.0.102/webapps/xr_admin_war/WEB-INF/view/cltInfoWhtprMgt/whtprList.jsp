<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>

<div class="contants">
	<!-- search area start -->
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="<c:out value='${srchWhtprInfo.paramPageNo}'/>">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="<c:out value='${srchWhtprInfo.paramRecordCnt}'/>">
			<input type="hidden" id="srchWhtprId" name="srchWhtprId" value="<c:out value='${srchWhtprInfo.paramWhtprId}'/>">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-ele" data-size="100p">
							<input type="text" id="srchString" name="srchString" value="<c:out value='${srchWhtprInfo.paramSrchString}'/>" placeholder="백서명을 입력하세요.">
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<c:if test="${UserAuthrtInfo.menuInqAuthrtYn == 'Y' }">
						<button type="button" class="btns" id="btnSrch" name="btnSrch" onclick="javascript:getListSrch(); return false;">조회</button>
						<button type="button" class="btns color-gray" id="btnSrchRst" name="btnSrchRst" onclick="javascript:getListSrchReset(); return false;">초기화</button>
					</c:if>
				</div>
				
			</div>
		</form>
	</div>
	<!-- search area end -->
	<!-- list count area & regist button area Start -->
	<div class="list-option top between">
		<strong>전체건수 : <b><c:out value="${pageInfo.paramTotListCnt}"/></b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" id="btnReg" name="btnReg" class="btns" onclick="javascript:moveRegWhtprInfo(); return false;">등록</button>
		</c:if>
	</div>
	<!-- list count area & regist button area End -->
	<!-- list area start  -->
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="100px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>백서명</th>
					<th>첨부파일</th>
					<th>등록자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty whtprInfoList}">
				<c:forEach var="whtprData" items="${whtprInfoList}" varStatus="status">
				<tr>
					<td><c:out value="${whtprData.listWhtprNo}"/></td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<td><a href="#" onclick="javascript:moveDltWhtprInfo('${whtprData.whtprId}'); return false;"><c:out value="${whtprData.whtprNm}"/></a></td>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;">${whtprData.whtprNm}</a></td>
				</c:if>
					<td>${whtprData.atchFileGroupId}</td>
					<td><c:out value="${whtprData.frstRgtrNcm}"/>(<c:out value="${pf:getMaskingID(whtprData.frstRgtrId)}"/>)</td>
					<td>${whtprData.frstRegDtV19}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty whtprInfoList}">
				<tr>
					<td colspan="5">No Data</td>
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
<script type="text/javascript">
	
	function getListSrch() {
		let frm = document.frmListSrch;
		frm.action = contextPath + "/cltInfoWhtprMgt/whtprList.do";
		frm.submit();
	}
	
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchString.value = "";
	}
	
	
	function moveDltWhtprInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchWhtprId.value = paramString;
		frm.action = contextPath + "/cltInfoWhtprMgt/whtprDtl.do";
		frm.submit();
	}
	
	function moveRegWhtprInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/cltInfoWhtprMgt/whtprReg.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		// document.getElementById('srchPageNo').value = paramDataInt;
		frm.srchPageNo.value = paramDataInt;
		frm.action = contextPath + "/cltInfoWhtprMgt/whtprList.do";
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