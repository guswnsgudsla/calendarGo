<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="contants">

	<div class="table-wrap write">
		<form name="frmRegSrch" id="frmRegSrch" method="post" action="#"  enctype="multipart/form-data">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value='<c:out value="${srchWhtprInfo.paramPageNo}" />'>
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value='<c:out value="${srchWhtprInfo.paramRecordCnt}" />'>
			<input type="hidden" id="srchWhtprId" name="srchWhtprId" value='<c:out value="${srchWhtprInfo.paramWhtprId}" />'>
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value='<c:out value="${srchWhtprInfo.paramWrtMode}" />'>
			<input type="hidden" id="srchString" name="srchString" value='<c:out value="${srchWhtprInfo.paramSrchString}" />'>
			<input type="hidden" id="errorMessage" name="errorMessage" value='<c:out value="${errorMessage}" />'>
			<table>
				<caption></caption>
				<colgroup>
					<col width="200px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
				<c:if test="${srchWhtprInfo.paramWrtMode == 'edit'}">
					<tr>
						<th>백서아이디</th>
						<td><c:out value="${whtprInfo.whtprId}" /></td>
					</tr>
				</c:if>
					<tr>
						<th>발행연도<span class="required">필수</span></th>
						<td>
							<div class="fm-ele" data-size="w200">
								<input type="text" id="pblcnYr" name="pblcnYr" value='<c:out value="${whtprInfo.pblcnYr}" />' onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="4" style="ime-mode:disabled;" placeholder="발행연도를 입력하세요." />
							</div>
						</td>
					</tr>
					<tr>
						<th>발행여부<span class="required">필수</span></th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="pblcnYnY" name="pblcnYn" value="Y" <c:if test="${whtprInfo.pblcnYn == 'Y'}">checked</c:if>/><label for="pblcnYnY">발행</label></span>
								<span><input type="radio" id="pblcnYnN" name="pblcnYn" value="N" <c:if test="${whtprInfo.pblcnYn != 'Y'}">checked</c:if>/><label for="pblcnYnN">미발행</label></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>백서명<span class="required">필수</span></th>
						<td>
							<div class="fm-ele" data-size="w500">
								<input type="text" id="whtprNm" name="whtprNm" value='<c:out value="${whtprInfo.whtprNm}" />'placeholder="백서명을 입력하세요." />
							</div>
						</td>
					</tr>
					<tr>
						<th>백서내용</th>
						<td>
							<div class="fm-textarea">
								<textarea class="" id="whtprCn" name="whtprCn" cols="50" rows="5" placeholder="백서내용을 입력하세요."><c:out value="${whtprInfo.whtprCn}" /></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<div class="filebox-wrap">
								<div class="fm-group fm-filebox">
									<div class="fm-focus">
										<input type="hidden" id="atchFileGroupId" name="atchFileGroupId"value='<c:out value="${whtprInfo.atchFileGroupId}" />'>
										<input type="hidden" id="atchFileDeleteSn" name="atchFileDeleteSn" value="">
										<input type="file" name="atchFile" id="atchFile" class="file-data" multiple onchange="addGetFileList()">
										<label for="atchFile" style="position: unset;">파일선택</label>
										<div id="contents-list" class="contents-list">
											<ul id="fileList">
												<c:if test="${!empty whtprAtchFileList}">
													<c:forEach var="atchFileData" items="${whtprAtchFileList}" varStatus="status">
														<div id="oldFile_${atchFileData.atchFileSn}"  class="file-data">
															<p class="file-name">${atchFileData.orgnlAtchFileNm}</p>
															<button class="" type="button" id="btnDelOldFiles_${atchFileData.atchFileSn}"
																	name="btnDelOldFiles_${atchFileData.atchFileSn}"
																	onclick="javascript:deleteOldFileList('${atchFileData.atchFileSn}'); return false;">삭제</button>
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
				</tbody>
			</table>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnMovePrevPage" name="btnMovePrevPage" onclick="javascript:moveListPrevInfo(); return false;">이전</button>
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListWhtprInfo(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y' or UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
			<button type="button" class="btns" id="btnMoveSavePage" name="btnMoveSavePage" onclick="javascript:moveSaveWhtprInfo(); return false;">저장</button>
		</c:if>
	</div>
</div>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script>

	let fileList = [];
	let fileNo = 0;
	//const dataFtransfer = new DataTransfer();

	// DOM 생성 후 실행
	document.addEventListener('DOMContentLoaded', async function() {
		const errMsg = document.getElementById('errorMessage').value;
		if (errMsg) {
			alert(errMsg);
		}

		//init();
	});

	function moveListPrevInfo() {
		history.back();
	}
	
	function moveListWhtprInfo() {
		let frmD = document.frmRegSrch;
		frmD.action = contextPath +  "/cltInfoWhtprMgt/whtprList.do"
		frmD.submit();
	}
	
	function moveSaveWhtprInfo() {
		let frmD = document.frmRegSrch;
		
		if (cms_txt_is_empty(true, frmD.whtprNm)) { alert("백서명을 입력해 주십시오."); return false;}
		
		
		
		if (confirm("저장하시겠습니까?")) {
			frmD.action = contextPath + "/cltInfoWhtprMgt/whtprSave.do";
			frmD.submit();
		}
	}

 	function validFileList() {
		//첨부 가능 파일
		let addPsbleFileType = ['PDF', 'GIF', 'JPEG', 'JPG', 'PNG', 'BMP', 'TIF', 'HWP', 'XLS', 'XLSX', 'DOC','DOCX', 'PPT', 'PPTX'];
		//최대 첨구 가능 파일 수
		let maxFileCnt = 10;
		//최대 첨부 가능 파일 크기 (20MB)
		let maxFileSize = 20 * 1024 * 1024;
		
		const inputFiles = document.getElementById("atchFile").files;
		
		if (inputFiles.length >= maxFileCnt) {
			alert("첨부파일은 " + maxFileCnt + "까지만 첨부 가능합니다.")
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
		let frm = document.frmRegSrch;
		let deleteFileSn = frm.atchFileDeleteSn.value;
		if (deleteFileSn == "") {
			deleteFileSn = num;
		} else {
			deleteFileSn += "," + num;
		}
		frm.atchFileDeleteSn.value = deleteFileSn;
	}

</script>