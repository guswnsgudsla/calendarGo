<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<!-- 공통 javascript 함수 -->
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
	<div class="contants">
			<form id="frmClcSrch" name="frmClcSrch" method="post" action="#">
				<!-- 검색값 유지용 변수 -->
				<input type="hidden" id="srchTypeCd" name="srchTypeCd" value="<c:out value="${dgtlClcVO.srchTypeCd}"/>"> 
				<input type="hidden" id="srchWrtMode" name="srchWrtMode" value=""> 
				<input type="hidden" id="srchExbiTypeCd" name="srchExbiTypeCd" value="<c:out value="${dgtlClcVO.srchExbiTypeCd}"/>"> 
				<input type="hidden" id="srchOpenYn" name="srchOpenYn" value="<c:out value="${dgtlClcVO.srchOpenYn}"/>"> 
				<input type="hidden" id="srchText" name="srchText" value="<c:out value="${dgtlClcVO.srchText}"/>"> 
				<input type="hidden" id="srchExbiId" name="srchExbiId" value="<c:out value="${dgtlClcVO.srchExbiId}"/>"> 
				<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${dgtlClcVO.srchTabPstnId}"/>">
				<!-- 페이징 변수 -->
				<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${dgtlClcVO.currentPage}"/>">
			<div class="table_wrap" style="margin-top: 30px;">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width: 100px"></col>
					<col style="width: 300px"></col>
					<col style="width: 100px"></col>
					<col style="width: 300px"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>컬렉션 명</th>
						<td style="text-align: left; padding-left: 30px;"><c:out value="${exbiInfo.exbiNm}"/></td>
						<th>기관 명(코드)</th>
						<td style="text-align: left; padding-left: 30px;">
							<c:out value="${exbiInfo.instNm}"/>(<c:out value="${exbiInfo.instId}"/>)
						</td>
					</tr>
					<tr>
						<th>컬렉션 유형</th>
						<td style="text-align: left; padding-left: 30px;">
							<c:if test="${exbiInfo.exbiTypeCd == 'A01'}">상설 전시</c:if>
							<c:if test="${exbiInfo.exbiTypeCd == 'A02'}">기간 전시</c:if>
						</td>
						<th>공개</th>
						<td>
						<div style="padding-left: 30px;">
							<div class="switch-check" style="display: flex; justify-content:center;">
							    <label>  
								    <input type="checkbox" name="rlsYn" value="Y" onclick="return false;" <c:if test="${exbiInfo.rlsYn == 'Y' }">checked="checked"</c:if>>
								    <span class="onoff-switch"></span>
							    </label>
							</div>
						</div>
						</td>
					</tr>
					<!-- 파일 이름 없으면 보여주지 않기 -->
					<c:if test="${exbiInfo.strgFileNm ne null and exbiInfo.strgFileNm ne ''}">
					<tr>
						<th>대표 이미지</th>
						<td colspan="3">
							<div id="imageZone" style="width:30%;" >
								<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${exbiInfo.filePath}&fileNm=${exbiInfo.strgFileNm}&atchFileGroupId=${exbiInfo.rprsImgGroupId}' />"  alt="${exbiInfo.orgnlAtchFileNm}" style="width: 100%; height: 100%">
							</div>
						</td>
					</tr>
					</c:if>
					<tr>
						<th>컬렉션 설명</th>
						<div style="white-space: pre-line;">
						<td colspan="3" style="text-align: left; padding-left: 30px;">
							<c:out value="${exbiInfo.exbiExpln}"/>
						</td>
						</div>
					</tr>
					<tr>
						<th>조회 수</th>
						<td style="text-align: left; padding-left: 30px;"><c:out value="${exbiInfo.inqCnt}"/></td>
						<th>문화자원 수</th>
						<td style="text-align: left; padding-left: 30px;"><c:out value="${exbiInfo.relCnt}"/></td>
					</tr>
				</tbody>
			</table>
			</div>
			</form>
		<div class="btn-wrap align-right">
			<button type="button" class="btns black" id="btnList" onclick="javascript:goListClcInfo(); return false;">목록</button>
			<button type="button" class="btns black" id="btnEdit" onclick="javascript:goEditClcInfo(); return false;">수정</button>
		</div>
		<!-- 팝업 띄우는 부분 -->
		<div class="modals" id="modals">
            <div class="pop-layer" id="clrcsPop" style="padding:0;width:80%;border-radius:0px;">
            </div>
        </div>
		<!-- 컬렉션과 관련있는 문화자원들 리스트와 컬렉션 변경이력을 볼 수 있는 섹션 -->
		 <div class="tab-wrap as-tab-wrap">
			<ul class="tab-menu" style="width: 50%;">
				<li id="tabRelList"<c:if test="${dgtlClcVO.srchTabPstnId == 'relList' }">class="on"</c:if>><a href="#" onclick="javascript:moveTabChage('relList'); return false;">관련 문화자원 목록</a></li>
				<li id="tabHstryList"<c:if test="${dgtlClcVO.srchTabPstnId == 'hstryList' }">class="on"</c:if>><a href="#" onclick="javascript:moveTabChage('hstryList'); return false;">컬렉션 변경 이력</a></li>
			</ul>
			<div class="inner-depth">
				<div class="tab-inner" id="tabRelArea" <c:if test="${dgtlClcVO.srchTabPstnId != 'relList' }">style="display:none;"</c:if>>
					<div class="information">
					<div class="btn-wrap" style="text-align: right;">
						<button class="btns black" onclick="javascript:goClrcsInfo('${dgtlClcVO.srchExbiId}'); return false;">+&nbsp;추가</button>
						<button type="button" class="btns black" onclick="javascript:goUpdateRelInfo('${dgtlClcVO.srchExbiId}'); return false;">변경사항 저장</button>
					</div>
					<form id="frmRelList" name="frmRelList" method="post" action="#">
					<!-- 문화자원 수정을 위한 변수 -->
					<input type="hidden" id="popExbiId" name="popExbiId" value="<c:out value="${dgtlClcVO.srchExbiId}"/>">
					<div class="table-wrap" style="margin-top: 0;">
						<table>
							<caption></caption>
							<colgroup>
								<col width="5%"></col>
								<col width="30%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="*"></col>
								<col width="*"></col>
							</colgroup>
							<thead>
								<tr>
									<th>순번</th>
									<th>문화자원 명</th>
									<th>정렬 순서</th>
									<th>공개</th>
									<th>삭제</th>
									<th>등록자(ID)</th>
									<th>컬렉션 추가 일시</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty dgtlClcRel}">
									<c:forEach var="dgtlClcRel" items="${dgtlClcRel}" varStatus="status">
										<input type="hidden" name="clrcsId" value="<c:out value="${dgtlClcRel.clrcsId}"/>">
									</c:forEach>
									<c:forEach var="dgtlClcRel" items="${dgtlClcRel}" varStatus="status">
									<c:set var="i" value="${i+1 }"/>
										<tr>
											<td><c:out value="${dgtlClcRel.dgtlClcListNo}"/></td>
											<td style="text-align: left;"><c:out value="${dgtlClcRel.clrcsNm}"/></td>
											<td>
											<input type="text" id="sortSn${i }" name="sortSn" value="<c:out value="${dgtlClcRel.sortSn}"/>" style="width:40px;height:40px;font-size:20px; text-align: center;" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)">
											</td>
											<td>
												<div style="display: flex; justify-content:center;">
													<div class="switch-check" >
													    <label >  
														    <input type="checkbox" id="rlsYn${i }" name="rlsYn" value="Y" <c:if test="${dgtlClcRel.rlsYn == 'Y' }">checked="checked"</c:if>>
														    <span class="onoff-switch"></span>
													    </label>
													</div>
												</div>
											</td>
											<td>
												<button class="btns size-small color-red" style="width: 45px;height: 35px;" type="button" onclick="javascript:goDeleteRel('${dgtlClcRel.clrcsId}','${dgtlClcRel.sortSn}', '${dgtlClcVO.srchExbiId}'); return false;">삭제</button>
											</td>
											<td>
											<c:out value="${dgtlClcRel.mbrNcm}"/>
												<br>
											(<c:out value="${dgtlClcRel.frstRgtrId}"/>)
											</td>
											<td>
											<c:out value="${dgtlClcRel.frstRegDtV19}"/>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty dgtlClcRel}">
									<tr>
										<td colspan="7">No Data</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						</div>
					</form>
					<input id="relCnt" name="relCnt" type="hidden" value="${i }">
					</div>
				</div>
				<div class="tab-inner" id="tabHstryArea" <c:if test="${dgtlClcVO.srchTabPstnId != 'hstryList' }">style="display:none;"</c:if>>
					<div class="information">
					<div class="table-wrap" style="margin-top: 0;">
						<table style="margin-top: 60px;">
							<caption></caption>
							<colgroup>
								<col width="5%"></col>
								<col width="10%"></col>
								<col width="*"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
							</colgroup>
							<thead>
								<tr>
									<th>순번</th>
									<th>변경 유형</th>
									<th>컬렉션 명</th>
									<th>유형</th>
									<th>전시 기간</th>
									<th>공개</th>
									<th>변경자</th>
									<th>변경 일시</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty hstryList}">
									<c:forEach var="hstryList" items="${hstryList}" varStatus="status">
										<tr>
											<td><c:out value="${hstryList.dgtlClcListNo}"/></td>
											<td>
												<c:if test="${hstryList.chgHstryTypeCd == 'B01'}">
													등록
												</c:if>
												<c:if test="${hstryList.chgHstryTypeCd == 'B02'}">
													변경
												</c:if>
											</td>
											<td><c:out value="${hstryList.exbiNm}"/></td>
											<td>
												<c:if test="${hstryList.exbiTypeCd  == 'A01'}">
													상설전시
												</c:if>
												<c:if test="${hstryList.exbiTypeCd == 'A02'}">
													기간전시
												</c:if>
											</td>
											<td>
												<c:out value="${hstryList.exbiBgngYmd}"/>
													<br>
												<c:out value="${hstryList.exbiEndYmd}"/>
											</td>
											<td>
												<c:if test="${hstryList.rlsYn == 'Y'}">
													공개
												</c:if>
												<c:if test="${hstryList.rlsYn == 'N'}">
													비공개
												</c:if>
											</td>
											<td>
												<c:out value="${pf:getMaskingID(hstryList.frstRgtrId)}"/>
											</td>
											<td><c:out value="${hstryList.frstRegDtV19}"/></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty hstryList}">
									<tr>
										<td colspan="8">No Data</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div> 
	</div>
	</div>
	<!-- contants(e) -->
	</div>
	</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

