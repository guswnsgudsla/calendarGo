<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	
	<div class="table-wrap write">
		<form name="frmInfoWrite" method="post" action="#" enctype="multipart/form-data">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchInstInfo.paramPageNo}">
			<input type="hidden" id="srchInstId" name="srchInstId" value="${srchInstInfo.paramInstId}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="${srchInstInfo.paramWrtMode}">
			<input type="hidden" id="srchInstNm" name="srchInstNm" value="${srchInstInfo.paramInstNm}">
			<input type="hidden" id="srchInstTypeCd" name="srchInstTypeCd" value="${srchInstInfo.paramInstTypeCd}">
			<input type="hidden" id="srchFldTypeCd" name="srchFldTypeCd" value="${srchInstInfo.paramFldTypeCd}">
			<input type="hidden" id="srchClcTypeCd" name="srchClcTypeCd" value="${srchInstInfo.paramClcTypeCd}">
			<input type="hidden" id="srchCertChk" name="srchCertChk" value="${srchInstInfo.paramCertChk}">
			<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="${srchInstInfo.paramTabPstnId}">
			<input type="hidden" id="srchTabUserListPageNo" name="srchTabUserListPageNo" value="${srchInstInfo.paramTabUserListPageNo}">
			<input type="hidden" id="srchTabUserRecordCnt" name="srchTabUserRecordCnt" value="${srchInstInfo.paramTabUserRecordCnt}">
			<input type="hidden" id="srchTabDclrcsListPageNo" name="srchTabDclrcsListPageNo" value="${srchInstInfo.paramTabDclrcsListPageNo}">
			<input type="hidden" id="srchTabDclrcsRecordCnt" name="srchTabDclrcsRecordCnt" value="${srchInstInfo.paramTabDclrcsRecordCnt}">
			<input type="hidden" id="srchTabDgtlClcListPageNo" name="srchTabDgtlClcListPageNo" value="${srchInstInfo.paramTabDgtlClcListPageNo}">
			<input type="hidden" id="srchTabDgtlClcRecordCnt" name="srchTabDgtlClcRecordCnt" value="${srchInstInfo.paramTabDgtlClcRecordCnt}">
			<input type="hidden" id="chkDuplInstId" name="chkDuplInstId" value="${srchInstInfo.chkDuplInstIdYn}">
			<input type="hidden" id="chkDuplInstCd" name="chkDuplInstCd" value="${srchInstInfo.chkDuplInstCdYn}">
			<input type="hidden" id="sprrCertYmd" name="sprrCertYmd" value="${instInfo.sprrCertYmd}">
			<input type="hidden" id="ablYmd" name="ablYmd" value="${instInfo.ablYmd}">
			<input type="hidden" id="instZip" name="instZip" value="${instInfo.instZip}">
			<input type="hidden" id="instAddr" name="instAddr" value="${instInfo.instAddr}">
			<input type="hidden" id="instDaddr" name="instDaddr" value="${instInfo.instDaddr}">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:12%"></col>
					<col style="width:38%"></col>
					<col style="width:12%"></col>
					<col style="width:38%"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>기관 명<span class="required">필수</span></th>
						<td colspan="3">
							<div class="fm-ele">
								<input type="text" id="instNm" name="instNm" value="${instInfo.instNm}" placeholder="기관명을 입력하세요" />
							</div>	
						</td>
					</tr>
					<tr>
						<th>기관 아이디<span class="required">필수</span></th>
						<td>
							<c:if test="${srchInstInfo.paramWrtMode eq 'entry'}">
							<div class="fm-ele with-btn">
								<input type="text" id="instId" name="instId" value="${instInfo.instId}" maxlength="10" placeholder="기관아이디를 입력하세요" />
								<button type="button" class="btns size-small" id="btnChkDuplId" name="btnChkDuplId" onclick="javascript:checkDuplInstId(); return false;" style="padding: 0 20px;">중복검사</button>
							</div>
							</c:if>
							<c:if test="${srchInstInfo.paramWrtMode eq 'edit'}">
								<input type="hidden" id="instId" name="instId" value="${instInfo.instId}">
								<span>${instInfo.instId}</span>
							</c:if>
						
						</td>
						<th>기관 코드</th>
						<td>
							<div class="fm-ele with-btn">
								<input type="text" id="instCd" name="instCd" value="${instInfo.instCd}" placeholder="기관코드를 입력하세요" />
								<button type="button" class="btns size-small" id="btnChkDuplCd" name="btnChkDuplCd" onclick="javascript:checkDuplInstCd(); return false;">중복검사</button>
							</div>
						</td>
					</tr>
					<tr>
						<th>기관 유형</th>
						<td>
							<div class="fm-focus fm-select">
								<select id=id="instTypeCd" name="instTypeCd" style="min-height: 23px;  padding-left: 10px;">
									<option value="" <c:if test="${instInfo.instTypeCd == ''}">selected</c:if>>선택</option>
									<c:if test="${!empty instTypeCmmnCdList}">
										<c:forEach var="typeCdRow" items="${instTypeCmmnCdList}">
									<option value="${typeCdRow.cdId}" <c:if test="${instInfo.instTypeCd == typeCdRow.cdId }">selected</c:if>>${typeCdRow.cdNm}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</td>
						<th>영역 유형</th>
						<td>
							<div class="fm-focus fm-select">
								<select id="fildTypeCd" name="fildTypeCd" style="min-height: 23px;  padding-left: 10px;">
									<option value="" <c:if test="${instInfo.fildTypeCd == ''}">selected</c:if>>선택</option>
									<c:if test="${!empty fldTypeCmmnCdList}">
										<c:forEach var="fldCdRow" items="${fldTypeCmmnCdList}">
									<option value="${fldCdRow.cdId}" <c:if test="${instInfo.fildTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.cdNm}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="fm-ele">
								<input type="text" id="instTelno" name="instTelno"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${instInfo.instTelno}" maxlength="11" style="ime-mode:disabled;" placeholder="전화번호를 입력하세요" />
							</div>
						</td>
						<th>팩스번호</th>
						<td>
							<div class="fm-ele">
								<input type="text" id="instFxno" name="instFxno"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${instInfo.instFxno}" maxlength="11" style="ime-mode:disabled;" placeholder="팩스번호를 입력하세요" />
							</div>
						</td>
					</tr>
					<tr>
						<th>기관대표이미지</th>
						<td colspan="3">
							<div class="filebox-wrap">
								<div class="fm-group fm-filebox">
									<div class="fm-focus">
										<input type="hidden" id="rprsImgGroupId" name="rprsImgGroupId"value='<c:out value="${instInfo.rprsImgGroupId}" />'>
										<input type="hidden" id="atchFileDeleteSn" name="atchFileDeleteSn" value="">
										<input type="file" name="atchFile" id="atchFile" class="file-data" onchange="addGetFileList()">
										<label for="atchFile" style="position: unset;">파일선택</label>
										<div id="contents-list" class="contents-list">
											<ul id="fileList">
												<c:if test="${!empty instAtchFileList}">
													<c:forEach var="atchFileData" items="${instAtchFileList}" varStatus="status">
														<div id="oldFile_${atchFileData.atchFileSn}" name="oldFile" class="file-data">
															<p class="file-name">${atchFileData.orgnlAtchFileNm}</p>
															<button class="" type="button" id="btnDelOldFiles_${atchFileData.atchFileSn}" name="btnDelOldFiles_${atchFileData.atchFileSn}" onclick="javascript:deleteOldFileList('${atchFileData.atchFileSn}'); return false;">삭제</button>
														</div>
													</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>기관설명</th>
						<td colspan="3">
							<div class="fm-textarea">
								<textarea class="" id="instExpln" name="instExpln" cols="50" rows="5" placeholder="기관설명을 입력하세요."><c:out value="${instInfo.instExpln}" /></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th>누리집 주소</th>
						<td colspan="3">
							<div class="fm-ele">
								<input type="text" id="hmpgAddr" name="hmpgAddr" value="${instInfo.hmpgAddr}" placeholder="누리집 주소를 입력하세요" />
							</div>	
						</td>
					</tr>
					<tr>
						<th>수집 유형</th>
						<td>
							<div class="fm-focus fm-select align-right">
								<select id="clctTypeCd" name="clctTypeCd">
									<option value="" <c:if test="${instInfo.clctTypeCd == ''}">selected</c:if>>선택</option>
									<c:if test="${!empty clcTypeCmmnCdList}">
										<c:forEach var="clcCdRow" items="${clcTypeCmmnCdList}">
									<option value="${clcCdRow.cdId}" <c:if test="${instInfo.clctTypeCd == clcCdRow.cdId }">selected</c:if>>${clcCdRow.cdNm}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</td>
						<th>수집 주기</th>
						<td>
							<div class="fm-focus fm-select align-right">
								<select id="clctCyclCd" name="clctCyclCd">
									<option value="" <c:if test="${instInfo.clctCyclCd == ''}">selected</c:if>>선택</option>
									<c:if test="${!empty clctCyclCmmnCdList}">
										<c:forEach var="cyclCdRow" items="${clctCyclCmmnCdList}">
									<option value="${cyclCdRow.cdId}" <c:if test="${instInfo.clctCyclCd == cyclCdRow.cdId }">selected</c:if>>${cyclCdRow.cdNm}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>우수 인증</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="sprrCertYnY" name="sprrCertYn" value="Y" <c:if test="${instInfo.sprrCertYn == 'Y'}">checked</c:if> onclick="javascript:changeSprrCertYnDate();"/><label for="sprrCertYnY">YES</label></span>
								<span><input type="radio" id="sprrCertYnN" name="sprrCertYn" value="N" <c:if test="${instInfo.sprrCertYn != 'Y'}">checked</c:if> onclick="javascript:changeSprrCertYnDate();"/><label for="sprrCertYnN">NO</label></span>
							</div>
						</td>
						<th>우수 인증 일자</th>
						<td>
							<div class="fm-ele date">
								<input type="date" id="sprrCertYmdV10" name="sprrCertYmdV10" value="${instInfo.sprrCertYmdV10}" <c:if test="${instInfo.ablYn != 'Y'}">readonly</c:if> placeholder="우수 인증 일자" />
							</div>
						</td>
					</tr>
					<tr>
						<th>폐지</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="ablYnY" name="ablYn" value="Y" <c:if test="${instInfo.ablYn == 'Y'}">checked</c:if> onclick="javascript:changeAblYnDate();"/><label for="ablYnY">YES</label></span>
								<span><input type="radio" id="ablYnN" name="ablYn" value="N" <c:if test="${instInfo.ablYn != 'Y'}">checked</c:if> onclick="javascript:changeAblYnDate();"/><label for="ablYnN">NO</label></span>
							</div>
						</td>
						<th>폐지 일자</th>
						<td>
							<div class="fm-ele date">
								<input type="date" id="ablYmdV10" name="ablYmdV10" value="${instInfo.ablYmdV10}" <c:if test="${instInfo.ablYn != 'Y'}">readonly</c:if> placeholder="폐지 일자" />
							</div>
						</td>
					</tr>
					<tr>
						<th>기관 공개<span class="required">필수</span></th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="rlsYnY" name="rlsYn" value="Y" <c:if test="${instInfo.rlsYn == 'Y'}">checked</c:if>/><label for="rlsYnY">YES</label></span>
								<span><input type="radio" id="rlsYnN" name="rlsYn" value="N" <c:if test="${instInfo.rlsYn != 'Y'}">checked</c:if>/><label for="rlsYnN">NO</label></span>
							</div>
						</td>
						<th>지역</th>
						<td>
							<div class="fm-focus fm-select align-right">
								<select id="rgnCd" name="rgnCd">
									<option value="" <c:if test="${instInfo.rgnCd == ''}">selected</c:if>>선택</option>
									<c:if test="${!empty rgnCmmnCdList}">
										<c:forEach var="rgnCdRow" items="${rgnCmmnCdList}">
									<option value="${rgnCdRow.cdId}" <c:if test="${instInfo.rgnCd == rgnCdRow.cdId }">selected</c:if>>${rgnCdRow.cdNm}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" id="btnMovePrevPage" name="btnMovePrevPage" class="btns color-gray" onclick="javascript:movePrevPage(); return false;">이전</button>
		<button type="button" id="btnMoveListPage" name="btnMoveListPage" class="btns color-gray" onclick="javascript:moveListInstInfo(); return false;">목록</button>
		<button type="button" id="btnSetSave" name="btnSetSave" class="btns" onclick="javascript:setInstInfo(); return false;">저장</button>
	</div>
