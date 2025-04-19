<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<!-- 공통 javascript 함수 -->
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<div class="contants">
	<input type="hidden" id="instChkFlag" name="instChkFlag" value="<c:out value=""/>"> 
	<form name="frmClcSrch" method="post" action="#" enctype="multipart/form-data">
		<!-- 검색값 유지를 위한 히든 변수 -->
		<input type="hidden" id="srchTypeCd" name="srchTypeCd" value="<c:out value="${dgtlClcVO.srchTypeCd}"/>"> 
		<input type="hidden" id="srchWrtMode" name="srchWrtMode" value=""> 
		<input type="hidden" id="srchExbiTypeCd" name="srchExbiTypeCd" value="<c:out value="${dgtlClcVO.srchExbiTypeCd}"/>"> 
		<input type="hidden" id="srchOpenYn" name="srchOpenYn" value="<c:out value="${dgtlClcVO.srchOpenYn}"/>"> 
		<input type="hidden" id="srchText" name="srchText" value="<c:out value="${dgtlClcVO.srchText}"/>"> 
		<input type="hidden" id="srchExbiId" name="srchExbiId" value="<c:out value="${dgtlClcVO.srchExbiId}"/>"> 
		<input type="hidden" id="srchTabPstnId" name="srchTabPstnId" value="<c:out value="${dgtlClcVO.srchTabPstnId}"/>">
		<!-- 페이징 변수 -->
		<input type="hidden" id="pagePerBlock" name="pagePerBlock" value="<c:out value="${dgtlClcVO.pagePerBlock}"/>">
		<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="<c:out value="${dgtlClcVO.recordCountPerPage}"/>">
		<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${dgtlClcVO.currentPage}"/>">
		<input type="hidden" id="calculPage" name="calculPage" value="<c:out value="${dgtlClcVO.calculPage}"/>">
		<input type="hidden" id="totalRecord" name="totalRecord" value="<c:out value="${dgtlClcVO.totalRecord}"/>">
		<input type="hidden" id="totalPage" name="totalPage" value="<c:out value="${dgtlClcVO.totalPage}"/>">
		
		<div class="table-wrap write">
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
						<th>컬렉션 명<span class="required"> *</span></th>
						<!-- 작성 모드를 판가름하여 등록할지 수정할지 결정하는 분기점(dgtlClcMgtSave 참조) -->
						<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
							<td colspan="3">
								<div class="search fm-ele" data-size="w600">
									<input type="text" id="exbiNm" name="exbiNm" value=""  placeholder="컬렉션 명을 입력하세요.">
								</div>
							</td>
						</c:if>
						<!-- 작성 모드를 판가름하여 등록할지 수정할지 결정하는 분기점 (dgtlClcMgtSave 참조) -->
						<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
							<td colspan="3">
								<div class="fm-ele" data-size="w600">
									<input type="text" id="exbiNm" name="exbiNm" value="<c:out value="${exbiInfo.exbiNm}"/>">
								</div>
							</td>
						</c:if>
					</tr>
					<tr>
						<th>기관 명</th>
						<td>
						<%-- 작성 모드를 판가름하여 등록할지 수정할지 결정하는 분기점 (dgtlClcMgtSave 참조 이하동일) --%>
						<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
							<%-- 일반 기관 사용자일 경우 세션에서 값을 찾아 기관 값으로 활용한다. --%>
							<c:if test="${authority ne 'AUTH000001'}">
							<div class="fm-ele" data-size="w500">
								<input type="text" id="instNm" name="instNm" value="${dgtlClcVO.instNm}" readonly="readonly">
							</div>
							</c:if>
							<%-- 총괄 관리자일 경우 기관정보가 없기 때문에 수동으로 입력하여 기관 값으로 활용한다. --%>
							<c:if test="${authority eq 'AUTH000001'}">
								<div class="fm-ele with-btn" data-size="w500">
									<input type="text" id="instNm" name="instNm" value="" placeholder="입력 후 조회버튼을 누르세요." oninput="resetChk()">
									<button class="btns black" id="searchInst" onclick="javascript:checkInstNm(); return false;">조회</button>
								</div>
							</c:if>
						</c:if>
						<!-- 작성 모드를 판가름하여 등록할지 수정할지 결정하는 분기점 (dgtlClcMgtSave 참조 이하동일) -->
						<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
							<%-- 일반 기관 사용자일 경우 세션에서 값을 찾아 기관 값으로 활용한다. --%>
							<c:if test="${authority ne 'AUTH000001'}">
							<div class="fm-ele" data-size="w500">
								<input type="text" id="instNm" name="instNm" value="${exbiInfo.instNm}" readonly="readonly">
							</div>
							</c:if>
							<%-- 총괄 관리자일 경우 기관정보가 없기 때문에 수동으로 입력하여 기관 값으로 활용한다. --%>
							<c:if test="${authority eq 'AUTH000001'}">
								<div class="fm-ele with-btn" data-size="w500">
									<input type="text" id="instNm" name="instNm" value="${exbiInfo.instNm}" placeholder="입력 후 조회버튼을 누르세요." oninput="resetChk()">
									<button class="btns black" id="searchInst" onclick="javascript:checkInstNm(); return false;">조회</button>
								</div>
							</c:if>
						</c:if>
						</td>
						<th>공개 여부 <span class="required"> *</span></th>
						<td>
							<div class="switch-check">
							    <label>  
								    <input type="checkbox" name="rlsYn" value="Y" <c:if test="${exbiInfo.rlsYn == 'Y' }">checked="checked"</c:if>>
								    <span class="onoff-switch"></span>
							    </label>
							</div>
						</td>
					</tr>
					<tr>
						<th>컬렉션 유형</th>
						<td>
							<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
								<div class="fm-ele fm-radio"><input type="radio" id="radio2" name="exbiTypeCd" value="A01" checked="checked"><label for="radio2">상설전시</label></div>
								<div class="fm-ele fm-radio"><input type="radio" id="radio1" name="exbiTypeCd" value="A02"><label for="radio1">기간전시</label></div>
							</c:if>
							<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
								<div class="fm-ele fm-radio"><input type="radio" id="radio2" name="exbiTypeCd" value="A01" <c:if test="${exbiInfo.exbiTypeCd == 'A01' }">checked="checked"</c:if>><label for="radio2">상설전시</label></div>
								<div class="fm-ele fm-radio"><input type="radio" id="radio1" name="exbiTypeCd" value="A02" <c:if test="${exbiInfo.exbiTypeCd == 'A02' }">checked="checked"</c:if>><label for="radio1">기간전시</label></div>
							</c:if>
						</td>
						<th>전시기간</th>
						<td>
							<div class="fm-ele date">
								<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
									<input type="date" id="exbiBgngYmd" name="exbiBgngYmd" value="" placeholder="시작 일자" disabled="disabled"/>
								</c:if>	
								<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
									<input type="date" id="exbiBgngYmd" name="exbiBgngYmd" value="<c:out value="${exbiInfo.exbiBgngYmd}"/>" placeholder="시작 일자" <c:if test="${exbiInfo.exbiBgngYmd == '' }">disabled="disabled"</c:if>/>
								</c:if>
							</div >
							<span>-</span>
							<div class="fm-ele date">
								<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
									<input type="date" id="exbiEndYmd" name="exbiEndYmd" value="" placeholder="종료 일자" disabled="disabled" />
								</c:if>	
								<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
									<input type="date" id="exbiEndYmd" name="exbiEndYmd" value="<c:out value="${exbiInfo.exbiEndYmd}"/>" placeholder="종료 일자" <c:if test="${exbiInfo.exbiEndYmd == '' }">disabled="disabled"</c:if> />
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<th>대표 이미지</th>
						<td colspan="3">
							<div class="filebox-wrap">
								<div class="fm-filebox file-one">
							    <c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
							        <input type="hidden" id="rprsImgGroupId" name="rprsImgGroupId" value="">
									<input type="file" name="thumnailFile" id="thumnailFile" accept="image/*" multiple onchange="javascript:addGetFileList(); return false;">
									<label for="thumnailFile">파일선택</label>
							    </c:if>    
							    <c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
							        <input type="hidden" id="rprsImgGroupId" name="rprsImgGroupId" value="${exbiInfo.rprsImgGroupId}">
									<input type="file" name="thumnailFile" id="thumnailFile" accept="image/*" multiple onchange="javascript:addGetFileList(); return false;">
									<label for="thumnailFile">파일선택</label>
							    </c:if>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>컬렉션 설명</th>
						<td colspan="3">
							<div class="fm-textarea">
							<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">
								<textarea rows="5" cols="150" id="exbiExpln" name="exbiExpln"></textarea>
							</c:if>    
							<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">
								<textarea rows="5" cols="150" id="exbiExpln" name="exbiExpln"><c:out value="${exbiInfo.exbiExpln}"/></textarea>
							</c:if>  
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
	<div class="btn-wrap align-right">
		<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">	
			<button type="button" class="btns color-gray" id="btnList" onclick="javascript:goListClcInfo(); return false;">취소</button>
		</c:if>
		<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">	
			<button type="button" class="btns color-gray" id="btnList" onclick="javascript:goViewInfo(); return false;">취소</button>
		</c:if>
		<c:if test="${dgtlClcVO.srchWrtMode eq 'entry'}">		
			<button type="button" class="btns black" id="btnEntry" onclick="javascript:goEntryClcInfo('entry'); return false;">등록</button>
		</c:if>		
		<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">	
			<button type="button" class="btns black" id="btnEdit" onclick="javascript:goEditClcInfo('edit'); return false;">수정</button>
		<div class="modals" id="modals">
	         <div class="pop-layer" id="clrcsPop" style="padding:0;width:80%;border-radius:0px;"></div>
	     </div>
		</c:if>			
	</div>
	<c:if test="${dgtlClcVO.srchWrtMode eq 'edit'}">	
		<!-- 컬렉션과 관련있는 문화자원들 리스트와 컬렉션 변경이력을 볼 수 있는 섹션 -->
		 <div class="tab-wrap as-tab-wrap">
			<ul class="tab-menu" style="width: 50%;">
				<li id="tabRelList"<c:if test="${dgtlClcVO.srchTabPstnId == 'relList' }">class="on"</c:if>><a href="#" onclick="javascript:moveTabChage('relList'); return false;">관련 문화자원 목록</a></li>
				<li id="tabHstryList"<c:if test="${dgtlClcVO.srchTabPstnId == 'hstryList' }">class="on"</c:if>><a href="#" onclick="javascript:moveTabChage('hstryList'); return false;">컬렉션 변경 이력</a></li>
			</ul>
			<div class="inner-depth">
				<div class="tab-inner" id="tabRelArea" <c:if test="${dgtlClcVO.srchTabPstnId != 'relList' }">style="display:none;"</c:if>>
					<div class="information">
					<div style="text-align: right;">
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
								<col width="10%"></col>
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
													<div class="switch-check" style="display: flex; justify-content:center;">
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
					<div class="table-wrap">
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
	</c:if>			
