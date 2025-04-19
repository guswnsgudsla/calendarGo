<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">
	<%-- search area start --%>
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchUserInfo.hdnMenuParam}"/>">
			<input type="hidden" id="srchUserTypeCd" name="srchUserTypeCd" value="<c:out value="${srchUserInfo.paramSrchUserTypeCd}"/>">
			<input type="hidden" id="paramPageNo" name="paramPageNo" value="<c:out value="${srchUserInfo.paramPageNo}"/>">
			<input type="hidden" id="srchUserId" name="srchUserId" value="<c:out value="${srchUserInfo.paramUserId}"/>">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${srchUserInfo.paramTabPstnId}"/>">
			<input type="hidden" id="srchTabCntnHstryListPageNo" name="srchTabCntnHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabCntnHstryListPageNo}"/>">
			<input type="hidden" id="srchTabAprvHstryListPageNo" name="srchTabAprvHstryListPageNo" value="<c:out value="${srchUserInfo.paramTabAprvHstryListPageNo}"/>">
			<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
			<input type="hidden" id="srchInstInfoDiv" name="srchInstInfoDiv" value="<c:out value="${srchUserInfo.paramSrchInstInfoDiv}"/>">
			<input type="hidden" id="srchInstInfoString" name="srchInstInfoString" value="<c:out value="${srchUserInfo.paramSrchInstInfoString}"/>">
			</c:if>
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select">
							<select id="srchUserInfoDiv" name="srchUserInfoDiv" class="" title="사용자 조회항목">
								<option value="ID" <c:if test="${srchUserInfo.paramSrchUserInfoDiv == 'ID'}">selected</c:if>>아이디</option>
								<option value="NM" <c:if test="${srchUserInfo.paramSrchUserInfoDiv == 'NM' }">selected</c:if>>사용자명</option>
								<option value="NCM" <c:if test="${srchUserInfo.paramSrchUserInfoDiv == 'NCM' }">selected</c:if>>사용자별칭</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w300">
							<input type="text" id="srchUserInfoString" name="srchUserInfoString" value="${srchUserInfo.paramSrchUserInfoString}" placeholder="검색어를 입력하세요." />
						</div>
				
				<c:if test="${UserAuthrtInfo.authrtTypeCd ne 'USERTY0002'}">
						<div class="fm-focus fm-select">
							<select id="srchInstInfoDiv" name="srchInstInfoDiv" class="" title="기관 조회항목">
								<option value="ID" <c:if test="${srchUserInfo.paramSrchInstInfoDiv == 'ID' or srchUserInfo.paramSrchInstInfoDiv == '' }">selected</c:if>>기관아이디</option>
								<option value="NM" <c:if test="${srchUserInfo.paramSrchInstInfoDiv == 'NM'}">selected</c:if>>기관명</option>
								<option value="CD"  <c:if test="${srchUserInfo.paramSrchInstInfoDiv == 'CD'}">selected</c:if>>기관코드</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w300">
							<input type="text" id="srchInstInfoString" name="srchInstInfoString" value="${srchUserInfo.paramSrchInstInfoString}" placeholder="검색어를 입력하세요." />
						</div>
				</c:if>
						<div class="fm-focus fm-select">
							<select id="srchUserAuthrtId" name="srchUserAuthrtId" class="" title="권한정보">
								<option value="" <c:if test="${srchUserInfo.paramSrchUserAuthrtId == ''}">selected</c:if>>전체</option>
						<c:if test="${!empty userAuthrtIdList}">
							<c:forEach var="authrtData" items="${userAuthrtIdList}">
								<option value="${authrtData.authrtId}" <c:if test="${srchUserInfo.paramSrchUserAuthrtId == authrtData.authrtId }">selected</c:if>>${authrtData.authrtNm}</option>
							</c:forEach>
						</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchUserSttCd" name="srchUserSttCd" class="" title="상태정보">
								<option value="" <c:if test="${srchUserInfo.paramSrchUserSttCd == ''}">selected</c:if>>전체</option>
						<c:if test="${!empty userSttcTypeCmmnCdList}">
							<c:forEach var="sttCdRow" items="${userSttcTypeCmmnCdList}">
								<option value="${sttCdRow.cdId}" <c:if test="${srchUserInfo.paramSrchUserSttCd == sttCdRow.cdId }">selected</c:if>>${sttCdRow.cdNm}</option>
							</c:forEach>
						</c:if>
							</select>
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
	<%-- search area end --%>
	<%-- list count area & regist button area --%>
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" id="btnReg" name="btnReg" class="btns" onclick="javascript:moveRegUserInfo(); return false;">등록</button>
		</c:if>
	</div>	
	<%-- list area start  --%>
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="150px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="180px"></col>
				<col width="180px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>사용자 아이디</th>
					<th>사용자 명</th>
					<th>사용자 별칭</th>
					<th>기관명</th>
					<th>권한명</th>
					<th>승인여부</th>
					<th>승인자</th>
					<th>승인일시</th>
					<th>신청일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty userInfoList}">
				<c:forEach var="userData" items="${userInfoList}" varStatus="status">
				<tr>
					<td>${userData.userListNo}</td>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<td><a href="#" onclick="javascript:moveDltUserInfo('<c:out value="${userData.userId}"/>'); return false;"><c:out value="${pf:getMaskingID(userData.userId)}" /></a></td>
					<td><a href="#" onclick="javascript:moveDltUserInfo('<c:out value="${userData.userId}"/>'); return false;"><c:out value="${pf:getMaskingName(userData.userNm)}" /></a></td>
					<td><a href="#" onclick="javascript:moveDltUserInfo('<c:out value="${userData.userId}"/>'); return false;"><c:out value="${userData.userNcm}"/></a></td>
				</c:if>
				<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;"><c:out value="${pf:getMaskingID(userData.userId)}" /></a></td>
					<td><a href="#" onclick="javascript:return false;"><c:out value="${pf:getMaskingName(userData.userNm)}" /></a></td>
					<td><a href="#" onclick="javascript:return false;"><c:out value="${userData.userNcm}"/></a></td>
				</c:if>
				<c:if test="${!empty userData.instId}">
					<td><c:out value="${userData.instNm}"/>(<c:out value="${userData.instCd}"/>)</td>
				</c:if>
				<c:if test="${empty userData.instId}">
					<td><c:out value="${userData.instNm}"/></td>
				</c:if>
					<td><c:out value="${userData.authrtNm}"/></td>
					<td><c:out value="${userData.aprvYnNm}"/></td>
					<td>${pf:getMaskingID(userData.autzrId)}</td>
					<td><c:out value="${userData.aprvDtV19}"/></td>
					<td><c:out value="${userData.frstRegDtV19}"/></td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty userInfoList}">
				<tr>
					<td colspan="10">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<%-- list area end --%>
	
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
			<span class="navi prev">이전 페이지</span>
			<span class="active"><a href="#">1</a></span>
			<span class="navi next">다음 페이지</span>
			</c:if>
		</div>
	</div>
	<%-- page area end --%>
</div>
<script type="text/javascript">
	
	function getListSrch() {
		let frm = document.frmListSrch;
		frm.action = contextPath + "/userMgt/userList.do";
		frm.submit();
	}
	
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchUserInfoDiv.value = "ID";
		frm.srchUserInfoString.value = "";
		frm.srchInstInfoDiv.value = "NM";
		frm.srchInstInfoString.value = "";
		frm.srchUserAuthrtId.value = "";
		frm.srchUserSttCd.value = "";
	}
	
	
	function moveDltUserInfo(paramString) {
		let frm = document.frmListSrch;
		frm.srchUserId.value = paramString;
		frm.action = contextPath + "/userMgt/userDtl.do";
		frm.submit();
	}
	
	function moveRegUserInfo() {
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/userMgt/userReg.do";
		frm.submit();
	}
	
	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.paramPageNo.value = paramDataInt;
		frm.action = contextPath + "/userMgt/userList.do";
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