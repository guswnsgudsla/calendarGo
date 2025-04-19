<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="contants">
    <form name="frmScheduleSrch" id="frmScheduleSrch" method="post" action="#">
        <input type="hidden" class="serverValue" id="srchInstTypeCdVal" name="srchInstTypeCdVal" value="${srchScheduleInfo.srchInstTypeCdVal}">
        <input type="hidden" class="serverValue" id="srchUseYnVal" name="srchUseYnVal" value="${srchScheduleInfo.srchUseYnVal}">
        <input type="hidden" class="serverValue" id="srchScheduleNmVal" name="srchScheduleNmVal" value="${srchScheduleInfo.srchScheduleNmVal}">
        <input type="hidden" class="serverValue" id="srchExcnYnVal" name="srchExcnYnVal" value="${srchScheduleInfo.srchExcnYnVal}">
        <input type="hidden" class="serverValue" id="btjId" name="btjId" value="${srchScheduleInfo.btjId}">
        <input type="hidden"  id="srchPageModeVal" name="srchPageModeVal" value="${srchScheduleInfo.srchPageModeVal}">
        <input type="hidden"  id="srchSaveModeVal" name="srchSaveModeVal" value="${srchScheduleInfo.srchSaveModeVal}">
    </form>
    <div class="table-wrap write">
        <table>
            <caption>DAG 상세정보</caption>
            <colgroup>
                <col style="width: 10%" />
                <col style="width: 40%" />
                <col style="width: 10%" />
                <col style="width: 40%" />
            </colgroup>
            <tbody>
            <tr>
                <th>스케줄 ID</th>
                <td><c:out value="${scheduleJobInfo.btjId}"/></td>
                <th>스케줄 명</th>
                <td><c:out value="${scheduleJobInfo.btjNm}"/></td>
            </tr>
            <tr>
                <th>스케줄 설명</th>
                <td colspan="3"><c:out value="${scheduleJobInfo.btjExpln}"/></td>
            </tr>
            <tr>
                <th>스케줄 대상기관</th>
                <td><c:out value="${scheduleJobInfo.instNm}"/></td>
                <th>실행 DAG ID</th>
                <td><c:out value="${scheduleJobInfo.excnAplId}"/></td>
            </tr>
            <tr>
                <th>스케줄 실행 정보</th>
                <td colspan="3"><c:out value="${scheduleJobInfo.btjSchdlCn}"/></td>
            </tr>

            </tbody>
        </table>
    </div>
    <div class="btn-wrap align-right">
        <button type="button" class="btns color-gray" onclick="goBack()">목록</button>
        <button type="button" class="btns" onclick="goModify('${scheduleJobInfo.btjId}')">수정</button>

    </div>
</div>

<script>
    const goBack = function (){
        window.history.back();
    }

    const goModify = function(btjId) {
        document.getElementById('srchPageModeVal').value = 'modify';
        document.getElementById('srchSaveModeVal').value = '';

        document.getElementById('btjId').value = btjId;
        document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtReg.do';
        document.getElementById('frmDgtlClrcsSrch').submit();
    }
</script>