</div>
</div>
<!-- contants(e) -->
</div>
</div>
</script>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">
//기관명 체크 플래그 적용을 위해 전역변수 선언
var instChkVal = document.getElementById("instChkFlag").value;
/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
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

//등록기능 요청
function goEntryClcInfo(srchWrtMode){
	let frm = document.frmClcSrch;
	let flag = false;
	
	flag = saveValidation(srchWrtMode);
	if(flag){
		frm.srchWrtMode.value = "entry";
        frm.action = contextPath + "/dgtlClcMgt/dgtlClcSaveInfo.do";
        frm.submit();
	}
}
//수정기능 요청
function goEditClcInfo(){
	let frm = document.frmClcSrch;
	let flag = false;
	flag = saveValidation();
	if(flag){
		frm.srchWrtMode.value = "edit";
        frm.action = contextPath + "/dgtlClcMgt/dgtlClcSaveInfo.do";
        frm.submit();
	}
}
//목록화면 돌아가기
function goListClcInfo() {
	history.back();
}
//상세화면으로 돌아가기
function goViewInfo(){
	
	history.back();
	/*
	let frm = document.frmClcSrch;
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcDtl.do";
    frm.submit();
	*/
}
//라디오 값 선택에 따라 입력을 통제하는 함수
$("input:radio[name=exbiTypeCd]").click(function(){
   	let frm = document.frmClcSrch;
   	if($("input:radio[name=exbiTypeCd]:checked").val() == 'A02'){
   		frm.exbiBgngYmd.disabled = false;
   		frm.exbiEndYmd.disabled = false;
   	}
   	else{
   		frm.exbiBgngYmd.disabled = true;
   		frm.exbiBgngYmd.value = "";
   		frm.exbiEndYmd.disabled = true;
   		frm.exbiEndYmd.value = "";
   	}
});
/*4.동적메서드 선언부분*/

