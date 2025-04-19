<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<div class="contants">
	<div class="table-wrap write">
		<form name="frmRegSrch" id="frmRegSrch" method="post" action="#" enctype="multipart/form-data">
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
			<table>
				<colgroup>
					<col width="150px"><col width="*"><col width="150px"><col width="*"><col width="150px"><col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>제목 <span class="required">필수</span></th>
						<td colspan="5">
							<div class="fm-ele" data-size="w600"  style="text-align: left; display: block;">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="text" id="evntTtl" name="evntTtl" value=""  placeholder="이벤트 제목을 입력하세요.">
									<label for="evntTtl" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="text" id="evntTtl" name="evntTtl" value="<c:out value="${evntInfo.evntTtl }"/>"  placeholder="이벤트 제목을 입력하세요.">
									<label for="evntTtl" class="blind"/>
								</c:if>
								<%-- 당첨글 등록시 [이벤트 당첨자 발표] 를 기본적으로 붙여준다. --%>
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="text" id="evntTtl" name="evntTtl" value="[이벤트 당첨자 발표] <c:out value="${evntInfo.evntTtl }"/>"  placeholder="이벤트 제목을 입력하세요.">
									<label for="evntTtl" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="text" id="evntTtl" name="evntTtl" value="<c:out value="${evntWinnerInfo.pstTtl}"/>"  placeholder="이벤트 제목을 입력하세요.">
									<label for="evntTtl" class="blind"/>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<c:if test="${evntVO.srchWrtMode eq 'entry'}">
							<th>썸네일<span class="required">필수</span></th>
							<td colspan="5">
								<div class="filebox-wrap">
									<div class="fm-filebox file-one">
										<input type="hidden" id="rprsImgGroupId" name="rprsImgGroupId" value="">
										<input type="file" name="thumnailFile" id="thumnailFile" accept="image/*" multiple>
										<label for="thumnailFile">파일선택</label>
									</div>
								</div>
								 <p>썸네일 이미지 권장사이즈는 780 X 360 입니다.</p>
							</td>  	 
								</c:if>    
						<c:if test="${evntVO.srchWrtMode eq 'edit'}">
								<th>썸네일<span class="required">필수</span></th>
								<td colspan="5">
									<div class="filebox-wrap">
										<div class="fm-filebox file-one">
											<input type="hidden" id="rprsImgGroupId" name="rprsImgGroupId" value="<c:out value="${evntInfo.rprsImgGroupId }"/>">
											<input type="file" name="thumnailFile" id="thumnailFile" accept="image/*" multiple>
											<label for="thumnailFile">파일선택</label>
										</div>
									</div>
									<p>썸네일 이미지 권장사이즈는 780 X 360 입니다.</p>
								</td>   
						</c:if>    
					</tr>
					<tr>
						<th>이벤트 시작일 <span class="required">필수</span></th>
						<td>
							<div class="fm-ele date">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="date" id="bgngYmd" name="bgngYmd" value="" placeholder="시작 일자"/>
									<label for="bgngYmd" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="date" id="bgngYmd" name="bgngYmd" value="<c:out value="${evntInfo.bgngYmd}"/>" placeholder="시작 일자"/>
									<label for="bgngYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="date" id="bgngYmd" name="bgngYmd" value="<c:out value="${evntInfo.bgngYmd}"/>" placeholder="시작 일자" readonly="readonly"/>
									<label for="bgngYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="date" id="bgngYmd" name="bgngYmd" value="<c:out value="${evntInfo.bgngYmd}"/>" placeholder="시작 일자" readonly="readonly"/>
									<label for="bgngYmd" class="blind"/>
								</c:if>
							</div >
						</td>
						<th>이벤트 종료일 <span class="required">필수</span></th>
						<td>
							<div class="fm-ele date">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="date" id="endYmd" name="endYmd" value="" placeholder="종료 일자"/>
									<label for="endYmd" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="date" id="endYmd" name="endYmd" value="<c:out value="${evntInfo.endYmd}"/>" placeholder="종료 일자" />
									<label for="endYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="date" id="endYmd" name="endYmd" value="<c:out value="${evntInfo.endYmd}"/>" placeholder="종료 일자" readonly="readonly"/>
									<label for="endYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="date" id="endYmd" name="endYmd" value="<c:out value="${evntInfo.endYmd}"/>" placeholder="종료 일자" readonly="readonly"/>
									<label for="endYmd" class="blind"/>
								</c:if>
							</div>
						</td>
						<th>당첨자 발표일 <span class="required">필수</span></th>
						<td>
							<div class="fm-ele date">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="date" id="slctnNtcYmd" name="slctnNtcYmd" value="" placeholder="당첨자 발표 일자"/>
									<label for="slctnNtcYmd" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="date" id="slctnNtcYmd" name="slctnNtcYmd" value="<c:out value="${evntInfo.slctnNtcYmd}"/>" placeholder="당첨자 발표 일자"/>
									<label for="slctnNtcYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="date" id="slctnNtcYmd" name="slctnNtcYmd" value="<c:out value="${evntInfo.slctnNtcYmd}"/>" placeholder="당첨자 발표 일자" readonly="readonly"/>
									<label for="slctnNtcYmd" class="blind"/>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="date" id="slctnNtcYmd" name="slctnNtcYmd" value="<c:out value="${evntInfo.slctnNtcYmd}"/>" placeholder="당첨자 발표 일자" readonly="readonly"/>
									<label for="slctnNtcYmd" class="blind"/>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<c:if test="${evntVO.srchWrtMode eq 'edit'}">
							<th>행사 진행 상태</th>
							<td>
								<div class="fm-focus fm-select server-bind">
									<select id="evntSttsCd" name="evntSttsCd" style="padding-left: 10px;">
										<option value="E01" <c:if test="${evntInfo.evntSttsCd == 'E01'}">selected</c:if>>예정</option>
										<option value="E02" <c:if test="${evntInfo.evntSttsCd == 'E02'}">selected</c:if>>진행</option>
										<option value="E03" <c:if test="${evntInfo.evntSttsCd == 'E03'}">selected</c:if>>종료</option>
									</select>
									<label for="evntSttsCd" class="blind"/>
								</div>
							</td>
						</c:if>
						<c:if test="${evntVO.srchWrtMode eq 'winner'}">
							<th>행사 진행 상태</th>
							<td>
								<div class="fm-focus fm-select server-bind">
									<select id="evntSttsCd" name="evntSttsCd" style="padding-left: 10px;" disabled="disabled">
										<option value="E01" <c:if test="${evntInfo.evntSttsCd == 'E01'}">selected</c:if>>예정</option>
										<option value="E02" <c:if test="${evntInfo.evntSttsCd == 'E02'}">selected</c:if>>진행</option>
										<option value="E03" <c:if test="${evntInfo.evntSttsCd == 'E03'}">selected</c:if>>종료</option>
									</select>
									<label for="evntSttsCd" class="blind"/>
								</div>
							</td>
						</c:if>	
						<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
							<th>행사 진행 상태</th>
							<td>
								<div class="fm-focus fm-select server-bind">
									<select id="evntSttsCd" name="evntSttsCd" style="padding-left: 10px;" disabled="disabled">
										<option value="E01" <c:if test="${evntInfo.evntSttsCd == 'E01'}">selected</c:if>>예정</option>
										<option value="E02" <c:if test="${evntInfo.evntSttsCd == 'E02'}">selected</c:if>>진행</option>
										<option value="E03" <c:if test="${evntInfo.evntSttsCd == 'E03'}">selected</c:if>>종료</option>
									</select>
									<label for="evntSttsCd" class="blind"/>
								</div>
							</td>
						</c:if>		
						<th>담당자 <span class="required">필수</span></th>
						<td>
							<div class="fm-ele" data-size="w200"  style="text-align: left; display: block;">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="text" id="picNm" name="picNm" value=""  placeholder="담당자를 입력하세요.">
									<label for="picNm" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="text" id="picNm" name="picNm" value="<c:out value="${evntInfo.picNm}"/>"  placeholder="담당자를 입력하세요.">
									<label for="picNm" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="text" id="picNm" name="picNm" value="<c:out value="${evntInfo.picNm}"/>"  placeholder="담당자를 입력하세요." readonly="readonly">
									<label for="picNm" class="blind"/>
								</c:if>	
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="text" id="picNm" name="picNm" value="<c:out value="${evntInfo.picNm}"/>"  placeholder="담당자를 입력하세요." readonly="readonly">
									<label for="picNm" class="blind"/>
								</c:if>	
							</div>
						</td>
						<th>담당자 연락처 <span class="required">필수</span></th>
						<td>
							<div class="fm-ele" data-size="w200"  style="text-align: left; display: block;">
								<c:if test="${evntVO.srchWrtMode eq 'entry'}">
									<input type="tel" id="picTelno" name="picTelno" value="" maxlength="11"  placeholder="전화번호를 입력하세요." onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" required>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'edit'}">
									<input type="tel" id="picTelno" name="picTelno" value="<c:out value="${evntInfo.picTelno}"/>" maxlength="11" placeholder="전화번호를 입력하세요." onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" required>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winner'}">
									<input type="tel" id="picTelno" name="picTelno" value="<c:out value="${evntInfo.picTelno}"/>" maxlength="11" placeholder="전화번호를 입력하세요." readonly="readonly" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" required>
								</c:if>
								<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
									<input type="tel" id="picTelno" name="picTelno" value="<c:out value="${evntInfo.picTelno}"/>" maxlength="11" placeholder="전화번호를 입력하세요." readonly="readonly" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" required>
								</c:if>
							</div>
						</td>
						<c:if test="${evntVO.srchWrtMode eq 'entry'}">
							<td colspan="2"></td>
						</c:if>	
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
							<c:if test="${evntVO.srchWrtMode eq 'entry'}">
								<textarea id="evntCn" name="evntCn" cols="50" rows="5" placeholder="이벤트 설명 입력"></textarea>
								<label for="evntCn" class="blind"/>
								<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
								<script type="text/javascript">
									var editor = CKEDITOR.replace('evntCn');
									CKEDITOR.instances.evntCn.on('key', function(e) {
										var board_text = this.getData();
										text = board_text.replace(/(<([^>]+)>)/gi, "");
										
										var svtext = CKEDITOR.instances.evntCn.getData();
										datatext = svtext.replace(/(<([^>]+)>)/gi, "");
									});
								</script>
							</c:if>    
							<c:if test="${evntVO.srchWrtMode eq 'edit'}">
								<textarea id="evntCn" name="evntCn" cols="50" rows="5" placeholder="이벤트 설명 입력"><c:out value="${evntInfo.evntCn}" /></textarea>
								<label for="evntCn" class="blind"/>
								<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
								<script type="text/javascript">
									var editor = CKEDITOR.replace('evntCn');
									CKEDITOR.instances.evntCn.on('key', function(e) {
										var board_text = this.getData();
										text = board_text.replace(/(<([^>]+)>)/gi, "");
										
										var svtext = CKEDITOR.instances.evntCn.getData();
										datatext = svtext.replace(/(<([^>]+)>)/gi, "");
									});
								</script>
							</c:if>  
							<c:if test="${evntVO.srchWrtMode eq 'winner'}">
								<textarea id="evntCn" name="evntCn" cols="50" rows="5" placeholder="이벤트 설명 입력" ><c:out value="${evntInfo.evntCn}" /><br>==================== 당첨자 List ====================</textarea>
								<label for="evntCn" class="blind"/>
								<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
								<script type="text/javascript">
									var editor = CKEDITOR.replace('evntCn');
									CKEDITOR.instances.evntCn.on('key', function(e) {
										var board_text = this.getData();
										text = board_text.replace(/(<([^>]+)>)/gi, "");
										
										var svtext = CKEDITOR.instances.evntCn.getData();
										datatext = svtext.replace(/(<([^>]+)>)/gi, "");
									});
								</script>
							</c:if>  
							<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
								<textarea id="evntCn" name="evntCn" cols="50" rows="5" placeholder="이벤트 설명 입력"><c:out value="${evntWinnerInfo.pstCn}" /></textarea>
								<label for="evntCn" class="blind"/>
								<%-- ckeditor 호출하는 부분 --%>
								<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
								<%-- textarea 를 CKEditor로 변환하는 부분 --%>
								<script type="text/javascript">
									var editor = CKEDITOR.replace('evntCn');
									//에디터에서 키보드 입력이 발생할 때마다 호출되는 함수
									CKEDITOR.instances.evntCn.on('key', function(e) {
										//에디터의 현재 내용을 html형태로 가져옴.
										var board_text = this.getData();
										//태그를 제거하고 순수 텍스트만 남김.
										text = board_text.replace(/(<([^>]+)>)/gi, "");
										var svtext = CKEDITOR.instances.evntCn.getData();
										datatext = svtext.replace(/(<([^>]+)>)/gi, "");
									});
								</script>
							</c:if>  
						</td>
					</tr>
				</tbody>
			</table>
			
		</form>
	</div>
	<%-- 작성모드에 따른 버튼 표출 다르게 처리 --%>
	<div class="list-option right mt20">
		<c:if test="${evntVO.srchWrtMode eq 'entry'}">
			<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListInfo(); return false;">목록</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'edit'}">
			<button type="button" class="btns color-gray" id="btnMoveBack" name="btnMoveBack" onclick="goBack()">취소</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'winner'}">
			<button type="button" class="btns color-gray" id="btnMoveBack" name="btnMoveBack" onclick="goBack()">취소</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
			<button type="button" class="btns color-gray" id="btnMoveBack" name="btnMoveBack" onclick="goBack()">취소</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'entry'}">
			<button type="button" class="btns" id="regBtn" name="regBtn" onclick="javascript:evntSaveInfo('entry'); return false;">저장</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'edit'}">
			<button type="button" class="btns" id="regBtn" name="regBtn" onclick="javascript:evntSaveInfo('edit'); return false;">수정</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'winner'}">
			<button type="button" class="btns" id="regBtn" name="regBtn" onclick="javascript:winnerSaveInfo('winner'); return false;">당첨글 등록</button>
		</c:if>
		<c:if test="${evntVO.srchWrtMode eq 'winnerEdit'}">
			<button type="button" class="btns" id="regBtn" name="regBtn" onclick="javascript:winnerSaveInfo('winnerEdit'); return false;">당첨글 수정</button>
		</c:if>
	</div>
