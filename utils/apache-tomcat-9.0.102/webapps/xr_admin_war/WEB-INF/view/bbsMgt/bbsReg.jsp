<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- contants(s) -->
<div class="contants">
	<c:set var="targetBbsId" value="BBS0000002" />
	<div class="table-wrap write">
		<form name="frmRegSrch" id="frmRegSrch" method="post" action="#" enctype="multipart/form-data">
			<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
			<input type="hidden" id="paramBbsId" name="paramBbsId" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
			<input type="hidden" id="paramPstId" name="paramPstId" value="<c:out value="${srchBbsInfo.paramPstId}"/>">
			<input type="hidden" id="paramWrtMode" name="paramWrtMode" value="<c:out value="${srchBbsInfo.paramWrtMode}"/>">

			<c:if test="${srchBbsInfo.paramBbsId eq targetBbsId}">
				<input type="hidden" id="wrtInstId" name="wrtInstId" value="${instId}">
			</c:if>
			<table>
				<colgroup>
					<col width="10%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>제목</th>
					<td>
						<div class="fm-ele" data-size="100p">
							<%--<input type="text" id="pstTtl" name="pstTtl" value="${not empty bbsInfo.pstTtl ? bbsInfo.pstTtl : ''}">--%>
							<input type="text" id="pstTtl" name="pstTtl" value="<c:out value="${bbsInfo.pstTtl}"/>">
						</div>
					</td>
				</tr>
				<c:if test="${srchBbsInfo.paramBbsId eq targetBbsId or srchBbsInfo.paramBbsId eq 'FAQ'}">
					<tr>
						<th>분류</th>
						<td>
							<div class="fm-focus fm-select">
								<select id="clsfCd" name="clsfCd" class="" title="분류">
									<option value="" <c:if test="${bbsInfo.clsfCd == ''}">selected</c:if>>선택</option>
									<c:forEach var="bbsClsfCdInfo" items="${bbsClsfCdInfoList}">
										<option value="<c:out value="${bbsClsfCdInfo.clsfCd}"/>" <c:if test="${bbsInfo.clsfCd == bbsClsfCdInfo.clsfCd}">selected</c:if>><c:out value="${bbsClsfCdInfo.clsfNm}"/></option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>내용</th>
					<td>
						<div class="editer">
							<%--<textarea id="pstCn" name="pstCn" cols="50" rows="5" placeholder="기타사항 입력" >${not empty bbsInfo.pstCn ? bbsInfo.pstCn : ''}</textarea>--%>
							<textarea id="pstCn" name="pstCn" cols="150" rows="20" placeholder="내용을 입력해 주세요." ><c:out value="${bbsInfo.pstCn}"/></textarea>
							<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
							<script type="text/javascript">
								var editor = CKEDITOR.replace('pstCn');
								CKEDITOR.instances.pstCn.on('key', function(e) {
									var board_text = this.getData();
								    text = board_text.replace(/(<([^>]+)>)/gi, "");
								    
							    	var svtext = CKEDITOR.instances.pstCn.getData();
							    	datatext = svtext.replace(/(<([^>]+)>)/gi, "");
								});
							</script>
						</div>
					</td>
				</tr>
				<c:if test="${srchBbsInfo.paramBbsId ne 'FAQ'}">
					<tr>
						<th>첨부 파일</th>
						<td>
							<div class="filebox-wrap">
								<div class="fm-group fm-filebox">
									<div class="fm-focus">
										<input type="file" name="atchFile" id="atchFile" class="file-data" multiple onchange="addGetFileList()">
										<label for="atchFile" style="position: unset;">파일선택</label>
										<input type="hidden" id="atchFileGroupId" name="atchFileGroupId" value="<c:out value="${bbsInfo.atchFileGroupId}"/>">
										<input type="hidden" id="atchFileDeleteSn" name="atchFileDeleteSn" value="">
										<div class="contents-list">
											<ul id="fileList">
												<c:if test="${!empty atchFileInfoList}">
													<c:forEach var="atchFileData" items="${atchFileInfoList}" varStatus="status">
														<li id="oldFile_<c:out value="${atchFileData.atchFileSn}"/>"  class="file-data">
															<p class="file-name"><c:out value="${atchFileData.orgnlAtchFileNm}"/></p>
															<button class="" type="button" id="btnDelOldFiles_<c:out value="${atchFileData.atchFileSn}"/>"
																	name="btnDelOldFiles_<c:out value="${atchFileData.atchFileSn}"/>"
																	onclick="javascript:deleteOldFileList('<c:out value="${atchFileData.atchFileSn}"/>'); return false;"
																	style="display: unset; position: unset;">삭제</button>
														</li>
													</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	<div class="list-option right mt20">
		<button type="button" class="btns color-gray" name="btnMoveListPage" onclick="javascript:moveListPstInfo(); return false;">목록</button>
		<button type="button" class="btns" onclick="javascript:setSaveBbsPstInfo(); return false;">저장</button>
	</div>
</div>
<!-- contants(e) -->

<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">
	<%--var receivedFiles = ${not empty atchFileInfoList ? atchFileInfoList : '[]'};--%>
	let fileList = [];
	let fileNo = 0;

	function moveListPrevInfo() {
		history.back();
	}

	function moveListPstInfo() {
		if (document.getElementById("paramWrtMode").value !== "edit") {
			window.history.back();
		} else {
			let frmR = document.frmRegSrch;
			frmR.action = contextPath + "/bbsMgt/bbsList.do";
			frmR.method = "GET";
			frmR.submit();
		}
	}

	function setSaveBbsPstInfo() {
		let frmR = document.frmRegSrch;
		formStrip(frmR[0]);
		if (cms_txt_is_empty(true, frmR.pstTtl)) { alert("제목을 입력해 주십시오."); return false;}
		<c:if test="${srchBbsInfo.paramBbsId eq targetBbsId}">
			if (cms_select_is_empty(true, frmR.clsfCd)) { alert("분류를 선택해 주십시오."); return false;}
		</c:if>
//		if (cms_txt_is_empty(true, frmR.pstCn)) { alert("내용을 입력해 주십시오."); return false;}
		if (ckeditorChk("pstCn", "내용")) { return false;}

		// let formData = new FormData();
		// for (let i = 0; i < fileList.length; i++) {
		// 	formData.append("atchFile", fileList[i]);
		// }

		if (confirm("저장하시겠습니까?")) {
			frmR.action = contextPath + "/bbsMgt/bbsSave.do";
			frmR.submit();
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
				fileDataTxt += "<button class=\"\" type=\"\" id=\"btnDelFiles"
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

	function openSrchPop() {
		popUpUrl = "";
		popUpOption = "resizable=yes, top=100, left=100, width=500, height=500";
		window.open(popUpUrl, "_srchEventList", popUpOption, false);
	}



</script>