</div>
<!-- 공통 javascript 함수 -->
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script>

	/**
	 *  Page 렌더링 전 작업
	 */
	
	
	/**
	 * Page 초기화
	 * 변수 정의
	 */
	
	
	 /**
	 * 이벤트 핸들링
	 */
	 
	//버튼 이벤트
	/*
	$("#btnMovePrevPage").click(movePrevPage);
	$("#btnMoveListPage").click(moveListInstInfo);
	$("#btnSetSave").click(setInstInfo);
	$("#btnChkDuplId").click(checkDuplInstId);
	$("#btnChkDuplCd").click(checkDuplInstCd);
	*/

	 /**
	 * 동적메소드 선언
	 */
	
	let fileList = [];
	let fileNo = 0;
	

	//이전페이지
	function movePrevPage() {
		history.back();
	}

	//목록
	function moveListInstInfo() {
		let frm = document.frmInfoWrite;
		frm.action = contextPath + "/instMgt/instList.do";
		frm.submit();
	}
	
	//우수인증
	function changeSprrCertYnDate() {
		if ($("#sprrCertYnY").is(":checked")) {
			$("#sprrCertYmdV10").attr("readonly", false);
		} else {
			$("#sprrCertYmdV10").attr("readonly", true);
		}
	}
	
	function changeAblYnDate() {
		if ($("#ablYnY").is(":checked")) {
			$("#ablYmdV10").attr("readonly", false);
		} else {
			$("#ablYmdV10").attr("readonly", true);
		}
	}
	
	//저장
	function setInstInfo() {
		
		let frm = document.frmInfoWrite;
		
		//유효성 체크
		if (cms_txt_is_empty(true, frm.instNm)) { alert("기관명을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frm.instId)) { alert("기관아이디를 입력해 주십시오."); return false;}
		if (frm.chkDuplInstId.value == "N") { alert("기관아이디 중복검사를 진행해 주십시오."); return false;}
		if (/\s|\W/.test(frm.instCd.value)) {alert("기관코드에 공백 및 특수문자를 포함할 수 없습니다"); return false;}
		
		//if (cms_txt_is_empty(true, frm.instCd)) { alert("기관코드를 입력해 주십시오."); return false;}
		if (!cms_txt_is_empty(false, frm.instCd) && frm.chkDuplInstCd.value == "N") { alert("기관코드 중복검사를 진행해 주십시오."); return false;}
		
		//if (cms_select_is_empty(true, frm.instTypeCd)) { alert("기관 유형을 선택해 주십시오."); return false;}
		//if (cms_select_is_empty(true, frm.fildTypeCd)) { alert("영역 유형을 선택해 주십시오."); return false;}
		
		//if (cms_txt_is_empty(true, frm.instTelno)) { alert("전화번호를 입력해 주십시오."); return false;}
		//if (cms_txt_is_empty(true, frm.instFxno)) { alert("팩스번호를 입력해 주십시오."); return false;}
		
		//if (cms_txt_is_empty(true, frm.hmpgAddr)) { alert("누리집주소를 입력해 주십시오."); return false;}
		
		//if (cms_select_is_empty(true, frm.clctTypeCd)) { alert("수집 유형을 선택해 주십시오."); return false;}
		//if (cms_select_is_empty(true, frm.clctCyclCd)) { alert("수집 주기를 선택해 주십시오."); return false;}
		
		//if (!cms_radio_is_checked(true, frm.sprrCertYn)) { alert("우수 인증 여부를 선택해 주십시오"); return false; }
		//if (!cms_radio_is_checked(true, frm.ablYn)) { alert("폐지 여부를 선택해 주십시오"); return false; }
		//hidden채우기
		
		//if (!cms_radio_is_checked(true, frm.rlsYn)) { alert("공개 여부를 선택해 주십시오"); return false; }
		if (confirm("저장 하시겠습니까?")) {
			frm.action=contextPath + "/instMgt/saveInst.do";
			frm.submit();
		}
	}
	
	//아이디 중복여부 체크
	function checkDuplInstId() {
		let frm = document.frmInfoWrite;
		
		if (/\s|\W/.test(frm.instId.value)) {
		     alert("기관아이디에 공백 및 특수문자를 포함할 수 없습니다");
		     return false;
		 }
		
		if (cms_txt_is_empty(true, frm.instId)) {
			alert("기관아이디를 입력해 주세요");
			return false;
		} else {
			//기관아이디 중복검사여부 초기화
			frm.chkDuplInstId.value = "N";
			
			$.ajax({
				type : "GET",
				url : contextPath + "/instMgt/checkDuplInstInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkMode" : "checkInstId",
					"checkData" : frm.instId.value,
					"checkData1" : ""
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert(frm.instId.value + "는 이미 등록된 기관아이디입니다.");
						return false;
					} else {
						frm.chkDuplInstId.value = "Y";
						alert("중복이 아닙니다. 계속 진행 하십시오.");
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
			
		}
		
	}
	
	//기관코드 중복여부 체크
	function checkDuplInstCd() {
		let frm = document.frmInfoWrite;
		
		if (/\s|\W/.test(frm.instCd.value)) {
		     alert("기관코드에 공백 및 특수문자를 포함할 수 없습니다");
		     return false;
		 }
		
		if (cms_txt_is_empty(true, frm.instCd)) {
			alert("기관코드를 입력해 주세요");
			return false;
		} else {
			//기관코드 중복검사여부 초기화
			frm.chkDuplInstCd.value = "N";
			
			$.ajax({
				type : "GET",
				url : contextPath + "/instMgt/checkDuplInstInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkMode" : "checkInstCd",
					"checkData" : frm.instCd.value,
					"checkData1" : frm.instId.value
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert(frm.instCd.value + "는 이미 등록된 기관코드입니다.");
						return false;
					} else {
						frm.chkDuplInstCd.value = "Y";
						alert("중복이 아닙니다. 계속 진행 하십시오.");
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	}
	
	function validFileList() {
		//첨부 가능 파일
		let addPsbleFileType = ['GIF', 'JPEG', 'JPG', 'PNG', 'BMP'];
		//최대 첨부 가능 파일 수
		let maxFileCnt = 1;
		//최대 첨부 가능 파일 크기 (20MB)
		let maxFileSize = 20 * 1024 * 1024;
		
		const inputFiles = document.getElementById("atchFile").files;
		let nowFileCnt = $(".file-data").length;
		
		if (nowFileCnt > maxFileCnt) {
			alert("첨부파일은 " + maxFileCnt + "개 까지만 첨부 가능합니다.")
			return false;
		} else {
			for (var i = 0; i < inputFiles.length; i++) {
				let obj = inputFiles[i];
				let addFileName = obj.name;
				let addFileType = addFileName.split(".")[addFileName.split(".").length - 1].toUpperCase();
				let addFileSize = obj.size;
				if (fileList.some(file => file.name === addFileName)) {
					alert("이미 선택한 파일입니다.");
					return false;
				}
				if (!addPsbleFileType.includes(addFileType)) {
					alert("첨부가 불가능한 파일(" + addFileType + ")입니다.")
					return false;
				}
				if (addFileSize > maxFileSize) {
					alert("첨부 가능한 크기를 초과한 파일입니다. ")
					return false;
				}
			}
		}
		return true;
	}

	function addGetFileList(){
		if(validFileList()){
			const fileInput = document.querySelector('#atchFile');
			const preview = document.querySelector('#fileList');
			const files = Array.from(fileInput.files)
			files.forEach( file => {
				fileNo = fileNo + 1;
				let fileDataTxt = "";
				fileDataTxt += "<div id=\"file" + fileNo + "\" class=\"file-data\">";
				fileDataTxt += "<p class=\"file-name\">" + file.name + "</p>";
				fileDataTxt += "<button class=\"\" type=\"button\" id=\"btnDelFiles"
						+ fileNo + "\" name=\"btnDelFiles\" onclick=\"javascript:deleteFileList(" + fileNo + "); return false;\">삭제</button>";
				fileDataTxt += "</div>";
				preview.innerHTML += fileDataTxt;
				file.fileNo = fileNo;
				fileList.push(file)
			});
		}
		// input 값 갱신
		const dataTranster = new DataTransfer();
		fileList.forEach(file => dataTranster.items.add(file));
		document.querySelector('#atchFile').files = dataTranster.files;
	}
	
	function deleteFileList(num){
		const removeTarget = document.querySelector("#file" + num);
		const dataTranster = new DataTransfer();
		fileList.filter(file => file.fileNo != num)
				.forEach(file => {
					dataTranster.items.add(file);
				});
		const updatedFileList = document.querySelector('#atchFile').files = dataTranster.files;
		removeTarget.remove();
		fileList = Array.from(updatedFileList);
	}
	
	function deleteOldFileList(num) {
		document.querySelector("#oldFile_" + num).remove();
		let frm = document.frmInfoWrite;
		let deleteFileSn = frm.atchFileDeleteSn.value;
		if (deleteFileSn == "") {
			deleteFileSn = num;
		} else {
			deleteFileSn += "," + num;
		}
		frm.atchFileDeleteSn.value = deleteFileSn;
	}

</script>