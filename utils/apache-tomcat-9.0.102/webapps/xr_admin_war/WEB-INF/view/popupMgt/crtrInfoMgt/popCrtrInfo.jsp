<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>기준 정보 변경 이력</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<div class="table-wrap">
		<div class="div-scroll mb20">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="200px"></col>
				<col width="200px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="120px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>코드</th>
					<th>코드명</th>
					<th>이력번호</th>
					<th>이력유형</th>
					<th>코드상세</th>
					<th>사용여부</th>
					<th>승인여부</th>
					<th>승인자</th>
					<th>승인일</th>
					<th>등록자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty crtrInfoList}">
				<c:forEach var="crtrInfoData" items="${crtrInfoList}" varStatus="status">
					<tr>
						<td>${crtrInfoData.clsfListNo}</td>
						<td>${crtrInfoData.clsfCd}</a></td>
						<td>${crtrInfoData.clsfNm}</a></td>
						<td>${crtrInfoData.chgHstrySn}</td>
						<td>${crtrInfoData.chgHstryTypeCd}</td>
						<td>${crtrInfoData.clsfCdExpln}</td>
						<td>${crtrInfoData.useYn}</td>
						<td>${crtrInfoData.aprvYn}</td>
						<td>${crtrInfoData.autzrId}</td>
						<td>${crtrInfoData.aprvDt}</td>
						<td>${crtrInfoData.rgtrId}</td>
						<td>${crtrInfoData.regDt}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty crtrInfoList}">
				<tr>
					<td colspan="12">No Data</td>
				</tr>
			</c:if>	
			</tbody>
		</table>
		</div>
	</div>
	<!-- 소분류 코드 이력 List -->
	<div class="table-wrap">
	<div class="div-scroll mb20">	
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="200px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="120px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
				<col width="80px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>대분류코드</th>
					<th>코드</th>
					<th>코드명</th>
					<th>이력유형</th>
					<th>코드상세</th>
					<th>사용여부</th>
					<th>정렬순서</th>
					<th>부가정보1</th>
					<th>부가정보2</th>
					<th>부가정보3</th>
					<th>부가정보4</th>
					<th>부가정보5</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty crtrSubInfoList}">
				<c:forEach var="crtrSubInfoData" items="${crtrSubInfoList}" varStatus="status">
					<tr>
						<td>${crtrSubInfoData.cdIdNo}</td>
						<td>${crtrSubInfoData.clsfCd}</a></td>
						<td>${crtrSubInfoData.cdId}</a></td>
						<td>${crtrSubInfoData.cdNm}</td>
						<td>${crtrSubInfoData.chgHstryTypeCd}</td>
						<td>${crtrSubInfoData.cdExpln}</td>
						<td>${crtrSubInfoData.useYn}</td>
						<td>${crtrSubInfoData.sortSn}</td>
						<td>${crtrSubInfoData.anxtCn1}</td>
						<td>${crtrSubInfoData.anxtCn2}</td>
						<td>${crtrSubInfoData.anxtCn3}</td>
						<td>${crtrSubInfoData.anxtCn4}</td>
						<td>${crtrSubInfoData.anxtCn5}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty crtrSubInfoList}">
				<tr>
					<td colspan="12">No Data</td>
				</tr>
			</c:if>	
			</tbody>
		</table>
	</div>
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
</script>