/*1.페이지 렌더링 후 작업이 있다면 여기에 기입*/

function moveTabChage(paramNewTabId) {
	let oldTabId = $("#srchTabPstnId").val();
	if (oldTabId == "relList") {
		$("#tabRelList").removeClass("on");
		$("#tabRelArea").hide();
	} else if (oldTabId == "hstryList") {
		$("#tabHstryList").removeClass("on");
		$("#tabHstryArea").hide();
	}
	if (paramNewTabId == "relList") {
		$("#tabRelList").addClass("on");
		$("#tabRelArea").show();
	} else if (paramNewTabId == "hstryList") {
		$("#tabHstryList").addClass("on");
		$("#tabHstryArea").show();
	} 
	$("#srchTabPstnId").val(paramNewTabId);
}
/*2.전역변수 정의 및 초기화는 여기에 기입*/
 
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/

//컬렉션 목록화면으로 다시 돌아가는 함수
function goListClcInfo() {
    let frm = document.frmClcSrch;
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcList.do";
    frm.submit();
}

//수정화면으로 이동하는 함수
function goEditClcInfo() {
    let frm = document.frmClcSrch;
    frm.srchWrtMode.value = 'edit'
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcSave.do";
    frm.submit();
}


/*4.동적메서드 선언부분*/

