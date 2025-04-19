<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<c:set var="reqId" value="BBS0000002" />
<c:set var="qnaId" value="QNA" />

<form name="frmRegSrch" id="frmRegSrch" method="post" action="#" enctype="multipart/form-data">
    <input type="hidden" id="pstId" name="pstId" value="<c:out value="${srchBbsInfo.paramPstId}"/>">
    <input type="hidden" id="ansId" name="ansId" value="<c:out value="${bbsAnswerInfoVo.ansId}"/>">
    <input type="hidden" id="bbsId" name="bbsId" value="<c:out value="${srchBbsInfo.paramBbsId}"/>">

    <div class="contants">
        <div class="table-wrap write">
            <table>
                <colgroup>
                    <col width="10%" />
                    <col width="*" />
                </colgroup>
                <tr>
                    <%--<th colspan="2">[답변사항]${not empty bbsInfo.pstTtl ? bbsInfo.pstTtl : ''}</th>--%>
                    <th colspan="2">[답변사항]<c:out value="${bbsInfo.pstTtl}"/></th>
                </tr>
                <tr>
                    <c:if test="">
                        <td colspan="2" class="util">
                            <span>답변자 : <c:out value="${bbsAnswerInfoVo.answrId}"/></span>
                            <span>답변일 : <c:out value="${bbsAnswerInfoVo.lastMdfcnDt}"/></span>
                        </td>
                    </c:if>
                </tr>
                <tr>
                    <td colspan="2">
                        <%--<div class="editer">${not empty bbsAnswerInfoVo.ansCn ? bbsAnswerInfoVo.ansCn : ''}</div>--%>
                        <div class="editer fm-textarea">
                            <textarea id="ansCn" name="ansCn" cols="150" rows="15" placeholder="기타사항 입력" ><c:out value="${bbsAnswerInfoVo.ansCn}"/></textarea>
                            <script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
                            <script type="text/javascript">
                                var editor = CKEDITOR.replace('ansCn');
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
                <tr>
                    <td>첨부 파일</td>
                    <td class="filelist">
                        <div class="filebox-wrap">
                            <div class="fm-group fm-filebox">
                                <div class="fm-focus">
                                    <input type="file" name="atchFile" id="atchFile" class="upload-name" multiple onchange="addGetFileList()">
                                    <label for="atchFile" style="position: unset;">파일선택</label>
                                    <input type="hidden" id="atchFileGroupId" name="atchFileGroupId" value="${bbsAnswerInfoVo.ansAtchFileId}">
                                    <input type="hidden" id="atchFileDeleteSn" name="atchFileDeleteSn" value="">
                                    <div class="contents-list">
                                        <ul id="fileList">
                                            <c:if test="${!empty ansAtchFileInfoList}">
                                                <c:forEach var="atchFileData" items="${ansAtchFileInfoList}" varStatus="status">
                                                    <div id="oldFile_<c:out value="${atchFileData.atchFileSn}"/>"  class="file-data">
                                                        <p class="file-name"><c:out value="${atchFileData.orgnlAtchFileNm}"/></p>
                                                        <button type="button"  id="btnDelOldFiles_<c:out value="${atchFileData.atchFileSn}"/>"
                                                                class="btn-delete" name="btnDelOldFiles_<c:out value="${atchFileData.atchFileSn}"/>"
                                                                onclick="javascript:deleteOldFileList('<c:out value="${atchFileData.atchFileSn}"/>'); return false;"
                                                        >삭제</button>
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
            </table>
        </div>
        <div class="list-option right mt20">
            <button type="button" class="btns" id="btnSaveAnsInfo" name="btnSaveAnsInfo" onclick="javascript:setSaveBbsPstInfo(); return false;">저장</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    // 답변 저장
    function setSaveBbsPstInfo() {
        let frmR = document.frmRegSrch;
        // /if (cms_txt_is_empty(true, frmR.ansCn.value)) { alert("내용을 입력해 주십시오."); return false;}

        // let formData = new FormData();
        // for (let i = 0; i < fileList.length; i++) {
        // 	formData.append("atchFile", fileList[i]);
        // }

        if (confirm("저장하시겠습니까?")) {
            frmR.action = frmR.ansId.value ? contextPath + "/bbsMgt/bbsAnsUpdate.do" : contextPath + "/bbsMgt/bbsAnsSave.do";
            frmR.submit();
        }

    }
</script>