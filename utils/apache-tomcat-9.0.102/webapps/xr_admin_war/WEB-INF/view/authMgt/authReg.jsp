<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	
	<div class="table-wrap write">
		<form name="frmDtlSrch" id="frmDtlSrch" method="post" action="#">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="${srchAuthrtInfo.hdnMenuParam}">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchAuthrtInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchAuthrtInfo.paramRecordCnt}">
			<input type="hidden" id="srchAuthrtId" name="srchAuthrtId" value="${srchAuthrtInfo.paramAuthrtId}">
			<input type="hidden" id="srchAuthrtString" name="srchAuthrtString" value="${srchAuthrtInfo.paramAuthrtString}">
			<input type="hidden" id="srchAuthrtTypeDiv" name="srchAuthrtTypeDiv" value="${srchAuthrtInfo.paramAuthrtTypeDiv}">
			<input type="hidden" id="srchAuthrtUseYn" name="srchAuthrtUseYn" value="${srchAuthrtInfo.paramAuthrtUseYn}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="${srchAuthrtInfo.paramWrtMode}">
			<input type="hidden" id="srchMenuTypeCd" name="srchMenuTypeCd" value="${authrtInfo.authrtMenuTypeCd}">
			<input type="hidden" id="srchAhthrtRelStts" name="srchAhthrtRelStts" value="">
			<input type="hidden" id="srchAuthrtRelMenuId" name="srchAuthrtRelMenuId" value="">
			<input type="hidden" id="srchAhthrtRelMenuInqAuthrtYn" name="srchAhthrtRelMenuInqAuthrtYn" value="">
			<input type="hidden" id="srchAhthrtRelPrslAuthrtYn" name="srchAhthrtRelPrslAuthrtYn" value="">
			<input type="hidden" id="srchAhthrtRelWrtAuthrtYn" name="srchAhthrtRelWrtAuthrtYn" value="">
			<input type="hidden" id="srchAhthrtRelMdfcnAuthrtYn" name="srchAhthrtRelMdfcnAuthrtYn" value="">
			<input type="hidden" id="srchAhthrtRelDelAuthrtYn" name="srchAhthrtRelDelAuthrtYn" value="">
			<table>
				<caption></caption>
				<colgroup>
					<col width="200px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
				<c:if test="${srchAuthrtInfo.paramWrtMode == 'edit'}">
					<tr>
						<th>권한아이디<span class="required">필수</span></th>
						<td class="tl pl10"><c:out value="${authrtInfo.authrtId}"/></td>
					</tr>
				</c:if>
				<c:if test="${srchAuthrtInfo.paramWrtMode == 'edit'}">
					<tr>
						<th>권한유형<span class="required">필수</span></th>
						<td class="tl pl10"><c:out value="${authrtInfo.authrtTypeNm}"/>
							<input type="hidden" id="authrtTypeCd" name="authrtTypeCd" value="${authrtInfo.authrtTypeCd}"/> 
						</td>
					</tr>
				</c:if>
				<c:if test="${srchAuthrtInfo.paramWrtMode == 'entry'}">
					<tr>
						<th>권한유형<span class="required">필수</span></th>
						<td>
							<div class="fm-select fm-focus" data-size="w200">
								<select id="authrtTypeCd" name="authrtTypeCd" onchange="javascript:moveChangeAuthrtMenuTypeCd()">
									<option value="">선택</option>
						<c:if test="${!empty authTypeCmmnCdList}">
							<c:forEach var="authCdRow" items="${authTypeCmmnCdList}">
									<option value="${authCdRow.cdId}" <c:if test="${authrtInfo.authrtTypeCd == authCdRow.cdId }">selected</c:if>>${authCdRow.cdNm}</option>
							</c:forEach>
						</c:if>
								</select>
							</div>
						</td>
					</tr>
				</c:if>
					<tr>
						<th>권한명<span class="required">필수</span></th>
						<td><div class="fm-ele" data-size="w400"><input type="text" id="authrtNm" name="authrtNm" value="${authrtInfo.authrtNm}"></div></td>
					</tr>
					<tr>
						<th>사용여부<span class="required">필수</span></th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="useYnY" name="useYn" value="Y" <c:if test="${authrtInfo.useYn == 'Y'}">checked</c:if>/><label for="useYnY">YES</label></span>
								<span><input type="radio" id="useYnN" name="useYn" value="N" <c:if test="${authrtInfo.useYn != 'Y'}">checked</c:if> /><label for="useYnN">NO</label></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>권한설명</th>
						<td>
							<div class="fm-textarea">
								<textarea class="" id="authrtExpln" name="authrtExpln" cols="50" rows="5" placeholder="권한설명을 입력하세요."><c:out value="${authrtInfo.authrtExpln}" /></textarea>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnMoveBackPage" name="btnMoveBackPage" onclick="javascript:moveListBackPage(); return false;">이전</button>
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListAuthrtPage(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y' or UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnMoveSavePage" name="btnMoveSavePage" onclick="javascript:moveSaveAuthrtInfo(); return false;">저장</button>
		</c:if>
	</div>
	
	<div class="list-option top between">
		<strong>권한메뉴</strong>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y'}">
			<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
			<div>
		<button type="button" id="btnAuthMenuReg" name="btnAuthMenuReg" class="btns" onclick="javascript:moveOpenPopMenuList(); return false;">+ 추가</button>
			</div>
			</c:if>
		</c:if>
	</div>
	<div class="table-wrap">
		<table class="table-small">
			<caption></caption>
			<colgroup>
				<col width="70px"></col>
				<col width="150px"></col>
				<col width="*"></col>
				<col width="110px"></col>
				<col width="110px"></col>
				<col width="110px"></col>
				<col width="110px"></col>
				<col width="110px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">Status</th>
					<th rowspan="2">메뉴ID</th>
					<th rowspan="2">메뉴명</th>
					<th colspan="5">권한</th>
					<th rowspan="2"></th>
				</tr>
				<tr>
					<th>조회</th>
					<th>상세</th>
					<th>등록</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="authrtRelTbody">
		<c:if test="${!empty authRelInfoList}">
			<c:forEach var="authRelData" items="${authRelInfoList}" varStatus="status">
				<tr>
					<td><span id="authViewStts_${authRelData.authMenuNo}" name="authViewStts">M</span><input type="hidden" id="authStts_${authRelData.authMenuNo}" name="authStts" value="M"></td>
					<td>${authRelData.menuId}<input type="hidden" id="authMenuId_${authRelData.authMenuNo}" name="authMenuId" value="<c:out value="${authRelData.menuId}"/>"></td>
					<td>${authRelData.menuNm}</td>
					<td>YES<input type="hidden" id="menuInqAuthrtYn_${authRelData.authMenuNo}" name="menuInqAuthrtYn" value="<c:out value="${authRelData.menuInqAuthrtYn}"/>"></td>
					<td><div class="fm-select" data-size="w100"><select id="prslAuthrtYn_${authRelData.authMenuNo}" name="prslAuthrtYn" onchange="javascript:moveChangeSelectMenuAuthrt('${authRelData.authMenuNo}'); return false;"><option value="Y" <c:if test="${authRelData.prslAuthrtYn eq 'Y'}">selected</c:if>>Yes</option><option value="N" <c:if test="${authRelData.prslAuthrtYn eq 'N'}">selected</c:if>>No</option></select></div></td>
					<td><div class="fm-select" data-size="w100"><select id="wrtAuthrtYn_${authRelData.authMenuNo}" name="wrtAuthrtYn" onchange="javascript:moveChangeSelectMenuAuthrt('${authRelData.authMenuNo}'); return false;"><option value="Y" <c:if test="${authRelData.wrtAuthrtYn eq 'Y'}">selected</c:if>>Yes</option><option value="N" <c:if test="${authRelData.wrtAuthrtYn eq 'N'}">selected</c:if>>No</option></select></div></td>
					<td><div class="fm-select" data-size="w100"><select id="mdfcnAuthrtYn_${authRelData.authMenuNo}" name="mdfcnAuthrtYn" onchange="javascript:moveChangeSelectMenuAuthrt('${authRelData.authMenuNo}'); return false;"><option value="Y" <c:if test="${authRelData.mdfcnAuthrtYn eq 'Y'}">selected</c:if>>Yes</option><option value="N" <c:if test="${authRelData.mdfcnAuthrtYn eq 'N'}">selected</c:if>>No</option></select></div></td>
					<td><div class="fm-select" data-size="w100"><select id="delAuthrtYn_${authRelData.authMenuNo}" name="delAuthrtYn" onchange="javascript:moveChangeSelectMenuAuthrt('${authRelData.authMenuNo}'); return false;"><option value="Y" <c:if test="${authRelData.delAuthrtYn eq 'Y'}">selected</c:if>>Yes</option><option value="N" <c:if test="${authRelData.delAuthrtYn eq 'N'}">selected</c:if>>No</option></select></div></td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnDeleteAuthMenuInfoRow_${authRelData.authMenuNo}" name="btnDeleteAuthMenuInfoRow" onclick="javascript:moveDeleteAuthMenuInfo('${authRelData.authMenuNo}'); return false;">삭제</button></td>
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
<script type="text/javascript">
	
	function moveListBackPage() {
		history.back();
	}
	
	function moveListAuthrtPage() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/authMgt/authList.do";
		frm.submit();
	}
	
	function moveDeleteAuthMenuInfo(paramData) {
		let oldAuthMenuStts = $("#authStts_" + paramData).val();
		if (oldAuthMenuStts == "D") {
			alert("해당 메뉴는 이미 삭제로 설정되었습니다.");
		} else {
			$("#prslAuthrtYn_" + paramData).attr("disabled", true);
			$("#wrtAuthrtYn_" + paramData).attr("disabled", true);
			$("#mdfcnAuthrtYn_" + paramData).attr("disabled", true);
			$("#delAuthrtYn_" + paramData).attr("disabled", true);
			$("#authViewStts_" + paramData).text("D");
			$("#authStts_" + paramData).val("D");
		}
	}
	
	function moveChangeSelectMenuAuthrt(paramDataNo) {
		if ($("#authStts_" + paramDataNo).val() == "M") {
			$("#authViewStts_" + paramDataNo).text("U");
			$("#authStts_" + paramDataNo).val("U");
		}
	}
	
	function moveChangeAuthrtMenuTypeCd() {
		let authrtTypeCd = $("#authrtTypeCd").val();
		let authrtMenuTypeCd = "";
		if (authrtTypeCd == "USERTY0001") {
			authrtMenuTypeCd = "MNCLSF0001";
		} else if (authrtTypeCd == "USERTY0002") {
			authrtMenuTypeCd = "MNCLSF0001";
		} else if (authrtTypeCd == "USERTY0003") {
			authrtMenuTypeCd = "MNCLSF0002";
		} else {
			authrtMenuTypeCd = "MNCLSF0002";
		}
		$("#srchMenuTypeCd").val(authrtMenuTypeCd);
		
	}
	
	function moveOpenPopMenuList() {
		
		let paramPopUrl = "";
		let paramAuthrtId = $("#srchAuthrtId").val();
		let paramMenuTypeCd = $("#srchMenuTypeCd").val();
		
		if (paramMenuTypeCd == "") {
			alert("권한유형을 선택해 주십시오.");
			return false;
		} else {
			paramPopUrl = "/authMgt/popLayerMenuInfoList.do";
			paramPopUrl += "?popAuthrtId=" + paramAuthrtId;
			paramPopUrl += "&srchPopMenuTypeCd=" + paramMenuTypeCd;
			
			let paramPopUrlTxt = contextPath + paramPopUrl;
			$(".pop-layer").load(paramPopUrlTxt);
			admin.modalsShow('modals');
		}
	}
	
	function moveAddAuthrtMenuData(paramData) {
		let popMenuId = $("#popMenuId_" + paramData).val();
		let popMenuNm = $("#popMenuNm_" + paramData).val();
		
		let addMenuListYn = "N";
		if ($("input[name=authMenuId]").length == 0) {
			addMenuListYn = "Y";
		} else {
			for (let amr = 0; amr < $("input[name=authMenuId]").length; amr++) {
				if($("input[name=authMenuId]").eq(amr).val() == popMenuId) {
					alert("이미 설정되어 있는 메뉴입니다.");
					return false;
				} else {
					addMenuListYn = "Y";
				}
			}
		}
		
		if (addMenuListYn == "Y") {
			let tblAuthrtMenuBody, newMenuRowNumber, newMenuRow, viewMenuRowNum, newMenuCell0, newMenuCell1, newMenuCell2, newMenuCell3, newMenuCell4, newMenuCell5, newMenuCell6, newMenuCell7, newMenuCell8;
			tblAuthrtMenuBody = $("#authrtRelTbody");
			newMenuRowNumber = tblAuthrtMenuBody[0].rows.length;
			newMenuRow = tblAuthrtMenuBody[0].insertRow(newMenuRowNumber);
			newMenuCell0 = newMenuRow.insertCell();
			newMenuCell1 = newMenuRow.insertCell();
			newMenuCell2 = newMenuRow.insertCell();
			newMenuCell3 = newMenuRow.insertCell();
			newMenuCell4 = newMenuRow.insertCell();
			newMenuCell5 = newMenuRow.insertCell();
			newMenuCell6 = newMenuRow.insertCell();
			newMenuCell7 = newMenuRow.insertCell();
			newMenuCell8 = newMenuRow.insertCell();
			
			viewMenuRowNum = tblAuthrtMenuBody[0].rows.length;
			
			newMenuCell0.innerHTML = "<span id=\"authViewStts_" + viewMenuRowNum + "\" name=\"authViewStts\">I</span><input type=\"hidden\" id=\"authStts_" + viewMenuRowNum + "\" name=\"authStts\" value=\"I\">";
			newMenuCell1.innerHTML = "" + popMenuId + "<input type=\"hidden\" id=\"authMenuId_" + viewMenuRowNum + "\" name=\"authMenuId\" value=\"" + popMenuId + "\">";
			newMenuCell2.innerHTML = "" + popMenuNm + "";
			newMenuCell3.innerHTML = "YES<input type=\"hidden\" id=\"menuInqAuthrtYn_" + viewMenuRowNum + "\" name=\"menuInqAuthrtYn\" value=\"Y\">";
			newMenuCell4.innerHTML = "<div class=\"fm-select\" data-size=\"w100\"><select id=\"prslAuthrtYn_" + viewMenuRowNum + "\" name=\"prslAuthrtYn\"><option value=\"Y\">Yes</option><option value=\"N\">No</option></select></div>";
			newMenuCell5.innerHTML = "<div class=\"fm-select\" data-size=\"w100\"><select id=\"wrtAuthrtYn_" + viewMenuRowNum + "\" name=\"wrtAuthrtYn\"><option value=\"Y\">Yes</option><option value=\"N\">No</option></select></div>";
			newMenuCell6.innerHTML = "<div class=\"fm-select\" data-size=\"w100\"><select id=\"mdfcnAuthrtYn_" + viewMenuRowNum + "\" name=\"mdfcnAuthrtYn\"><option value=\"Y\">Yes</option><option value=\"N\">No</option></select></div>";
			newMenuCell7.innerHTML = "<div class=\"fm-select\" data-size=\"w100\"><select id=\"delAuthrtYn_" + viewMenuRowNum + "\" name=\"delAuthrtYn\"><option value=\"Y\">Yes</option><option value=\"N\">No</option></select></div>";
			newMenuCell8.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnDeleteAuthMenuInfoRow_" + viewMenuRowNum + "\" name=\"btnDeleteAuthMenuInfoRow\" onclick=\"javascript:moveDeleteAuthMenuInfo(\'" + viewMenuRowNum + "\'); return false;\">삭제</button>";
		}
	}
	
	function moveSaveAuthrtInfo() {
		let autWrtMode = $("#srchWrtMode").val();
		let frm = document.frmDtlSrch;
		
		//let chkRegExpChar = /[\{\}\[\]\/?.,;:||\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		
		if (autWrtMode == "entry") {
			if (cms_select_is_empty(true, frm.authrtTypeCd)) { alert("권한유형을 선택해 주십시오."); return false;}
		}
		
		if (cms_txt_is_empty(true, frm.authrtNm)) { alert("권한명을 입력해 주십시오."); return false;}
		
		let authSttsData = "";
		let menuIdData = "";
		let menuInqAuthrtData = "";
		let menuPrslAuthrtData = "";
		let menuWrtAuthrtData = "";
		let menuMdfcnAuthrtData = "";
		let menuDelAuthrtData = "";
		
		if (typeof($("input[name=authStts]")) != "undefined") {
			if (typeof($("input[name=authStts]").length) != "undefined" ) {//여러개 일때
				for (let ai = 0; ai < $("input[name=authStts]").length; ai++) {
					if (authSttsData == "") {
						authSttsData = $("input[name=authStts]").eq(ai).val();
						menuIdData = $("input[name=authMenuId]").eq(ai).val();
						menuInqAuthrtData = $("input[name=menuInqAuthrtYn]").eq(ai).val();
						menuPrslAuthrtData = $("select[name=prslAuthrtYn]").eq(ai).val();
						menuWrtAuthrtData = $("select[name=wrtAuthrtYn]").eq(ai).val();
						menuMdfcnAuthrtData = $("select[name=mdfcnAuthrtYn]").eq(ai).val();
						menuDelAuthrtData = $("select[name=delAuthrtYn]").eq(ai).val();
					} else {
						authSttsData += "|" + $("input[name=authStts]").eq(ai).val();
						menuIdData += "|" + $("input[name=authMenuId]").eq(ai).val();
						menuInqAuthrtData += "|" + $("input[name=menuInqAuthrtYn]").eq(ai).val();
						menuPrslAuthrtData += "|" + $("select[name=prslAuthrtYn]").eq(ai).val();
						menuWrtAuthrtData += "|" + $("select[name=wrtAuthrtYn]").eq(ai).val();
						menuMdfcnAuthrtData += "|" + $("select[name=mdfcnAuthrtYn]").eq(ai).val();
						menuDelAuthrtData += "|" + $("select[name=delAuthrtYn]").eq(ai).val();
					}
				}
				
			} else { //단일
				authSttsData = $("input[name=authStts]").val();
				menuIdData = $("input[name=authMenuId]").val();
				menuInqAuthrtData = $("input[name=menuInqAuthrtYn]").val();
				menuPrslAuthrtData = $("select[name=prslAuthrtYn]").val();
				menuWrtAuthrtData = $("select[name=wrtAuthrtYn]").val();
				menuMdfcnAuthrtData = $("select[name=mdfcnAuthrtYn]").val();
				menuDelAuthrtData = $("select[name=delAuthrtYn]").val();
			}
		}
		
		if (confirm("권한을 저장하시겠습니까?")) {
			
			$("#srchAhthrtRelStts").val(authSttsData);
			$("#srchAuthrtRelMenuId").val(menuIdData);
			$("#srchAhthrtRelMenuInqAuthrtYn").val(menuInqAuthrtData);
			$("#srchAhthrtRelPrslAuthrtYn").val(menuPrslAuthrtData);
			$("#srchAhthrtRelWrtAuthrtYn").val(menuWrtAuthrtData);
			$("#srchAhthrtRelMdfcnAuthrtYn").val(menuMdfcnAuthrtData);
			$("#srchAhthrtRelDelAuthrtYn").val(menuDelAuthrtData);
			
			frm.action = contextPath + "/authMgt/authSave.do"; 
			frm.submit();
		} else {
			return false;	
		}
	}
	
</script>