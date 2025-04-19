<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>게시판 분류 코드 - <c:out value="${popBbsStngInfo.bbsNm}"/></h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
		
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns size-small" id="bntPopAddBbsClsf" name="bntPopAddBbsClsf" onclick="javascript:popAddBbsClsfCd(); return false;">추가</button>
		<button type="button" class="btns size-small" id="btnSavePopAddBbsClsf" name="btnSavePopAddBbsClsf" onclick="javascript:moveSavePopBbsClsfCd(); return false;">저장</button>
	</div>
	<div class="table-wrap">
		<input type="hidden" id="popBbsId" name="popBbsId" value="<c:out value="${popBbsStngInfo.bbsId}"/>">
		<input type="hidden" id="popSttsSave" name="popSttsSave" value="">
		<input type="hidden" id="popBbsAllClsfCdStts" name="popBbsAllClsfCdStts" value="">
		<input type="hidden" id="popBbsAllClsfCd" name="popBbsAllClsfCd" value="">
		<input type="hidden" id="popBbsAllClsfNm" name="popBbsAllClsfNm" value="">
		<input type="hidden" id="popBbsAllClsfSortSn" name="popBbsAllClsfSortSn" value="">
		<input type="hidden" id="popBbsAllClsfUseYn" name="popBbsAllClsfUseYn" value="">
		<div class="div-scroll">
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:50px"></col>
				<col style="width:50px"></col>
				<col style="width:170px"></col>
				<col style=""></col>
				<col style="width:100px"></col>
				<col style="width:120px"></col>
				<col style="width:200px"></col>
			</colgroup>
			<thead>
				<tr>
					<th class="tc">Status</th>
					<th class="tc">No</th>
					<th class="tc">분류코드</th>
					<th class="tc">분류명</th>
					<th class="tc">순번</th>
					<th class="tc">사용여부</th>
					<th class="tc">삭제</th>
				</tr>
			</thead>
			<tbody id="popBbsCslfTbody">
			<c:if test="${!empty popBbsClsfCdList}">
				<c:forEach var="pBbsClsfCdData" items="${popBbsClsfCdList}" varStatus="status">
				<tr>
					<td>
						<span id="clsfSttsView_${pBbsClsfCdData.listClsfNo}" name="clsfSttsView" class="">M</span>
						<input type="hidden" id="clsfStts_${pBbsClsfCdData.listClsfNo}" name="clsfStts" value="M"> 
					</td>
					<td>
						<span id="clsfNo_${pBbsClsfCdData.listClsfNo}" name="clsfNo"><c:out value="${pBbsClsfCdData.listClsfNo}"/></span>
						<input type="hidden" id="clsfNo_${pBbsClsfCdData.listClsfNo}" name="clsfNoHdn" value="<c:out value="${pBbsClsfCdData.listClsfNo}"/>" readonly> 
					</td>
					<td>
						<div class="fm-ele" data-size="w150">
						<input type="text" id="clsfCd_${pBbsClsfCdData.listClsfNo}" name="clsfCd" maxlength="10" value="<c:out value="${pBbsClsfCdData.clsfCd}"/>" readonly>
						</div>
						<input type="hidden" id="clsfCdHdn_${pBbsClsfCdData.listClsfNo}" name="clsfCdHdn" value="<c:out value="${pBbsClsfCdData.clsfCd}"/>" readonly>
					</td>
					<td>
						<div class="fm-ele">
						<input type="text" id="clsfNm_${pBbsClsfCdData.listClsfNo}" name="clsfNm" value="<c:out value="${pBbsClsfCdData.clsfNm}"/>">
						</div>
						<input type="hidden" id="clsfNmHdn_${pBbsClsfCdData.listClsfNo}" name="clsfNmHdn" value="<c:out value="${pBbsClsfCdData.clsfNm}"/>">
					</td>
					<td>
						<div class="fm-ele">
						<input type="text" id="sortSn_${pBbsClsfCdData.listClsfNo}" name="sortSn" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="<c:out value="${pBbsClsfCdData.sortSn}"/>"  maxlength="2" style="ime-mode:disabled; text-align:center;">
						</div>
						<input type="hidden" id="sortSnHdn_${pBbsClsfCdData.listClsfNo}" name="sortSnHdn" value="<c:out value="${pBbsClsfCdData.sortSn}"/>">
					</td>
					<td>
						<div class="fm-focus fm-select" data-size="w100">
							<select id="clsfUseYn_${pBbsClsfCdData.listClsfNo}" name="clsfUseYn">
								<option value="Y" <c:if test="${pBbsClsfCdData.useYn =='Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${pBbsClsfCdData.useYn !='Y'}">selected</c:if>>사용안함</option>
							</select>
						</div>
						<input type="hidden" id="clsfUseYnHdn_${pBbsClsfCdData.listClsfNo}" name="clsfUseYnHdn" value="<c:out value="${pBbsClsfCdData.useYn}"/>">
					</td>
					<td><button type="button" class="btns size-xsmall color-red" id="btnCtgryDel_${pBbsClsfCdData.listClsfNo}" onclick="javascript:popDelBbsClsfCd('${pBbsClsfCdData.listClsfNo}'); return false;">삭제</button>
						<button type="button" class="btns size-xsmall color-gray" id="btnCtgryRst_${pBbsClsfCdData.listClsfNo}" onclick="javascript:popRstBbsClsfCd('${pBbsClsfCdData.listClsfNo}'); return false;">복원</button>
					</td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		</div>
	</div>
	<div class="btn-wrap align-right">
	</div>
