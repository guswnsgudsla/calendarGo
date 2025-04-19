<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<div class="contants">
	<!-- 작성자 정보 채우기 -->
	<div class="table-wrap write">
		<table>
			<colgroup>
				<col width="150px"></col>
				<col width=""></col>
			</colgroup>
			<tr>
				<th colspan="2"><c:out value="${portalQnaView.pstTtlNm}"/></th>
			</tr>
			<tr>
				<td colspan="2" class="util">
					<span>작성자 : <c:out value="${portalQnaView.frstRgtrId }"/></span>
					<span> 문의 시간 : <c:out value="${portalQnaView.frstRegDt }"/> </span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="cont">
					<div id="contentZone" >
					<%-- ckeditor 로 작성한 내용 처리하는 변환과정 --%>
						<c:set var="pstCn" value="${portalQnaView.pstCn}"/>
						<c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
						<c:out value="${pstCn}" escapeXml="false"/>
					</div>
				</td>
			</tr> 
		</table>
	</div>
	<br>
	<form id = "qnaSubmit"  method="post">
	<input type="hidden" id="getUserId" name="getUserId" value="${getUserId.userNm}">
    <input type="hidden" id="viewStatus" name="viewStatus" value="${empty portalQnaView.ansCn || portalQnaView.ansCn == '' ? 'reg' : 'modify'}">
    <input type="hidden" id="pstId" name="pstId" value="${portalQnaView.pstId}">
    <div class="editer fm-textarea">
    <textarea id="ansCn" name="ansCn" cols="150" rows="15" placeholder="기타사항 입력" ><c:out value="${portalQnaView.ansCn}"/></textarea>
	</div>    
	    <div class="list-option right mt20">
	        <button type="button" class="btns color-gray" id="listgo" name="listgo" onclick="historyBack()">목록</button>
	        <button type="button" id ='portalSubmit' name='portalSubmit' class="btns" >등록</button>
	    </div>
	</form>
</div>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script type="text/javascript">
function historyBack(){
window.location.href = "javascript:history.back()";
}


document.getElementById('portalSubmit').addEventListener('click', function() {
	portalSubmit();
});

function portalSubmit() {
    if (confirm("등록하시겠습니까?")) {
        var ansCn = $('textarea[name="ansCn"]').val();
        var viewStatus = $('input[name="viewStatus"]').val();
        var pstId = $('input[name="pstId"]').val();
        var getUserId = $('input[name="getUserId"]').val();
        
        $("#qnaSubmit").attr("action", contextPath + "/portalQna/portalQnaReg.do");
        
        $("#qnaSubmit").submit();
    } 
}





</script>