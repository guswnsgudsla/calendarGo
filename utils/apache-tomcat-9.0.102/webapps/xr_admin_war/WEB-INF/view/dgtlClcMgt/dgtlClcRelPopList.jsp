<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 공통 javascript 함수 -->
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>">
<div class="pop-contants">
	<!-- 팝업 헤더 영역 -->
	<div class="title-wrap">
		<div class="title between">
			<h2>컬렉션 관련 문화 자원 조회</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:closeModal()">X</button>
		</div>
	</div>
	<!-- 콘텐츠 영역 -->
	<div>
		<table>
			<colgroup>
				<col width="200px"></col>
				<col width="*"></col>
			</colgroup>
			<tr>
				<th>컬렉션명</th>
				<td class="align-left"><c:out value="${dgtlClcVO.exbiNm}"/></td>
				
			</tr>
			<tr>
				<th>전시 유형</th>
				<td class="align-left"><c:out value="${dgtlClcVO.exbiTypeCdNm}"/></td>
			</tr>
		</table>
	</div> 
	<div class="table-wrap table-scroll" >
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="500px"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>관련 문화자원 ID</th>
					<th>관련 문화자원 명</th>
					<th style="padding-right: 20px;">보유기관</th>
					<th style="padding-right: 25px;">정렬 순서</th>
					<th style="padding-right: 25px;">전시 여부</th>
					<th style="padding-right: 35px;">제외</th>
				</tr>
			</thead>
		</table>	
		<div class="scroll-wrap" style="height: 400px">
		<form id="frmRelSrch" name="frmRelSrch" method="post" action="#">
		<table class="list">
			<colgroup>
				<col width="50px"></col>
				<col width="*"></col>
				<col width="500px"></col>
				<col width="*"></col>
				<col width="*"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<!-- 조회 파라미터 -->
				<input type="hidden" id="popExbiId" name="popExbiId" value="<c:out value="${dgtlClcVO.srchExbiId}"/>">
				<c:if test="${!empty dgtlClcRelList}">
					<c:forEach var="dgtlRelData" items="${dgtlClcRelList}" varStatus="status">
						<input type="hidden" name="clrcsId" value="<c:out value="${dgtlRelData.clrcsId}"/>">
					</c:forEach>
				</c:if>
				<!-- 페이징 변수 -->
				 <input type="hidden" id="currentPage" name="currentPage" value="1" />
				<c:if test="${!empty dgtlClcRelList}">
				<c:forEach var="dgtlRelData" items="${dgtlClcRelList}" varStatus="status">
				<c:set var="i" value="${i+1 }"/>
				<tr>
					<td><c:out value="${dgtlRelData.dgtlClcListNo}"/></td>
					<td><c:out value="${dgtlRelData.clrcsId}"/></td>
					<td style="text-align: left;"><c:out value="${dgtlRelData.clrcsNm}"/></td>
					<td><c:out value="${dgtlRelData.instNm}"/></td>
					<td>
						<div class="fm-ele" data-size="w60">
							<input type="text" id="sortSn${i }" class="align-center" name="sortSn" value="<c:out value="${dgtlRelData.sortSn}"/>" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)"/>
						</div>  
					</td>
					<td>
						<div class="switch-check">
							<label>
								<input type="checkbox" id="rlsYn${i }" name="rlsYn" value="Y"<c:if test="${dgtlRelData.rlsYn == 'Y' }">checked="checked"</c:if> >
								<span class="onoff-switch"></span>  
							</label>
						</div>
					</td>
					<td>
						<div>
							<button class="btns size-small color-red" type="button" style="width: 45px;height: 35px;" onclick="javascript:goDeleteRel('${dgtlRelData.clrcsId}','${dgtlRelData.sortSn}', '${dgtlClcVO.srchExbiId}'); return false;">삭제</button>
						</div>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty dgtlClcRelList}">
					<tr>
						<td colspan="7">No Data</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>
	 </div>
	</div>
	<div class="btn-wrap align-center">
		<button type="button" class="btns color-gray closeBtn" onclick="javascript:closeModal()">닫기</button>
		<button type="button" class="btns" onclick="javascript:goUpdateRelInfo('${dgtlClcVO.srchExbiId}','${i }'); return false;">저장</button>
	</div>
	<!-- 콘텐츠 영역 끝  -->
