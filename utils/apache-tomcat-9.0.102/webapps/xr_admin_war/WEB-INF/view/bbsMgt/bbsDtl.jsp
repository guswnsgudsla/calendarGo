<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- contants(s) -->
<div class="contants">
	<c:set var="reqId" value="BBS0000002" />
	<c:set var="qnaId" value="QNA" />
	<form name="frmDtlSrch" id="frmDtlSrch" action="#">
		<input type="hidden" id="hdnMenuParam" name="hdnMenuParam" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
		<input type="hidden" id="paramBbsId" name="paramBbsId" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">
		<input type="hidden" id="paramPstId" name="paramPstId" value="<c:out value="${srchBbsInfo.paramPstId}"/>">
		<input type="hidden" id="paramWrtMode" name="paramWrtMode" value="">
		<input type="hidden" id="userId" name="userId" value="${userId} ">
		<input type="hidden" id="authority" name="authority" value="${authority} ">
		<input type="hidden" id="menuInqAuthrtYn" name="menuInqAuthrtYn" value="${UserAuthrtInfo.menuInqAuthrtYn} ">
		<input type="hidden" id="prslAuthrtYn" name="prslAuthrtYn" value="${UserAuthrtInfo.prslAuthrtYn} ">
		<input type="hidden" id="wrtAuthrtYn" name="wrtAuthrtYn" value="${UserAuthrtInfo.wrtAuthrtYn} ">
		<input type="hidden" id="mdfcnAuthrtYn" name="mdfcnAuthrtYn" value="${UserAuthrtInfo.mdfcnAuthrtYn} ">
		<input type="hidden" id="delAuthrtYn" name="delAuthrtYn" value="${UserAuthrtInfo.delAuthrtYn} ">
		<input type="hidden" id="paramSrchClsfCd" name="paramSrchClsfCd" value="${srchBbsInfo.paramSrchClsfCd} ">

		<%--이전 다음글을 통해 이동한 경우를 분류하기 위한 설정--%>
		<input type="hidden" id="isNavigationRedirect" name="isNavigationRedirect" value="">
	</form>
	<div class="table-wrap write">
		<table>
			<colgroup>
				<col width="10%" />
				<col width="*" />
			</colgroup>
			<tr>
				<th colspan="2">
					<c:out value="${bbsInfo.pstTtl}"/>
					<c:if test="${srchBbsInfo.paramBbsId eq 'QNA'}">
						 [${bbsInfo.lnkgContsTtl}]
					</c:if>
				</th>
			</tr>
			<tr>
				<td colspan="2" class="util">
					<span>등록일 : <c:out value="${bbsInfo.frstRegDtV10}"/></span>
					<span>작성자 : <c:out value="${pf:getMaskingID(bbsInfo.frstRgtrId)}"/></span>
					<span>조회수 : <c:out value="${bbsInfo.inqCnt}"/></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="cont">
					<c:if test="${srchBbsInfo.paramBbsId  == 'JOIN'}">
                    	<c:set var="pstCn" value="등록요청 아이디 : ${bbsInfo.frstRgtrId }${bbsInfo.pstCn}"/>
                    </c:if>
                    <c:if test="${srchBbsInfo.paramBbsId  != 'JOIN'}">
                    	<c:set var="pstCn" value="${bbsInfo.pstCn}"/>
                    </c:if>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
				</td>
			</tr>
			<c:if test="${srchBbsInfo.paramBbsId  ne 'JOIN'}">
				<tr>
					<td>첨부파일</td>
					<td>
						<c:if test="${!empty atchFileInfoList}">
							<c:forEach var="atchFileData" items="${atchFileInfoList}" varStatus="status">
								<c:url var="url" value="/cmmn/downloadFile.do">
									<c:param name="filePath" value="${atchFileData.fileStrgPathNm}" />
									<c:param name="fileNm" value="${atchFileData.strgFileNm}" />
									<c:param name="orgnlFileNm" value="${atchFileData.orgnlAtchFileNm}" />
								</c:url>
								<a href="${url}">
									<c:out value="${atchFileData.orgnlAtchFileNm}" />  (<c:out value="${atchFileData.fileSz}"/>)
								</a>
							</c:forEach>
						</c:if>
					</td>
				</tr>
			</c:if>	
		</table>
	</div>
	<div class="list-option right mt20">
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:goBbsList(); return false;">목록</button>
	
			<c:if test="${srchBbsInfo.paramBbsId eq 'BBS0000002'}">
			
				<c:if test="${srchBbsInfo.paramBbsId eq 'BBS0000002' and empty UserAuthrtInfo.mdfcnAuthrtYn  and empty UserAuthrtInfo.delAuthrtYn and authority ne 'AUTH000001' }">
					<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveListPage" onclick="javascript:goBbsReg(); return false;">수정</button>
					<button type="button" class="btns color-red" id="btnDelete" name="btnMoveListPage" onclick="javascript:deleteBbsInfo(); return false;">삭제</button>
				</c:if>
				
				<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' and empty bbsAnswerInfoVo and bbsInfo.frstRgtrId eq userId and authority ne 'AUTH000001'}">
					<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveListPage" onclick="javascript:goBbsReg(); return false;">수정</button>
				</c:if>
				
				<c:if test="${UserAuthrtInfo.delAuthrtYn eq 'Y' and empty bbsAnswerInfoVo and bbsInfo.frstRgtrId eq userId and authority ne 'AUTH000001'}">
					<button type="button" class="btns color-red" id="btnDelete" name="btnMoveListPage" onclick="javascript:deleteBbsInfo(); return false;">삭제</button>
				</c:if>
				
				<c:if test="${authority eq 'AUTH000001' and bbsInfo.frstRgtrId ne userId}">
					<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveListPage" onclick="javascript:goBbsReg(); return false;">수정</button>
					<button type="button" class="btns color-red" id="btnDelete" name="btnMoveListPage" onclick="javascript:deleteBbsInfo(); return false;">삭제</button>
				</c:if>
			</c:if>

	        <c:if test="${srchBbsInfo.paramBbsId ne 'BBS0000002' and authority eq 'AUTH000001' or authority eq 'AUTH000003'}">
	        	<c:if test="${srchBbsInfo.paramBbsId  ne 'JOIN'}">
					<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveListPage" onclick="javascript:goBbsReg(); return false;">수정</button>
					<button type="button" class="btns color-red" id="btnDelete" name="btnMoveListPage" onclick="javascript:deleteBbsInfo(); return false;">삭제</button>
	        	</c:if>
			</c:if>
		
		<%--
			 <c:if test="${authority eq 'AUTH000001' or authority eq 'AUTH000003'}">
				<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveListPage" onclick="javascript:goBbsReg(); return false;">수정</button>
				<button type="button" class="btns color-red" id="btnDelete" name="btnMoveListPage" onclick="javascript:deleteBbsInfo(); return false;">삭제</button>
			</c:if>
		 --%>
	</div>
	<%--기관 요청사항, 슈퍼관리자일 경우 답글을 달 수 있다.--%>
	<c:if test="${srchBbsInfo.paramBbsId eq reqId and authority eq 'AUTH000001'}">
		<jsp:include page="answReg.jsp"/>
	</c:if>
	<%--문화자원QNA, 슈퍼관리자일 경우 답글을 달 수 있다.(에디터x)--%>
	<c:if test="${srchBbsInfo.paramBbsId eq qnaId and authority eq 'AUTH000001'}">
		<jsp:include page="plainTextReg.jsp"/>
	</c:if>
	<%--기관 요청사항, 기관관리자일 경우 경우 답변을 조회한다.--%>
	<c:if test="${srchBbsInfo.paramBbsId eq 'BBS0000002' and authority ne 'AUTH000001' and not empty bbsAnswerInfoVo}">
		<jsp:include page="answDtl.jsp"/>
	</c:if>
	<%--문화자원QNA, 슈퍼관리자일 경우 답글을 달 수 있다.(에디터x)--%>
	<c:if test="${srchBbsInfo.paramBbsId eq 'JOIN' and authority eq 'AUTH000001'}">
		<jsp:include page="plainTextReg.jsp"/>
	</c:if>
	
	<%-- <c:if test="${srchBbsInfo.paramBbsId eq reqId and authority eq 'AUTH000003' and not empty bbsAnswerInfoVo}">
		<jsp:include page="answDtl.jsp"/>
	</c:if> --%>

	<ul class="page-list">
		<c:if test="${!empty bbsInfo.prePstId}">
			<li>
				<a href="#" onclick="javascript:goBbsDtl('${bbsInfo.prePstId}'); return false;">이전글 : <strong><c:out value="${bbsInfo.prePstTtl}"/></strong></a>
			</li>
		</c:if>
		<c:if test="${!empty bbsInfo.nextPstId}">
			<li>
				<a href="#" onclick="javascript:goBbsDtl('${bbsInfo.nextPstId}'); return false;">다음글 : <strong><c:out value="${bbsInfo.nextPstTtl}"/></strong></a>
			</li>
		</c:if>
	</ul>
</div>
<!-- contants(e) -->
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">
	let fileList = [];
	let fileNo = 0;
	function goBbsList(){
		if (${not isRedirect}) {
			window.history.back();
		} else {
			let frm = document.frmDtlSrch;
			frm.action = contextPath + "/bbsMgt/bbsList.do";
			frm.submit();
		}
	}

	function goBbsReg(){
		let frm = document.frmDtlSrch;
		frm.paramWrtMode.value = "edit";
		frm.action = contextPath + "/bbsMgt/bbsReg.do";
		frm.submit();
	}

	function goBbsDtl(pstId){
		let frm = document.frmDtlSrch;
		frm.paramPstId.value = pstId;
		frm.isNavigationRedirect.value = true; // 이전 다음글을 통해 이동한 경우를 분류하기 위한 설정
		frm.action = contextPath + "/bbsMgt/bbsDtl.do";
		frm.submit();
	}

	function deleteBbsInfo(){
		if(confirm("삭제하시겠습니까?")){
			let frm = document.frmDtlSrch;
			frm.action = contextPath + "/bbsMgt/bbsDelete.do";
			frm.method = "POST";
			frm.submit();
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
	admin.nav.pageOpen(2, 0);
</script>