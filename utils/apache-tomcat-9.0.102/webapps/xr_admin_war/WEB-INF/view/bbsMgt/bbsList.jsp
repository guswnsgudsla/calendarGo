<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="contants">
	<c:set var="reqId" value="BBS0000002" />
	<c:set var="qnaId" value="QNA" />
	<c:set var="isReqId" value="${srchBbsInfo.paramBbsId eq reqId}" />
	<c:set var="isQnaId" value="${srchBbsInfo.paramBbsId eq qnaId}" />
	<c:set var="displayExtraColumns" value="${isReqId or isQnaId}" />
	<!-- search area start -->
	<div class="control-wrap">
		<form id="frmListSrch" name="frmListSrch" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
			<input type="hidden" id="paramPageNo" name="paramPageNo" value="<c:out value="${srchBbsInfo.paramPageNo}"/>">
			<input type="hidden" id="paramBbsId" name="paramBbsId" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
			<input type="hidden" id="paramPstId" name="paramPstId" value="<c:out value="${srchBbsInfo.paramPstId}"/>">
			<div class="search">
				<div class="filter">
					<div class="row">
						<c:if test="${isReqId}">
							<div class="fm-focus fm-select">
								<select id="srchInstType" name="srchInstType" class="" title="기관">
									<option value="name" <c:if test="${empty srchBbsInfo.paramSrchInstType or srchBbsInfo.paramSrchInstType == 'name'}">selected</c:if>>기관명</option>
									<option value="id" <c:if test="${srchBbsInfo.paramSrchInstType == 'id'}">selected</c:if>>기관ID</option>
									<option value="code" <c:if test="${srchBbsInfo.paramSrchInstType == 'code'}">selected</c:if>>기관코드</option>
								</select>
							</div>
							<div class="fm-ele">
								<input type="text" id="srchInstString" name="srchInstString" value="<c:out value="${srchBbsInfo.paramSrchInstString}"/>" placeholder="검색어를 입력하세요">
							</div>
						</c:if>
						<span class="tit">검색기간</span>
						<div class="fm-ele date">
							<input type="date" id="paramBgngYmd" name="paramBgngYmd" value="<c:out value="${srchBbsInfo.paramBgngYmd}"/>" placeholder="시작 일자"/>
							<%--								<input type="date" id="paramBgngYmd" name="paramBgngYmd"  placeholder="시작 일자"/>--%>
						</div >
						<span>~</span>
						<div class="fm-ele date">
							<input type="date" id="paramEndYmd" name="paramEndYmd" value="<c:out value="${srchBbsInfo.paramEndYmd}"/>" placeholder="종료 일자"/>
							<%--								<input type="date" id="paramEndYmd" name="paramEndYmd" placeholder="종료 일자"/>--%>
						</div>
						<div class="fm-focus fm-select">
							<select id="paramSrchTrgt" name="paramSrchTrgt" class="" title="조회조건">
								<option value="ttl" <c:if test="${empty srchBbsInfo.paramSrchTrgt or srchBbsInfo.paramSrchTrgt == 'ttl'}">selected</c:if>>제목</option>
								<option value="cn" <c:if test="${srchBbsInfo.paramSrchTrgt == 'cn'}">selected</c:if>>내용</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w400">
							<input type="text"  id="paramSrchString" name="paramSrchString" value="<c:out value="${srchBbsInfo.paramSrchString}"/>" placeholder="검색어를 입력하세요." >
						</div>
						<c:if test="${!empty bbsClsfCdList}">
							<div class="fm-focus fm-select">
								<select id="paramSrchClsfCd" name="paramSrchClsfCd" class="" title="게시판분류">
									<option value="" <c:if test="${srchBbsInfo.paramSrchBbsClsfCd == ''}">selected</c:if>>선택</option>
									<c:forEach var="bbsClsfCdRow" items="${bbsClsfCdList}">
										<option value="<c:out value="${bbsClsfCdRow.clsfCd}"/>" <c:if test="${srchBbsInfo.paramSrchBbsClsfCd == bbsClsfCdRow.clsfCd }">selected</c:if>>${bbsClsfCdRow.clsfNm}</option>
									</c:forEach>
								</select>
							</div>
						</c:if>
						<c:if test="${srchBbsInfo.paramBbsId eq reqId}">
							<div class="fm-focus fm-select">
								<select id="srchAnsStatus" name="srchAnsStatus" class="" title="답변 완료 유무">
									<option value="" <c:if test="${srchBbsInfo.srchAnsStatus == '' }">selected</c:if>>전체</option>
									<option value="N" <c:if test="${srchBbsInfo.srchAnsStatus == 'N' }">selected</c:if>>대기</option>
									<option value="Y" <c:if test="${srchBbsInfo.srchAnsStatus == 'Y' }">selected</c:if>>완료</option>
								</select>
							</div>
						</c:if>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns black" id="btnSrch" onclick="javascript:getListSrch(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnSrchRst" onclick="javascript:getListSrchReset(); return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<!-- search area end -->
	<!-- list count area & regist button area start -->
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${srchBbsInfo.paramBbsId  ne 'JOIN'}">
			<c:if test="${authority eq 'AUTH000001' or authority eq 'AUTH000003' or srchBbsInfo.paramBbsId eq 'BBS0000002'}">
				<c:if test="${srchBbsInfo.paramBbsId ne 'QNA'}">
					<div class="btn-wrap align-right">
						<button type="button" id="btnReg" name="btnReg" class="btns" onclick="javascript:moveRegWhtprInfo(); return false;">등록</button>
					</div>
				</c:if>
			</c:if>
		</c:if>
	</div>
	<!-- list count area & regist button area end -->
	<!--  list area start -->
	<div class="table-wrap">
		<table class="list">
			<colgroup>
				<col width="80px"></col>
				<col width="*"></col>
				<c:if test="${displayExtraColumns}">
					<col width="100px"></col>
					<c:if test="${isReqId}">
						<col width="100px"></col>
					</c:if>
				</c:if>
				<col width="100px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<c:if test="${displayExtraColumns}">
						<th>답변 완료 유무</th>
						<c:if test="${isReqId}">
							<th>기관</th>
						</c:if>
					</c:if>
					<th>조회수</th>
					<th>작성자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<%--포털 공지사항 게시글 리스트--%>
			<c:if test="${!empty bbsInfoList}">
				<c:forEach var="bbsPstData" items="${bbsInfoList}" varStatus="status">
					<tr>
						<td><c:out value="${bbsPstData.listPstNo}"/></td>
						<td style="text-align: left;">
							<a href="#" onclick="javascript:moveDltBbsInfo('${bbsPstData.pstId}'); return false;">
								<c:out value=""/>${bbsPstData.pstTtl}
								<c:if test="${srchBbsInfo.paramBbsId eq 'QNA'}">
									 [${bbsPstData.lnkgContsTtl}]
									 - ${fn:substring(bbsPstData.pstCn, 0, 20)}...
								</c:if>
							</a>
						</td>
						<c:if test="${displayExtraColumns}">
							<c:choose>
								<c:when test="${empty bbsPstData.ansId}">
									<td>대기</td>
								</c:when>
								<c:otherwise>
									<td>완료</td>
								</c:otherwise>
							</c:choose>
							<c:if test="${srchBbsInfo.paramBbsId eq reqId}">
								<td><c:out value="${bbsPstData.wrtInstNm}"/></td>
							</c:if>
						</c:if>
						<td><c:out value="${bbsPstData.inqCnt}"/></td>
						<td><c:out value="${pf:getMaskingID(bbsPstData.frstRgtrId)}"/></td>
<%--						<td>${bbsPstData.frstRgtrNcm}(${whtprData.frstRgtrId})</td>--%>
						<td><c:out value="${bbsPstData.frstRegDtV19}"/></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty bbsInfoList}">
				<tr>
					<td colspan="5">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<!--  list area end -->
	
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
		frm.action = contextPath + "/bbsMgt/bbsList.do";
		frm.submit();
	}

	function getListSrchReset() {
		let frm = document.frmListSrch;
		frm.paramBgngYmd.value = "";
		frm.paramEndYmd.value = "";
		frm.paramSrchString.value = "";
		frm.srchAnsStatus.value = "";
		frm.srchInstType.value = "name";
		frm.srchInstString.value = "";
	}

	// 상세 페이지로 이동
	function moveDltBbsInfo(pstId){
		let frm = document.frmListSrch;
		frm.paramPstId.value = pstId;
		frm.action = contextPath + "/bbsMgt/bbsDtl.do";
		frm.submit();
	}

	// 등록 페이지로 이동
	function moveRegWhtprInfo(){
		let frm = document.frmListSrch;
		frm.action = contextPath + "/bbsMgt/bbsReg.do";
		frm.submit();
	}

	//선택한 페이징으로 이동
	function moveListPageNo(paramDataInt) {
		let frm = document.frmListSrch;
		frm.paramPageNo.value = paramDataInt;
		frm.action = contextPath + "/bbsMgt/bbsList.do";
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