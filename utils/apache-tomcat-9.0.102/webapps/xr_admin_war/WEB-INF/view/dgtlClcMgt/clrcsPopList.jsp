<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css' />">
<div class="pop-contants">
	<!-- 팝업 헤더 영역 -->
	<div class="title-wrap">
		<div class="title between">
			<h2>문화 자원 목록</h2>
			<button type="button" class="closeBtn btnClose" onclick="closeModal()">X</button>
		</div>
	</div>
	<!-- 콘텐츠 영역 -->
	<form id="frmClrcsSrch" name="frmClrcsSrch" method="post" action="#">
		<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
		<input type="hidden" id="popExbiId" name="popExbiId" value="<c:out value="${dgtlClcVO.popExbiId}"/>"> 
		<!-- 페이징 변수 -->
		<input type="hidden" id="currentPage" name="currentPage" value="1" />
		
		<div class="control-wrap">
			<div class="search" style="justify-content: unset; align-items: unset; padding-top: 30px;">
				<div class="fm-focus fm-select server-bind">
					<select id="popSrchTypeCd" name="popSrchTypeCd" style="padding-left: 10px;">
						<option value="clrcsNm" <c:if test="${dgtlClcVO.popSrchTypeCd == 'clrcsNm'}">selected</c:if>>문화자원 명</option>
						<c:if test="${authority eq 'AUTH000001'}">
							<option value="instNm" <c:if test="${dgtlClcVO.srchTypeCd == 'instNm'}">selected</c:if>>기관명</option>
						</c:if>
					</select>
				</div>
				<div class="fm-ele" data-size="w500">
					<input type="text" id="popSrchText" name="popSrchText" value="<c:out value="${dgtlClcVO.popSrchText}"/>" placeholder="검색어를 입력하세요.">
				</div>
				<div class="btn-wrap align-right">
					<button type="button" class="btns" id="btnSrch" onclick="javascript:goClrcsSrchParam(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnReset" onclick="javascript:goClrcsSrchParamReset(); return false;">초기화</button>
				</div>
			</div>
		</div>
		</form>
		<div class="table-wrap table-scroll">
			<table class="list" style="padding: 15px; padding-top:5px; padding-bottom:0px; border:none;">
				<colgroup>
					<col width="10%"/><col width="*"/><col width="*"/><col width="10%"/><col width="10%"/><col width="10%"/>
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>문화자원 ID</th>
						<th>문화자원 명</th>
						<th>보유 기관</th>
						<th style="padding-right: 35px;">전시</th>
						<th></th>
					</tr>
				</thead>
			</table>
		<div class="scroll-wrap" style="height: 450px">
			<table class="list" style="padding: 15px; padding-top:5px; padding-bottom:0px; border:none;">
				<colgroup>
					<col width="10%"/><col width="*"/><col width="*"/><col width="10%"/><col width="10%"/><col width="10%"/>
				</colgroup>
				<tbody>
					<c:if test="${!empty dgtlClrcsList}">
						<c:forEach var="dgtlClrcsList" items="${dgtlClrcsList}" varStatus="status">
						<tr>
							<td><c:out value="${dgtlClrcsList.dgtlClcListNo}"/></td>
							<td><c:out value="${dgtlClrcsList.clrcsId}"/></td>
							<td style="text-align: left;"><c:out value="${dgtlClrcsList.clrcsNm}"/></td>
							<td><c:out value="${dgtlClrcsList.instNm}"/></td>
							<td style="text-align: center;">
							<div style="display: flex; justify-content:center;">
								<div class="switch-check">
									<label>
		                          	  	<input type="checkbox" name="rlsYn" value="Y" checked="checked" onclick="return false;">
								    	<span class="onoff-switch"></span>  
							    	</label>
							    </div>
	                        </div>   
							</td>
							<td>
								<button type="button" class="btns black" onclick="javascript:goInsertRelInfo('${dgtlClcVO.popExbiId}', '${dgtlClrcsList.clrcsNm}','${dgtlClrcsList.clrcsId}'); return false;">추가</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty dgtlClrcsList}">
						<tr>
							<td colspan="6">No Data</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		 </div>
	</div>
	<div class="align_flex center">
		<div class="align_flex paging">
			<c:import url="/WEB-INF/view/include/custom_paging.jsp">
				<c:param name="currentPage" value="${dgtlClcVO.currentPage}"/>
				<c:param name="totalPage" value="${dgtlClcVO.totalPage}"/>
				<c:param name="totalRecord" value="${dgtlClcVO.totalRecord}"/>
				<c:param name="recordCountPerPage" value="${dgtlClcVO.recordCountPerPage}"/>
				<c:param name="pagePerBlock" value="${dgtlClcVO.pagePerBlock}"/>
				<c:param name="calculPage" value="${dgtlClcVO.calculPage}"/>
				<c:param name="funNm" value="popFnList"/>
				<c:param name="url" value="getClrcsList.do"/>
			</c:import>
		</div>
	</div>
