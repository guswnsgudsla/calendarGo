<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	<%-- info detail area start --%>
	<div class="table-wrap write">
		<form name="frmRegSrch" id="frmRegSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchRcsExmnInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchRcsExmnInfo.paramRecordCnt}">
			<input type="hidden" id="srchRcsexmnId" name="srchRcsexmnId" value="${srchRcsExmnInfo.paramRcsexmnId}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="${srchRcsExmnInfo.paramWrtMode}">
			<input type="hidden" id="srchRcsexmnYr" name="srchRcsexmnYr" value="${srchRcsExmnInfo.paramRcsexmnYr}">
			<input type="hidden" id="srchRcsexmnDiv" name="srchRcsexmnDiv" value="${srchRcsExmnInfo.paramSrchRcsexmnDiv}">
			<input type="hidden" id="srchRcsexmnString" name="srchRcsexmnString" value="${srchRcsExmnInfo.paramSrchRcsexmnString}">
			<input type="hidden" id="srchBgngYr" name="srchBgngYr" value="${srchRcsExmnInfo.paramBgngYr}">
			<input type="hidden" id="srchEndYr" name="srchEndYr" value="${srchRcsExmnInfo.paramEndYr}">
			<input type="hidden" id="srchTabInstListPageNo" name="srchTabInstListPageNo" value="${srchRcsExmnInfo.paramTabInstListPageNo}">
			<input type="hidden" id="srchTabInstListRecordCnt" name="srchTabInstListRecordCnt" value="${srchRcsExmnInfo.paramTabInstListRecordCnt}">
			<input type="hidden" id="srchAddRcsexmnInstIds" name="srchAddRcsexmnInstIds" value="">
			<input type="hidden" id="srchDelsRcsexmnInstIds" name="srchDelsRcsexmnInstIds" value="">
			<table>
				<caption></caption>
				<colgroup>
					<col width="200px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
				<c:if test="${srchRcsExmnInfo.paramWrtMode == 'edit'}">
					<tr>
						<th>환경조사아이디</th>
						<td>${rcsExmnInfo.rcsexmnId}</td>
					</tr>
				</c:if>
					<tr>
						<th>환경조사명</th>
						<td>
							<div class="fm-ele">
								<input type="text" id="rcsexmnNm" name="rcsexmnNm" value="${rcsExmnInfo.rcsexmnNm}" placeholder="환경조사명을 입력하세요." />
							</div>
						</td>
					</tr>
					<tr>
						<th>환경조사연도</th>
						<td>
							<div class="fm-focus fm-select">
								<select id="rcsexmnYr" name="rcsexmnYr" class="" title="환경조사연도">
									<option value="" <c:if test="${rcsExmnInfo.rcsexmnYr == ''}">selected</c:if>>선택</option>
								<c:forEach var="srchYr" begin="${srchRcsExmnInfo.paramBgngYr}" end="${srchRcsExmnInfo.paramEndYr}" >
									<option value="${srchYr}" <c:if test="${rcsExmnInfo.rcsexmnYr == srchYr}">selected</c:if>>${srchYr}년</option>
								</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>환경조사기간</th>
						<td>
							<div class="fm-ele date" >
								<input type="date" id="rcsexmnBgngYmd" name="rcsexmnBgngYmd" value="${rcsExmnInfo.rcsexmnBgngYmdV10}" placeholder="시작 일자"/>
							</div>
							<span class="dash">~</span>
							<div class="fm-ele date">
								<input type="date" id="rcsexmnEndYmd" name="rcsexmnEndYmd" value="${rcsExmnInfo.rcsexmnEndYmdV10}" placeholder="종료 일자"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>환경조사 설명</th>
						<td>
							<div class="fm-textarea">
								<textarea id="rcsexmnCn" name="rcsexmnCn" cols="50" rows="5" placeholder="환경조사 설명을 입력하세요">${rcsExmnInfo.rcsexmnCn}</textarea>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%-- info detail area end --%>
	<%-- button area start --%>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnMovePrevPage" name="btnMovePrevPage" onclick="javascript:movePrevRcsExmnInfo(); return false;">이전</button>
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListRcsExmnInfo(); return false;">목록</button>
		<button type="button" class="btns" id="btnMoveSavePage" name="btnMoveSavePage" onclick="javascript:moveSaveRcsExmnInfo(); return false;">저장</button>
	</div>
	
	<%-- button area end --%>

	<div class="mid-title-wrap">
		<h2>환경조사 기관 목록</h2>
		<div class="btn-wrap align-right">
			<button type="button" id="btnPopInstListpage" name="btnPopInstListpage" class="btns size-small" onclick="javascript:moveOpenPopupInstList(); return false;">+ 기관</button>
		</div>
	</div>
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>Status</th>
					<th>기관ID</th>
					<th>기관명</th>
					<th>기관코드</th>
					<th>기관유형</th>
					<th>영역유형</th>
					<th>조사여부</th>
					<th>작성자</th>
					<th>전화번호</th>
					<th>조사시작일시</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody id="rcsExmnTrgtInstTBody">
		<c:if test="${!empty rcsExmnTrgtInstAllList}">
			<c:forEach var="instRcsexmnData" items="${rcsExmnTrgtInstAllList}" varStatus="status">
				<tr>
					<td><span id="exmnTrgtInstStts_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstStts">M</span>
						<input type="hidden" id="exmnTrgtInstSttsHdn_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstSttsHdn" value="M"/>
					</td>
					<td><span id="exmnTrgtInstId_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstId">${instRcsexmnData.instId}</span>
						<input type="hidden" id="exmnTrgtInstIdHdn_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstIdHdn" value="${instRcsexmnData.instId}"/>
					</td>
					<td><span id="exmnTrgtInstNm_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstNm">${instRcsexmnData.instNm}</span></td>
					<td><span id="exmnTrgtInstCd_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstCd">${instRcsexmnData.instCd}</span></td>
					<td><span id="exmnTrgtInstTypeNm_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstTypeNm">${instRcsexmnData.instTypeNm}</span></td>
					<td><span id="exmnTrgtFildTypeNm_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtFildTypeNm">${instRcsexmnData.fildTypeNm}</span></td>
					<td><span id="exmnTrgtInstSttNm_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstSttNm">${instRcsexmnData.exmnSttNm}</span>
						<input type="hidden" id="exmnTrgtInstBgngYn_${instRcsexmnData.listTrgtInstNo}" name="exmnTrgtInstBgngYn" value="${instRcsexmnData.exmnBgngYn}"/>
					</td>
					<td>${instRcsexmnData.exmnrNm}</td>
					<td>${instRcsexmnData.exmnrTelno}</td>
					<td>${instRcsexmnData.exmnBgngDtV19}</td>
					<td>
						<button type="button" class="btns size-xsmall color-red" id="btnDelExmnTrgtInst_${instRcsexmnData.listTrgtInstNo}" onclick="javascript:delExmnTrgtInstInfo('${instRcsexmnData.listTrgtInstNo}'); return false;">삭제</button>
						<%--<button type="button" class="btns size-xsmall color-gray" id="btnRstDispInstItem_${instRcsexmnData.listTrgtInstNo}" onclick="javascript:rstExmnTrgtInstInfo('${instRcsexmnData.listTrgtInstNo}'); return false;">복원</button>--%>
					</td>
				</tr>
			</c:forEach>
		</c:if>
			</tbody>
		</table>
	</div>
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:70%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script>

	function movePrevRcsExmnInfo() {
		history.back();
	}
	
	function moveListRcsExmnInfo() {
		let frm = document.frmRegSrch;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnList.do";
		frm.submit();
	}
	
	function moveSaveRcsExmnInfo() {
		let frm = document.frmRegSrch;
		let addTrgtInstIdList = "";
		let delTrgtInstIdList = "";
		if (cms_txt_is_empty(true, frm.rcsexmnNm)) { alert("환경조사명을 입력해 주십시오."); return false;}
		if (cms_select_is_empty(true, frm.rcsexmnYr)) { alert("환경조사연도를 선택해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frm.rcsexmnBgngYmd)) { alert("환경조사기간 시작일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frm.rcsexmnEndYmd)) { alert("환경조사기간 종료일을 입력해 주십시오."); return false;}
		
		if (typeof($("input[name=exmnTrgtInstSttsHdn]")) != "undefined") {
			if (typeof($("input[name=exmnTrgtInstSttsHdn]").length) != "undefined" ) {//여러개 일때
				for (let eti = 0 ; eti < $("input[name=exmnTrgtInstSttsHdn]").length; eti++) {
					if ($("input[name=exmnTrgtInstSttsHdn]").eq(eti).val() == "I") {
						if (addTrgtInstIdList == "") {
							addTrgtInstIdList = $("input[name=exmnTrgtInstIdHdn]").eq(eti).val();
						} else {
							addTrgtInstIdList += "|" + $("input[name=exmnTrgtInstIdHdn]").eq(eti).val();
						}
					} else if ($("input[name=exmnTrgtInstSttsHdn]").eq(eti).val() == "D") {
						if (delTrgtInstIdList == "") {
							delTrgtInstIdList = $("input[name=exmnTrgtInstIdHdn]").eq(eti).val();
						} else {
							delTrgtInstIdList += "|" + $("input[name=exmnTrgtInstIdHdn]").eq(eti).val();
						}
					}
				}
			} else {
				if ($("input[name=exmnTrgtInstSttsHdn]").val() == "I") {
					addTrgtInstIdList = $("input[name=exmnTrgtInstIdHdn]").val();
				} else if ($("input[name=exmnTrgtInstSttsHdn]").val() == "D") {
					delTrgtInstIdList = $("input[name=exmnTrgtInstIdHdn]").val();
				}
			}
			
		}
		
		if(confirm("저장하시겠습니까?")) {
			frm.srchAddRcsexmnInstIds.value = addTrgtInstIdList;
			frm.srchDelsRcsexmnInstIds.value = delTrgtInstIdList;
			frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnSave.do";
			frm.submit();
		}
	}
	
	function moveOpenPopupInstList() {
		let paramPopUrl = "";
		paramPopUrl = contextPath + "/exhMgt/popLayerExhInstList.do";
		
		if (paramPopUrl != "") {
			$(".pop-layer").load(paramPopUrl);
			admin.modalsShow('modals'); 
		}
	}
	
	function moveAddExhInstData(paramPopInstId) {
		let popExmnTrgtInstId = $("#hdnExhItemId_" + paramPopInstId).val();
		let popExmnTrgtInstNm = $("#hdnExhItemInstNm_" + paramPopInstId).val();
		let popExmnTrgtInstCd = $("#hdnExhItemInstCd_" + paramPopInstId).val();
		let popExmnTrgtInstTypeNm = $("#hdnExhItemInstTypeNm_" + paramPopInstId).val();
		let popExmnTrgtInstfildTypeNm = $("#hdnExhItemFildTypeNm_" + paramPopInstId).val();
		
		//기존 환경조사 대상 기관 목록에 있는지 체크
		let addInstListYn = "N";
		if ($("input[name=exmnTrgtInstIdHdn]").length == 0) {
			addInstListYn = "Y";
		} else {
			for (let dcr = 0; dcr < $("input[name=exmnTrgtInstIdHdn]").length; dcr++) {
				if ($("input[name=exmnTrgtInstIdHdn]").eq(dcr).val() == popExmnTrgtInstId) {
					alert("이미 설정되어 있는 기관입니다.");
					return false;
				} else {
					addInstListYn = "Y";
				}
			}
		}
		
		if (addInstListYn == "Y") {
			let tblTrgtInstBody, newTrgtInstRowNumber, newTrgtInstRow, viewInstRowNum, newTrgtInstCell0, newTrgtInstCell1, newTrgtInstCell2, newTrgtInstCell3, newTrgtInstCell4, newTrgtInstCell5, newTrgtInstCell6, newTrgtInstCell7, newTrgtInstCell8, newTrgtInstCell9, newTrgtInstCell10;
			tblTrgtInstBody = $("#rcsExmnTrgtInstTBody");
			newTrgtInstRowNumber = tblTrgtInstBody[0].rows.length;
			newTrgtInstRow = tblTrgtInstBody[0].insertRow(newTrgtInstRowNumber);
			newTrgtInstCell0 = newTrgtInstRow.insertCell();
			newTrgtInstCell1 = newTrgtInstRow.insertCell();
			newTrgtInstCell2 = newTrgtInstRow.insertCell();
			newTrgtInstCell3 = newTrgtInstRow.insertCell();
			newTrgtInstCell4 = newTrgtInstRow.insertCell();
			newTrgtInstCell5 = newTrgtInstRow.insertCell();
			newTrgtInstCell6 = newTrgtInstRow.insertCell();
			newTrgtInstCell7 = newTrgtInstRow.insertCell();
			newTrgtInstCell8 = newTrgtInstRow.insertCell();
			newTrgtInstCell9 = newTrgtInstRow.insertCell();
			newTrgtInstCell10 = newTrgtInstRow.insertCell();
			
			viewTrgtInstRowNum = tblTrgtInstBody[0].rows.length;
			
			newTrgtInstCell0.innerHTML = "<span id=\"exmnTrgtInstStts_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstStts\">I</span>";
			newTrgtInstCell0.innerHTML += "<input type=\"hidden\" id=\"exmnTrgtInstSttsHdn_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstSttsHdn\" value=\"I\" >";
			newTrgtInstCell1.innerHTML = "<span id=\"exmnTrgtInstId_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstId\">" + popExmnTrgtInstId + "</span>";
			newTrgtInstCell1.innerHTML += "<input type=\"hidden\" id=\"exmnTrgtInstIdHdn_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstIdHdn\" value=\"" + popExmnTrgtInstId + "\"/>";
			newTrgtInstCell2.innerHTML = "<span id=\"exmnTrgtInstNm_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstNm\">" + popExmnTrgtInstNm + "</span>";
			newTrgtInstCell3.innerHTML = "<span id=\"exmnTrgtInstCd_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstCd\">" + popExmnTrgtInstCd + "</span>";
			newTrgtInstCell4.innerHTML = "<span id=\"exmnTrgtInstTypeNm_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstTypeNm\">" + popExmnTrgtInstTypeNm + "</span>";
			newTrgtInstCell5.innerHTML = "<span id=\"exmnTrgtFildTypeNm_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtFildTypeNm\">" + popExmnTrgtInstfildTypeNm + "</span>";
			newTrgtInstCell6.innerHTML = "<span id=\"exmnTrgtInstSttNm_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstSttNm\"></span>";
			newTrgtInstCell6.innerHTML += "<input type=\"hidden\" id=\"exmnTrgtInstBgngYn_" + viewTrgtInstRowNum + "\" name=\"exmnTrgtInstBgngYn\" value=\"N\"/>";
			newTrgtInstCell7.innerHTML = "";
			newTrgtInstCell8.innerHTML = "";
			newTrgtInstCell9.innerHTML = "";
			newTrgtInstCell10.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnDelExmnTrgtInst_" + viewTrgtInstRowNum + "\" onclick=\"javascript:delExmnTrgtInstInfo('" + viewTrgtInstRowNum + "'); return false;\">삭제</button>";
			//newTrgtInstCell10.innerHTML += "<button type=\"button\" class=\"btns size-xsmall color-gray\" id=\"btnRstDispInstItem_" + viewInstRowNum + "\" onclick=\"javascript:rstExmnTrgtInstNewInfo('" + viewInstRowNum + "'); return false;\">복원</button>";
			
		}
		
	}
	
	function delExmnTrgtInstInfo(paramExmnTrgtInstListNo) {
		let exmnTrgtInstStts = $("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo).val();
		let exmnTrgtInstBgngYn = $("#exmnTrgtInstBgngYn_" + paramExmnTrgtInstListNo).val();
		
		if (exmnTrgtInstStts == "D") {
			alert("이미 삭제로 설정되었습니다.");
			return false;
		} else {
			if (exmnTrgtInstBgngYn != "N") {
				alert("이미 환경조사를 진행한 기관으로 삭제 설정이 불가능합니다.");
				return false;
			} else {
				if (confirm("대상으로 설정된 기관을 환경조사 대상기관에서 삭제하시겠습니까?")) {
					$("#exmnTrgtInstStts_" + paramExmnTrgtInstListNo).text("D");
					$("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo).val("D");
				} else {
					return false;
				}
			}
		}
	}
	
	function rstExmnTrgtInstInfo(paramExmnTrgtInstListNo) {
		let exmnTrgtInstStts = $("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo);
		
		if (exmnTrgtInstStts != "D") {//삭제가 아닌 경우
			alert("복원 대상 기관이 아닙니다.");
			return false;
		} else {
			if (confirm("삭제 설정된 기관을 복원하시겠습니까?")) {
				$("#exmnTrgtInstStts_" + paramExmnTrgtInstListNo).text("M");
				$("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo).val("M");
			} else {
				return false;
			}
		}
	}
	
	function rstExmnTrgtInstNewInfo(paramExmnTrgtInstListNo) {
		let exmnTrgtInstStts = $("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo);
		
		if (exmnTrgtInstStts == "I") {//삭제가 아닌 경우
			alert("복원 대상 기관이 아닙니다.");
			return false;
		} else {
			if (confirm("삭제 설정된 기관을 복원하시겠습니까?")) {
				$("#exmnTrgtInstStts_" + paramExmnTrgtInstListNo).text("I");
				$("#exmnTrgtInstSttsHdn_" + paramExmnTrgtInstListNo).val("I");
			} else {
				return false;
			}
		}
	}
	
</script>