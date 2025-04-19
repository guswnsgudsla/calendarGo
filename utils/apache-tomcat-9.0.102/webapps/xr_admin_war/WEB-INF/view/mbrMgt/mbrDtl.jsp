<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>

<div class="contants">
	<%-- info detail area start --%>
	<div class="table-wrap write">
		<form name="frmMbrDtl" id="frmMbrDtl" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchMbrInfo.hdnMenuParam}"/>">
			<input type="hidden" id="paramPageNo" name="paramPageNo" value="<c:out value="${srchMbrInfo.paramPageNo}"/>">
			<input type="hidden" id="srchDiv" name="srchDiv" value="<c:out value="${srchMbrInfo.paramSrchDiv}"/>">
			<input type="hidden" id="srchString" name="srchString" value="<c:out value="${srchMbrInfo.paramSrchString}"/>">
			<input type="hidden" id="srchDateDiv" name="srchDateDiv" value="<c:out value="${srchMbrInfo.paramSrchDateDiv}"/>">
			<input type="hidden" id="srchBgngDay" name="srchBgngDay" value="<c:out value="${srchMbrInfo.paramSrchBgngDay}"/>">
			<input type="hidden" id="srchEndDay" name="srchEndDay" value="<c:out value="${srchMbrInfo.paramSrchEndDay}"/>">
			<input type="hidden" id="srchMbrId" name="srchMbrId" value="<c:out value="${srchMbrInfo.paramMbrId}"/>">
			<input type="hidden" id="srchBbsId" name="srchBbsId" value="<c:out value="${srchMbrInfo.paramBbsId}"/>">
			<input type="hidden" id="srchPstId" name="srchPstId" value="<c:out value="${srchMbrInfo.paramPstId}"/>">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${srchMbrInfo.paramTabPstnId}"/>">
			<input type="hidden" id="srchTabDwnldListPageNo" name="srchTabDwnldListPageNo" value="<c:out value="${srchMbrInfo.paramTabDwnldListPageNo}"/>">
			<input type="hidden" id="srchTabQnaListPageNo" name="srchTabQnaListPageNo" value="<c:out value="${srchMbrInfo.paramTabQnaListPageNo}"/>">
			<input type="hidden" id="srchTabSrchListPageNo" name="srchTabSrchListPageNo" value="<c:out value="${srchMbrInfo.paramTabSrchListPageNo}"/>">
			<input type="hidden" id="srchTabCntnListPageNo" name="srchTabCntnListPageNo" value="<c:out value="${srchMbrInfo.paramTabCntnListPageNo}"/>">
			<input type="hidden" id="srchTabItrstClrcsListPageNo" name="srchTabItrstClrcsListPageNo" value="<c:out value="${srchMbrInfo.paramTabItrstClrcsListPageNo}"/>">
			<input type="hidden" id="srchTrckId" name="srchTrckId" value="">
			<input type="hidden" id="srchPopPageNo" name="srchPopPageNo" value="<c:out value="${srchMbrInfo.paramPopPageNo}"/>">
			<input type="hidden" id="srchPopPageRecordCnt" name="srchPopPageRecordCnt" value="<c:out value="${srchMbrInfo.paramPopPageRecordCnt}"/>">
		</form>
		
		<table>
			<colgroup>
				<col width="200px">
				<col width="">
				<col width="200px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th>회원아이디</th>
					<td><c:out value="${pf:getMaskingID(mbrInfo.mbrId)}" /></td>
					<th>별칭</th>
					<td><c:out value="${mbrInfo.mbrNcm}"/></td>
				</tr>
				<tr>
					<th>최종 로그인 일시</th>
					<td><c:out value="${mbrInfo.lastCntnDtV19}"/></td>
					<th>가입일시</th>
					<td><c:out value="${mbrInfo.frstRegDtV19}"/></td>
				</tr>
				<tr>
					<th>관심자원 등록 알림</th>
					<td colspan="3"><c:out value="${mbrInfo.itrstClsfRegNtfcYnNm}"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<%-- info detail area end --%>
	
	<%-- button arae start --%>
	<div class="btn-wrap align-right">
		<button type="button" id="btnList" name="btnList" class="btns color-gray" onclick="javascript:moveListMbrInfo(); return false;">목록</button>
	</div>
	<%-- button area end --%>
	
	<!-- tab area start -->
	<div class="tab-wrap as-tab-wrap">
		<ul class="tab-menu">
			<li id="tabMbrDwnld" <c:if test="${srchMbrInfo.paramTabPstnId == 'DWNLD' }">class="active"</c:if>><a href="#" onclick="javascript:moveTabChage('DWNLD'); return false;">다운로드 신청 내역</a></li>
			<li id="tabMbrQna" <c:if test="${srchMbrInfo.paramTabPstnId == 'QNA' }">class="active"</c:if>><a href="#" onclick="javascript:moveTabChage('QNA'); return false;">Q&A 문의내역</a></li>
			<li id="tabMbrSrch" <c:if test="${srchMbrInfo.paramTabPstnId == 'SRCH' }">class="active"</c:if>><a href="#" onclick="javascript:moveTabChage('SRCH'); return false;">검색이력</a></li>
			<li id="tabMbrCntn" <c:if test="${srchMbrInfo.paramTabPstnId == 'CNTN' }">class="active"</c:if>><a href="#" onclick="javascript:moveTabChage('CNTN'); return false;">접속이력</a></li>
		</ul>
		<div class="inner-depth">
			<div class="tab-inner" id="tabDwnldArea" <c:if test="${srchMbrInfo.paramTabPstnId != 'DWNLD' }">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="50px">
							<col width="*">
							<col width="100px">
							<col width="100px">
							<col width="200px">
							<col width="200px">
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>문화자원명</th>
								<th>콘텐츠 사용 유형</th>
								<th>콘텐츠 활용 효과</th>
								<th>다운로드 추적ID</th>
								<th>다운로드 일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty mbrDwnldHstryList}">
					<c:forEach var="mbrDwnldHstryData" items="${mbrDwnldHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${mbrDwnldHstryData.dwnldListNo}"/></td>
								<td><c:out value="${mbrDwnldHstryData.clrcsNm}"/></td>
								<td><c:out value="${mbrDwnldHstryData.contsUseTypeNm}"/></td>
								<td><c:out value="${mbrDwnldHstryData.contsCnjtTypeNm}"/></td>
								<td>
						<c:if test="${!empty mbrDwnldHstryData.prdctTrckId}">
									<a href="#" onclick="javascript:moveOpenPopTrck('${mbrDwnldHstryData.prdctTrckId}'); return false;"><c:out value=" ${mbrDwnldHstryData.prdctTrckId}"/></a>
						</c:if>	
						<c:if test="${empty mbrDwnldHstryData.prdctTrckId}"><c:out value="${mbrDwnldHstryData.prdctTrckId}"/>
						</c:if>		
								</td>
								<td><c:out value="${mbrDwnldHstryData.frstRegDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty mbrDwnldHstryList}">
							<tr>
								<td colspan="6">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				<div class="pagination">
					<c:if test="${!empty pageMbrDwnldHstryInfo}">
						<c:if test="${pageMbrDwnldHstryInfo.paramPageNo == pageMbrDwnldHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrDwnldHstryInfo.paramPageNo > pageMbrDwnldHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListDwnldPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pmd" begin="${pageMbrDwnldHstryInfo.paramPageStartNo}" end="${pageMbrDwnldHstryInfo.paramPageEndNo}">
							<c:if test="${pmd == pageMbrDwnldHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;"><c:out value="${pmd}"/></a></span></c:if>
							<c:if test="${pmd != pageMbrDwnldHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListDwnldPageNo('<c:out value="${pmd}"/>'); return false;"><c:out value="${pmd}"/></a></span></c:if>
						</c:forEach>
						<c:if test="${pageMbrDwnldHstryInfo.paramPageNo < pageMbrDwnldHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListDwnldNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrDwnldHstryInfo.paramPageNo == pageMbrDwnldHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageMbrDwnldHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
		
			<div class="tab-inner" id="tabQnaArea" <c:if test="${srchMbrInfo.paramTabPstnId != 'QNA' }">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="50px">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>문화자원 명</th>
								<th>소장기관</th>
								<th>문의 제목</th>
								<th>기관 답변 여부</th>
								<th>문의 일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty mbrQnaHstryList}">
					<c:forEach var="mbrQnaHstryData" items="${mbrQnaHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${mbrQnaHstryData.listPstNo}"/></td>
								<td><c:out value="${mbrQnaHstryData.clrcsNm}"/></td>
								<td><c:out value="${mbrQnaHstryData.instNm}"/></td>
								<td><c:out value="${mbrQnaHstryData.pstTtl}"/></td>
								<td><c:out value="${mbrQnaHstryData.qnaAnsYnNm}"/></td>
								<td><c:out value="${mbrQnaHstryData.frstRegDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty mbrQnaHstryList}">
							<tr>
								<td colspan="6">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				<div class="pagination">
					<c:if test="${!empty pageMbrQnaHstryInfo}">
						<c:if test="${pageMbrQnaHstryInfo.paramPageNo == pageMbrQnaHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrQnaHstryInfo.paramPageNo > pageMbrQnaHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListQnaPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pmq" begin="${pageMbrQnaHstryInfo.paramPageStartNo}" end="${pageMbrQnaHstryInfo.paramPageEndNo}">
							<c:if test="${pmq == pageMbrQnaHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;"><c:out value="${pmq}"/></a></span></c:if>
							<c:if test="${pmq != pageMbrQnaHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListQnaPageNo('<c:out value="${pmq}"/>'); return false;"><c:out value="${pmq}"/></a></span></c:if>
						</c:forEach>
						<c:if test="${pageMbrQnaHstryInfo.paramPageNo < pageMbrQnaHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListQnaNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrQnaHstryInfo.paramPageNo == pageMbrQnaHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageMbrQnaHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
			<div class="tab-inner" id="tabMbrSrchArea" <c:if test="${srchMbrInfo.paramTabPstnId != 'SRCH' }">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="50px">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>검색어</th>
								<th>메뉴아이디</th>
								<th>메뉴명</th>
								<th>검색 일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty mbrSrchHstryList}">
					<c:forEach var="mbrSrchHstryData" items="${mbrSrchHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${mbrSrchHstryData.srchListNo}"/></td>
								<td><c:out value="${mbrSrchHstryData.srwdNm}"/></td>
								<td><c:out value="${mbrSrchHstryData.menuId}"/></td>
								<td><c:out value="${mbrSrchHstryData.menuNm}"/></td>
								<td><c:out value="${mbrSrchHstryData.srchDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty mbrSrchHstryList}">
							<tr>
								<td colspan="5">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				<div class="pagination">
					<c:if test="${!empty pageMbrSrchHstryInfo}">
						<c:if test="${pageMbrSrchHstryInfo.paramPageNo == pageMbrSrchHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrSrchHstryInfo.paramPageNo > pageMbrSrchHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListSrchPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pms" begin="${pageMbrSrchHstryInfo.paramPageStartNo}" end="${pageMbrSrchHstryInfo.paramPageEndNo}">
							<c:if test="${pms == pageMbrSrchHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;"><c:out value="${pms}"/></a></span></c:if>
							<c:if test="${pms != pageMbrSrchHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListSrchPageNo('<c:out value="${pms}"/>'); return false;"><c:out value="${pms}"/></a></span></c:if>
						</c:forEach>
						<c:if test="${pageMbrSrchHstryInfo.paramPageNo < pageMbrSrchHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListSrchNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrSrchHstryInfo.paramPageNo == pageMbrSrchHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageMbrSrchHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
			<div class="tab-inner" id="tabMbrCntnArea" <c:if test="${srchMbrInfo.paramTabPstnId != 'CNTN' }">style="display:none;"</c:if>>
				<div class="table-wrap">
					<table>
						<colgroup>
							<col width="100px">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>로그인 일시</th>
							</tr>
						</thead>
						<tbody>
				<c:if test="${!empty mbrCntnHstryList}">
					<c:forEach var="mbrCntnHstryData" items="${mbrCntnHstryList}" varStatus="status">
							<tr>
								<td><c:out value="${mbrCntnHstryData.cntnListNo}"/></td>
								<td><c:out value="${mbrCntnHstryData.cntnDtV19}"/></td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty mbrCntnHstryList}">
							<tr>
								<td colspan="2">No Data</td>
							</tr>
				</c:if>
						</tbody>
					</table>
				</div>
				<!-- tab list page area start -->
				<div class="pagination">
					<c:if test="${!empty pageMbrCntnHstryInfo}">
						<c:if test="${pageMbrCntnHstryInfo.paramPageNo == pageMbrCntnHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrCntnHstryInfo.paramPageNo > pageMbrCntnHstryInfo.paramPageStartNo}">
					<span class="navi prev"><a href="#" onclick="javascript:moveListCntnPrevPage(); return false;">이전 페이지</a></span>
						</c:if>
						<c:forEach var="pmc" begin="${pageMbrCntnHstryInfo.paramPageStartNo}" end="${pageMbrCntnHstryInfo.paramPageEndNo}">
							<c:if test="${pmc == pageMbrCntnHstryInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;"><c:out value="${pmc}"/></a></span></c:if>
							<c:if test="${pmc != pageMbrCntnHstryInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:moveListCntnPageNo('<c:out value="${pmc}"/>'); return false;"><c:out value="${pmc}"/></a></span></c:if>
						</c:forEach>
						<c:if test="${pageMbrCntnHstryInfo.paramPageNo < pageMbrCntnHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="javascript:moveListCntnNextPage(); return false;">다음 페이지</a></span>
						</c:if>
						<c:if test="${pageMbrCntnHstryInfo.paramPageNo == pageMbrCntnHstryInfo.paramPageMaxNo}">
					<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
						</c:if>
					</c:if>
					<c:if test="${empty pageMbrCntnHstryInfo}">
					<span class="navi prev">이전 페이지</span>
					<span class="active"><a href="#">1</a></span>
					<span class="navi next">다음 페이지</span>
					</c:if>
				</div>
				<!-- tab list page area end -->
			</div>
		</div>
	</div>
	<!-- tab area end -->
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:70%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script type="text/javascript">
	function moveOpenPopTrck(paramTrckId) {
		let paramPopUrl = "";
		let srchPopPageNo = $("#srchPopPageNo").val();
		let srchPopPageRecordCnt = $("#srchPopPageRecordCnt").val();
		
		paramPopUrl += "/mbrMgt/popLayerTrckInfo.do";
		paramPopUrl += "?srchTrckId=" + paramTrckId;
		paramPopUrl += "&srchPopPageNo=" + srchPopPageNo;
		paramPopUrl += "&srchPopPageRecordCnt=" + srchPopPageRecordCnt;

		paramPopUrl = contextPath + paramPopUrl;
		
		$(".pop-layer").load(paramPopUrl);
		admin.modalsShow('modals'); 
	}

	function moveListMbrInfo() {
		let frmU = document.frmMbrDtl;
		frmU.action = contextPath +"/mbrMgt/mbrList.do";
		frmU.submit();
	}
	
	function moveTabChage(paramNewTabId) {
		let oldTabId = $("#srchTabPstnId").val();
		
		if (oldTabId == "DWNLD") {
			$("#tabMbrDwnld").removeClass("on");
			$("#tabDwnldArea").hide();
		} else if (oldTabId == "QNA") {
			$("#tabMbrQna").removeClass("on");
			$("#tabQnaArea").hide();
		} else if (oldTabId == "SRCH") {
			$("#tabMbrSrch").removeClass("on");
			$("#tabMbrSrchArea").hide();
		} else if (oldTabId == "CNTN") {
			$("#tabMbrCntn").removeClass("on");
			$("#tabMbrCntnArea").hide();
		}
		if (paramNewTabId == "DWNLD") {
			$("#tabMbrDwnld").addClass("on");
			$("#tabDwnldArea").show();
		} else if (paramNewTabId == "QNA") {
			$("#tabMbrQna").addClass("on");
			$("#tabQnaArea").show();
		} else if (paramNewTabId == "SRCH") {
			$("#tabMbrSrch").addClass("on");
			$("#tabMbrSrchArea").show();
		} else if (paramNewTabId == "CNTN") {
			$("#tabMbrCntn").addClass("on");
			$("#tabMbrCntnArea").show();
		}
		$("#srchTabPstnId").val(paramNewTabId);
	}
	
	//다운로드이력 Tab page 이동
	//선택한 페이징으로 이동
	function moveListDwnldPageNo(paramDataInt) {
		let frm = document.frmMbrDtl;
		frm.srchTabDwnldListPageNo.value = paramDataInt;
		frm.action = contextPath +"/mbrMgt/mbrDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListDwnldPrevPage() {
		let frm = document.frmMbrDtl;
		let nowPageNo = parseInt(frm.srchTabDwnldListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListDwnldPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListDwnldNextPage() {
		let frm = document.frmMbrDtl;
		let maxPageNo = parseInt(${pageMbrDwnldHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabDwnldListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListDwnldPageNo(movePageNo);
		}
	}
	
	
	//Qna문의이력 Tab page 이동
	//선택한 페이징으로 이동
	function moveListQnaPageNo(paramDataInt) {
		let frm = document.frmMbrDtl;
		frm.srchTabQnaListPageNo.value = paramDataInt;
		frm.action = contextPath + "/mbrMgt/mbrDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListQnaPrevPage() {
		let frm = document.frmMbrDtl;
		let nowPageNo = parseInt(frm.srchTabQnaListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListQnaPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListQnaNextPage() {
		let frm = document.frmMbrDtl;
		let maxPageNo = parseInt(${pageMbrQnaHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabQnaListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListQnaPageNo(movePageNo);
		}
	}
	
	
	//검색 Tab page 이동
	//선택한 페이징으로 이동
	function moveListSrchPageNo(paramDataInt) {
		let frm = document.frmMbrDtl;
		frm.srchTabSrchListPageNo.value = paramDataInt;
		frm.action = contextPath + "/mbrMgt/mbrDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListSrchPrevPage() {
		let frm = document.frmMbrDtl;
		let nowPageNo = parseInt(frm.srchTabSrchListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListSrchPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListSrchNextPage() {
		let frm = document.frmMbrDtl;
		let maxPageNo = parseInt(${pageMbrSrchHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabSrchListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListSrchPageNo(movePageNo);
		}
	}
	
	
	//접속이력 Tab page 이동
	//선택한 페이징으로 이동
	function moveListCntnPageNo(paramDataInt) {
		let frm = document.frmMbrDtl;
		frm.srchTabCntnListPageNo.value = paramDataInt;
		frm.action = contextPath + "/mbrMgt/mbrDtl.do";
		frm.submit();
	}
	
	// 이전페이지
	function moveListCntnPrevPage() {
		let frm = document.frmMbrDtl;
		let nowPageNo = parseInt(frm.srchTabCntnListPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			moveListCntnPageNo(movePageNo);
		}
	}
	
	// 다음페이지
	function moveListCntnNextPage() {
		let frm = document.frmMbrDtl;
		let maxPageNo = parseInt(${pageMbrCntnHstryInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchTabCntnListPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			moveListCntnPageNo(movePageNo);
		}
	}

</script>