</div>
<script src="/js/cmmnLibrary.js"></script>
<script type="text/javascript">
	
	//게시판 분류 추가
	function popAddBbsClsfCd() {
		let tblBody, newRowNumber, newRow, newCell0, newCell1, newCell2, newCell3, newCell4, newCell5, newCell6;
		tblBody = $("#popBbsCslfTbody");
		newRowNumber = tblBody[0].rows.length;
		newRow = tblBody[0].insertRow(newRowNumber);
		newCell0 = newRow.insertCell();
		newCell1 = newRow.insertCell();
		newCell2 = newRow.insertCell();
		newCell3 = newRow.insertCell();
		newCell4 = newRow.insertCell();
		newCell5 = newRow.insertCell();
		newCell6 = newRow.insertCell();
		
		viwRowNum = tblBody[0].rows.length;
		
		newCell0.innerHTML = "<span id=\"clsfSttsView_" + viwRowNum + "\" name=\"clsfSttsView\" class=\"\">I</span>";
		newCell0.innerHTML += "<input type=\"hidden\" id=\"clsfStts_" + viwRowNum + "\" name=\"clsfStts\" value=\"I\">";
		newCell1.innerHTML = "<span id=\"clsfNo_" + viwRowNum + "\" name=\"clsfNo\"  class=\"\">" + viwRowNum + "</span>";
		newCell1.innerHTML += "<input type=\"hidden\" id=\"clsfNo_" + viwRowNum + "\" name=\"clsfNoHdn\" value=\"" + viwRowNum + "\" readonly>";
		newCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"w150\"><input type=\"text\" id=\"clsfCd_" + viwRowNum + "\" name=\"clsfCd\"  maxlength=\"10\" value=\"\"></div>";
		newCell2.innerHTML += "<input type=\"hidden\" id=\"clsfCdHdn_" + viwRowNum + "\" name=\"clsfCdHdn\" value=\"\" readonly>";
		newCell3.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"clsfNm_" + viwRowNum + "\" name=\"clsfNm\"  class=\"\" value=\"\"></div>";
		newCell3.innerHTML += "<input type=\"hidden\" id=\"clsfNmHdn_" + viwRowNum + "\" name=\"clsfNmHdn\" value=\"\">";
		newCell4.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"sortSn_" + viwRowNum + "\" name=\"sortSn\" class=\"\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\"  onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\"></div>";
		newCell4.innerHTML += "<input type=\"hidden\" id=\"sortSnHdn_" + viwRowNum + "\" name=\"sortSnHdn\" value=\"\">";
		newCell5.innerHTML += "<div class=\"fm-focus fm-select\" data-size=\"w100\"><select id=\"clsfUseYn_" + viwRowNum + "\" name=\"clsfUseYn\" class=\"\"><option value=\"Y\" selected>사용</option><option value=\"N\" >사용안함</option></select></div>";
		newCell5.innerHTML += "<input type=\"hidden\" id=\"clsfUseYnHdn_" + viwRowNum + "\" name=\"clsfUseYnHdn\" value=\"\">";
		newCell6.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnCtgryDel_" + viwRowNum + "\" onclick=\"javascript:popDelBbsClsfCd('" + viwRowNum + "'); return false;\">삭제</button>";
	}
	
	//게시판 분류 삭제
	function popDelBbsClsfCd(paramClsfNo) {
		let clsfRowStts = $("#clsfStts_" + paramClsfNo).val();
		
		if (clsfRowStts =="D") { //신규등록일 경우
			alert("이미 삭제로 변경되었습니다.");
		} else {
			if (confirm("분류를 삭제하시겠습니까?")) {
				$("#clsfCd_" + paramClsfNo).attr("readonly", true);
				$("#clsfNm_" + paramClsfNo).attr("readonly", true);
				$("#sortSn_" + paramClsfNo).attr("readonly", true);
				$("#clsfUseYn_" + paramClsfNo).attr("disabled", true);
				$("#clsfSttsView_" + paramClsfNo).text("D");
				$("#clsfStts_" + paramClsfNo).val("D");
			} else {
				return false;
			}
			
		}
	}
	
	function popRstBbsClsfCd(paramClsfNo) {
		let clsfRowStts = $("#clsfStts_" + paramClsfNo).val();
		if (clsfRowStts == "M") {//데이터 변경이 없을 경우
			alert("복원할 대상이 아닙니다.");
		} else {
			if (confirm("분류를 복원하시겠습니까?")) {
				$("#clsfCd_" + paramClsfNo).removeAttr("readonly");
				$("#clsfNm_" + paramClsfNo).removeAttr("readonly");
				$("#sortSn_" + paramClsfNo).removeAttr("readonly");
				$("#clsfUseYn_" + paramClsfNo).removeAttr("disabled");
				$("#clsfCd_" + paramClsfNo).val($("#clsfCdHdn_" + paramClsfNo).val());
				$("#clsfNm_" + paramClsfNo).val($("#clsfNmHdn_" + paramClsfNo).val());
				$("#sortSn_" + paramClsfNo).val($("#sortSnHdn_" + paramClsfNo).val());
				$("#clsfUseYn_" + paramClsfNo).val($("#clsfUseYnHdn_" + paramClsfNo).val());
				$("#clsfSttsView_" + paramClsfNo).text("M");
				$("#clsfStts_" + paramClsfNo).val("M");
			} else {
				return false;
			}
		}
	}
	
	function moveSavePopBbsClsfCd() {
		
		//변경이 있었는지 체크
		let popSttsSaveYn = "N";
		//게시판 분류 
		let popBbsClsfSttusValue = "";
		let popBbsClsfCdValue = "";
		let popBbsClsfNmValue = "";
		let popBbsClsfSortValue = "";
		let popBbsClsfUseYnValue = "";
		
		let chkRegExpChar = /[\{\}\[\]\/?.,;:||\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		let paramClsfNo;
		
		if (typeof($("input[name=clsfStts]")) != "undefined") {
			if (typeof($("input[name=clsfStts]").length) != "undefined" ) {
				for (let ci = 0; ci < $("input[name=clsfStts]").length; ci++) {
					//삭제가 아닐 경우에만 유효성 체크
					if ($("input[name=clsfStts]").eq(ci).val() != "D") {
						if ($("input[name=clsfCd").eq(ci).val() =="") {
							alert("분류 코드를 입력해 주십시오.");
							return false;
						} else {
							if (chkRegExpChar.test($("input[name=clsfCd").eq(ci).val())) {
								alert("특수문자는 입력하실 수 없습니다." + ci);
								return false;
							} else {
								if ($("input[name=clsfStts]").eq(ci).val() != "D") {
									for (let ki = 0; ki < $("input[name=clsfStts]").length; ki++ ) {
										if ((ci != ki) && ($("input[name=clsfStts]").eq(ki).val() != "D") && ($("input[name=clsfCd]").eq(ci).val() == $("input[name=clsfCd]").eq(ki).val())) {
											alert("중복된 분류 코드가 존재합니다.");
											return false;
										}
									}
								}
							}
						}
						if ($("input[name=clsfNm]").eq(ci).val() =="") {
							alert("분류 명을 입력해 주십시오.");
							return false;
						} else {
							if (chkRegExpChar.test($("input[name=clsfNm]").eq(ci).val())) {
								alert("특수문자는 입력하실 수 없습니다. Nm" + ci);
								return false;
							}
						}
						if ($("input[name=sortSn]").eq(ci).val() == "") { alert("정렬 순번을 입력해 주십시오."); return false;}
					}
					
					//수정인지 체크
					if ($("input[name=clsfStts]").eq(ci).val() == "M") {
						
						if (($("input[name=clsfNm]").eq(ci).val() != $("input[name=clsfNmHdn]").eq(ci).val()) || ($("input[name=sortSn]").eq(ci).val() != $("input[name=sortSnHdn]").eq(ci).val()) || ($("select[name=clsfUseYn]").eq(ci).val() != $("input[name=clsfUseYnHdn]").eq(ci).val())) {
							$("input[name=clsfStts]").eq(ci).val("U");
							paramClsfNo = $("input[name=clsfNoHdn]").eq(ci).val();
							$("#clsfSttsView_" + paramClsfNo).text("U");
						}
					}
					
					if (popBbsClsfSttusValue == "") {
						popBbsClsfSttusValue = $("input[name=clsfStts]").eq(ci).val();
						popBbsClsfCdValue = $("input[name=clsfCd]").eq(ci).val();
						popBbsClsfNmValue = $("input[name=clsfNm]").eq(ci).val();
						popBbsClsfSortValue = $("input[name=sortSn]").eq(ci).val();
						popBbsClsfUseYnValue = $("select[name=clsfUseYn]").eq(ci).val();
					} else {
						popBbsClsfSttusValue += "|" + $("input[name=clsfStts]").eq(ci).val();
						popBbsClsfCdValue += "|" + $("input[name=clsfCd]").eq(ci).val();
						popBbsClsfNmValue += "|" + $("input[name=clsfNm]").eq(ci).val();
						popBbsClsfSortValue += "|" + $("input[name=sortSn]").eq(ci).val();
						popBbsClsfUseYnValue += "|" + $("select[name=clsfUseYn]").eq(ci).val();
					}
					
					if ($("input[name=clsfStts]").eq(ci).val() != "M") {
						popSttsSaveYn = "Y";
					}
					
				}
			} else {
				
				//삭제가 아닐 경우에만 유효성 체크
				if ($("input[name=clsfStts]").val() != "D") {
					if ($("input[name=clsfCd]").val() == "") {
						alert("분류 코드를 입력해 주십시오.");
						return false;
					} else {
						if (chkRegExpChar.test($("input[name=clsfCd]").val())) {
							alert("특수문자는 입력하실 수 없습니다.");
							return false;
						}
					}
					if ($("input[name=clsfNm]").val() == "") {
						alert("분류 명을 입력해 주십시오.");
						return false;
					} else {
						if (chkRegExpChar.test($("input[name=clsfNm]").val())) {
							alert("특수문자는 입력하실 수 없습니다. Nm");
							return false;
						}
					}
					if ($("input[name=sortSn]").val() == "") { alert("정렬 순번을 입력해 주십시오."); return false;}
				}
				//수정인지 체크
				if ($("input[name=clsfStts]").val() == "M") {
					if (($("input[name=clsfNm]").val() != $("input[name=clsfNmHdn]").val()) || ($("input[name=sortSn]").val() != $("input[name=sortSnHdn]").val()) || ($("select[name=clsfUseYn]").val() != $("input[name=clsfUseYnHdn]").val()) ) {
						$("input[name=clsfStts]").val("U");
						$("input[name=clsfSttsView]").innerHTML = "U";
					}
				}
				
				popBbsClsfSttusValue = $("input[name=clsfStts]").val();
				popBbsClsfCdValue = $("input[name=clsfCd]").val();
				popBbsClsfNmValue = $("input[name=clsfNm]").val();
				popBbsClsfSortValue = $("input[name=sortSn]").val();
				popBbsClsfUseYnValue = $("select[name=clsfUseYn]").val();
				
				if ($("input[name=clsfStts]").val() != "M") {
					popSttsSaveYn = "Y";
				}
			}
			
		}
		
		$("#popBbsAllClsfCdStts").val(popBbsClsfSttusValue);
		$("#popBbsAllClsfCd").val(popBbsClsfCdValue);
		$("#popBbsAllClsfNm").val(popBbsClsfNmValue);
		$("#popBbsAllClsfSortSn").val(popBbsClsfSortValue);
		$("#popBbsAllClsfUseYn").val(popBbsClsfUseYnValue);
	
		
		let paramPopBbsAllClsfCdStts = popBbsClsfSttusValue;
		let paramPopBbsAllClsfCd = popBbsClsfCdValue;
		let paramPopBbsAllClsfNm = popBbsClsfNmValue;
		let paramPopBbsAllClsfSortSn = popBbsClsfSortValue;
		let paramPopBbsAllClsfUseYn = popBbsClsfUseYnValue;
		
		if (popSttsSaveYn == "Y") {
			if (confirm("저장하시겠습니까?")) {
				$.ajax({
					type : "GET",
					url : contextPath + "/bbsStngMgt/saveBbsClsfCdList.do",
					async : true,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : {
						"checkPopBbsId" : '${popBbsStngInfo.bbsId}',
						"checkPopClsfCdStts" : popBbsClsfSttusValue,
						"checkPopClsfCd" : popBbsClsfCdValue,
						"checkPopClsfNm" : popBbsClsfNmValue,
						"checkPopClsfSort" : popBbsClsfSortValue,
						"checkPopClsfUseYn" : popBbsClsfUseYnValue
					},
					success : function(rtnData) {
						if (rtnData == "Y") {
							alert("저장되었습니다.");
							layerPopReload('${popBbsStngInfo.bbsId}');
							return false;
						} else {
							alert("데이터 이상으로 저장되지 못했습니다. 관리자에게 문의하십시오.");
							return false;
						}
					}, 
					error : function(request, status, error) {
						console.log(error);
					}
				});
			} else {
				return false;
			}
		} else {
			alert("변경된 분류가 없습니다.");
			return false;
		}
	}
	
	function layerPopReload(popBbsparam) {
		let paramUrl = "";
		paramUrl += "/bbsStngMgt/popBbsClsfList.do";
		paramUrl += "?srchPopBbsId==" + popBbsparam;
		
		paramUrl = contextPath + paramUrl
		
		$(".pop-layer").load(paramUrl);
	}

</script>