//컬렉션 등록 입력값 유효성 검사
function saveValidation(srchWrtMode){
	let frm = document.frmClcSrch;
	if (cms_txt_is_empty(true, frm.exbiNm)) { alert("컬렉션명을 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.instNm)) { alert("기관명을 입력해 주십시오."); return false;}
	if(srchWrtMode == 'entry'){
		if (cms_txt_is_empty(true, frm.thumnailFile)) { alert("썸네일을 등록해 주십시오."); return false;}
	}
	if(frm.instNm.value == "" || frm.instNm.value == null ){
		alert("기관 명 입력을 진행하세요.")
		return false;
	}
	var instChkBtn = document.getElementById("searchInst");
	if(instChkBtn){
		if(instChkVal != "1"){
			alert("기관명 체크를 진행해주세요.")
			return false;
		}
	}
	if($("input:radio[name=exbiTypeCd]:checked").val() == 'A02'){
   		if(frm.exbiBgngYmd.value == "" || frm.exbiEndYmd.value == ""){
   			alert("기간전시는 시작일과 종료일을 전부 기입해야 합니다.")
   			return false;
   		}
   	}
	var exbiBgngYmd = frm.exbiBgngYmd.value;
	var exbiEndYmd = frm.exbiEndYmd.value;
	if(exbiBgngYmd != null || exbiBgngYmd != ''){
		if(exbiEndYmd != null || exbiEndYmd != ''){
			var date1 = new Date(exbiBgngYmd);
			var date2 = new Date(exbiEndYmd);
			
			if(date1 > date2){
				alert("시작일이 종료일보다 미래일 수 없습니다.");
	   			return false;
			}
		}
	}
	return true;
}

//기관명 조회 함수
function checkInstNm(){
	let frm = document.frmClcSrch;
	let srchInstNm = frm.instNm.value;
	$.ajax({
		type : "GET",
		url : contextPath + "/dgtlClcMgt/checkInstNm.do" ,
		async : true,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : "text",
		data : {
			"checkData" : srchInstNm,
		},
		success : function(rtnData) {
			if (rtnData == "1") {
				alert(srchInstNm + "은(는) 올바른 기관명입니다. 계속 진행하세요.");
				frm.instNm.readonly = true;
				instChkVal = "1";
			} else {
				alert("올바른 기관명이 아닙니다. 올바른 기관명을 기입하십시오.");
			}
		}, 
		error : function(request, status, error) {
			alert("올바른 기관명이 아닙니다. 올바른 기관명을 기입하십시오.");
		}
	});
}

//체크버튼을 누른 후 값을 변경시 등록 유효성을 통과하는 버그를 발견해 oninput 이벤트를 통해 체크 통과해도 값변경시 등록 못하게 막음.
function resetChk(){
	instChkVal = "0";
}

//관련 자원 추가를 위한 문화자원 목록을 불러오는 팝업 함수
function goClrcsInfo(id){
	
$( '#clrcsPop' ).load("<c:url value='/dgtlClcMgt/getClrcsList.do'/>"+"?popExbiId="+id);

admin.modalsShow('modals'); 
	
}
//컬렉션 관련자원 정보 수정(전시 여부)
function goUpdateRelInfo(exbiId){
	
	var relCnt = document.getElementById("relCnt").value;
	
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
	
//관련 목록에서 문화자원 삭제하는 함수	
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

//파일 태그가 변화가 있으면 발동되는 함수
$("input[name=thumnailFile]").off().on("change", function(){
	
	//첨부 가능 파일 
	const fileTypes = ['image/xbm', 'image/tif', 'image/jfif', 'image/ico', 'image/tiff', 'image/gif', 'image/svg', 'image/jpeg', 'image/svgz', 'image/jpg', 'image/webp','image/png', 'image/bmp', 'image/pjp', 'image/apng', 'image/pjpeg', 'image/avif'];
	
	if (this.files && this.files[0]) {

		//최대 첨부 가능 파일 크기 (20MB)
		var maxSize = 20 * 1024 * 1024;
		
		var fileSize = this.files[0].size;

		if(fileSize > maxSize){
			alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
			$(this).val('');
			return false;
		}
	}
	if(validFileType(this.files[0])){
		//해당될 경우 그냥 넘어가기
	}
	else{
		alert("첨부파일은 이미지만 등록 가능합니다.");
		$(this).val('');
		return false;
	}
	
	//파일타입을 돌면서 있는지 확인
	function validFileType(file) {
	  return fileTypes.includes(file.type);
	}
	
});



</script>