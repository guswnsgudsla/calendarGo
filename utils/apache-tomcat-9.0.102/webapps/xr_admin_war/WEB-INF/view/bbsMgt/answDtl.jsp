<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="table-wrap write">
    <table>
        <colgroup>
            <col width="10%" />
            <col width="*" />
        </colgroup>
        <tr>
            <th colspan="2">[답변사항]<c:out value="${bbsInfo.pstTtl}"/></th>
        </tr>
        <tr>
            <td colspan="2" class="util">
                <span>답변자 : <c:out value="${bbsAnswerInfoVo.answrId}"/></span>
                <span>답변일 : <c:out value="${bbsAnswerInfoVo.lastMdfcnDt}"/></span>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="cont">
                <c:set var="ansCn" value="${bbsAnswerInfoVo.ansCn}"/>
                <c:set var="ansCn" value="${pf:nl2br(ansCn)}" />
                <c:out value="${ansCn}" escapeXml="false"/>
            </td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <c:if test="${!empty atchFileInfoList}">
                    <c:forEach var="atchFileData" items="${ansAtchFileInfoList}" varStatus="status">
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
    </table>
</div>