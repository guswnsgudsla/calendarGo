<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css' />">
<div class="pop-contants">
	<!-- 팝업 헤더 영역 -->
	<div class="title-wrap">
		<div class="title between">
			<h2>메뉴 이력 팝업</h2>
			<button type="button" class="closeBtn btnClose" onclick="closeModal()">X</button>
		</div>
	</div>
	<!-- 콘텐츠 영역 -->
		<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
		<input type="hidden" id="paramMenuId2" name="paramMenuId2" value="${paramMenuVo.paramMenuId}"> 
		<div class="control-wrap">
		<form id="frmClrcsSrch" name="frmClrcsSrch" method="post" action="#">
		<!-- 페이징 변수 -->
		<input type="hidden" id="currentPage" name="currentPage" value="1" />
		<div class="search">
			<div class="filter">
				<div class="row">
					<strong class="tit">메뉴 유형</strong>
					<div class="fm-focus fm-select">
						<select id="paramMenuTypeCd2" name="paramMenuTypeCd2">
							<option value="" <c:if test="${paramMenuVo.paramMenuTypeCd == ''}">selected</c:if>>전체</option>
							<option value="01" <c:if test="${paramMenuVo.paramMenuTypeCd == '01'}">selected</c:if>>폴더</option>
							<option value="02" <c:if test="${paramMenuVo.paramMenuTypeCd == '02'}">selected</c:if>>콘텐츠</option>
						</select>
					</div>
					<strong class="tit">사용 여부</strong>
					<div class="fm-focus fm-select">
						<select id="paramUseYn2" name="paramUseYn2">
							<option value="" <c:if test="${paramMenuVo.paramUseYn == ''}">selected</c:if>>전체</option>
							<option value="Y" <c:if test="${paramMenuVo.paramUseYn == 'Y'}">selected</c:if>>Y</option>
							<option value="N" <c:if test="${paramMenuVo.paramUseYn == 'N'}">selected</c:if>>N</option>
						</select>
					</div>
				</div>
				<div class="row">
					<strong class="tit">메뉴 명</strong>
					<div class="fm-ele" data-size="w400">
						<input type="hidden" id="originMenuNm" name="originMenuNm" value="${paramMenuVo.paramMenuNm}">
						<input type="text" id="paramMenuNm2" name="paramMenuNm2" value="${paramMenuVo.paramMenuNm}">
					</div>
				</div>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btns" onclick="goClrcsSrchParam()">조회</button>
			</div>
		</div>
		</form>
		</div>
		
		<div class="table-wrap table-scroll">
			<table class="list">
				<colgroup>
					<col width="10%"/><col width="*"/><col width="*"/><col width="*"/><col width="10%"/><col width="10%"/>
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>메뉴 명</th>
						<th>메뉴 설명</th>
						<th>url</th>
						<th>사용 여부</th>
						<th>변경 유형</th>
					</tr>
				</thead>
			</table>
		<div class="scroll-wrap" style="height: 280px">
			<table>
				<colgroup>
					<col width="10%"/><col width="*"/><col width="*"/><col width="*"/><col width="10%"/><col width="10%"/>
				</colgroup>
				<tbody>
					<c:if test="${!empty resultMenuVo}">
						<c:forEach var="resultMenuVo" items="${resultMenuVo}" varStatus="status">
						<tr>
							<td>${resultMenuVo.menuHrstListNo}</td>
							<td class="align-left"><span>${resultMenuVo.menuNm}</span></td>
						<%-- <td class="align-left"><a href="#" onclick="goDtlMenuHistory('${resultMenuVo.chgHstrySn}')">${resultMenuVo.menuNm}</a></td> --%>
							<td class="align-left">${resultMenuVo.menuExpln}</td>
							<td>${resultMenuVo.scrnUriAddr}</td>
							<td>${resultMenuVo.useYn}</td>
							<td>${resultMenuVo.chgHstryTypeCdNm}</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty resultMenuVo}">
						<tr>
							<td colspan="6">No Data</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		 </div>
	</div>
	
	<div class="align_flex center">
		 <c:import url="/WEB-INF/view/include/custom_paging.jsp">
			 <c:param name="currentPage" value="${paramMenuVo.currentPage}"/>
			 <c:param name="totalPage" value="${paramMenuVo.totalPage}"/>
			 <c:param name="totalRecord" value="${paramMenuVo.totalRecord}"/>
			 <c:param name="recordCountPerPage" value="${paramMenuVo.recordCountPerPage}"/>
			 <c:param name="pagePerBlock" value="${paramMenuVo.pagePerBlock}"/>
			 <c:param name="calculPage" value="${paramMenuVo.calculPage}"/>
			 <c:param name="funNm" value="popFnList"/>
			 <c:param name="url" value="menuHstryList.do"/>
		 </c:import>
	 </div>
		 <!-- <div class="btn-wrap align-right">
			 <button type="button" class="btns blue closeBtn" onclick="javascript:closeModal()">CLOSE</button>
		 </div> -->
