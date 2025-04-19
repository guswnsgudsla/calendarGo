<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="contants">
	<form id="frmCollectSrch" method="post">
		<input type="hidden" id="dagId" name="dagId" value="${srchDgtlClrcsInfo.dagId}">
		<!-- 페이징 변수 -->
		<input type="hidden" id="pagePerBlock" name="pagePerBlock" value="${srchDgtlClrcsInfo.pagePerBlock}">
		<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${srchDgtlClrcsInfo.recordCountPerPage}">
		<input type="hidden" id="currentPage" name="currentPage" value="${srchDgtlClrcsInfo.currentPage}">
		<input type="hidden" id="calculPage" name="calculPage" value="${srchDgtlClrcsInfo.calculPage}">
		<input type="hidden" id="totalRecord" name="totalRecord" value="${srchDgtlClrcsInfo.totalRecord}">
		<input type="hidden" id="totalPage" name="totalPage" value="${srchDgtlClrcsInfo.totalPage}">
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
					<th>DAG ID</th>
					<td><c:out value="${srchDgtlClrcsInfo.dagId}"/></td>
					<th>DAG 명</th>
					<td><c:out value="${srchDgtlClrcsInfo.dagTitle}"/></td>
				</tr>
				<tr>
					<th>DAG 설명</th>
					<td colspan="3"><c:out value="${srchDgtlClrcsInfo.dagDesc}"/></td>
				</tr>
				<tr>
					<th>Task 설명</th>
					<td colspan="3">
						<div class="tag-wrap">
							<c:forEach var="taskData" items="${taskList.tasks}" varStatus="status">
								<span class="tag">"${taskData.taskId}"</span>
							</c:forEach>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" onclick="goBack()">목록</button>
	</div>

	<div class="mid-title-wrap">
		<h2>실행이력정보</h2>
	</div>
	<div class="table-wrap">
		<table>
			<caption></caption>
			<colgroup>
				<col width="5%"></col>
				<col width="*"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="15%"></col>
				<col width="15%"></col>

			</colgroup>
			<thead>
			<tr>
				<th>순번</th>
				<th>job ID</th>
				<th>기관명</th>
				<th>실행결과</th>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty dagExecHistoryList}">
				<c:forEach var="dagListItem" items="${dagExecHistoryList}" varStatus="status">
					<tr>
						<td><c:out value="${dagListItem.rowNumber}"/></td>
						<td><c:out value="${dagListItem.jobId}"/></td>
						<td><c:out value="${dagListItem.instNm}"/></td>
						<td><c:out value="${dagListItem.clctSttsNm}"/></td>
						<td><c:out value="${dagListItem.jobBgngDt}"/></td>
						<td><c:out value="${dagListItem.jobEndDt}"/></td>

					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty dagExecHistoryList}">
				<tr>
					<td colspan="6">실행내역이 없습니다.</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<c:import url="/WEB-INF/view/include/custom_paging.jsp">
		<c:param name="currentPage" value="${srchDgtlClrcsInfo.currentPage}"/>
		<c:param name="totalPage" value="${srchDgtlClrcsInfo.totalPage}"/>
		<c:param name="totalRecord" value="${srchDgtlClrcsInfo.totalRecord}"/>
		<c:param name="recordCountPerPage" value="${srchDgtlClrcsInfo.recordCountPerPage}"/>
		<c:param name="pagePerBlock" value="${srchDgtlClrcsInfo.pagePerBlock}"/>
		<c:param name="calculPage" value="${srchDgtlClrcsInfo.calculPage}"/>
		<c:param name="funNm" value="fnList" />
		<c:param name="url" value="dgtlMgtList.do" />
	</c:import>
</div>
<script>

    window.fnList = function(action, mapKVs) {
        // currentPage 파라미터 추가
        document.getElementById('currentPage').value = mapKVs.currentPage;

        goInstSrchParam();
    }

    const goInstSrchParam  = function (){
        document.getElementById('frmCollectSrch').action = contextPath +'/collectMgt/dagDtl.do';
        document.getElementById('frmCollectSrch').submit();
    }
    const goBack = function (){
        window.history.back();
    }
</script>