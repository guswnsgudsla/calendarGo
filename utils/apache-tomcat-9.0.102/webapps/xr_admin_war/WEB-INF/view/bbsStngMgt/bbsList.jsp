<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">

	<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmBbsSrch" id="frmBbsSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="<c:out value="${srchBbsStngInfo.paramPageNo}"/>">
			<input type="hidden" id="srchBbsId" name="srchBbsId" value="">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select">
							<select id="srchType" name="srchType">
								<option value="ID" <c:if test="${srchBbsStngInfo.paramBbsSrchDiv == 'ID' or srchBbsStngInfo.paramBbsSrchDiv == ''}">selected</c:if>>게시판 아이디</option>
								<option value="NM" <c:if test="${srchBbsStngInfo.paramBbsSrchDiv == 'NM'}">selected</c:if>>게시판 명</option>
							</select>
						</div>
						<div class="fm-ele" data-size="w500">
							<input type="text" id="srchString" name="srchString" value="${srchBbsStngInfo.paramBbsSrchString}" placeholder="검색어을 입력하세요.">
						</div>
						<div class="fm-focus fm-select">
							<select id="srchBbsType" name="srchBbsType">
								<option value="" <c:if test="${srchBbsStngInfo.paramBbsTypeCd == ''}">selected</c:if>>게시판 유형</option>
								<c:if test="${!empty bbsTypeCmmnCdList}">
									<c:forEach var="bbsTypeCdRow" items="${bbsTypeCmmnCdList}">
								<option value="${bbsTypeCdRow.cdId}" <c:if test="${srchBbsStngInfo.paramBbsTypeCd == bbsTypeCdRow.cdId }">selected</c:if>>${bbsTypeCdRow.cdNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchUseYn" name="srchUseYn">
								<option value="" <c:if test="${srchBbsStngInfo.paramUseYn == ''}">selected</c:if>>전체</option>
								<option value="Y" <c:if test="${srchBbsStngInfo.paramUseYn == 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${srchBbsStngInfo.paramUseYn == 'N'}">selected</c:if>>중지</option>
							</select>
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="btnSrch" onclick="javascript:goSrchParam(); return false;">조회</button>
					<button type="button"  class="btns color-gray" id="btnSrchInit" onclick="javascript:goSrchParamReset(); return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<div class="list-option top between">
		<strong>전체건수 : <b>${pageInfo.paramTotListCnt}</b></strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnEntry" onclick="javascript:goEntryBbsInfo(); return false;">등록</button>
		</c:if>
	</div>
	
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="120px"></col>
				<col width="120px"></col>
				<col width="120px" style="display:none;"></col>
				<col width="120px" style="display:none;"></col>
				<col width="120px" style="display:none;"></col>
				<col width="100px"></col>
				<col width="200px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>게시판 명</th>
					<th>게시판 유형</th>
					<th>게시판 분류</th>
					<th style="display:none;">공지게시사용여부</th>
					<th style="display:none;">신규표시사용여부</th>
					<th style="display:none;">사용여부</th>
					<th>등록자</th>
					<th>등록 일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty bbsStngInfoList}">
				<c:forEach var="bbsData" items="${bbsStngInfoList}" varStatus="status">
				<tr>
					<td>${bbsData.listBbsNo}</td>
					<c:if test="${UserAuthrtInfo.prslAuthrtYn == 'Y'}">
					<td class="align-left"><a href="#" onclick="javascript:goViewBbsInfo('${bbsData.bbsId}'); return false;">${bbsData.bbsNm}</a></td>
					</c:if>
					<c:if test="${UserAuthrtInfo.prslAuthrtYn != 'Y'}">
					<td class="align-left"><a href="#" onclick="javascript:return false;">${bbsData.bbsNm}</a></td>
					</c:if>
					<td>${bbsData.bbsTypeNm}</td>
					<td>
						<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y' or UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
						<button type="button" name="btnBbsCtgry" class="btns size-xsmall" onclick="javascript:moveOpenPopupList('${bbsData.bbsId}'); return false;">관리</button>
						</c:if>
					</td>
					<td style="display:none;">
						<div class="switch-button" data-size="w100">
							<span><input type="radio" id="ntcPstgUseYnY_<c:out value="${bbsData.bbsId}"/>" name="ntcPstgUseYn_<c:out value="${bbsData.bbsId}"/>" value="Y" <c:if test="${bbsData.ntcPstgUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('NTCPSTGUSE', '<c:out value="${bbsData.bbsId}"/>', 'ntcPstgUseYnY_<c:out value="${bbsData.bbsId}"/>', 'ntcPstgUseYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntcPstgUseYnY_<c:out value="${bbsData.bbsId}"/>">ON</label></span>
							<span><input type="radio" id="ntcPstgUseYnN_<c:out value="${bbsData.bbsId}"/>" name="ntcPstgUseYn_<c:out value="${bbsData.bbsId}"/>" value="N" <c:if test="${bbsData.ntcPstgUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('NTCPSTGUSE', '<c:out value="${bbsData.bbsId}"/>', 'ntcPstgUseYnY_<c:out value="${bbsData.bbsId}"/>', 'ntcPstgUseYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntcPstgUseYnN_<c:out value="${bbsData.bbsId}"/>">OFF</label></span>
						</div>
					</td>
					<td style="display:none;">
						<div class="switch-button" data-size="w100">
							<span><input type="radio" id="newIndctYnY_<c:out value="${bbsData.bbsId}"/>" name="newIndctYn_<c:out value="${bbsData.bbsId}"/>" value="Y" <c:if test="${bbsData.newIndctYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('NEWINDCT', '<c:out value="${bbsData.bbsId}"/>', 'newIndctYnY_<c:out value="${bbsData.bbsId}"/>', 'newIndctYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="newIndctYnY_<c:out value="${bbsData.bbsId}"/>">ON</label></span>
							<span><input type="radio" id="newIndctYnN_<c:out value="${bbsData.bbsId}"/>" name="newIndctYn_<c:out value="${bbsData.bbsId}"/>" value="N" <c:if test="${bbsData.newIndctYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('NEWINDCT', '<c:out value="${bbsData.bbsId}"/>', 'newIndctYnY_<c:out value="${bbsData.bbsId}"/>', 'newIndctYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="newIndctYnN_<c:out value="${bbsData.bbsId}"/>">OFF</label></span>
						</div>
					</td>
					<td style="display:none;">
						<div class="switch-button" data-size="w100">
							<span><input type="radio" id="useYnY_<c:out value="${bbsData.bbsId}"/>" name="useYn_<c:out value="${bbsData.bbsId}"/>" value="Y" <c:if test="${bbsData.useYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('USE', '<c:out value="${bbsData.bbsId}"/>', 'useYnY_<c:out value="${bbsData.bbsId}"/>', 'useYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="useYnY_<c:out value="${bbsData.bbsId}"/>">ON</label></span>
							<span><input type="radio" id="useYnN_<c:out value="${bbsData.bbsId}"/>" name="useYn_<c:out value="${bbsData.bbsId}"/>" value="N" <c:if test="${bbsData.useYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwich('USE', '<c:out value="${bbsData.bbsId}"/>', 'useYnY_<c:out value="${bbsData.bbsId}"/>', 'useYnN_<c:out value="${bbsData.bbsId}"/>');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="useYnN_<c:out value="${bbsData.bbsId}"/>">OFF</label></span>
						</div>
					</td>
					<td><c:out value="${pf:getMaskingID(bbsData.frstRgtrId)}" /></td>
					<td><c:out value="${bbsData.frstRegDtV19}"/></td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty bbsStngInfoList}">
				<tr>
					<td colspan="9" class="tc">No Data</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="pagination">
		<c:if test="${!empty pageInfo}">
			<c:if test="${pageInfo.paramPageNo == pageInfo.paramPageStartNo}">
		<span class="navi prev"><a href="#" onclick="return false;">이전 페이지</a></span>
			</c:if>
			<c:if test="${pageInfo.paramPageNo > pageInfo.paramPageStartNo}">
		<span class="navi prev"><a href="#" onclick="javascript:goListPrevMove(); return false;">이전 페이지</a></span>
			</c:if>
			<c:forEach var="pi" begin="${pageInfo.paramPageStartNo}" end="${pageInfo.paramPageEndNo}">
				<c:if test="${pi == pageInfo.paramPageNo}"><span class="active"><a href="#" onclick="return false;">${pi}</a></span></c:if>
				<c:if test="${pi != pageInfo.paramPageNo}"><span class=""><a href="#" onclick="javascript:goListPageMove('${pi}'); return false;">${pi}</a></span></c:if>
			</c:forEach>
			<c:if test="${pageInfo.paramPageNo < pageInfo.paramPageMaxNo}">
		<span class="navi next"><a href="#" onclick="javascript:goListNextMove(); return false;">다음 페이지</a></span>
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
	
	<!-- 콘텐츠 영역 끝  -->
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:55%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script>

	function goSrchParam() {
		let frm = document.frmBbsSrch;
		frm.action = contextPath + "/bbsStngMgt/bbsList.do";
		frm.submit();
	}
	
	function goSrchParamReset() {
		let frm = document.frmBbsSrch;
		frm.srchType.value = "";
		frm.srchString.value = "";
		frm.srchBbsType.value = "";
		frm.srchUseYn.value = "";
	}
	
	//
	function goViewBbsInfo(paramDataString) {
		let frm = document.frmBbsSrch;
		frm.srchBbsId.value = paramDataString;
		frm.action = contextPath + "/bbsStngMgt/bbsDtl.do";
		frm.submit();
	}
	
	//
	function goEntryBbsInfo() {
		let frm = document.frmBbsSrch;
		frm.srchWrtMode.value = "entry";
		frm.action = contextPath + "/bbsStngMgt/bbsReg.do";
		frm.submit();
	}
	
	function goChangeSwich(paramMode, paramDataString, paramElementId1, paramElementId2) {
		if ($("#" + paramElementId1).is(':checked') == true) {
			paramUseValue = "Y";
		} else {
			paramUseValue = "N";
		}
		if (confirm("변경하시겠습니까?")) {
			
			$.ajax({
				type : "GET",
				url : contextPath + "/bbsStngMgt/updateBbsStngUseInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkBbsId" : paramDataString,
					"checkUseCd" : paramMode,
					"checkUseValue" : paramUseValue
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert("변경되었습니다.");
					} else {
						alert("데이터 이상으로 변경되지 못했습니다. 관리자에게 문의하십시오.");
						if (paramUseValue == "Y") {
							$("#" + paramElementId2).prop('checked', true);
						} else {
							$("#" + paramElementId1).prop('checked', true);
						}
						return false;
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
			
		} else {
			if (paramUseValue == "Y") {
				$("#" + paramElementId2).prop('checked', true);
			} else {
				$("#" + paramElementId1).prop('checked', true);
			}
		}
	}
	
	//페이지 이동
	function goListPageMove(paramDataInt) {
		let frm = document.frmBbsSrch;
		frm.srchPageNo.value = paramDataInt;
		frm.action = contextPath + "/bbsStngMgt/bbsList.do";
		frm.submit();
	}
	
	// 이전페이지
	function goListPrevMove() {
		let frm = document.frmBbsSrch;
		let nowPageNo = parseInt(frm.srchPageNo.value, 10);
		let movePageNo = nowPageNo - 1;
		if (movePageNo <= 0) {
			window.alert("이동할 이전 페이지가 존재하지 않습니다.");
			return false;
		} else {
			goListPageMove(movePageNo);
		}
	}
	
	// 다음페이지
	function goListNextMove() {
		let frm = document.frmBbsSrch;
		let maxPageNo = parseInt(${pageInfo.paramPageMaxNo}, 10);
		let nowPageNo = parseInt(frm.srchPageNo.value, 10);
		if (nowPageNo == maxPageNo) {
			window.alert("이동할 다음 페이지가 존재하지 않습니다.");
			return false;
		} else {
			let movePageNo = nowPageNo + 1;
			goListPageMove(movePageNo);
		}
		
	}
	
	
	//팝업창 열기
	function moveOpenPopupList(paramDataString) {
		let paramUrl = contextPath + "/bbsStngMgt/popBbsClsfList.do";
		if (paramDataString != "") {
			$(".pop-layer").load(paramUrl + "?srchPopBbsId=" + paramDataString);
			admin.modalsShow('modals'); 
		}
	}
	
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
		goSrchParam();
	}
	
	//팝업창 닫기 시 팝업에서 호출
	function goComLayerPopEnd() {
		$("#viewPopupArea").css("display", "none");
		$("#popupArea").atrr("src", "about:blank");
		$("html,body").css("overflow", "");
	}

</script>