</div>
<!-- 콘텐츠 영역 끝  -->

<script type="text/javascript">

window.popFnList = function(action, mapKVs) {
	    // URL에서 '#!' 제거
	    // var newUrl = window.location.href.replace('#!', '');
	    // // 'currentPage' 파라미터 추가
	    // var currentPageParam = 'currentPage=' + mapKVs.currentPage;
	//
	    // // URL에 이미 파라미터가 존재하는 경우 해당 파라미터를 대체
	    // if (newUrl.includes('currentPage=')) {
	    //     newUrl = newUrl.replace(/(currentPage=\d+)/, currentPageParam);
	    // } else {
	    //     // URL에 파라미터가 없는 경우 새로운 파라미터 추가
	    //     newUrl += newUrl.includes('?') ? '&' + currentPageParam : '?' + currentPageParam;
	    // }
	    // // 새로운 URL로 이동
	    // window.location.href = newUrl;
	    // // 폼 제출
	    // fnFormSubmit(action, mapKVs);
	
	// currentPage 파라미터 추가
	document.getElementById('currentPage').value = mapKVs.currentPage;
	
		var currentPage = document.getElementById('currentPage').value;
	    goPoPSrchParam(currentPage);
	}
	
	function goPoPSrchParam(currentPage){
		
		var paramMenuId = document.getElementById('paramMenuId2').value;
		
		var paramMenuNm = document.getElementById('paramMenuNm2').value;
		var originMenuNm = document.getElementById('originMenuNm').value;
		paramMenuNm = paramMenuNm.split(' ').join('');
		originMenuNm = originMenuNm.split(' ').join('');
		
		if(originMenuNm != paramMenuNm){
			paramMenuId = '';
		}
		
		var paramMenuTypeCd = document.getElementById('paramMenuTypeCd2').value;
		var paramUseYn = document.getElementById('paramUseYn2').value;
		
		console.log('currentPage'+currentPage);
		console.log('paramMenuId'+paramMenuId);
		console.log('paramMenuNm'+paramMenuNm);
		console.log('originMenuNm'+originMenuNm);
		console.log('paramMenuTypeCd'+paramMenuTypeCd);
		console.log('paramUseYn'+paramUseYn);
		
		$( '#historyPop' ).load(contextPath+'/menuMgt/menuHstryList.do'+"?paramMenuId="+paramMenuId+"&&currentPage="+currentPage+"&&paramMenuNm="+paramMenuNm+"&&paramMenuTypeCd="+paramMenuTypeCd+"&&paramUseYn="+paramUseYn);
	}

	//조회조건에 맞는 메뉴 이력불러오기
	function goClrcsSrchParam(){
		
		var paramMenuId = document.getElementById('paramMenuId2').value;
		
		var paramMenuNm = document.getElementById('paramMenuNm2').value;
		var originMenuNm = document.getElementById('originMenuNm').value;
		paramMenuNm = paramMenuNm.split(' ').join('');
		originMenuNm = originMenuNm.split(' ').join('');
		
		if(originMenuNm != paramMenuNm){
			paramMenuId = '';
		}
		
		var paramMenuTypeCd = document.getElementById('paramMenuTypeCd2').value;
		var paramUseYn = document.getElementById('paramUseYn2').value;
		
		
		$( '#historyPop' ).load(contextPath+'/menuMgt/menuHstryList.do'+"?paramMenuId="+paramMenuId+"&&paramMenuNm="+paramMenuNm+"&&paramMenuTypeCd="+paramMenuTypeCd+"&&paramUseYn="+paramUseYn);
	}	
	
	//이력 클릭시 상세 정보 화면 가기
	function goDtlMenuHistory(chgHstrySn){
		
		var paramMenuId = document.getElementById('paramMenuId2').value;
		var paramMenuNm = document.getElementById('paramMenuNm2').value;
		paramMenuNm = paramMenuNm.split(' ').join('');
		var paramMenuTypeCd = document.getElementById('paramMenuTypeCd2').value;
		var paramUseYn = document.getElementById('paramUseYn2').value;
		
		var viewFlag = 'dtl';
		
		$( '#historyPop' ).load(contextPath+'/menuMgt/menuHstryList.do'+"?paramMenuId="+paramMenuId+"&&paramMenuNm="+paramMenuNm+"&&paramMenuTypeCd="+paramMenuTypeCd+"&&paramUseYn="+paramUseYn+"&&viewFlag="+viewFlag+"&&paramChgHstrySn="+chgHstrySn);
	}	
	
	//모달창 닫는 함수
	function closeModal(){
		admin.modalsClose('modals');
		location.reload();
	}
	
	//검색 조회 후 엔터키 누를시 비정상 페이지 이동이 발생하여 입력 막음
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	
		
</script>