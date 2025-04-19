<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="contants">
	<div class="control-wrap">
		<form name="frmDtlSrch" id="frmDtlSrch" method="post" action="#">
			<!-- 검색값 유지용 변수 -->
			<input type="hidden" id="srchTypeCd" name="srchTypeCd" value="<c:out value="${evntVO.srchTypeCd}"/>"> 
			<input type="hidden" id="srchEvntSttsCd" name="srchEvntSttsCd" value="<c:out value="${evntVO.srchEvntSttsCd}"/>"> 
			<input type="hidden" id="srchText" name="srchText" value="<c:out value="${evntVO.srchText}"/>"> 
			<input type="hidden" id="srchEvntId" name="srchEvntId" value="<c:out value="${evntVO.srchEvntId}"/>"> 
			<input type="hidden" id="srchBgngYmd" name="srchBgngYmd" value="<c:out value="${evntVO.srchBgngYmd}"/>"> 
			<input type="hidden" id="srchEndYmd" name="srchEndYmd" value="<c:out value="${evntVO.srchEndYmd}"/>"> 
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value=""> 
			<!-- 페이징 변수 -->
			<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${evntVO.currentPage}"/>">
		</form>
	</div>
	<div class="control-wrap" style="margin-top: 0px; height:50px; padding-top: 8px;">	
		<div style="margin-left: 20px; text-align: left;"><c:out value="${evntWinnerInfo.pstTtl}"/></div>
	</div>
	<hr>
	<!-- 작성자 정보 채우기 -->
	<div class="table_wrap">
		<table>
			<colgroup>
				<col width="150px"></col>
				<col width="300px"></col>
				<col width="150px"></col>
				<col width="300px"></col>
				<col width="150px"></col>
				<col width="300px"></col>
			</colgroup>
			<tr>
				<th style="padding-left: 20px; text-align: left;">작성자명 :</th>
				<td style="padding-left: 20px; text-align: left;"><c:out value="${evntWinnerInfo.wrtrNm }"/></td>
				<th style="padding-left: 20px; text-align: left;">최종수정일 :</th>
				<td style="padding-left: 20px; text-align: left;"><c:out value="${evntWinnerInfo.lastMdfcnDtV10 }"/></td>
				<th style="padding-left: 20px; text-align: left;">조회수 :</th>
				<td style="padding-left: 20px; text-align: left;"><c:out value="${evntWinnerInfo.inqCnt }"/></td>
			</tr>
		</table>
	</div>
	<hr>
	<div id="contentZone" style="margin-left: 20px; margin-top:30px; margin-bottom:30px;">
		<%-- ckeditor 로 작성한 내용 처리하는 변환과정 --%>
		<c:set var="pstCn" value="${evntWinnerInfo.pstCn}"/>
        <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
        <c:out value="${pstCn}" escapeXml="false"/>
	</div>
	<div class="control-wrap" style="margin-top: 0px; height:0px;"></div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns" id="btnMoveListPage" name="btnMoveBackPage" onclick="javascript:goBack(); return false;">뒤로가기</button>
		<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveRegPage" onclick="javascript:goEvntReg(); return false;">수정</button>
		<button type="button" class="btns color-red" id="btnMoveRegPage" name="btnMoveRegPage" onclick="javascript:goWinnerDel(); return false;">삭제</button>
	</div>
</div>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script type="text/javascript">

	//이벤트 상세화면으로 되돌아가는 함수
	function goBack(){
		//history.back();
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/evntMgt/evntDtl.do";
		frm.submit();
	}
	//당첨글 수정화면으로 되돌아가는 함수
	function goEvntReg(){
		let frm = document.frmDtlSrch;
		frm.srchWrtMode.value = "winnerEdit";
		frm.action = contextPath + "/evntMgt/evntSave.do";
		frm.submit();
	}
	//당첨글 삭제 여부 확인 후 삭제 시키는 함수
	function goWinnerDel(){
		if (confirm("당첨글을 삭제하시겠습니까?")) {
			let frm = document.frmDtlSrch;
			frm.action = contextPath + "/evntMgt/deleteWinner.do";
			frm.submit();
		}
	}

</script>