//관련 자원 추가를 위한 문화자원 목록 팝업 띄우는 함수
function goClrcsInfo(id){
	
	$( '#clrcsPop' ).load("<c:url value='/dgtlClcMgt/getClrcsList.do'/>"+"?popExbiId="+id);
	
	admin.modalsShow('modals'); 
	
}
//컬렉션 관련자원 정보 수정(전시 여부)
function goUpdateRelInfo(exbiId){
	
	var relCnt = document.getElementById("relCnt").value;
	
	if(relCnt <= 0){
 		alert("변경할 문화자원이 없습니다.");
 		return;
 	}
	
	var formData = $("#frmRelList").serialize();
	
 	var checkRlsYn = "";
	
 	var numRelId = Number(relCnt);
	
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
 	
 	//정보수정 작업 요청 후 성공시 모달창 새로고침
 	$.ajax({
 	    type: "post",
 	    url: contextPath + "/dgtlClcMgt/updateRelInfo.do",
 	    data: formData += checkRlsYn,
 	    dataType: 'text',
 	    success: function (data) {
 		    	alert("수정이 완료되었습니다.");
 		    	location.reload();
 	    },
 	    error: function (request, status, error) {
 	    	alert("수정이 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
 	    }
 	});
}	
	
//관련자원 삭제를 요청하는 함수	
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
			    	location.reload();
		    },
		    error: function (request, status, error) {
		    	alert("삭제가 미완료되었습니다. 서버 담당자에게 문의 바랍니다.");
		    }
		});
		location.reload();
		
	}else{
		return;
	}
}	
</script>