</div>
<script>
	//폼값을 가지고 목록으로 돌아가는 함수
	function moveListInfo() {
		let frmR = document.frmRegSrch;
		frmR.action = contextPath + "/evntMgt/evntList.do";
		frmR.submit();
	}
	//입력 날짜를 검사하여 유효하지 않은 이벤트를 막기
	function checkDate() {
	  var bgngYmd = new Date(document.getElementById("bgngYmd").value);
	  var endYmd = new Date(document.getElementById("endYmd").value);
	  var slctnNtcYmd = new Date(document.getElementById("slctnNtcYmd").value);
	  var currentDate = new Date();
	  
	  // 현재 날짜의 시간을 00:00:00으로 설정
	  currentDate.setHours(0, 0, 0, 0);
	  
	  // 입력된 시작 날짜가 종료 날짜보다 미래인 경우 경고
	  if(endYmd <= bgngYmd) {
	    alert("시작일은 종료날짜 보다 같거나 미래일 수 없습니다.");
	    return false;
	  } 
	  
	  // 입력된 종료 날짜가 현재 날짜보다 이전인 경우 경고
	  if(endYmd <= currentDate) {
	    alert("종료일은 오늘 날짜 이후의 날짜를 선택해주세요.");
	    return false;
	  } 
	  // 입력된 당첨 날짜가 현재 날짜보다 이전인 경우 경고
	  if(slctnNtcYmd <= currentDate) {
	    alert("당첨날짜는 오늘 날짜 이후의 날짜를 선택해주세요.");
	    return false;	    
	  } 
	  
	  // 입력된 당첨 날짜가 현재 날짜보다 이전인 경우 경고
	  if(slctnNtcYmd < endYmd) {
	    alert("당첨날짜는 종료 날짜 이후의 날짜를 선택해주세요.");
	    return false;	    
	  } 
	}
	
	//값이 비었는지 유효성 검사 후 저장 요청
	function evntSaveInfo(srchWrtMode) {
		let frmR = document.frmRegSrch;
		formStrip(frmR[0]);
		if (cms_txt_is_empty(true, frmR.evntTtl)) { alert("이벤트 제목을 입력해 주십시오."); return false;}
		if(srchWrtMode == 'entry'){
			if (cms_txt_is_empty(true, frmR.thumnailFile)) { alert("이벤트 썸네일을 첨부해 주십시오."); return false;}
		}
		if(srchWrtMode == 'edit'){
			if (cms_txt_is_empty(true, frmR.rprsImgGroupId)) { alert("이벤트 썸네일을 첨부해 주십시오."); return false;}
		}
		if (cms_txt_is_empty(true, frmR.bgngYmd)) { alert("이벤트 시작일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.endYmd)) { alert("이벤트 종료일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.slctnNtcYmd)) { alert("당첨자 발표일을 입력해 주십시오."); return false;}
		var flag = checkDate();
		if(flag == false){ return false;}
		if (cms_txt_is_empty(true, frmR.picNm)) { alert("담당자명을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.picTelno)) { alert("담당자 연락처를 입력해 주십시오."); return false;}
		//CKEditor는 일반 textarea와 다르게 CKEditor 인스턴스에서 데이터를 가져와서 해당 데이터가 비어 있는지 또는 공백으로만 구성되어 있는지 확인해야 합니다.
		var data = CKEDITOR.instances.evntCn.getData();
        // HTML 태그 제거
        var textOnly = data.replace(/<[^>]*>?/gm, '');

        // 앞뒤 공백 제거 후 체크
        if (textOnly.trim() === '') {
        	alert("이벤트 내용을 입력해 주십시오."); return false;
        } 
		if (confirm("이벤트 내용을 저장하시겠습니까?")) {
			frmR.srchWrtMode.value = srchWrtMode;
			frmR.action = contextPath + "/evntMgt/evntSaveInfo.do";
			frmR.submit();
		}

	}
	
	//값이 비었는지 유효성 검사 후 저장 요청
	function winnerSaveInfo(srchWrtMode) {
		let frmR = document.frmRegSrch;
		formStrip(frmR[0]);
		if (cms_txt_is_empty(true, frmR.evntTtl)) { alert("당첨글 제목을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.bgngYmd)) { alert("이벤트 시작일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.endYmd)) { alert("이벤트 종료일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.slctnNtcYmd)) { alert("당첨자 발표일을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.picNm)) { alert("담당자명을 입력해 주십시오."); return false;}
		if (cms_txt_is_empty(true, frmR.picTelno)) { alert("담당자 연락처를 입력해 주십시오."); return false;}
		//CKEditor는 일반 textarea와 다르게 CKEditor 인스턴스에서 데이터를 가져와서 해당 데이터가 비어 있는지 또는 공백으로만 구성되어 있는지 확인해야 합니다.
		var data = CKEDITOR.instances.evntCn.getData();
        // HTML 태그 제거
        var textOnly = data.replace(/<[^>]*>?/gm, '');

        // 앞뒤 공백 제거 후 체크
        if (textOnly.trim() === '') {
        	alert("당첨글 내용을 입력해 주십시오."); return false;
        } 
		//이벤트 종료시에만 당첨글을 달 수 있게 하는 함수(사용자의 오작동을 막음)
		if(srchWrtMode == "winner"){
			var evntSttsCd = document.getElementById("evntSttsCd").value;
			if(evntSttsCd != 'E03'){
				alert("이벤트 진행 중 당첨글을 올릴 수 없습니다.");
				return false;
			}
		}
		//이벤트 종료시에만 당첨글을 달 수 있게 하는 함수(사용자의 오작동을 막음)
		if(srchWrtMode == "winnerEdit"){
			var evntSttsCd = document.getElementById("evntSttsCd").value;
			if(evntSttsCd != 'E03'){
				alert("이벤트 진행 중 당첨글을 올릴 수 없습니다.");
				return false;
			}
		}
		
		if (confirm("당첨글을 저장하시겠습니까?")) {
			frmR.srchWrtMode.value = srchWrtMode;
			frmR.action = contextPath + "/evntMgt/evntSaveInfo.do";
			frmR.submit();
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
	
	//수정 취소시 뒤로가기 지원하는 함수
	function goBack() {
	  history.back();
	}
	
</script>