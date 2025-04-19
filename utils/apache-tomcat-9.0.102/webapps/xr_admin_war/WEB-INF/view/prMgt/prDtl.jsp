<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
	<div class="contants">
		<form name="frmClcSrch" method="post" action="#">
			<input type="hidden" id="srchTypeCd" name="srchTypeCd" value="<c:out value="${prVO.srchTypeCd}"/>"> 
			<input type="hidden" id="srchExbiTypeCd" name="srchExbiTypeCd" value="<c:out value="${prVO.srchDataTypeCd}"/>"> 
			<input type="hidden" id="srchAprvYn" name="srchAprvYn" value="<c:out value="${prVO.srchAprvYn}"/>"> 
			<input type="hidden" id="srchText" name="srchText" value="<c:out value="${prVO.srchText}"/>"> 
			<input type="hidden" id="srchPrId" name="srchPrId"value="<c:out value="${prVO.srchPrId}"/>"> 
		<!-- 페이징 변수 -->
			<input type="hidden" id="pagePerBlock" name="pagePerBlock" value="<c:out value="${prVO.pagePerBlock}"/>">
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="<c:out value="${prVO.recordCountPerPage}"/>">
			<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${prVO.currentPage}"/>">
			<input type="hidden" id="calculPage" name="calculPage" value="<c:out value="${prVO.calculPage}"/>">
			<input type="hidden" id="totalRecord" name="totalRecord" value="<c:out value="${prVO.totalRecord}"/>">
			<input type="hidden" id="totalPage" name="totalPage" value="<c:out value="${prVO.totalPage}"/>">
		<div class="table-wrap write">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width: 10%"></col>
					<col style="width: 40%"></col>
					<col style="width: 10%"></col>
					<col style="width: 40%"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>명칭</th>
						<td><c:out value="${prInfo.prTtl}"/></td>
						<th>기업명</th>
						<td><c:out value="${prInfo.entNm}"/></td>
					</tr>
					<tr>
						<th>제공기관</th>
						<td><c:out value="${prInfo.pvsnInstNm}"/></td>
						<th>E-mail</th>
						<td><c:out value="${prInfo.rgtrEmlAddr}"/></td>
					</tr>
					<tr>
						<th>활용 데이터</th>
						<td><c:out value="${prInfo.utztnDataCn}"/></td>
						<th>홈페이지</th>
						<td><c:out value="${prInfo.entHmpgAddr}"/></td>
					</tr>
					<tr>
						<th>사업내용</th>
						<td colspan="3">
							<!-- 파일이름이 없다면 보여주지 않기 -->
							<c:if test="${prInfo.strgFileNm != null and prInfo.strgFileNm ne ''}">
								<div id="imageZone" style="width:30%; margin: 20px;">
									<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${prInfo.filePath}&fileNm=${prInfo.strgFileNm}&atchFileGroupId=${prInfo.rprsImgGroupId}' />"  alt="<c:out value="${prInfo.orgnlAtchFileNm}"/>" style="width: 100%; height: 100%">
								</div>
							</c:if>
							<div id="contentZone" style="margin: 20px; white-space: pre-line;"">
								<c:set var="bizCn" value="${prInfo.bizCn}"/>
								<c:set var="bizCn" value="${pf:nl2br(bizCn)}" />
								<c:out value="${bizCn}" escapeXml="false"/>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-wrap write">	
			<table>
				<caption></caption>
				<colgroup>
					<col style="width: 10%"></col>
					<col style="width: 90%"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>승인 상태 변경</th>
						<td>
							<div class="fm-radio">
				                <span class="fm-ele"><input type="radio" id="radio1" name="aprvYn" value="N" onclick="return false;" <c:if test="${prInfo.aprvYn == 'N'}">checked</c:if>><label for="radio1"> 대기</label></span>
				                <span class="fm-ele"><input type="radio" id="radio2" name="aprvYn" value="Y" <c:if test="${prInfo.aprvYn == 'Y'}">checked</c:if>><label for="radio2"> 승인</label></span>
				                <span class="fm-ele"><input type="radio" id="radio3" name="aprvYn" value="D" <c:if test="${prInfo.aprvYn == 'D'}">checked</c:if>><label for="radio3"> 미 승인</label></span>
				            </div>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td>
							<div class="fm-ele" data-size="w600">
								<input type="text" id="rjctCn" name="rjctCn" value="<c:out value="${prInfo.rjctCn}"/>" placeholder="비고사항을 입력하세요.">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="list-option right mt20">
			<button type="button" class="btns color-gray" onclick="javascript:goListInfo(); return false;">목록</button>
			<button type="button" class="btns " onclick="javascript:goUpdateInfo(); return false;">저장</button>
		</div>
		</form>
		<ul class="page-list">
			<li><a href="#" onclick="javascript:goViewInfo('${prInfo.prePrId}'); return false;">이전글 : <strong><c:out value="${prInfo.prePrTtl}"/></strong></a></li>
			<li><a href="#" onclick="javascript:goViewInfo('${prInfo.nextPrId}'); return false;">다음글 : <strong><c:out value="${prInfo.nextPrTtl}"/></strong></a></li>
		</ul>
	</div>
	</div>
	<!-- contants(e) -->
	</div>
	</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

/*1.페이지 렌더링전 작업이 있다면 여기에 기입*/

/*2.전역변수 정의 및 초기화는 여기에 기입*/
 
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/

//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
function goListInfo() {
    let frm = document.frmClcSrch;
    frm.action = contextPath + "/prMgt/prList.do";
    frm.submit();
}

//클릭시 해당 id에 맞는 게시물 상세정보 화면으로 이동
function goViewInfo(id){
	let frm = document.frmClcSrch;
		if(id.trim().length == 0){
			alert("이동할 게시물이 존재하지 않습니다!!");
			return;
		}
		frm.srchPrId.value = id;
		frm.action = contextPath + "/prMgt/prDtl.do";
		frm.submit();
}

//승인상태, 비고사항 수정
function goUpdateInfo() {
	let frm = document.frmClcSrch;
	var aprvYn = frm.aprvYn.value;
	var rjctCn = frm.rjctCn.value;
	var srchPrId = frm.srchPrId.value;
	
	var data =  {"aprvYn" : aprvYn, "rjctCn" : rjctCn, "srchPrId" : srchPrId}
	$.ajax({
		type : "GET",
		url : contextPath + "/prMgt/prUpdateInfo.do" ,
		async : true,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : data,
		dataType : "text",
		success : function(rtnData) {
			if (rtnData == "1") {
				alert("변경사항이 적용되었습니다!");
			} else {
				alert("변경 작업 오류. 서버 담당자에게 문의하세요.");
			}
		}, 
		error : function(request, status, error) {
		}
	});
}

/*4.동적메서드 선언부분*/
       
</script>