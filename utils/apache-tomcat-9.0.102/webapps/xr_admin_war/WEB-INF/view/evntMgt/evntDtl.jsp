<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<div class="contants">
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
	<!-- 작성자 정보 채우기 -->
	<div class="table-wrap write">
		<table>
			<colgroup>
				<col width="150px"></col>
				<col width=""></col>
			</colgroup>
			<tr>
				<th colspan="2"><c:out value="${evntInfo.evntTtl}"/></th>
			</tr>
			<tr>
				<td colspan="2" class="util">
					<span>주관기관 : <c:out value="${evntInfo.regInstNm }"/></span>
					<span>진행상태 : <c:out value="${evntInfo.evntSttsCd }"/></span>
					<span>이벤트 기간 : <c:out value="${evntInfo.bgngYmd }"/> ~ <c:out value="${evntInfo.endYmd }"/></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="cont">
					<%-- ckeditor 본문 이미지 삽입 기능으로 썸네일 본문에 넣지 않기로 함. 썸네일 테스트 용으로 확인할 때 사용
					<c:if test="${evntInfo.strgFileNm != null and evntInfo.strgFileNm ne ''}">
						<div id="imageZone" style="width:30%;">
							<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${evntInfo.filePath}&fileNm=${evntInfo.strgFileNm}&atchFileGroupId=${evntInfo.rprsImgGroupId}' />"  alt="${evntInfo.orgnlAtchFileNm}" style="width: 100%; height: 100%">
						</div>
					</c:if>
					--%>
					<div id="contentZone" >
					<%-- ckeditor 로 작성한 내용 처리하는 변환과정 --%>
						<c:set var="pstCn" value="${evntInfo.evntCn}"/>
						<c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
						<c:out value="${pstCn}" escapeXml="false"/>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="list-option right mt20">
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:goEvntList(); return false;">목록</button>
		<button type="button" class="btns" id="btnMoveRegPage" name="btnMoveRegPage" onclick="javascript:goEvntReg(); return false;">수정</button>
		<button type="button" class="btns color-red" id="btnMoveDelPage" name="btnMoveDelPage" onclick="javascript:goEvntDel(); return false;">삭제</button>
	</div>
	<!-- 이벤트 상태가 종료가 아니라면 보여주지 않기 -->
	<c:if test="${evntInfo.evntSttsCd == '종료' }">
		<div class="tab-wrap as-tab-wrap">
			<ul class="tab-menu" style="width: 30%;">
				<li class="on"><a href="#">당첨글 관리</a></li>
			</ul>
			<div class="inner-depth">
					<div class="tab-inner">
					<c:if test="${empty evntWinnerInfo}">
					<div class="btn-wrap align-right" style="margin-top: 0px;">
						<button type="button" class="btns" id="btnMoveWinnerPage" name="btnMoveWinnerPage" onclick="javascript:saveWinnerInfo(); return false;">당첨글 등록</button>
					</div>	
					</c:if>
						<div class="information">
						<div class="table-wrap" style="margin-top: 20px;">
							<table>
								<caption></caption>
								<colgroup>
									<col width="50px"></col>
									<col width="450px"></col>
									<col width="150px"></col>
									<col width="150px"></col>
									<col width="80px"></col>
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>당첨글 제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${!empty evntWinnerInfo}">
									<tr>
										<td>1</td>
										<td style="text-align: left;"><a onclick="javascript:goWinnerViewInfo(); return false;"><c:out value="${evntWinnerInfo.pstTtl}"/></a></td>
										<td><c:out value="${evntWinnerInfo.wrtrNm}"/></td>
										<td><c:out value="${evntWinnerInfo.frstRegDtV10}"/></td>
										<td><c:out value="${evntWinnerInfo.inqCnt}"/></td>
									</tr>
								</c:if>
								<c:if test="${empty evntWinnerInfo}">
									<tr>
										<td colspan="5">아직 당첨글이 등록되지 않았습니다.</td>
									</tr>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 이벤트 상태가 종료가 아니라면 종료 후 작성하도록 안내하기 -->
	<c:if test="${evntInfo.evntSttsCd != '종료' }">
		<div class="tab-wrap as-tab-wrap">
			<ul class="tab-menu" style="width: 30%;">
				<li><a href="#">당첨글 관리</a></li>
			</ul>
			<div class="inner-depth">
					<div class="tab-inner">
						<div class="information">
						<div class="table-wrap" style="margin-top: 20px;">
							<table>
								<caption></caption>
								<colgroup>
									<col width="50px"></col>
									<col width="450px"></col>
									<col width="150px"></col>
									<col width="150px"></col>
									<col width="80px"></col>
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>당첨글 제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5">당첨글은 이벤트 종료 후 작성이 가능합니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script type="text/javascript">
	//당첨글 상세보기로 이동하는 함수
	function goWinnerViewInfo() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/evntMgt/evntWinnerDtl.do";
		frm.submit();
	}
	//이벤트 목록으로 되돌아가는 함수
	function goEvntList(){
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/evntMgt/evntList.do";
		frm.submit();
	}
	//이벤트 수정화면으로 넘어가는 함수
	function goEvntReg(){
		let frm = document.frmDtlSrch;
		frm.srchWrtMode.value = "edit";
		frm.action = contextPath + "/evntMgt/evntSave.do";
		frm.submit();
	}
	//이벤트 삭제하는 함수
	function goEvntDel(){
		if (confirm("이벤트를 삭제하시겠습니까?")) {
			let frm = document.frmDtlSrch;
			frm.action = contextPath + "/evntMgt/deleteEvnt.do";
			frm.submit();
		}
	}
	//당첨글 등록화면으로 이동하는 함수
	function saveWinnerInfo(){
		let frm = document.frmDtlSrch;
		frm.srchWrtMode.value = "winner";
		frm.action = contextPath + "/evntMgt/evntSave.do";
		frm.submit();
	}

</script>