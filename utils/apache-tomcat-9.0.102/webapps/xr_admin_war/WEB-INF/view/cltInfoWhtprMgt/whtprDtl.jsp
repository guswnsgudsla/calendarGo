<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">

	<form name="frmDtlSrch" id="frmDtlSrch" method="post" action="#">
		<input type="hidden" id="srchPageNo" name="srchPageNo" value="<c:out value='${srchWhtprInfo.paramPageNo}'/>">
		<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="<c:out value='${srchWhtprInfo.paramRecordCnt}'/>">
		<input type="hidden" id="srchWhtprId" name="srchWhtprId" value="<c:out value='${srchWhtprInfo.paramWhtprId}'/>">
		<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="<c:out value='${srchWhtprInfo.paramWrtMode}'/>">
		<input type="hidden" id="srchString" name="srchString" value="<c:out value='${srchWhtprInfo.paramSrchString}'/>">
	</form>
	<div class="table-wrap write">
		<table>
			<caption></caption>
			<colgroup>
				<col width="200px"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>백서아이디</th>
					<td><c:out value="${whtprInfo.whtprId}"/></td>
				</tr>
				<tr>
					<th>발행연도</th>
					<td><c:out value="${whtprInfo.pblcnYr}"/> 년</td>
				</tr>
				<tr>
					<th>발행여부</th>
					<td><c:out value="${whtprInfo.pblcnYnNm}"/></td>
				</tr>
				<tr>
					<th>백서명</th>
					<td><c:out value="${whtprInfo.whtprNm}"/></td>
				</tr>
				<tr>
					<th>백서내용</th>
					<td><c:out value="${whtprInfo.whtprCn}"/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td class="file-list">
						<c:if test="${!empty whtprAtchFileList}">
							<c:forEach var="atchFileData" items="${whtprAtchFileList}" varStatus="status">
								<c:url var="url" value="/cmmn/downloadFile.do">
									<c:param name="filePath" value="${atchFileData.fileStrgPathNm}" />
									<c:param name="fileNm" value="${atchFileData.strgFileNm}" />
									<c:param name="orgnlFileNm" value="${atchFileData.orgnlAtchFileNm}" />
								</c:url>
								<p><a href="${url}">
									<c:out value="${atchFileData.orgnlAtchFileNm}" />  (<c:out value="${atchFileData.fileSz}"/>)
								</a></p>
							</c:forEach>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btn-wrap align-right">
		
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListWhtprInfo(); return false;">목록</button>
	<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnMoveEditPage" name="btnMoveEditPage" onclick="javascript:moveEditWhtprInfo(); return false;">수정</button>
	</c:if>
	</div>
	
	<div class="mid-title-wrap">
		<h2>백서 목차</h2>
	</div>
	<div class="table-wrap">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th colspan="3">백서목차</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="5">일반현황</td>
					<td rowspan="3">1.정보화 및 정보보호 인력현황</td>
					<td>1)연도별 현황</td>
					<td><button type="button" class="btns size-xsmall" id="btnOpenPopYrInfrmNmpr" name="btnOpenPopYrInfrmNmpr" onclick="javascript:moveOpenPopWhtprInfo('YRINFRMNMPR','${whtprInfo.pblcnYr}'); return false;">보기</button></td>
				</tr>
				<tr>
					<td>2)정보화 및 정보보호 인력 현황</td>
					<td><button type="button" class="btns size-xsmall" id="btnOpenPopInfrmInfscrNmpr" name="btnOpenPopInfrmInfscrNmpr" onclick="javascript:moveOpenPopWhtprInfo('INFRMINFSCRNMPR','${whtprInfo.pblcnYr}'); return false;">보기</button></td>
				</tr>
				<tr>
					<td>3)기관별 현황</td>
					<td><button type="button" class="btns size-xsmall" id="btnOpenPopInstInfrmNmpr" name="btnOpenPopInstInfrmNmpr" onclick="javascript:moveOpenPopWhtprInfo('INSTINFRMNMPR'); return false;">보기</button></td>
				</tr>
				<tr>
					<td rowspan="2">2.정보화 예산 현황</td>
					<td>1)재원별 정보화 예산</td>
					<td><button type="button" class="btns size-xsmall" id="btnOpenPopFircsInfrmBgt" name="btnOpenPopFircsInfrmBgt" onclick="javascript:moveOpenPopWhtprInfo('FIRCSINFRMBGT',' ${whtprInfo.pblcnYr}'); return false;">보기</button></td>
				</tr>
				<tr>
					<td>2)유형별 정보화 예산</td>
					<td><button type="button" class="btns size-xsmall" id="btnOpenPopTypeInfrmBgt" name="btnOpenPopTypeInfrmBgt" onclick="javascript:moveOpenPopWhtprInfo('TYPEINFRMBGT', '${whtprInfo.pblcnYr}'); return false;">보기</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- 4번 모달 -->
  <div class="modals" id="modals">
     <div class="pop-layer" id="relList" style="width:80%;"></div>
  </div>
  
<script> 
	/**
	 *  Page 렌더링 전 작업
	 */
	
	
	/**
	 * Page 초기화
	 * 변수 정의
	 */
	
	
	 /**
	 * 이벤트 핸들링
	 */
	 //버튼 이벤트
	
	/*
	$("#btnMoveListPage").click(moveListInstInfo);
	$("#btnMoveEditPage").click(moveEditInstInfo);
	*/
	var whtprId = '${whtprInfo.whtprId}';
	function moveListWhtprInfo() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath+'/cltInfoWhtprMgt/whtprList.do';
		frm.submit();
	}

	function moveEditWhtprInfo() {
		let frm = document.frmDtlSrch;
		frm.srchWrtMode.value = "edit";
		frm.action = contextPath+'/cltInfoWhtprMgt/whtprReg.do';
		frm.submit();
	}

	
	
	function moveOpenPopWhtprInfo(checkParam, pblcnYr) {
	    $.ajax({
	        type: "POST",
	        url: contextPath+'/cltInfoWhtprMgt/whtprPop.do',
	        data: { checkParam: checkParam 
	        	   ,whtprId: whtprId
	        	   ,pblcnYr: pblcnYr 
	        	    
	        	  }, // 데이터를 추가
	        success: function(response) {
	            $('#relList').html(response);
	            admin.modalsShow('modals');
	        },
	        error: function() {
	            alert("관리자에게 문의해주세요.");
	        }
	    });
	}

</script>



