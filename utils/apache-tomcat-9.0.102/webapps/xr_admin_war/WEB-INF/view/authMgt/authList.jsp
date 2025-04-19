<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %>
<div class="contants">
	<%-- search area start --%>
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="${srchAuthrtInfo.hdnMenuParam}">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchAuthrtInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchAuthrtInfo.paramRecordCnt}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchAuthrtId" name="srchAuthrtId" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-select">
							<select id="srchAuthrtTypeDiv" name="srchAuthrtTypeDiv" class="" title="권한유형">
								<option value="" <c:if test="${srchAuthrtInfo.paramAuthrtTypeDiv == ''}">selected</c:if>>권한유형전체</option>
								<c:if test="${!empty authTypeCmmnCdList}">
									<c:forEach var="authCdRow" items="${authTypeCmmnCdList}">
										<option value="${authCdRow.cdId}" <c:if test="${srchAuthrtInfo.paramAuthrtTypeDiv == authCdRow.cdId }">selected</c:if>>${authCdRow.cdNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-select">
							<select id="srchAuthrtUseYn" name="srchAuthrtUseYn" class="" title="사용여부">
								<option value="" <c:if test="${srchAuthrtInfo.paramAuthrtUseYn == ''}">selected</c:if>>사용여부</option>
								<option value="ID" <c:if test="${srchAuthrtInfo.paramAuthrtUseYn eq 'Y'}">selected</c:if>>사용</option>
								<option value="NM" <c:if test="${srchAuthrtInfo.paramAuthrtUseYn eq 'N'}">selected</c:if>>사용안함</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w700">
							<input type="text" id="srchAuthrtString" name="srchAuthrtString" value="${srchAuthrtInfo.paramAuthrtString}" placeholder="권한명을 입력하세요." />
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
	<%-- search area end --%>
	<%-- list count area & regist button area start --%>
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" id="btnReg" name="btnReg" class="btns" onclick="javascript:moveRegRcsExmnInfo(); return false;">등록</button>
		</c:if>
	</div>
	<%-- list count area & regist button area end --%>
	<%-- list area start  --%>
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>권한 아이디</th>
					<th>권한 명</th>
					<th>권한유형</th>
					<th>상태</th>
					<th>등록자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${!empty authrtInfoList}">
			<c:forEach var="authrtData" items="${authrtInfoList}" varStatus="status">
				<tr>
					<td>${authrtData.authListNo}</td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">	
					<td><a href="#" onclick="javascript:moveDltAuthrtInfo('<c:out value="${authrtData.authrtId}"/>'); return false;"><c:out value="${authrtData.authrtId}"/></a></td>
					<td><a href="#" onclick="javascript:moveDltAuthrtInfo('<c:out value="${authrtData.authrtId}"/>'); return false;"><c:out value="${authrtData.authrtNm}"/></a></td>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;"><c:out value="${authrtData.authrtId}"/></a></td>
					<td><a href="#" onclick="javascript:return false;"><c:out value="${authrtData.authrtNm}"/></a></td>
				</c:if>
					<td><c:out value="${authrtData.authrtTypeNm}"/></td>
					<td><c:out value="${authrtData.useYnNm}"/></td>
					<td><c:out value="${authrtData.frstRgtrNcm}"/>(<c:out value="${pf:getMaskingID(authrtData.frstRgtrId)}" />)</td>
					<td><c:out value="${authrtData.frstRegDtV19}"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty authrtInfoList}">
				<tr>
					<td colspan="7">No Data</td>
				</tr>
		</c:if>
			</tbody>
		</table>
	</div>
	<%-- list area end  --%>
	<%-- page area start --%>
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
			<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
			<span class="active"><a href="#">1</a></span>
			<span class="navi next"><a href="#" onclick="return false;">다음 페이지</a></span>
			</c:if>
		</div>
	</div>
	<%-- page area end --%>
</div>
<script type="text/javascript">
	function getListSrch() {
		let frm = document.frmListSrch;
		frm.action = contextPath + "/authMgt/authList.do";
		frm.submit();
	}
	
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchAuthrtString.value = "";
		frm.srchAuthrtTypeDiv.value = "";
		frm.srchAuthrtUseYn.value = "";
	}
	
	function moveDltAuthrtInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchAuthrtId.value = paramString;
		frm.action = contextPath + "/authMgt/authDtl.do";
		frm.submit();
	}
	
	function moveRegRcsExmnInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/authMgt/authReg.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.paramPageNo.value = paramDataInt;
		frm.action = contextPath + "/authMgt/authList.do";
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