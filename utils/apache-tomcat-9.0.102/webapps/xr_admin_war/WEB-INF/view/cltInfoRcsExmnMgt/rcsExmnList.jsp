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
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchRcsExmnInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchRcsExmnInfo.paramRecordCnt}">
			<input type="hidden" id="srchRcsexmnId" name="srchRcsexmnId" value="${srchRcsExmnInfo.paramRcsexmnId}">
			<input type="hidden" id="srchBgngYr" name="srchBgngYr" value="${srchRcsExmnInfo.paramBgngYr}">
			<input type="hidden" id="srchEndYr" name="srchEndYr" value="${srchRcsExmnInfo.paramEndYr}">
			<input type="hidden" id="srchTabInstListPageNo" name="srchTabInstListPageNo" value="${srchRcsExmnInfo.paramTabInstListPageNo}">
			<input type="hidden" id="srchTabInstListRecordCnt" name="srchTabInstListRecordCnt" value="${srchRcsExmnInfo.paramTabInstListRecordCnt}">
			<input type="hidden" id="srchRcsexmnInstId" name="srchRcsexmnInstId" value="${srchRcsExmnInfo.paramInstId}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-select" data-size="w250">
							<select id="srchRcsexmnYr" name="srchRcsexmnYr" class="" title="환경조사년도">
								<option value="" <c:if test="${srchRcsExmnInfo.paramRcsexmnYr == ''}">selected</c:if>>환경조사년도</option>
							<c:forEach var="srchYr" begin="${srchRcsExmnInfo.paramBgngYr}" end="${srchRcsExmnInfo.paramEndYr}" >
								<option value="${srchYr}" <c:if test="${srchRcsExmnInfo.paramRcsexmnYr == srchYr}">selected</c:if>>${srchYr}년</option>
							</c:forEach>
							</select>
						</div>
						<div class="fm-select" data-size="w250">
							<select id="srchRcsexmnDiv" name="srchRcsexmnDiv" class="" title="세부 유형">
								<option value="ID" <c:if test="${srchRcsExmnInfo.paramSrchRcsexmnDiv == 'ID'}">selected</c:if>>환경조사 아이디</option>
								<option value="NM" <c:if test="${srchRcsExmnInfo.paramSrchRcsexmnDiv == 'NM'}">selected</c:if>>환경조사 명</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w700">
							<input type="text" id="srchRcsexmnString" name="srchRcsexmnString" value="${srchRcsExmnInfo.paramSrchRcsexmnString}" placeholder="검색어를 입력하세요." />
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
	<!-- list count area & regist button area -->
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
			<c:if test="${UserAuthrtInfo.authrtTypeCd == 'USERTY0001'}">
		<button type="button" id="btnReg" name="btnReg" class="btns" onclick="javascript:moveRegRcsExmnInfo(); return false;">등록</button>
			</c:if>
		</c:if>
	</div>	
	<!-- list area start  -->
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>환경조사 아이디</th>
					<th>환경조사 명</th>
					<th>조사 기간</th>
					<th>상태</th>
					<th>기관</th>
					<th>등록자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty rcsExmnInfoList}">
				<c:forEach var="exmnData" items="${rcsExmnInfoList}" varStatus="status">
				<tr>
					<td>${exmnData.listRcsexmnNo}</td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<c:if test="${UserAuthrtInfo.authrtTypeCd == 'USERTY0001'}">
					<td><a href="#" onclick="javascript:moveDltRcsExmnInfo('${exmnData.rcsexmnId}'); return false;">${exmnData.rcsexmnId}</a></td>
					<td><a href="#" onclick="javascript:moveDltRcsExmnInfo('${exmnData.rcsexmnId}'); return false;">${exmnData.rcsexmnNm}</a></td>
					</c:if>
					<c:if test="${UserAuthrtInfo.authrtTypeCd == 'USERTY0002'}">
					<td><a href="#" onclick="javascript:moveDltRcsExmnInstInfo('${exmnData.rcsexmnId}'); return false;">${exmnData.rcsexmnId}</a></td>
					<td><a href="#" onclick="javascript:moveDltRcsExmnInstInfo('${exmnData.rcsexmnId}'); return false;">${exmnData.rcsexmnNm}</a></td>
					</c:if>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;">${exmnData.rcsexmnId}</a></td>
					<td><a href="#" onclick="javascript:return false;">${exmnData.rcsexmnNm}</a></td>
				</c:if>
					<td>${exmnData.rcsexmnBgngYmdV10} ~ ${exmnData.rcsexmnEndYmdV10}</td>
					<td>${exmnData.rcsexmnSttdNm}</td>
					<td>${exmnData.rcsexmnCmptnInstCnt} / ${exmnData.rcsexmnTrgtInstCnt}</td>
					<td>${exmnData.frstRgtrNcm}(<c:out value="${pf:getMaskingID(exmnData.frstRgtrId)}" />)</td>
					<td>${exmnData.frstRegDtV19}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty rcsExmnInfoList}">
				<tr>
					<td colspan="8">No Data</td>
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
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnList.do";
		frm.submit();
	}
	
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchRcsexmnYr.value = "";
		frm.srchRcsexmnDiv.value = "ID";
		frm.srchRcsexmnString.value = "";
	}
	
	
	function moveDltRcsExmnInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchRcsexmnId.value = paramString;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnDtl.do";
		frm.submit();
	}
	
	function moveDltRcsExmnInstInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchRcsexmnId.value = paramString;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/instRcsExmnDtl.do";
		frm.submit();
	}
	
	function moveRegRcsExmnInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnReg.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.paramPageNo.value = paramDataInt;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnList.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListPrevPage() {
		let frm = document.frmListSrch;
		let nowPageNo = parseInt(frm.paramPageNo.value, 10);
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
		let nowPageNo = parseInt(frm.paramPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListPageNo(movePageNo);
		}
	}
	
</script>