</div>
</div>
<script type="text/javascript">

	/*1.페이지 렌더링 후 작업이 있다면 여기에 기입*/
	
	/*2.전역변수 정의 및 초기화는 여기에 기입*/
	/*3.이벤트 핸들링 하는 부분은 여기에 기입*/
	
	//모달창 닫는 함수
	function closeModal(){
		admin.modalsClose('modals');
		location.reload();
	}
	
	//컬렉션 관련자원 정보 수정(전시 여부)
	function goUpdateRelInfo(exbiId, relId){
		
		var formData = $("#frmRelSrch").serialize();
		
		var checkRlsYn = "";
		
		var numRelId = Number(relId);
		
		//정렬순서 체크를 위한 배열 생성
		var sortArr = new Array();
		
		for(var i=1; i <= numRelId; i++){
			if(document.getElementById("sortSn"+i)){
				if(document.getElementById("sortSn"+i).value == "" || document.getElementById("sortSn"+i).value == null){
					alert("정렬 순서는 필수로 입력하여야 합니다.");
					return;
				}
				else{
					sortArr.push(document.getElementById("sortSn"+i).value);
				}
			}
		}
		
		//중복값이 허용이 안되는 Set 컬렉션 특성을 이용하여 중복체크를 위해 생성
		var setSortArr = new Set(sortArr);
		
		if(setSortArr.size < sortArr.length){
			alert("정렬 순서는 중복될 수 없습니다.");
			return;
		}
		
		for(var i=1; i <= numRelId; i++){
			if(document.getElementById("rlsYn"+i)){
				if(document.getElementById("rlsYn"+i).checked){
					checkRlsYn += "&&checkRlsYn=Y"
				}
				else{
					checkRlsYn += "&&checkRlsYn=N"
				}
			}
		}
		
		//정렬순서 입력값을 오름차순으로 정렬하는 함수.
		sortArr.sort(function(a, b)  {
			  return a - b;
		});
		
		if(sortArr[0] != 1){
			alert("정렬 순서는 1부터 입력 바랍니다");
			return;
		}
		//정렬순서를 과도하게 높게 입력할 시 제한 거는 함수
		for(var i=1; i <= numRelId; i++){
			if(document.getElementById("sortSn"+i)){
				let chkVal = document.getElementById("sortSn"+i).value;
				let numChkVal = parseInt(chkVal);
				if(numChkVal > numRelId){
					alert("정렬 순서는 총 개수를 넘을 수 없습니다");
					return;
				}
			}
		}
		
 		//정보수정 작업 요청 후 성공시 모달창 새로고침
		$.ajax({
		    type: "post",
		    url: contextPath + "/dgtlClcMgt/updateRelInfo.do",
		    data: formData += checkRlsYn,
		    dataType: 'text',
		    success: function (data) {
			    	alert("수정이 완료되었습니다.");
			    	$( '#relList' ).load("<c:url value='/dgtlClcMgt/getRelClc.do'/>"+"?srchExbiId="+exbiId);
		    },
		    error: function (request, status, error) {
		    	alert("수정이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
		    }
		});
	}	
		
	//관련 문화자원 삭제하는 함수	
	function goDeleteRel(clrcsId, sortSn, exbiId){
		
		if(confirm("삭제시 재등록 하여야 합니다. 계속 진행하시겠습니까?")){
			//관련자원 삭제 작업 요청 후 성공시 모달창 새로고침
			$.ajax({
			    type: "post",
			    url: contextPath + "/dgtlClcMgt/deleteRelInfo.do",
			    data: {
			    	"clrcsId" : clrcsId,
			    	"sortSn" : sortSn,
			    	"exbiId" : exbiId,
			    },
			    dataType: 'text',
			    success: function (data) {
				    	alert("삭제가 완료되었습니다.");
				    	$( '#relList' ).load("<c:url value='/dgtlClcMgt/getRelClc.do'/>"+"?srchExbiId="+exbiId);
			    },
			    error: function (request, status, error) {
			    	alert("삭제가 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
			    }
			});
			$( '#relList' ).load("<c:url value='/dgtlClcMgt/getRelClc.do'/>"+"?srchExbiId="+id+"&&currentPage="+currentPage);
			
		}else{
			return;
		}
	}	
</script>