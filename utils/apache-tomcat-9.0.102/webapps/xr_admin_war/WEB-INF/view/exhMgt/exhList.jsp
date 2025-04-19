<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">
	<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmListSrch"  id="frmListSrch" method="post" action="#">
			<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="${srchExhInfo.hdnMenuParam}">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchExhInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchExhInfo.paramRecordCnt}">
			<input type="hidden" id="srchDispTypeCd" name="srchDispTypeCd" value="${srchExhInfo.paramSrchDispTypeCd}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchDispId" name="srchDispId" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select">
							<select id="srchDispDiv" name="srchDispDiv" >
								<option value="ID" <c:if test="${srchExhInfo.paramSrchDispDiv == 'ID'}">selected</c:if>>전시 ID</option>
								<option value="NM" <c:if test="${srchExhInfo.paramSrchDispDiv == 'NM'}">selected</c:if>>전시 명</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w500">
							<input type="text" id="srchDistString" name="srchDistString" value="${srchExhInfo.paramSrchDispString}" placeholder="검색어를 입력하세요.">
						</div>
						<div class="fm-focus fm-select">
							<select id="srchUseYn" name="srchUseYn" >
								<option value="" <c:if test="${srchExhInfo.paramSrchUseYn == ''}">selected</c:if>>사용여부</option>
								<option value="Y" <c:if test="${srchExhInfo.paramSrchUseYn == 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${srchExhInfo.paramSrchUseYn == 'N'}">selected</c:if>>사용 안함</option>
							</select>
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns black" id="btnSrch" onclick="javascript:getListSrch(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnSrchInit" onclick="javascript:getListSrchReset(); return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" class="btns black" id="btnEntry" onclick="javascript:moveRegExhInfo(); return false;">전시목록 등록</button>
		</c:if>
	</div>
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="150px"></col>
				<col width="120px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
			<tr>
				<th>순번</th>
				<th>전시 ID</th>
				<th>전시 명</th>
				<th>
					<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0001'}">디지털문화자원수</c:if>
					<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0002'}">컬렉션 수</c:if>
					<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0003'}">기관 수</c:if>
				</th>
				<th>사용</th>
				<th>등록자</th>
				<th>등록일시</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty exhInfoList}">
				<c:forEach var="exhData" items="${exhInfoList}" varStatus="status">
				<tr>
					<td>${exhData.dispListNo}</td>
					<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<td><a href="#" onclick="javascript:moveDtlExhInfo('${exhData.dispId}'); return false;">${exhData.dispId}</a></td>
					<td class="align-left"><a href="#" onclick="javascript:moveDtlExhInfo('${exhData.dispId}'); return false;">${exhData.dispNm}</a></td>
					</c:if>
					<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td><a href="#" onclick="javascript:return false;">${exhData.dispId}</a></td>
					<td class="align-left"><a href="#"  onclick="javascript:return false;">${exhData.dispNm}</a></td>
					</c:if>
					<td>${exhData.dispListCnt}</td>
					<td>
						<div class="switch-button" data-size="w100">
							<span><input type="radio" id="switchY_${exhData.dispId}" name="useYn_${exhData.dispId}" value="Y" <c:if test="${exhData.useYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/><label for="switchY_${exhData.dispId}">Yes</label></span>
							<span><input type="radio" id="switchN_${exhData.dispId}" name="useYn_${exhData.dispId}" value="N" <c:if test="${exhData.useYn != 'Y'}">checked</c:if> onclick="javascript:return false;"/><label for="switchN_${exhData.dispId}">No</label></span>
						</div>
					</td>
					<td>${pf:getMaskingID(exhData.frstRgtrId)}</td>
					<td>${exhData.frstRegDtV19}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty exhInfoList}">
				<tr>
					<td colspan="7">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<!-- pagination 활성화 active -->
	<c:import url="/WEB-INF/view/include/custom_paging.jsp">
		<c:param name="currentPage" value="${srchExhInfo.currentPage}"/>
		<c:param name="totalPage" value="${srchExhInfo.totalPage}"/>
		<c:param name="totalRecord" value="${srchExhInfo.totalRecord}"/>
		<c:param name="recordCountPerPage" value="${srchExhInfo.recordCountPerPage}"/>
		<c:param name="pagePerBlock" value="${srchExhInfo.pagePerBlock}"/>
		<c:param name="calculPage" value="${srchExhInfo.calculPage}"/>
		<c:param name="funNm" value="fnList" />
		<c:param name="url" value="exhList.do" />
	</c:import>
	<!-- 콘텐츠 영역 끝  -->
</div>
<div class="modals" id="modals">
	<div class="pop_layer" id="relList" style="width:90%;">
	</div>
</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

	//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
	function getListSrch() {
		let frm = document.frmListSrch;
		frm.action = contextPath + "/exhMgt/exhList.do";
		frm.submit();
	}

	// 검색폼 값을 초기화
	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.srchDispDiv.value = "ID";
		frm.srchDistString.value = "";
		frm.srchUseYn.value = "";
	}

	// 상세 화면 이동
	function moveDtlExhInfo(paramString){
		let frm = document.frmListSrch;
		frm.srchDispId.value = paramString;
		frm.action = contextPath + "/exhMgt/exhDtl.do";
		frm.submit();
	}
	// 등록 화면으로 이동
	function moveRegExhInfo(){
		let frm = document.frmListSrch;
		frm.srchWrtMode.value = 'entry';
		frm.action = contextPath + "/exhMgt/exhReg.do";
		frm.submit();
	}
	
	function fnList(url, currentPage) {
		moveListPageNo(currentPage.currentPage);
	}

	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.srchPageNo.value = paramDataInt;
		frm.action = contextPath + "/exhMgt/exhList.do";
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