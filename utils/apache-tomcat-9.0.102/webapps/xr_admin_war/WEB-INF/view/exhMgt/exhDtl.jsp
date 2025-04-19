<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	<%-- info detail area start --%>
	<div class="table-wrap write">
		<table>
			<colgroup>
				<col width="200px">
				<col width="">
				<col width="200px">
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th>전시 ID</th>
					<td class="tl pl10"><c:out value="${exhInfo.dispId}"/></td>
					<th>전시 명</th>
					<td class="tl pl10"><c:out value="${exhInfo.dispNm}"/></td>
				</tr>
				<tr>
					<th>전시 기간</th>
					<td class="tl pl10">
						<c:if test="${!empty exhInfo.exbiBgngYmd}"><c:out value="${exhInfo.exbiBgngYmdV10}"/></c:if>
						<c:if test="${!empty exhInfo.exbiBgngYmd or !empty exhInfo.exbiEndYmd}"> ~ </c:if>
						<c:if test="${!empty exhInfo.exbiEndYmd}"><c:out value="${exhInfo.exbiEndYmdV10}"/></c:if>
					</td>
					<th>사용 설정</th>
					<td class="tl pl10">
						<div class="switch-button" data-size="w100">
							<span><input type="radio" id="useYnY" name="useYn" value="Y" <c:if test="${exhInfo.useYn == 'Y'}">checked</c:if> disabled/><label for="useYnY">Yes</label></span>
							<span><input type="radio" id="useYnN" name="useYn" value="N" <c:if test="${exhInfo.useYn == 'N'}">checked</c:if> disabled/><label for="useYnN">No</label></span>
						</div>
					</td>
				</tr>
				<!-- 파일 이름 없으면 보여주지 않기 -->
				<c:if test="${exhInfo.strgFileNm ne null and exhInfo.strgFileNm ne ''}">
				<tr>
					<th>대표 이미지</th>
					<td colspan="3">
						<div id="imageZone" style="width:30%;" >
							<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${exhInfo.filePath}&fileNm=${exhInfo.strgFileNm}&atchFileGroupId=${exhInfo.rprsImgGroupId}' />"  alt="${exhInfo.orgnlAtchFileNm}" style="width: 100%; height: 100%">
						</div>
					</td>
				</tr>
				</c:if>
				<tr>
					<th>전시 설명</th>
					<td class="tl pl10" colspan="3"><c:out value="${exhInfo.exbiExplnCn}"/></td>
				</tr>
				<tr>
					<th>활용 사례</th>
					<td class="tl pl10" colspan="3"><c:out value="${exhInfo.contsCnjtEfctExplnCn}"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- info detail area end --%>

	<%-- button arae start --%>
	<div class="btn-wrap align-right">
		
		<button type="button" id="btnMoveListPage" name="btnMoveListPage" class="btns color-gray" onclick="javascript:moveListPage(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<button type="button" id="btnMoveEditPage"  name="btnMoveEditPage" class="btns" onclick="javascript:moveEditPage(); return false;">수정</button>
		</c:if>
	</div>
	<%-- button area end  --%>
	<%--select area start--%>
	<div class="control-wrap mt100">
		<form name="frmSrchDtl"  id="frmSrchDtl" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="${srchExhInfo.hdnMenuParam}">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchExhInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchExhInfo.paramRecordCnt}">
			<input type="hidden" id="srchDispTypeCd" name="srchDispTypeCd" value="${srchExhInfo.paramSrchDispTypeCd}">
			<input type="hidden" id="srchDispDiv" name="srchDispDiv" value="${srchExhInfo.paramSrchDispDiv}">
			<input type="hidden" id="srchDistString" name="srchDistString" value="${srchExhInfo.paramSrchDispString}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchDispId" name="srchDispId" value="${srchExhInfo.paramDispId}">
			<input type="hidden" id="srchTabPageNo" name="srchTabPageNo" value="${srchExhInfo.paramTabDispListPageNo}">
			<input type="hidden" id="srchTabRecordCnt" name="srchTabRecordCnt" value="${srchExhInfo.paramTabDispListRecordCnt}">
			<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0003'}">
			<input type="hidden" id="srchTabDgtlDiv" name="srchTabDgtlDiv" value="${srchExhInfo.paramTabDgtlDiv}">
			<input type="hidden" id="srchTabDgtlString" name="srchTabDgtlString" value="${srchExhInfo.paramTabDgtlString}">
			</c:if>
			<input type="hidden" id="hdnAddItemIds" name="hdnAddItemIds" value="">
			<input type="hidden" id="hdnEditItemIds" name="hdnEditItemIds" value="">
			<input type="hidden" id="hdnDelItemIds" name="hdnDelItemIds" value="">
			<div class="search">
				<div class="filter">
					<div class="row">
						<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0001'}">
							<div class="fm-focus fm-select">
								<select id="srchTabDgtlDiv" name="srchTabDgtlDiv" >
									<option value="ID" <c:if test="${srchExhInfo.paramTabDgtlDiv == 'ID'}">selected</c:if>>문화자원 ID</option>
									<option value="NM" <c:if test="${srchExhInfo.paramTabDgtlDiv == 'NM'}">selected</c:if>>문화자원 명</option>
								</select>
							</div>
							<div class="fm-ele" data-size="w300">
								<input type="text" id="srchTabDgtlString" name="srchTabDgtlString" value="${srchExhInfo.paramTabDgtlString}" placeholder="검색어를 입력하세요.">
							</div>
						</c:if>
						<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0002'}">
							<div class="fm-focus fm-select">
								<select id="srchTabDgtlDiv" name="srchTabDgtlDiv" >
									<option value="ID" <c:if test="${srchExhInfo.paramTabDgtlDiv == 'ID'}">selected</c:if>>컬렉션 ID</option>
									<option value="NM" <c:if test="${srchExhInfo.paramTabDgtlDiv == 'NM'}">selected</c:if>>컬렉션 명</option>
								</select>
							</div>
							<div class="fm-ele" data-size="w300">
								<input type="text" id="srchTabDgtlString" name="srchTabDgtlString" value="${srchExhInfo.paramTabDgtlString}" placeholder="검색어를 입력하세요.">
							</div>
						</c:if>
						<div class="fm-focus fm-select">
							<select id="srchTabInstDiv" name="srchTabInstDiv" >
								<option value="NM" <c:if test="${srchExhInfo.paramTabInstDiv == 'NM'}">selected</c:if>>기관명</option>
								<option value="CD" <c:if test="${srchExhInfo.paramTabInstDiv == 'CD'}">selected</c:if>>기관코드</option>
							</select>
						</div>
						<div class="fm-ele" data-size="<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0003'}">w700</c:if><c:if test="${srchExhInfo.paramSrchDispTypeCd != 'PTDPTY0003'}">w300</c:if>">
							<input type="srchTabInstString"  name="srchTabInstString" value="${srchExhInfo.paramTabInstString}" placeholder="검색어를 입력하세요.">
						</div>
						<div class="fm-focus fm-select">
							<select id="srchTabRlsYn" name="srchTabRlsYn" >
								<option value="" <c:if test="${srchExhInfo.paramTabRlsYn == ''}">selected</c:if>>전시 전체</option>
								<option value="Y" <c:if test="${srchExhInfo.paramTabRlsYn == 'Y'}">selected</c:if>>전시</option>
								<option value="N" <c:if test="${srchExhInfo.paramTabRlsYn == 'N'}">selected</c:if>>전시 해제</option>
							</select>
						</div>
					</div>
				</div>
				<div class="align-right">
					<button type="button" class="btns" id="btnSrch" onclick="javascript:goSearchParam(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnSrchInit" onclick="javascript:goSrchParamReset(); return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<%-- select area end --%>

	<div class="mid-title-wrap mt10">
		<h2>
			<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0001'}">디지털문화자원</c:if>
			<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0002'}">컬렉션</c:if>
			<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0003'}">기관</c:if>
		</h2>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<div class="btn-wrap align-right">
			<button type="button" id="btnDtlOpenPop" name="btnDtlOpenPop" class="btns" onclick="javascript:moveOpenPopupListPage(); return false;">+추가</button>
			<button type="button" id="btnMoveSaveDtlDyspItem" name="btnMoveSaveDtlDyspItem" class="btns" onclick="javascript:saveExhDispItemList(); return false;">저장</button>
		</div>
		</c:if>
	</div>
	<div class="table-wrap">
		<%-- DgtlClrcs List Start --%>
		<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0001'}">
			<table>
				<colgroup>
					<col width="50px">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="220px">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>문화자원ID</th>
						<th>디지털문화자원명</th>
						<th>소장기관</th>
						<th>정렬</th>
						<th>전시</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody id="exhDispClrcsItemTbody">
			<c:if test="${!empty exhDispItemInfoList}">
				<c:forEach var="exhDispItemData" items="${exhDispItemInfoList}" varStatus="status">
					<tr>
						<td><span id="dispClrcsItemStts_${exhDispItemData.dispItemListNo}" name="dispClrcsItemStts">M</span>
							<input type="hidden" id="dispClrcsItemSttsHdn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemSttsHdn" value="M"></td>
						<td><span id="dispClrcsItemId_${exhDispItemData.dispItemListNo}" name="dispClrcsItemId">${exhDispItemData.dspyItemId}</span>
							<input type="hidden" id="dispClrcsItemIdHdn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemIdHdn" value="${exhDispItemData.dspyItemId}" readonly></td>
						<td><span id="dispClrcsItemNm_${exhDispItemData.dispItemListNo}" name="dispClrcsItemNm">${exhDispItemData.dspyItemNm}</span></td>
						<td><span id="dispClrcsItemInstNm_${exhDispItemData.dispItemListNo}" name="dispClrcsItemInstNm">${exhDispItemData.instNm}</span></td>
						<td><div class="fm-ele"><input type="text" id="dispClrcsItemSortSn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemSortSn" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${exhDispItemData.sortSn}" style="ime-mode:disabled;"></div>
							<input type="hidden" id="dispClrcsItemSortSnHdn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemSortSnHdn" value="${exhDispItemData.sortSn}"></td>
						<td>
							<div class="fm-focus fm-select" data-size="w200">
								<select id="dispClrcsItemRlsYn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemRlsYn">
									<option value="Y" <c:if test="${exhDispItemData.rlsYn =='Y'}">selected</c:if>>전시</option>
									<option value="N" <c:if test="${exhDispItemData.rlsYn !='Y'}">selected</c:if>>전시 안함</option>
								</select>
							</div>
							<input type="hidden" id="dispClrcsItemRlsYnHdn_${exhDispItemData.dispItemListNo}" name="dispClrcsItemRlsYnHdn" value="${exhDispItemData.rlsYn}" readonly>
						</td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnDelDispClrcsItem_${exhDispItemData.dispItemListNo}" onclick="javascript:delDispClrcsItem('${exhDispItemData.dispItemListNo}'); return false;">삭제</button>
							<%--<button type="button" class="btns size-xsmall color-gray" id="btnRstDispClrcsItem_${exhDispItemData.dispItemListNo}" onclick="javascript:rstDispClrcsItem('${exhDispItemData.dispItemListNo}'); return false;">복원</button> --%>
						</td>
					</tr>
				</c:forEach>
			</c:if>
				</tbody>
			</table>
		</c:if>
		<%-- DgtlClrcs List End --%>
		<%-- DgtlClc List Start --%>
		<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0002'}">
			<table>
				<colgroup>
					<col width="50px">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="220px">
					<col width="">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>컬렉션 ID</th>
						<th>컬렉션명</th>
						<th>소장기관</th>
						<th>정렬</th>
						<th>전시</th>
						<th>문화자원수</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="exhDispDgtlClcItemTbody">
			<c:if test="${!empty exhDispItemInfoList}">
				<c:forEach var="exhDispItemData" items="${exhDispItemInfoList}" varStatus="status">
					<tr>
						<td><span id="dispDgtlClcItemStts_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemStts">M</span>
							<input type="hidden" id="dispDgtlClcItemSttsHdn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemSttsHdn" value="M"></td>
						<td><span id="dispDgtlClcItemId_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemId">${exhDispItemData.dspyItemId}</span>
							<input type="hidden" id="dispDgtlClcItemIdHdn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemIdHdn" value="${exhDispItemData.dspyItemId}" readonly></td>
						<td><span id="dispDgtlClcItemNm_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemNm">${exhDispItemData.dspyItemNm}</span></td>
						<td><span id="dispDgtlClcItemInstNm_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemInstNm">${exhDispItemData.instNm}</span></td>
						<td><div class="fm-ele"><input type="text" id="dispDgtlClcItemSortSn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemSortSn" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${exhDispItemData.sortSn}"></div>
							<input type="hidden" id="dispDgtlClcItemSortSnHdn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemSortSnHdn" value="${exhDispItemData.sortSn}"></td>
						<td>
							<div class="fm-focus fm-select" data-size="w200">
								<select id="dispDgtlClcItemRlsYn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemRlsYn">
									<option value="Y" <c:if test="${exhDispItemData.rlsYn =='Y'}">selected</c:if>>전시</option>
									<option value="N" <c:if test="${exhDispItemData.rlsYn !='Y'}">selected</c:if>>전시 안함</option>
								</select>
							</div>
							<input type="hidden" id="dispDgtlClcItemRlsYnHdn_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemRlsYnHdn" value="${exhDispItemData.rlsYn}" readonly>
						</td>
						<td><span id="dispDgtlClcItemCnt_${exhDispItemData.dispItemListNo}" name="dispDgtlClcItemCnt">${exhDispItemData.dgtlClrcsCnt}</span></td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnDelDispDgtlClcItem_${exhDispItemData.dispItemListNo}" onclick="javascript:delDispDgtlClcItem('${exhDispItemData.dispItemListNo}'); return false;">삭제</button>
							<%--<button type="button" class="btns size-xsmall color-gray" id="btnRstDispDgtlClcItem_${exhDispItemData.dispItemListNo}" onclick="javascript:rstDispDgtlClcItem('${exhDispItemData.dispItemListNo}'); return false;">복원</button> --%>
						</td>
					</tr>
				</c:forEach>
			</c:if>
				</tbody>
			</table>	
		</c:if>
		<%-- DgtlClc List End --%>
		<%-- Inst List Start --%>
		<c:if test="${srchExhInfo.paramSrchDispTypeCd == 'PTDPTY0003'}">
			<table>
				<colgroup>
					<col width="50px">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="220px">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>기관 ID</th>
						<th>기관명</th>
						<th>기관코드</th>
						<th>기관유형</th>
						<th>영역유형</th>
						<th>정렬</th>
						<th>전시</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="exhDispInstItemTbody">
			<c:if test="${!empty exhDispItemInfoList}">
				<c:forEach var="exhDispItemData" items="${exhDispItemInfoList}" varStatus="status">
					<tr>
						<td><span id="dispInstItemStts_${exhDispItemData.dispItemListNo}" name="dispInstItemStts">M</span>
							<input type="hidden" id="dispInstItemSttsHdn_${exhDispItemData.dispItemListNo}" name="dispInstItemSttsHdn" value="M"></td>
						<td><span id="dispInstItemId_${exhDispItemData.dispItemListNo}" name="dispInstItemId">${exhDispItemData.dspyItemId}</span>
							<input type="hidden" id="dispInstItemIdHdn_${exhDispItemData.dispItemListNo}" name="dispInstItemIdHdn" value="${exhDispItemData.dspyItemId}" readonly></td>
						<td><span id="dispInstItemNm_${exhDispItemData.dispItemListNo}" name="dispInstItemNm">${exhDispItemData.dspyItemNm}</span></td>
						<td><span id="dispInstItemInstCd_${exhDispItemData.dispItemListNo}" name="dispInstItemInstCd">${exhDispItemData.instCd}</span></td>
						<td><span id="dispInstItemInstTypeNm_${exhDispItemData.dispItemListNo}" name="dispInstItemInstTypeNm">${exhDispItemData.instTypeNm}</span></td>
						<td><span id="dispInstItemFildTypeNm_${exhDispItemData.dispItemListNo}" name="dispInstItemFildTypeNm">${exhDispItemData.fildTypeNm}</span></td>
						<td><div class="fm-ele"><input type="text" id="dispInstItemSortSn_${exhDispItemData.dispItemListNo}" name="dispInstItemSortSn" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${exhDispItemData.sortSn}" style="ime-mode:disabled;"></div>
							<input type="hidden" id="dispInstItemSortSnHdn_${exhDispItemData.dispItemListNo}" name="dispInstItemSortSnHdn" value="${exhDispItemData.sortSn}"></td>
						<td>
							<div class="fm-focus fm-select" data-size="w200">
								<select id="dispInstItemRlsYn_${exhDispItemData.dispItemListNo}" name="dispInstItemRlsYn">
									<option value="Y" <c:if test="${exhDispItemData.rlsYn =='Y'}">selected</c:if>>전시</option>
									<option value="N" <c:if test="${exhDispItemData.rlsYn !='Y'}">selected</c:if>>전시 안함</option>
								</select>
							</div>
							<input type="hidden" id="dispInstItemRlsYnHdn_${exhDispItemData.dispItemListNo}" name="dispInstItemRlsYnHdn" value="${exhDispItemData.rlsYn}" readonly>
						</td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnDelDispInstItem_${exhDispItemData.dispItemListNo}" onclick="javascript:delDispInstItem('${exhDispItemData.dispItemListNo}'); return false;">삭제</button>
							<%--<button type="button" class="btns size-xsmall color-gray" id="btnRstDispInstItem_${exhDispItemData.dispItemListNo}" onclick="javascript:rstDispInstItem('${exhDispItemData.dispItemListNo}'); return false;">복원</button>--%>
						</td>
					</tr>
				</c:forEach>
			</c:if>
				</tbody>
			</table>
		</c:if>
		<%-- Inst List End --%>
	</div>
	