<div class="btn-wrap align-right" style="margin-bottom: 20px; margin-right: 30px;">
	<button type="button" class="btns blue closeBtn" onclick="javascript:closeModal()">CLOSE</button>
</div>
	<!-- 콘텐츠 영역 끝  -->
</div>
</div>
<script type="text/javascript">

	/*1.페이지 렌더링 후 작업이 있다면 여기에 기입*/
	
	window.popFnList = function(action, mapKVs) {
	
	// currentPage 파라미터 추가
	document.getElementById('currentPage').value = mapKVs.currentPage;
	
		var id = document.getElementById('popExbiId').value;
		var currentPage = document.getElementById('currentPage').value;
	      goPoPSrchParam(id,currentPage);
	  }
	
	const goPoPSrchParam  = function (id,currentPage){
		
		var popSrchText = document.getElementById('popSrchText').value;
		var popSrchTypeCd = document.getElementById('popSrchTypeCd').value;
		
		$( '#clrcsPop' ).load("<c:url value='/dgtlClcMgt/getClrcsList.do'/>"+"?popExbiId="+id+"&&currentPage="+currentPage+"&&popSrchText="+popSrchText+"&&popSrchTypeCd="+popSrchTypeCd);
	}	
	
	const goClrcsSrchParam  = function (){
		
		var popExbiId = document.getElementById('popExbiId').value;
		var popSrchText = document.getElementById('popSrchText').value;
		var popSrchTypeCd = document.getElementById('popSrchTypeCd').value;
		
		$( '#clrcsPop' ).load("<c:url value='/dgtlClcMgt/getClrcsList.do'/>"+"?popExbiId="+popExbiId+"&&popSrchText="+popSrchText+"&&popSrchTypeCd="+popSrchTypeCd);
	}	
	/*2.전역변수 정의 및 초기화는 여기에 기입*/
	/*3.이벤트 핸들링 하는 부분은 여기에 기입*/
	
	//클릭시 검색폼 값을 초기화 하는 함수
	function goClrcsSrchParamReset() {
		let frm = document.frmClrcsSrch;
	    frm.popSrchText.value = "";
	    frm.popSrchTypeCd.value = "clrcsNm";
	}	
	//검색 조회 후 엔터키 누를시 비정상 페이지 이동이 발생하여 입력 막음
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	
	//모달창 닫는 함수
	function closeModal(){
		admin.modalsClose('modals');
		location.reload();
	}
	
	//관련문화자원 등록하는 함수
	function goInsertRelInfo(popExbiId, clrcsNm, clrcsId){
		
		if(confirm(clrcsNm + " 자원을 등록하시겠습니까?")){
			//정보수정 작업 요청 후 성공시 모달창 새로고침
			$.ajax({
			    type: "post",
			    url: contextPath + "/dgtlClcMgt/insertRelInfo.do",
			    data: {
			    	"popExbiId" : popExbiId,
			    	"clrcsNm" : clrcsNm,
			    	"clrcsId" : clrcsId
			    },
			    dataType: 'text',
			    success: function (data) {
			    	if("" != data){
			    		alert(data +" 자원이 등록되었습니다.");
			    		//새로고침하여 최신 자원 목록 표출
				    	location.reload();
			    	}
			    	else{
			    		alert("등록이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
			    	}
				    	
			    },
			    error: function (request, status, error) {
			    	alert("등록이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
			    }
			});
		}
	}
		
</script>