<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>

<div class="contants">
    <form name="frmQcClrcsSrch" id="frmDgtlClrcsSrch">
        <input type="hidden" class="serverValue" id="crtrClsfCdVal" name="crtrClsfCdVal" value="<c:out value="${searchInfo.crtrClsfCdVal}"/>">
        <input type="hidden" class="serverValue" id="prdctUsgCdVal" name="prdctUsgCdVal" value="<c:out value="${searchInfo.prdctUsgCdVal}"/>">
        <input type="hidden" class="serverValue" id="srchKeywordVal" name="srchKeywordVal" value="<c:out value="${searchInfo.srchKeywordVal}"/>">
        <input type="hidden" class="serverValue" id="paramCrtrId" name="paramCrtrId" value="<c:out value="${qcInfo.crtrId}"/>">
        <input type="hidden" class="serverValue" id="crtrClsfCd" name="crtrClsfCd" value="<c:out value="${qcInfo.crtrClsfCd}"/>">
        <input type="hidden" class="serverValue" id="paramWrtMode" name="paramWrtMode" value="">
        <input type="hidden" class="serverValue" id="crtrCycl" name="crtrCycl" value="<c:out value="${qcInfo.crtrCycl}"/>">

        <!-- 페이징 변수 -->
        <input type="hidden" id="pagePerBlock" name="pagePerBlock" value="<c:out value="${searchInfo.pagePerBlock}"/>">
        <input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="<c:out value="${searchInfo.recordCountPerPage}"/>">
        <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${searchInfo.currentPage}"/>">
        <input type="hidden" id="calculPage" name="calculPage" value="<c:out value="${searchInfo.calculPage}"/>">
        <input type="hidden" id="totalRecord" name="totalRecord" value="<c:out value="${searchInfo.totalRecord}"/>">
        <input type="hidden" id="totalPage" name="totalPage" value="<c:out value="${searchInfo.totalPage}"/>">
    </form>
    <div class="table-wrap write">
        <table>
            <colgroup>
                <col width="200px"></col>
                <col width="*"></col>
                <col width="200px"></col>
                <col width="*"></col>
            </colgroup>
            <tbody>
                <tr>
                    <th>지표명</th>
                    <td colspan="3"><c:out value="${qcInfo.crtrNm}"/></td>
                </tr>
                <tr>
                    <th>데이터유형</th>
                    <td><c:out value="${qcInfo.crtrClsfNm}"/></td>
                    <th>세부유형</th>
                    <td><c:out value="${qcInfo.prdctUsgNm}"/></td>
                </tr>
                <tr>
                    <th>지표단위</th>
                    <td><c:out value="${qcInfo.crtrUnitNm}"/></td>
                    <th>지표연산</th>
                    <td><c:out value="${qcInfo.scrClsfNm}"/></td>
                </tr>
                <tr>
                    <th>지표 수치</th>
                    <td>
                        <c:out value="${qcInfo.stbltCrtrScr}"/>
                        <c:if test="${qcInfo.stbltMaxCrtrScr ne null and qcInfo.stbltMaxCrtrScr ne 0}">
                            <c:out value="~ ${qcInfo.stbltMaxCrtrScr}"/>
                        </c:if>
                    </td>
                    <th>PBR 적용 여부</th>
                    <td><c:out value="${qcInfo.pbrAplcnYn}"/></td>
                </tr>
                <tr>
                    <th>등록자</th>
                    <td><c:out value="${pf:getMaskingID(qcInfo.frstRgtrId)}"/></td>
                    <th>등록일</th>
                    <td><c:out value="${qcInfo.frstRegDtV10}"/></td>
                </tr>
                <tr>
                    <th>사용여부</th>
                    <td><c:out value="${qcInfo.useYn}"/></td>
                    <th>필수여부</th>
                    <td><c:out value="${qcInfo.esntlInspYn}"/></td>
                </tr>
            </tbody>
        </table>
        <div class="btn-wrap align-right">
            <button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:goList(); return false;">목록</button>
            <c:if test="${authority eq 'AUTH000001'}">
                <button type="button" class="btns" id="btnMoveRegPage" name="btnMoveRegPage" onclick="javascript:goReg(); return false;">수정</button>
                <button type="button" class="btns color-red" id="btnDeleteInfo" name="btnDeleteInfo" onclick="javascript:deleteInfo(); return false;">삭제</button>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript">
function goList(){
    if (${not isRedirect}) {
        window.history.back();
    } else {
        const frm = document.frmQcClrcsSrch;
        frm.crtrClsfCd.value = "";
        frm.paramCrtrId.value = "";
        frm.action = contextPath + "/qcMgt/qcList.do";
        frm.submit();
    }
}
function goReg(){
    const frm = document.frmQcClrcsSrch;
    frm.paramWrtMode.value = "edit";
    frm.action = contextPath + "/qcMgt/qcReg.do";
    frm.submit();
}
function deleteInfo(){
    if(confirm("삭제하시겠습니까?")){
        const frm = document.frmQcClrcsSrch;
        frm.action = contextPath + "/qcMgt/qcDelete.do";
        frm.method = "POST";
        frm.submit();
    }
}

</script>