</div>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:70%;">
		
	</div>
</div>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script type="text/javascript">
	function goSearchParam(){
		let frm = document.frmSrchDtl;
		frm.action = contextPath + "/exhMgt/exhDtl.do";
		frm.submit();
	}
	
	function goSrchParamReset(){
		let frm = document.frmSrchDtl;
		let dataType = "${srchExhInfo.paramSrchDispTypeCd}";
		if (dataType == "PTDPTY0001") {
			frm.srchTabDgtlDiv.value = "ID";
			frm.srchTabDgtlString.value = "";
		} else if (dataType == "PTDPTY0002") {
			frm.srchTabInstDiv.value = "D";
			frm.srchTabDgtlString.value = "";
		}
		frm.srchTabInstDiv.value = "NM";
		frm.srchTabInstString.value = "";
		frm.srchTabRlsYn.value = "";
	}
	
	function moveListPage() {
		let frm = document.frmSrchDtl;
		frm.action = contextPath + "/exhMgt/exhList.do";
		frm.submit();
	}
	
	function moveEditPage() {
		let frm = document.frmSrchDtl;
		frm.srchWrtMode.value = "edit";
		frm.action = contextPath + "/exhMgt/exhReg.do";
		frm.submit();
	}
	
	function saveExhDispItemList() {
		let frm = document.frmSrchDtl;
		let paramCheckId = frm.srchDispTypeCd.value;
		let itemInfo = "";
		let addItemInfo = "";
		let editItemInfo = "";
		let delItemInfo = "";
		
		if (paramCheckId == "PTDPTY0001") {
			
			if (typeof($("input[name=dispClrcsItemSttsHdn]")) != "undefined") {
				if (typeof($("input[name=dispClrcsItemSttsHdn]").length) != "undefined" ) {//여러개 일때
					for (let dcli = 0; dcli < $("input[name=dispClrcsItemSttsHdn]").length; dcli++) {
						if ($("input[name=dispClrcsItemSttsHdn]").eq(dcli).val() != "D") {
							if ($("input[name=dispClrcsItemSortSn]").eq(dcli).val() == "") { 
								alert("정렬 순번을 입력해 주십시오.");
								$("input[name=dispClrcsItemSortSn]").eq(dcli).focus();
								return false;
							}
						}
						
						//수정인지 체크
						if ($("input[name=dispClrcsItemSttsHdn]").eq(dcli).val() == "M") {
							if (($("input[name=dispClrcsItemSortSn]").eq(dcli).val() != $("input[name=dispClrcsItemSortSnHdn]").eq(dcli).val()) || ($("select[name=dispClrcsItemRlsYn]").eq(dcli).val() != $("input[name=dispClrcsItemRlsYnHdn]").eq(dcli).val()) ) {
								$("input[name=dispClrcsItemStts]").eq(dcli).text("U");
								$("input[name=dispClrcsItemSttsHdn]").eq(dcli).val("U");
							}
						}
					}
				
					for (let dclk = 0; dclk < $("input[name=dispClrcsItemSttsHdn]").length; dclk++) {
						itemInfo = $("input[name=dispClrcsItemIdHdn]").eq(dclk).val() + "^";
						itemInfo += $("input[name=dispClrcsItemSortSn]").eq(dclk).val() + "^";
						itemInfo += $("select[name=dispClrcsItemRlsYn]").eq(dclk).val();
						
						if ($("input[name=dispClrcsItemSttsHdn]").eq(dclk).val() == "I") {
							if (addItemInfo == "") {
								addItemInfo = itemInfo;
							} else {
								addItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispClrcsItemSttsHdn]").eq(dclk).val() == "U") {
							if (editItemInfo == "") {
								editItemInfo = itemInfo;
							} else {
								editItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispClrcsItemSttsHdn]").eq(dclk).val() == "D") {
							if (delItemInfo == "") {
								delItemInfo = itemInfo;
							} else {
								delItemInfo += "|" + itemInfo;
							}
						}
						
					}
					
					for (let dci = 0; dci < $("input[name=dispClrcsItemSortSn]").length; dci++) {
						for (let sci = 0; sci < $("input[name=dispClrcsItemSortSn]").length; sci++ ) {
							if ((dci != sci) && ($("input[name=dispClrcsItemSttsHdn]").eq(dci).val() != "D") && ($("input[name=dispClrcsItemSttsHdn]").eq(sci).val() != "D") && ($("input[name=dispClrcsItemSortSn]").eq(dci).val() == $("input[name=dispClrcsItemSortSn]").eq(sci).val())) {
								alert("중복된 정렬 순번이 존재합니다.");
								return false;
							}
						}
					}
				
				} else { //단일 1개일때
					if ($("input[name=dispClrcsItemSttsHdn]").val() != "D") {
						if ($("input[name=dispClrcsItemSortSn]").val() == "") { 
							alert("정렬 순번을 입력해 주십시오.");
							$("input[name=dispClrcsItemSortSn]").focus();
							return false;
						}
					}
					//수정인지 체크
					if ($("input[name=dispClrcsItemSttsHdn]").val() == "M") {
						if (($("input[name=dispClrcsItemSortSn]").val() != $("input[name=dispClrcsItemSortSnHdn]").val()) || ($("select[name=dispClrcsItemRlsYn]").val() != $("input[name=dispClrcsItemRlsYnHdn]").val()) ) {
							$("input[name=dispClrcsItemStts]").val("U");
							$("input[name=dispClrcsItemSttsHdn]").text("U");
						}
					}
					
					itemInfo = $("input[name=dispClrcsItemIdHdn]").val() + "^";
					itemInfo += $("input[name=dispClrcsItemSortSn]").val() + "^";
					itemInfo += $("select[name=dispClrcsItemRlsYn]").val();
					if ($("input[name=dispClrcsItemSttsHdn]").val() == "I") {
						addItemInfo = itemInfo;
					} else if ($("input[name=dispClrcsItemSttsHdn]").val() == "U") {
						editItemInfo = itemInfo;
					} else if ($("input[name=dispClrcsItemSttsHdn]").val() == "D") {
						delItemInfo = itemInfo;
					}
				}
			}
			
			
		} else if (paramCheckId == "PTDPTY0002") {
			
			if (typeof($("input[name=dispDgtlClcItemSttsHdn]")) != "undefined") {
				if (typeof($("input[name=dispDgtlClcItemSttsHdn]").length) != "undefined" ) {//여러개 일때
					
					for (let dcci = 0; dcci < $("input[name=dispDgtlClcItemSttsHdn]").length; dcci++) {
						if ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcci).val() != "D") {
							if ($("input[name=dispDgtlClcItemSortSn]").eq(dcci).val() == "") { 
								alert("정렬 순번을 입력해 주십시오.");
								$("input[name=dispDgtlClcItemSortSn]").eq(dcci).focus();
								return false;
							}
						}
						
						//수정인지 체크
						if ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcci).val() == "M") {
							if (($("input[name=dispDgtlClcItemSortSn]").eq(dcci).val() != $("input[name=dispDgtlClcItemSortSnHdn]").eq(dcci).val()) || ($("select[name=dispDgtlClcItemRlsYn]").eq(dcci).val() != $("input[name=dispDgtlClcItemRlsYnHdn]").eq(dcci).val()) ) {
								$("input[name=dispDgtlClcItemStts]").eq(dcci).text("U");
								$("input[name=dispDgtlClcItemSttsHdn]").eq(dcci).val("U");
							}
						}
					}
				
					for (let dcck = 0; dcck < $("input[name=dispDgtlClcItemSttsHdn]").length; dcck++) {
						itemInfo = $("input[name=dispDgtlClcItemIdHdn]").eq(dcck).val() + "^";
						itemInfo += $("input[name=dispDgtlClcItemSortSn]").eq(dcck).val() + "^";
						itemInfo += $("select[name=dispDgtlClcItemRlsYn]").eq(dcck).val();
						if ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcck).val() == "I") {
							if (addItemInfo == "") {
								addItemInfo = itemInfo;
							} else {
								addItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcck).val() == "U") {
							if (editItemInfo == "") {
								editItemInfo = itemInfo;
							} else {
								editItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcck).val() == "D") {
							if (delItemInfo == "") {
								delItemInfo = itemInfo;
							} else {
								delItemInfo += "|" + itemInfo;
							}
						}
						
					}
					
					for (let dcci = 0; dcci < $("input[name=dispDgtlClcItemSortSn]").length; dcci++) {
						for (let scci = 0; scci < $("input[name=dispDgtlClcItemSortSn]").length; scci++ ) {
							if ((dcci != scci) && ($("input[name=dispDgtlClcItemSttsHdn]").eq(dcci).val() != "D") && ($("input[name=dispDgtlClcItemSttsHdn]").eq(scci).val() != "D") && ($("input[name=dispDgtlClcItemSortSn]").eq(dcci).val() == $("input[name=dispDgtlClcItemSortSn]").eq(scci).val())) {
								alert("중복된 정렬 순번이 존재합니다.");
								return false;
							}
						}
					}
					
				} else {//단일 1개일때
					if ($("input[name=dispDgtlClcItemSttsHdn]").val() != "D") {
						if ($("input[name=dispDgtlClcItemSortSn]").val() == "") {
							alert("정렬 순번을 입력해 주십시오.");
							$("input[name=dispDgtlClcItemSortSn]").focus();
							return false;
						}
					}
					//수정인지 체크
					if ($("input[name=dispDgtlClcItemSttsHdn]").val() == "M") {
						if (($("input[name=dispDgtlClcItemSortSn]").val() != $("input[name=dispDgtlClcItemSortSnHdn]").val()) || ($("select[name=dispDgtlClcItemRlsYn]").val() != $("input[name=dispDgtlClcItemRlsYnHdn]").val()) ) {
							$("input[name=dispDgtlClcItemStts]").text("U");
							$("input[name=dispDgtlClcItemSttsHdn]").val("U");
						}
					}
					
					itemInfo = $("input[name=dispDgtlClcItemIdHdn]").val() + "^";
					itemInfo += $("input[name=dispDgtlClcItemSortSn]").val() + "^";
					itemInfo += $("select[name=dispDgtlClcItemRlsYn]").val();
					
					if ($("input[name=dispDgtlClcItemSttsHdn]").val() == "I") {
						addItemInfo = itemInfo;
					} else if ($("input[name=dispDgtlClcItemSttsHdn]").val() == "U") {
						editItemInfo = itemInfo;
					} else if ($("input[name=dispDgtlClcItemSttsHdn]").val() == "D") {
						delItemInfo = itemInfo;
					}
				}
			}
			
			
		} else if (paramCheckId == "PTDPTY0003") {
			if (typeof($("input[name=dispInstItemSttsHdn]")) != "undefined") {
				if (typeof($("input[name=dispInstItemSttsHdn]").length) != "undefined" ) {//1개 이상 일 때
					for (let dci = 0; dci < $("input[name=dispInstItemSttsHdn]").length; dci++) {
						if ($("input[name=dispInstItemSttsHdn]").eq(dci).val() != "D") {
							if ($("input[name=dispInstItemSortSn]").eq(dci).val() == "") {
								alert("정렬 순번을 입력해 주십시오.");
								$("input[name=dispInstItemSortSn]").eq(dci).focus();
								return false;
							}
						}
						//수정인지 체크
						if ($("input[name=dispInstItemSttsHdn]").eq(dci).val() == "M") {
							if (($("input[name=dispInstItemSortSn]").eq(dci).val() != $("input[name=dispInstItemSortSnHdn]").eq(dci).val()) || ($("select[name=dispInstItemRlsYn]").eq(dci).val() != $("input[name=dispInstItemRlsYnHdn]").eq(dci).val()) ) {
								$("input[name=dispInstItemStts]").eq(dci).text("U");
								$("input[name=dispInstItemSttsHdn]").eq(dci).val("U");
							}
						}
					}
				
					for (let dck = 0; dck < $("input[name=dispInstItemSttsHdn]").length; dck++) {
						itemInfo = $("input[name=dispInstItemIdHdn]").eq(dck).val() + "^";
						itemInfo += $("input[name=dispInstItemSortSn]").eq(dck).val() + "^";
						itemInfo += $("select[name=dispInstItemRlsYn]").eq(dck).val();
						if ($("input[name=dispInstItemSttsHdn]").eq(dck).val() == "I") {
							if (addItemInfo == "") {
								addItemInfo = itemInfo;
							} else {
								addItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispInstItemSttsHdn]").eq(dck).val() == "U") {
							if (editItemInfo == "") {
								editItemInfo = itemInfo;
							} else {
								editItemInfo += "|" + itemInfo;
							}
						} else if ($("input[name=dispInstItemSttsHdn]").eq(dck).val() == "D") {
							if (delItemInfo == "") {
								delItemInfo = itemInfo;
							} else {
								delItemInfo += "|" + itemInfo;
							}
						}
						
					}
					
					for (let di = 0; di < $("input[name=dispInstItemSortSn]").length; di++) {
						for (let si = 0; si < $("input[name=dispInstItemSortSn]").length; si++ ) {
							if ((di != si) && ($("input[name=dispInstItemSttsHdn]").eq(di).val() != "D") && ($("input[name=dispInstItemSttsHdn]").eq(si).val() != "D") && ($("input[name=dispInstItemSortSn]").eq(di).val() == $("input[name=dispInstItemSortSn]").eq(si).val())) {
								alert("중복된 정렬 순번이 존재합니다.");
								return false;
							}
						}
					}
					
				} else {//단일 1개일때
					
					if ($("input[name=dispInstItemSttsHdn]").val() != "D") {
						if ($("input[name=dispInstItemSortSn]").val() == "") {
							alert("정렬 순번을 입력해 주십시오.");
							$("input[name=dispInstItemSortSn]").focus();
							return false;
						}
					}
					//수정인지 체크
					if ($("input[name=dispInstItemSttsHdn]").val() == "M") {
						if (($("input[name=dispInstItemSortSn]").val() != $("input[name=dispInstItemSortSnHdn]").val()) || ($("select[name=dispInstItemRlsYn]").val() != $("input[name=dispInstItemRlsYnHdn]").val()) ) {
							$("input[name=dispInstItemStts]").text("U");
							$("input[name=dispInstItemSttsHdn]").val("U");
						}
					}
					
					itemInfo = $("input[name=dispInstItemIdHdn]").val() + "^";
					itemInfo += $("input[name=dispInstItemSortSn]").val() + "^";
					itemInfo += $("select[name=dispInstItemRlsYn]").val();
					
					if ($("input[name=dispInstItemSttsHdn]").val() == "I") {
						addItemInfo = itemInfo;
					} else if ($("input[name=dispInstItemSttsHdn]").val() == "U") {
						editItemInfo = itemInfo;
					} else if ($("input[name=dispInstItemSttsHdn]").val() == "D") {
						delItemInfo = itemInfo;
					}
				}
			}
		}
		
		
		
		if (confirm("저장하시겠습니까?")) {
			frm.hdnAddItemIds.value = addItemInfo;
			frm.hdnEditItemIds.value = editItemInfo;
			frm.hdnDelItemIds.value = delItemInfo;
			frm.srchWrtMode.value = "dtl";
			frm.action = contextPath + "/exhMgt/exhSave.do";
			frm.submit();
		}
	}
	
	function moveOpenPopupListPage() {
		let frm = document.frmSrchDtl;
		let paramId = frm.srchDispTypeCd.value;
		let popTitle = "";
		let srchPopDispId = frm.srchDispId.value;
		let paramPopUrl = "";
		if (paramId == 'PTDPTY0001') {
			paramPopUrl = contextPath + "/exhMgt/popLayerExhDgtlClrcsList.do";
		} else if (paramId == 'PTDPTY0002') {
			paramPopUrl = contextPath + "/exhMgt/popLayerExhDgtlClcList.do";
		} else if (paramId == 'PTDPTY0003') {
			paramPopUrl = contextPath + "/exhMgt/popLayerExhInstList.do";
		}
		
		paramPopUrl += "?srchPopDispId=" + srchPopDispId; 
		
		if (paramPopUrl != "") {
			$(".pop-layer").load(paramPopUrl);
			admin.modalsShow('modals'); 
		}
	}
	
	//전시 디지털 문화자원 목록 추가
	function moveAddExhDgtlClrcsData(paramPopDgtlClrcsId) {
		let popItemClrcsId= $("#hdnExhItemId_" + paramPopDgtlClrcsId).val();
		let popItemClrcsNm = $("#hdnExhItemNm_" + paramPopDgtlClrcsId).val();
		let popItemClrcsInstNm = $("#hdnExhItemInstNm_" + paramPopDgtlClrcsId).val();
		
		
		//기존 전시 디지털 문화자원 목록에 있는지 체크
		let addDgtlClrcsListYn = "N";
		if ($("input[name=dispClrcsItemIdHdn]").length == 0) {
			addDgtlClrcsListYn = "Y";
		} else {
			for (let dcr = 0; dcr < $("input[name=dispClrcsItemIdHdn]").length; dcr++) {
				if($("input[name=dispClrcsItemIdHdn]").eq(dcr).val() == popItemClrcsId) {
					alert("이미 설정되어 있는 디지털 문화자원입니다.");
					return false;
				} else {
					addDgtlClrcsListYn = "Y";
				}
			}
		}
		
		if (addDgtlClrcsListYn == "Y") {
			let tblClrscBody, newClrcsRowNumber, newClrcsRow, viewClrcsRowNum, newClrcsCell0, newClrcsCell1, newClrcsCell2, newClrcsCell3, newClrcsCell4, newClrcsCell5, newClrcsCell6;
			tblClrscBody = $("#exhDispClrcsItemTbody");
			newClrcsRowNumber = tblClrscBody[0].rows.length;
			newClrcsRow = tblClrscBody[0].insertRow(newClrcsRowNumber);
			newClrcsCell0 = newClrcsRow.insertCell();
			newClrcsCell1 = newClrcsRow.insertCell();
			newClrcsCell2 = newClrcsRow.insertCell();
			newClrcsCell3 = newClrcsRow.insertCell();
			newClrcsCell4 = newClrcsRow.insertCell();
			newClrcsCell5 = newClrcsRow.insertCell();
			newClrcsCell6 = newClrcsRow.insertCell();
			
			viewClrcsRowNum = tblClrscBody[0].rows.length;
			
			newClrcsCell0.innerHTML = "<span id=\"dispClrcsItemStts_" + viewClrcsRowNum + "\" name=\"dispClrcsItemStts\">I</span>";
			newClrcsCell0.innerHTML += "<input type=\"hidden\" id=\"dispClrcsItemSttsHdn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemSttsHdn\" value=\"I\">";
			newClrcsCell1.innerHTML = "<span id=\"dispClrcsItemId_" + viewClrcsRowNum + "\" name=\"dispClrcsItemId\">" + popItemClrcsId + "</span>";
			newClrcsCell1.innerHTML += "<input type=\"hidden\" id=\"dispClrcsItemIdHdn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemIdHdn\" value=\"" + popItemClrcsId +  "\" readonly>";
			newClrcsCell2.innerHTML = "<span id=\"dispClrcsItemNm_" + viewClrcsRowNum + "\" name=\"dispClrcsItemNm\">" + popItemClrcsNm + "</span>"; 
			newClrcsCell3.innerHTML = "<span id=\"dispClrcsItemInstNm_" + viewClrcsRowNum + "\" name=\"dispClrcsItemInstNm\">" + popItemClrcsInstNm + "</span>"; 
			newClrcsCell4.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"dispClrcsItemSortSn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemSortSn\" maxlength=\"10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\"></div>";
			newClrcsCell4.innerHTML += "<input type=\"hidden\" id=\"dispClrcsItemSortSnHdn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemSortSnHdn\" value=\"\">"; 
			newClrcsCell5.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"w200\"><select id=\"dispClrcsItemRlsYn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemRlsYn\"><option value=\"Y\" selected>전시</option><option value=\"N\" >전시 안함</option></select></div>"
			newClrcsCell5.innerHTML += "<input type=\"hidden\" id=\"dispClrcsItemRlsYnHdn_" + viewClrcsRowNum + "\" name=\"dispClrcsItemRlsYnHdn\" value=\"Y\" readonly>";
			newClrcsCell6.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnDispClrcsDel_" + viewClrcsRowNum + "\" onclick=\"javascript:delDispClrcsItem('" + viewClrcsRowNum + "'); return false;\">삭제</button>";
			//newClrcsCell6.innerHTML += "<button type=\"button\" class=\"btns size-xsmall color-gray\" id=\"btnRstDispClrcsItem_" + viewClrcsRowNum + "\" onclick=\"javascript:rstDispClrcsNewItem('" + viewClrcsRowNum + "'); return false;\">복원</button>";
		}
	
	}
	
		
	//전시 문화자원 목록 삭제
	function delDispClrcsItem(paramDgtlClrscItemListNo) {
		let dispClrcsRowStts = $("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val();
		
		if (dispClrcsRowStts == "D") { //이미 삭제된 경우
			alert("이미 삭제되었습니다.");
			return false;
			
		} else {
			if (confirm("설정된 디지털 문화자원을 설정에서 삭제하시겠습니까?")) {
				$("#dispClrcsItemSortSn_" + paramDgtlClrscItemListNo).attr("readonly", true);
				$("#dispClrcsItemRlsYn_" + paramDgtlClrscItemListNo).attr("disabled", true);
				$("#dispClrcsItemStts_" + paramDgtlClrscItemListNo).text("D");
				$("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val("D");
			} else {
				return false;
			}
		}
		
	}
	
	//전시 문화자원 목록 복원
	function rstDispClrcsItem(paramDgtlClrscItemListNo) {
		let dispClrcsRowStts = $("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val();
		
		if (dispClrcsRowStts == "M") {//변경이 아닐 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("변경된 디지털문화자원을 복원하시겠습니까?")) {
				$("#dispClrcsItemSortSn_" + paramDgtlClrscItemListNo).removeAttr("readonly");
				$("#dispClrcsItemRlsYn_" + paramDgtlClrscItemListNo).removeAttr("disabled");
				$("#dispClrcsItemSortSn_" + paramDgtlClrscItemListNo).val($("#dispClrcsItemSortSnHdn_" + paramDgtlClrscItemListNo).val());
				$("#dispClrcsItemRlsYn_" + paramDgtlClrscItemListNo).val($("#dispClrcsItemRlsYnHdn_" + paramDgtlClrscItemListNo).val());
				$("#dispClrcsItemStts_" + paramDgtlClrscItemListNo).text("M");
				$("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val("M");
			} else {
				return false;
			}
			
		}
	}
	
	//신규 추가 전시 문화자원 목록 복원
	function rstDispClrcsNewItem(paramDgtlClrscItemListNo) {
		let dispClrcsRowStts = $("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val();
		
		if (dispClrcsRowStts == "I") {//변경이 아닐 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("삭제된 디지털문화자원을 복원하시겠습니까?")) {
				$("#dispClrcsItemSortSn_" + paramDgtlClrscItemListNo).removeAttr("readonly");
				$("#dispClrcsItemRlsYn_" + paramDgtlClrscItemListNo).removeAttr("disabled");
				$("#dispClrcsItemSortSn_" + paramDgtlClrscItemListNo).val($("#dispClrcsItemSortSnHdn_" + paramDgtlClrscItemListNo).val());
				$("#dispClrcsItemRlsYn_" + paramDgtlClrscItemListNo).val($("#dispClrcsItemRlsYnHdn_" + paramDgtlClrscItemListNo).val());
				$("#dispClrcsItemStts_" + paramDgtlClrscItemListNo).text("I");
				$("#dispClrcsItemSttsHdn_" + paramDgtlClrscItemListNo).val("I");
			} else {
				return false;
			}
			
		}
	}
	
	//전시 컬렉션 목록 추가
	function moveAddExhDgtlClcData(paramPopDgtlClcId) {
		let popItemDgtlClcId = $("#hdnExhItemId_" + paramPopDgtlClcId).val();
		let popItemDgtlClcNm = $("#hdnExhItemNm_" + paramPopDgtlClcId).val();
		let popItemDgtlClcInstNm = $("#hdnExhItemInstNm_" + paramPopDgtlClcId).val();
		let popItemDgtlClcClrcsCnt = $("#hdnExhItemCnt_" + paramPopDgtlClcId).val();

		//기존 전시 컬렉션 목록에 있는지 체크
		let addDgtlClcListYn = "N";
		if ($("input[name=dispDgtlClcItemIdHdn]").length == 0) {
			addDgtlClcListYn = "Y";
		} else {
			for (let dcr = 0; dcr < $("input[name=dispDgtlClcItemIdHdn]").length; dcr++) {
				if($("input[name=dispDgtlClcItemIdHdn]").eq(dcr).val() == popItemDgtlClcId) {
					alert("이미 설정되어 있는 컬렉션입니다.");
					return false;
				} else {
					addDgtlClcListYn = "Y";
				}
			}
		}
		
		if (addDgtlClcListYn == "Y") {
			let tblDgtlClcBody, newDgtlClcRowNumber, newDgtlClcRow, viewDgtlClcRowNum, newDgtlClcCell0, newDgtlClcCell1, newDgtlClcCell2, newDgtlClcCell3, newDgtlClcCell4, newDgtlClcCell5, newDgtlClcCell6, newDgtlClcCell7;
			tblDgtlClcBody = $("#exhDispDgtlClcItemTbody");
			newDgtlClcRowNumber = tblDgtlClcBody[0].rows.length;
			newDgtlClcRow = tblDgtlClcBody[0].insertRow(newDgtlClcRowNumber);
			newDgtlClcCell0 = newDgtlClcRow.insertCell();
			newDgtlClcCell1 = newDgtlClcRow.insertCell();
			newDgtlClcCell2 = newDgtlClcRow.insertCell();
			newDgtlClcCell3 = newDgtlClcRow.insertCell();
			newDgtlClcCell4 = newDgtlClcRow.insertCell();
			newDgtlClcCell5 = newDgtlClcRow.insertCell();
			newDgtlClcCell6 = newDgtlClcRow.insertCell();
			newDgtlClcCell7 = newDgtlClcRow.insertCell();
			
			viewDgtlClcRowNum = tblDgtlClcBody[0].rows.length;
			
			newDgtlClcCell0.innerHTML = "<span id=\"dispDgtlClcItemStts_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemStts\">I</span>";
			newDgtlClcCell0.innerHTML += "<input type=\"hidden\" id=\"dispDgtlClcItemSttsHdn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemSttsHdn\" value=\"I\">";
			newDgtlClcCell1.innerHTML = "<span id=\"dispDgtlClcItemId_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemId\">" + popItemDgtlClcId + "</span>";
			newDgtlClcCell1.innerHTML += "<input type=\"hidden\" id=\"dispDgtlClcItemIdHdn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemIdHdn\" value=\"" + popItemDgtlClcId + "\" readonly>";
			newDgtlClcCell2.innerHTML = "<span id=\"dispDgtlClcItemNm_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemNm\">" + popItemDgtlClcNm + "</span>"; 
			newDgtlClcCell3.innerHTML = "<span id=\"dispDgtlClcItemInstNm_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemInstNm\">" + popItemDgtlClcInstNm + "</span>"; 
			newDgtlClcCell4.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"dispDgtlClcItemSortSn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemSortSn\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" maxlength=\"10\" value=\"\"></div>";
			newDgtlClcCell4.innerHTML += "<input type=\"hidden\" id=\"dispDgtlClcItemSortSnHdn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemSortSnHdn\" value=\"\">"; 
			newDgtlClcCell5.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"w200\"><select id=\"dispDgtlClcItemRlsYn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemRlsYn\"><option value=\"Y\" selected>전시</option><option value=\"N\">전시 안함</option></select></div>";
			newDgtlClcCell5.innerHTML += "<input type=\"hidden\" id=\"dispDgtlClcItemRlsYnHdn_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemRlsYnHdn\" value=\"Y\" readonly>";
			newDgtlClcCell6.innerHTML = "<span id=\"dispDgtlClcItemCnt_" + viewDgtlClcRowNum + "\" name=\"dispDgtlClcItemCnt\">" + popItemDgtlClcClrcsCnt + "</span>"; 
			newDgtlClcCell7.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnDispDgtlClcDel_" + viewDgtlClcRowNum + "\" onclick=\"javascript:delDispDgtlClcItem('" + viewDgtlClcRowNum + "'); return false;\">삭제</button>";
			//newDgtlClcCell7.innerHTML += "<button type=\"button\" class=\"btns size-xsmall color-gray\" id=\"btnRstDispDgtlClcItem_" + viewDgtlClcRowNum + "\" onclick=\"javascript:rstDispDgtlClcNewItem('" + viewDgtlClcRowNum + "'); return false;\">복원</button>";
		}
	}
	
	//전시 컬렉션 목록 삭제
	function delDispDgtlClcItem(paramDgtlClcItemListNo) {
		let dispDgtlClcRowStts = $("dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val();
		if (dispDgtlClcRowStts == "D") { //이미 삭제된 경우
			alert("이미 삭제되었습니다.");
			return false;
			
		} else {
			if (confirm("설정된 컬렉션을 설정에서 삭제하시겠습니까?")) {
				$("#dispDgtlClcItemSortSn_" + paramDgtlClcItemListNo).attr("readonly", true);
				$("#dispDgtlClcItemRlsYn_" + paramDgtlClcItemListNo).attr("disabled", true);
				$("#dispDgtlClcItemStts_" + paramDgtlClcItemListNo).text("D");
				$("#dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val("D");
			} else {
				return false;
			}
		}
		
	}
	
	//전시 컬렉션 목록 복원
	function rstDispDgtlClcItem(paramDgtlClcItemListNo) {
		let dispDgtlClcRowStts = $("#dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val();
		
		if (dispDgtlClcRowStts == "M") {//변경이 아닐 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("변경된 컬렉션을 복원하시겠습니까?")) {
				$("#dispDgtlClcItemSortSn_" + paramDgtlClcItemListNo).removeAttr("readonly");
				$("#dispDgtlClcItemRlsYn_" + paramDgtlClcItemListNo).removeAttr("disabled");
				$("#dispDgtlClcItemSortSn_" + paramDgtlClcItemListNo).val($("#dispDgtlClcItemSortSnHdn_" + paramDgtlClcItemListNo).val());
				$("#dispDgtlClcItemRlsYn_" + paramDgtlClcItemListNo).val($("#dispDgtlClcItemRlsYnHdn_" + paramDgtlClcItemListNo).val());
				$("#dispDgtlClcItemStts_" + paramDgtlClcItemListNo).text("M");
				$("#dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val("M");
			} else {
				return false;
			}
			
		}
	}
	
	//신규 전시 컬렉션 목록 복원
	function rstDispDgtlClcNewItem(paramDgtlClcItemListNo) {
		let dispDgtlClcRowStts = $("#dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val();
		
		if (dispDgtlClcRowStts == "I") {//변경이 아닐 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("변경된 컬렉션을 복원하시겠습니까?")) {
				$("#dispDgtlClcItemSortSn_" + paramDgtlClcItemListNo).removeAttr("readonly");
				$("#dispDgtlClcItemRlsYn_" + paramDgtlClcItemListNo).removeAttr("disabled");
				$("#dispDgtlClcItemSortSn_" + paramDgtlClcItemListNo).val($("#dispDgtlClcItemSortSnHdn_" + paramDgtlClcItemListNo).val());
				$("#dispDgtlClcItemRlsYn_" + paramDgtlClcItemListNo).val($("#dispDgtlClcItemRlsYnHdn_" + paramDgtlClcItemListNo).val());
				$("#dispDgtlClcItemStts_" + paramDgtlClcItemListNo).text("I");
				$("#dispDgtlClcItemSttsHdn_" + paramDgtlClcItemListNo).val("I");
			} else {
				return false;
			}
			
		}
	}
	
	//전시 기관 목록 추가
	function moveAddExhInstData(paramPopInstId) {
		
		let popItemInstId = $("#hdnExhItemId_" + paramPopInstId).val();
		let popItemInstNm = $("#hdnExhItemInstNm_" + paramPopInstId).val();
		let popItemInstCd = $("#hdnExhItemInstCd_" + paramPopInstId).val();
		let popItemInstTypeNm = $("#hdnExhItemInstTypeNm_" + paramPopInstId).val();
		let popItemInstfildTypeNm = $("#hdnExhItemFildTypeNm_" + paramPopInstId).val();
		let popItemInstClctTypeNm = $("#hdnExhItemClctTypeNm_" + paramPopInstId).val();
		
		//기존 전시 컬렉션 목록에 있는지 체크
		let addInstListYn = "N";
		if ($("input[name=dispInstItemIdHdn]").length == 0) {
			addInstListYn = "Y";
		} else {
			for (let dcr = 0; dcr < $("input[name=dispInstItemIdHdn]").length; dcr++) {
				if ($("input[name=dispInstItemIdHdn]").eq(dcr).val() == popItemInstId) {
					alert("이미 설정되어 있는 기관입니다.");
					return false;
				} else {
					addInstListYn = "Y";
				}
			}
		}
		
		if (addInstListYn == "Y") {
			let tblInstBody, newInstRowNumber, newInstRow, viewInstRowNum, newInstCell0, newInstCell1, newInstCell2, newInstCell3, newInstCell4, newInstCell5, newInstCell6, newInstCell7, newInstCell8;
			tblInstBody = $("#exhDispInstItemTbody");
			newInstRowNumber = tblInstBody[0].rows.length;
			newInstRow = tblInstBody[0].insertRow(newInstRowNumber);
			newInstCell0 = newInstRow.insertCell();
			newInstCell1 = newInstRow.insertCell();
			newInstCell2 = newInstRow.insertCell();
			newInstCell3 = newInstRow.insertCell();
			newInstCell4 = newInstRow.insertCell();
			newInstCell5 = newInstRow.insertCell();
			newInstCell6 = newInstRow.insertCell();
			newInstCell7 = newInstRow.insertCell();
			newInstCell8 = newInstRow.insertCell();
			
			viewInstRowNum = tblInstBody[0].rows.length;
			
			newInstCell0.innerHTML = "<span id=\"dispInstItemStts_" + viewInstRowNum + "\" name=\"dispInstItemStts\">I</span>";
			newInstCell0.innerHTML += "<input type=\"hidden\" id=\"dispInstItemSttsHdn_" + viewInstRowNum + "\" name=\"dispInstItemSttsHdn\" value=\"I\">";
			newInstCell1.innerHTML = "<span id=\"dispInstItemId_" + viewInstRowNum + "\" name=\"dispInstItemId\">" + popItemInstId + "</span>";
			newInstCell1.innerHTML += "<input type=\"hidden\" id=\"dispInstItemIdHdn_" + viewInstRowNum + "\" name=\"dispInstItemIdHdn\" value=\"" + popItemInstId + "\" readonly>";
			newInstCell2.innerHTML = "<span id=\"dispInstItemNm_" + viewInstRowNum + "\" name=\"dispInstItemNm\">" + popItemInstNm + "</span>"; 
			newInstCell3.innerHTML = "<span id=\"dispInstItemInstCd_" + viewInstRowNum + "\" name=\"dispInstItemInstCd\">" + popItemInstCd + "</span>"; 
			newInstCell4.innerHTML = "<span id=\"dispInstItemInstTypeNm_" + viewInstRowNum + "\" name=\"dispInstItemInstTypeNm\">" + popItemInstTypeNm + "</span>"; 
			newInstCell5.innerHTML = "<span id=\"dispInstItemFildTypeNm_" + viewInstRowNum + "\" name=\"dispInstItemFildTypeNm\">" + popItemInstfildTypeNm + "</span>";
			newInstCell6.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"dispInstItemSortSn_" + viewInstRowNum + "\" name=\"dispInstItemSortSn\" maxlength=\"10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\"  onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\"></div>";
			newInstCell6.innerHTML += "<input type=\"hidden\" id=\"dispInstItemSortSnHdn_" + viewInstRowNum + "\" name=\"dispInstItemSortSnHdn\" value=\"\">";
			newInstCell7.innerHTML = "<div class=\"fm-focus fm-select\" data-size=\"w200\"><select id=\"dispInstItemRlsYn_" + viewInstRowNum + "\" name=\"dispInstItemRlsYn\"><option value=\"Y\" selected>전시</option><option value=\"N\">전시 안함</option></select></div>";
			newInstCell7.innerHTML += "<input type=\"hidden\" id=\"dispInstItemRlsYnHdn_" + viewInstRowNum + "\" name=\"dispInstItemRlsYnHdn\" value=\"Y\" readonly>";
			newInstCell8.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnDispInstDel_" + viewInstRowNum + "\" onclick=\"javascript:delDispInstItem('" + viewInstRowNum + "'); return false;\">삭제</button>";
			//newInstCell8.innerHTML += "<button type=\"button\" class=\"btns size-xsmall color-gray\" id=\"btnRstDispInstItem_" + viewInstRowNum + "\" onclick=\"javascript:rstDispInstNewItem('" + viewInstRowNum + "'); return false;\">복원</button>";
		}
	}
	
	//전시 기관 목록 삭제
	function delDispInstItem(paramInstItemListNo) {
		let dispInstRowStts = $("#dispInstItemSttsHdn_" + paramInstItemListNo).val();
		
		if (dispInstRowStts == "D") {//이미 삭제된 경우.
			alert("이미 삭제되었습니다.");
			return false;
		} else {
			if (confirm("설정된 기관을 설정에서 삭제하시겠습니까?")) {
				$("#dispInstItemSortSn_" + paramInstItemListNo).attr("readonly", true);
				$("#dispInstItemRlsYn_" + paramInstItemListNo).attr("disabled", true);
				$("#dispInstItemStts_" + paramInstItemListNo).text("D");
				$("#dispInstItemSttsHdn_" + paramInstItemListNo).val("D");
			} else {
				return false;
			}
		}
	}
	
	//전시 기관 목록 복원
	function rstDispInstItem(paramInstItemListNo) {
		
		let dispInstRowStts = $("#dispInstItemSttsHdn_" + paramInstItemListNo).val();
		if (dispInstRowStts == "M") { //변경이 없는 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("변경된 기관을 복원하시겠습니까?")) {
				$("#dispInstItemSortSn_" + paramInstItemListNo).removeAttr("readonly");
				$("#dispInstItemRlsYn_" + paramInstItemListNo).removeAttr("disabled");
				$("#dispInstItemSortSn_" + paramInstItemListNo).val($("#dispInstItemSortSnHdn_" + paramInstItemListNo).val());
				$("#dispInstItemRlsYn_" + paramInstItemListNo).val($("#dispInstItemRlsYnHdn_" + paramInstItemListNo).val());
				$("#dispInstItemStts_" + paramInstItemListNo).text("M");
				$("#dispInstItemSttsHdn_" + paramInstItemListNo).val("M");
			}
		}
		
	}
	
	//신규 전시 기관 목록 복원
	function rstDispInstNewItem(paramInstItemListNo) {
		
		let dispInstRowStts = $("#dispInstItemSttsHdn_" + paramInstItemListNo).val();
		if (dispInstRowStts == "I") { //변경이 없는 경우
			alert("복원 대상이 아닙니다.");
			return false;
		} else {
			if (confirm("변경된 기관을 복원하시겠습니까?")) {
				$("#dispInstItemSortSn_" + paramInstItemListNo).removeAttr("readonly");
				$("#dispInstItemRlsYn_" + paramInstItemListNo).removeAttr("disabled");
				$("#dispInstItemSortSn_" + paramInstItemListNo).val($("#dispInstItemSortSnHdn_" + paramInstItemListNo).val());
				$("#dispInstItemRlsYn_" + paramInstItemListNo).val($("#dispInstItemRlsYnHdn_" + paramInstItemListNo).val());
				$("#dispInstItemStts_" + paramInstItemListNo).text("I");
				$("#dispInstItemSttsHdn_" + paramInstItemListNo).val("I");
			}
		}
		
	}

</script>
