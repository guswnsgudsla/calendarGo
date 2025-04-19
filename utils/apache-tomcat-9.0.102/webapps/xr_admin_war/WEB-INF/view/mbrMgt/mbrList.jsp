<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>
<div class="contants">
	<!-- page title area strt -->
	<!-- page title area end -->
	<!-- search area start -->
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" method="post" action="#">
			<input type="hidden" id="paramPageNo" name="paramPageNo" value="<c:out value="${srchMbrInfo.paramPageNo}"/>">
			<input type="hidden" id="srchMbrId" name="srchMbrId" value="<c:out value="${srchMbrInfo.paramMbrId}"/>">
			<input type="hidden" id="srchBbsId" name="srchBbsId" value="<c:out value="${srchMbrInfo.paramBbsId}"/>">
			<input type="hidden" id="srchPstId" name="srchPstId" value="<c:out value="${srchMbrInfo.paramPstId}"/>">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${srchMbrInfo.paramTabPstnId}"/>">
			<input type="hidden" id="srchTabDwnldListPageNo" name="srchTabDwnldListPageNo" value="<c:out value="${srchMbrInfo.paramTabDwnldListPageNo}"/>">
			<input type="hidden" id="srchTabQnaListPageNo" name="srchTabQnaListPageNo" value="<c:out value="${srchMbrInfo.paramTabQnaListPageNo}"/>">
			<input type="hidden" id="srchTabSrchListPageNo" name="srchTabSrchListPageNo" value="<c:out value="${srchMbrInfo.paramTabSrchListPageNo}"/>">
			<input type="hidden" id="srchTabCntnListPageNo" name="srchTabCntnListPageNo" value="<c:out value="${srchMbrInfo.paramTabCntnListPageNo}"/>">
			<input type="hidden" id="srchTabItrstClrcsListPageNo" name="srchTabItrstClrcsListPageNo" value="<c:out value="${srchMbrInfo.paramTabItrstClrcsListPageNo}"/>">
			<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchMbrInfo.paramPopPageNo}"/>">
			<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchMbrInfo.paramPopPageRecordCnt}"/>">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select">
							<select id="srchDiv" name="srchDiv" class="" title="사용자 조회항목">
								<option value="ID" <c:if test="${srchMbrInfo.paramSrchDiv == 'ID' or srchMbrInfo.paramSrchDiv == '' }">selected</c:if>>아이디</option>
								<option value="NCM" <c:if test="${srchMbrInfo.paramSrchDiv == 'NCM' }">selected</c:if>>별칭</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w300">
							<input type="text" id="srchString" name="srchString" value="${srchMbrInfo.paramSrchString}" placeholder="검색어를 입력하세요." />
						</div>
						<div class="fm-focus fm-select">
							<select id="srchDateDiv" name="srchDateDiv" class="" title="사용자 조회항목">
								<option value="REG" <c:if test="${srchMbrInfo.paramSrchDateDiv == 'REG' or srchMbrInfo.paramSrchDateDiv == '' }">selected</c:if>>가입일</option>
								<option value="CNTN" <c:if test="${srchMbrInfo.paramSrchDateDiv == 'CNTN' }">selected</c:if>>최종접속일</option>
							</select>
						</div>
						<div class="fm-ele date">
							<input type="date" id="srchBgngDay" name="srchBgngDay" value="${srchMbrInfo.paramSrchBgngDay}" placeholder="시작 일자"/>
						</div>
						<div class="fm-ele date">
							<input type="date" id="srchEndDay" name="srchEndDay" value="${srchMbrInfo.paramSrchEndDay}" placeholder="종료 일자"/>
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<c:if test="${UserAuthrtInfo.menuInqAuthrtYn == 'Y'}">
						<div class="align-right">
							<button type="button" id="btnUserSrch" name="btnUserSrch" class="btns" onclick="javascript:getListSrch(); return false;">조회</button>
							<button type="button" id="btnUserSrchRst" name="btnUserSrchRst" class="btns color-gray" onclick="javascript:getListSrchReset(); return false;">초기화</button>
						</div>
					</c:if>
				</div>
			</div>
		</form>
	</div>
	<!-- search area end -->
	<!-- list count area & regist button area -->
	<div class="list-option top between">
		<strong>전체건수 : <b><c:out value="${pageInfo.paramTotListCnt}"/></b></strong>
	</div>	
	<!-- list area start  -->
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="100px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>아이디</th>
					<th>별칭</th>
					<th>권한</th>
					<th>관심자원등록알림</th>
					<th>최종로그인일시</th>
					<th>가입일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty mbrInfoList}">
				<c:forEach var="mbrData" items="${mbrInfoList}" varStatus="status">
				<tr>
					<td>${mbrData.mbrListNo}</td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">	
					<td><a href="#" onclick="javascript:moveDltMbrInfo('<c:out value="${mbrData.mbrId}"/>'); return false;"><c:out value="${pf:getMaskingID(mbrData.mbrId)}" /></a></td>
					<td><a href="#" onclick="javascript:moveDltMbrInfo('<c:out value="${mbrData.mbrId}"/>'); return false;"><c:out value="${mbrData.mbrNcm}"/></a></td>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;"><c:out value="${mbrData.mbrId}"/></a></td>
					<td><a href="#" onclick="javascript:return false;"><c:out value="${mbrData.mbrNcm}"/></a></td>
				</c:if>	
					<td><c:out value="${mbrData.authrtNm}"/></td>
					<td><c:out value="${mbrData.itrstClsfRegNtfcYnNm}"/></td>
					<td><c:out value="${mbrData.lastCntnDtV19}"/></td>
					<td><c:out value="${mbrData.frstRegDtV19}"/></td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty mbrInfoList}">
				<tr>
					<td colspan="7">No Data</td>
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
		frm.action = contextPath + "/mbrMgt/mbrList.do";
		frm.submit();
	}
	
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchDiv.value = "ID";
		frm.srchString.value = "";
		frm.srchDateDiv.value = "REG";
		frm.srchBgngDay.value = "";
		frm.srchEndDay.value = "";
	}
	
	function moveDltMbrInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchMbrId.value = paramString;
		frm.action = contextPath + "/mbrMgt/mbrDtl.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.paramPageNo.value = paramDataInt;
		frm.action = contextPath + "/mbrMgt/mbrList.do";
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