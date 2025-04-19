<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">

<div class="contants">
	
	<div class="table-wrap write">
		<form name="frmBbsInfo" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="<c:out value="${srchBbsStngInfo.paramPageNo}"/>">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="<c:out value="${srchBbsStngInfo.paramWrtMode}"/>">
			<input type="hidden" id="srchType" name="srchType" value="<c:out value="${srchBbsStngInfo.paramBbsSrchDiv}"/>">
			<input type="hidden" id="srchString" name="srchString" value="<c:out value="${srchBbsStngInfo.paramBbsSrchString}"/>">
			<input type="hidden" id="srchBbsType" name="srchBbsType" value="<c:out value="${srchBbsStngInfo.paramBbsTypeCd}"/>">
			<input type="hidden" id="srchUseYn" name="srchUseYn" value="<c:out value="${srchBbsStngInfo.paramUseYn}"/>">
			<input type="hidden" id="srchBbsId" name="srchBbsId" value="<c:out value="${srchBbsStngInfo.paramBbsId}"/>">
			<input type="hidden" id="bbsAllClsfCdStts" name="bbsAllClsfCdStts" value="">
			<input type="hidden" id="bbsAllClsfCd" name="bbsAllClsfCd" value="">
			<input type="hidden" id="bbsAllClsfNm" name="bbsAllClsfNm" value="">
			<input type="hidden" id="bbsAllClsfSortSn" name="bbsAllClsfSortSn" value="">
			<input type="hidden" id="bbsAllClsfUseYn" name="bbsAllClsfUseYn" value="">
			<input type="hidden" id="bbsUseAtchFiles" name="bbsUseAtchFiles" value="">
			<input type="hidden" id="bbsNotUseAtchFiles" name="bbsNotUseAtchFiles" value="">
			<input type="hidden" id="chkDuplBbsId" name="chkDuplBbsId" value="N">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:15%"></col>
					<col style="width:35%"></col>
					<col style="width:15%"></col>
					<col style="width:35%"></col>
				</colgroup>
				<tbody>
					<c:if test="${srchBbsStngInfo.paramWrtMode eq 'entry'}">
					<tr>
						<th>
						<button class="btn-tooltip" data-tooltip="<b>게시판아이디는 영문 대문자로 3~4자까지 가능합니다!</b>">?</button>
						게시판 아이디 <span class="required">필수</span></th>
						<td colspan="3">
							<div class="fm-ele with-btn" data-size="w700">
								<input type="text" id="bbsId" name="bbsId" oninput="resetChk()" maxlength="4"  placeholder="게시판 아이디를 입력하세요" value="<c:out value=""/>"/>
								<button type="button" class="btns size-small" id="btnChkDuplId" name="btnChkDuplId" onclick="javascript:checkDuplBbsId(); return false;" style="padding: 0 20px;">중복검사</button>
							</div>
						</td>
					</tr>
					</c:if>
					<c:if test="${srchBbsStngInfo.paramWrtMode eq 'edit'}">
					<tr>
						<th>
						<button class="btn-tooltip" data-tooltip="<b>게시판아이디는 영문 대문자로 3~4자까지 가능합니다!</b>">?</button>
						게시판 아이디 <span class="required">필수</span></th>
						<td colspan="3">
							<div class="fm-ele with-btn" data-size="w700">
								<input type="text" id="bbsId" name="bbsId" placeholder="게시판 아이디를 입력하세요" oninput="resetChk()" maxlength="4"  value="<c:out value="${bbsStngInfo.bbsId}"/>"/>
								<button type="button" class="btns size-small" id="btnChkDuplId" name="btnChkDuplId" onclick="javascript:checkDuplBbsId(); return false;" style="padding: 0 20px;">중복검사</button>
							</div>
						</td>
					</tr>
					</c:if>
					<tr>
						<th>게시판 명 <span class="required">필수</span></th>
						<td colspan="3">
							<div class="fm-ele" data-size="w700">
								<input type="text" id="bbsNm" name="bbsNm" placeholder="게시판 명을 입력하세요" value="<c:out value="${bbsStngInfo.bbsNm}"/>">
							</div>
						</td>
					</tr>
					<tr>
						<th>게시판 유형 <span class="required">필수</span></th>
						<td colspan="3">
							<div class="fm-focus fm-select">
								<select id="bbsTypeCd" name="bbsTypeCd" style="">
									<option value="" <c:if test="${bbsStngInfo.bbsTypeCd == ''}">selected</c:if>>선택</option>
							<c:if test="${!empty bbsTypeCmmnCdList}">
								<c:forEach var="bbsTypeCdRow" items="${bbsTypeCmmnCdList}">
									<option value="<c:out value="${bbsTypeCdRow.cdId}"/>" <c:if test="${bbsStngInfo.bbsTypeCd == bbsTypeCdRow.cdId }">selected</c:if>><c:out value="${bbsTypeCdRow.cdNm}"/></option>
								</c:forEach>
							</c:if>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>게시판 설명</th>
						<td colspan="3">
							 <div class="fm-textarea">
								<textarea id="bbsExpln" name="bbsExpln" cols="50" rows="5" placeholder="게시판 설명을 입력하세요"><c:out value="${bbsStngInfo.bbsExpln}"/></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th>게시판 분류</th>
						<td colspan="3">
							<div class="table-wrap table-small list">
								<table>
									<caption></caption>
									<colgroup>
										<col style="*"></col>
										<col style="50px"></col>
										<col style="*"></col>
										<col style="*"></col>
										<col style="*"></col>
										<col style="*"></col>
										<col style="*"></col>
									</colgroup>
									<thead>
										<tr>
											<th>Status</th>
											<th>No</th>
											<th>분류코드</th>
											<th>분류명</th>
											<th>순번</th>
											<th>사용여부</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody  id="bbsCslfTbody">
									<c:if test="${!empty bbsClsfCdList}">
										<c:forEach var="bbsClsfCdData" items="${bbsClsfCdList}" varStatus="status">
										<tr>
											<td>
												<span id="clsfSttsView_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfSttsView" class="">M</span>
												<input type="hidden" id="clsfStts_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfStts" value="M">
											</td>
											<td>
												<span id="clsfNo_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfNo"><c:out value="${bbsClsfCdData.listClsfNo}"/></span>
												<input type="hidden" id="clsfNo_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfNoHdn" value="<c:out value="${bbsClsfCdData.listClsfNo}"/>" readonly>
											</td>
											<td>
												<div class="fm-ele" data-size="w150">
												<input type="text" id="clsfCd_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfCd" maxlength="10" value="<c:out value="${bbsClsfCdData.clsfCd}"/>" readonly>
												</div>
												<input type="hidden" id="clsfCdHdn_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfCdHdn" value="<c:out value="${bbsClsfCdData.clsfCd}"/>" readonly>
											</td>
											<td>
												<div class="fm-ele">
												<input type="text" id="clsfNm_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfNm" value="<c:out value="${bbsClsfCdData.clsfNm}"/>">
												</div>
												<input type="hidden" id="clsfNmHdn_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfNmHdn" value="<c:out value="${bbsClsfCdData.clsfNm}"/>">
											</td>
											<td>
												<div class="fm-ele">
												<input type="text" id="sortSn_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="sortSn" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="<c:out value="${bbsClsfCdData.sortSn}"/>"  maxlength="2" style="ime-mode:disabled; text-align:center;">
												</div>
												<input type="hidden" id="sortSnHdn_<c:out value="${bbsClsfCdData.listClsfNo}"/>" name="sortSnHdn" value="<c:out value="${bbsClsfCdData.sortSn}"/>">
											</td>
											<td>
												<div class="fm-focus fm-select" data-size="w100">
													<select id="clsfUseYn_<c:out value=""/><c:out value="${bbsClsfCdData.listClsfNo}"/>" name="clsfUseYn">
														<option value="Y" <c:if test="${bbsClsfCdData.useYn =='Y'}">selected</c:if>>사용</option>
														<option value="N" <c:if test="${bbsClsfCdData.useYn !='Y'}">selected</c:if>>사용안함</option>
													</select>
												</div>
												<input type="hidden" id="clsfUseYnHdn_${bbsClsfCdData.listClsfNo}" name="clsfUseYnHdn" value="<c:out value="${bbsClsfCdData.useYn}"/>">
											</td>
											<td><button type="button" class="btns size-xsmall color-red" id="btnCtgryDel_<c:out value="${bbsClsfCdData.listClsfNo}"/>" onclick="javascript:delBbsClsfCd('<c:out value="${bbsClsfCdData.listClsfNo}"/>'); return false;">삭제</button>
												<button type="button" class="btns size-xsmall color-gray" id="btnCtgryRst_<c:out value="${bbsClsfCdData.listClsfNo}"/>" onclick="javascript:rstBbsClsfCd('<c:out value="${bbsClsfCdData.listClsfNo}"/>'); return false;">복원</button>
											</td>
										</tr>
										</c:forEach>
									</c:if>
									</tbody>
								</table>
							</div>
							<div class="btn-wrap align-left">
								<button type="button" class="btns size-small" id="btnCtgryAdd" onclick="javascript:addBbsClsfCd(); return false;">추가</button>
							</div>
							
						</td>
					</tr>
					<tr style="display:none;">
						<th>답변 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="ansUseYnY" name="ansUseYn" value="Y" <c:if test="${bbsStngInfo.ansUseYn == 'Y'}">checked</c:if>/><label for="ansUseYnY">ON</label></span>
								<span><input type="radio" id="ansUseYnN" name="ansUseYn" value="N" <c:if test="${bbsStngInfo.ansUseYn != 'Y'}">checked</c:if>/><label for="ansUseYnN">OFF</label></span>
							</div>
						</td>
						<th>비공개 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="prvtUseYnY" name="prvtUseYn" value="Y" <c:if test="${bbsStngInfo.prvtUseYn == 'Y'}">checked</c:if>/><label for="prvtUseYn">ON</label></span>
								<span><input type="radio" id="prvtUseYnN" name="prvtUseYn" value="N" <c:if test="${bbsStngInfo.prvtUseYn != 'Y'}">checked</c:if>/><label for="prvtUseYn">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>통합검색 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="itgSrchYnY" name="itgSrchYn" value="Y" <c:if test="${bbsStngInfo.itgSrchYn == 'Y'}">checked</c:if>/><label for="itgSrchYnY">ON</label></span>
								<span><input type="radio" id="itgSrchYnN" name="itgSrchYn" value="N" <c:if test="${bbsStngInfo.itgSrchYn != 'Y'}">checked</c:if>/><label for="itgSrchYnN">OFF</label></span>
							</div>
						</td>
						<th>연결콘텐츠 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="lnkgContsUseYnY" name="lnkgContsUseYn" value="Y" <c:if test="${bbsStngInfo.lnkgContsUseYn == 'Y'}">checked</c:if>/><label for="lnkgContsUseYnY">ON</label></span>
								<span><input type="radio" id="lnkgContsUseYnN" name="lnkgContsUseYn" value="N" <c:if test="${bbsStngInfo.lnkgContsUseYn != 'Y'}">checked</c:if>/><label for="lnkgContsUseYnN">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>알림 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="ntfcUseYnY" name="ntfcUseYn" value="Y" <c:if test="${bbsStngInfo.ntfcUseYn == 'Y'}">checked</c:if>/><label for="ntfcUseYnY">ON</label></span>
								<span><input type="radio" id="ntfcUseYnN" name="ntfcUseYn" value="N" <c:if test="${bbsStngInfo.ntfcUseYn != 'Y'}">checked</c:if>/><label for="ntfcUseYnN">OFF</label></span>
							</div>
						</td>
						<th>확인 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="idntyUseYnY" name="idntyUseYn" value="Y" <c:if test="${bbsStngInfo.idntyUseYn == 'Y'}">checked</c:if>/><label for="idntyUseYnY">ON</label></span>
								<span><input type="radio" id="idntyUseYnN" name="idntyUseYn" value="N" <c:if test="${bbsStngInfo.idntyUseYn != 'Y'}">checked</c:if>/><label for="idntyUseYnN">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>진행상태 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="prgrsSttsUseYnY" name="prgrsSttsUseYn" value="Y" <c:if test="${bbsStngInfo.prgrsSttsUseYn == 'Y'}">checked</c:if>/><label for="prgrsSttsUseYnY">ON</label></span>
								<span><input type="radio" id="prgrsSttsUseYnN" name="prgrsSttsUseYn" value="N" <c:if test="${bbsStngInfo.prgrsSttsUseYn != 'Y'}">checked</c:if>/><label for="prgrsSttsUseYnN">OFF</label></span>
							</div>
						</td>
						<th>평점 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="rtngUseYnY" name="rtngUseYn" value="Y" <c:if test="${bbsStngInfo.rtngUseYn == 'Y'}">checked</c:if>/><label for="rtngUseYnY">ON</label></span>
								<span><input type="radio" id="rtngUseYnN" name="rtngUseYn" value="N" <c:if test="${bbsStngInfo.rtngUseYn != 'Y'}">checked</c:if>/><label for="rtngUseYnN">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>추천 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="rcmdtnUseYnY" name="rcmdtnUseYn" value="Y" <c:if test="${bbsStngInfo.rcmdtnUseYn == 'Y'}">checked</c:if>/><label for="rcmdtnUseYnY">ON</label></span>
								<span><input type="radio" id="rcmdtnUseYnN" name="rcmdtnUseYn" value="N" <c:if test="${bbsStngInfo.rcmdtnUseYn != 'Y'}">checked</c:if>/><label for="rcmdtnUseYnN">OFF</label></span>
							</div>
						</td>
						<th>비공감 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="opseUseYnY" name="opseUseYn" value="Y" <c:if test="${bbsStngInfo.opseUseYn == 'Y'}">checked</c:if>/><label for="opseUseYnY">ON</label></span>
								<span><input type="radio" id="opseUseYnN" name="opseUseYn" value="N" <c:if test="${bbsStngInfo.opseUseYn != 'Y'}">checked</c:if>/><label for="opseUseYnN">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>게시판 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="useYnY" name="useYn" value="Y" <c:if test="${bbsStngInfo.useYn == 'Y'}">checked</c:if>/><label for="useYnY">ON</label></span>
								<span><input type="radio" id="useYnN" name="useYn" value="N" <c:if test="${bbsStngInfo.useYn != 'Y'}">checked</c:if>/><label for="useYnN">OFF</label></span>
							</div>
						</td>
						<th>댓글 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="cmntUseYnY" name="cmntUseYn" value="Y" <c:if test="${bbsStngInfo.cmntUseYn == 'Y'}">checked</c:if>/><label for="cmntUseYnY">ON</label></span>
								<span><input type="radio" id="cmntUseYnN" name="cmntUseYn" value="N" <c:if test="${bbsStngInfo.cmntUseYn != 'Y'}">checked</c:if>/><label for="cmntUseYnN">OFF</label></span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>공지 게시 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="ntcPstgUseYnY" name="ntcPstgUseYn" value="Y" <c:if test="${bbsStngInfo.ntcPstgUseYn == 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('NTCPSTGUSE');"/><label for="ntcPstgUseYnY">ON</label></span>
								<span><input type="radio" id="ntcPstgUseYnN" name="ntcPstgUseYn" value="N" <c:if test="${bbsStngInfo.ntcPstgUseYn != 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('NTCPSTGUSE');"/><label for="ntcPstgUseYnN">OFF</label></span>
							</div>
						</td>
						<th>공지 개수 / 게시 기한</th>
						<td>
							<div class="fm-ele" data-size="w200">
								<span class="fm-ele">공지 개수</span>
								<input type="text" id="ntcPstgLmtCnt" name="ntcPstgLmtCnt" value="<c:out value="${bbsStngInfo.ntcPstgLmtCnt}"/>" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="2" style="ime-mode:disabled; text-align:right;" placeHolder="공지개수 입력" <c:if test="${bbsStngInfo.ntcPstgUseYn != 'Y'}">readonly</c:if>>
								<span class="fm-ele">게시 기한</span><input type="text" id="ntcEndTermDayCnt" name="ntcEndTermDayCnt" value="<c:out value="${bbsStngInfo.ntcEndTermDayCnt}"/>" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="3" style="ime-mode:disabled; text-align:right;" placeHolder="게시 기한 일수 (예:30일)" <c:if test="${bbsStngInfo.ntcPstgUseYn != 'Y'}">readonly</c:if>>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>신규 표시 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="newIndctYnY" name="newIndctYn" value="Y" <c:if test="${bbsStngInfo.newIndctYn == 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('NEWINDCT');"/><label for="newIndctYnY">ON</label></span>
								<span><input type="radio" id="newIndctYnN" name="newIndctYn" value="N" <c:if test="${bbsStngInfo.newIndctYn != 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('NEWINDCT');"/><label for="newIndctYnN">OFF</label></span>
							</div>
						</td>
						<th>신규 표시 기한</th>
						<td>
							<div class="fm-ele" data-size="w200">
								<input type="text" id="newIndctTermDayCnt" name="newIndctTermDayCnt" value="<c:out value="${bbsStngInfo.newIndctTermDayCnt}"/>" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="3" style="ime-mode:disabled; text-align:right;" placeHolder="신규 표시 일수 (예:30일)" <c:if test="${bbsStngInfo.newIndctYn != 'Y'}">readonly</c:if>>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>첨부파일 사용 여부</th>
						<td>
							<div class="switch-button" data-size="w200">
								<span><input type="radio" id="atchFileUseYnY" name="atchFileUseYn" value="Y" <c:if test="${bbsStngInfo.atchFileUseYn == 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('ATCHFILEUSE');"/><label for="atchFileUseYnY">ON</label></span>
								<span><input type="radio" id="atchFileUseYnN" name="atchFileUseYn" value="N" <c:if test="${bbsStngInfo.atchFileUseYn != 'Y'}">checked</c:if> onclick="javascript:moveSetChangeControl('ATCHFILEUSE');"/><label for="atchFileUseYnN">OFF</label></span>
							</div>
						</td>
						<th>첨부파일 설정</th>
						<td>
							<div class="fm-ele"  data-size="w200">
								<span class="fm-ele">최대 업로드 파일수 : </span>
								<input type="text" id="atchFileLmtCnt" name="atchFileLmtCnt" value="<c:out value="${bbsStngInfo.atchFileLmtCnt}"/>"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="2" style="ime-mode:disabled;" <c:if test="${bbsStngInfo.atchFileUseYn != 'Y'}">readonly</c:if>>
								<span class="fm-ele">최대 업로드 용량 : </span>
								<input type="text" id="atchFileLmtSzMb" name="atchFileLmtSzMb" value="<c:out value="${bbsStngInfo.atchFileLmtSzMb}"/>"  onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="3" style="ime-mode:disabled;" <c:if test="${bbsStngInfo.atchFileUseYn != 'Y'}">readonly</c:if>><span style="float:left;">MB</span>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>첨부파일 사용 여부</th>
						<td colspan="3">
							<div class="fm-check">
							<c:if test="${!empty bbsAtchFileInfoList}">
								<c:forEach var="bbsAtchFileData" items="${bbsAtchFileInfoList}" varStatus="status">
								<span class="fm-ele">
									<input type="checkbox" id="<c:out value="${bbsAtchFileData.fileExtnCd}"/>" name="atchFileExtnCd" value="<c:out value="${bbsAtchFileData.fileExtnCd}"/>" <c:if test="${bbsAtchFileData.fileExtnUseYn == 'Y'}">checked</c:if> <c:if test="${bbsStngInfo.atchFileUseYn != 'Y'}">disabled</c:if>/>
									<label for="<c:out value="${bbsAtchFileData.fileExtnCd}"/>"><c:out value="${bbsAtchFileData.fileExtnNm}"/></label>
								</span>
								</c:forEach>
							</c:if>
							</div>
						</td>
					</tr>
					<tr style="display:none;">
						<th>페이지 표시 수</th>
						<td>
							<div class="fm-ele" data-size="w200">
								<input type="text" id="pageOtptNocs" name="pageOtptNocs" value="${bbsStngInfo.pageOtptNocs}" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="2" style="ime-mode:disabled; text-align:right;"/>
							</div>
						</td>
						<th>페이지별 게시물 수</th>
						<td>
							<div class="fm-ele" data-size="w200">
								<input type="text" id="artclOtptNocs" name="artclOtptNocs" value="${bbsStngInfo.artclOtptNocs}" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" maxlength="2" style="ime-mode:disabled; text-align:right;">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnPrev" onclick="javascript:goMovePrevPage(); return false;">이전</button>
		<button type="button" class="btns color-gray" id="btnList" onclick="javascript:goListBbsInfo(); return false;">목록</button>
		<button type="button" class="btns" id="btnSave" onclick="javascript:goEditBbsSave(); return false;">저장</button>
	</div>
</div>
<!-- 공통 Library -->
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script>

	function moveSetChangeControl(paramElement) {
		//선택에 따른 하위 Element 제어
		if (paramElement == "NTCPSTGUSE") { //공지사용
			if ($("#ntcPstgUseYnY").is(':checked') == true) {
				$("#ntcPstgLmtCnt").removeAttr("readonly");
				$("#ntcEndTermDayCnt").removeAttr("readonly");
			} else {
				$("#ntcPstgLmtCnt").attr("readonly", true);
				$("#ntcEndTermDayCnt").attr("readonly", true);
			}
		} else if (paramElement == "NEWINDCT") { //신규표시
			if ($("#newIndctYnY").is(':checked') == true) {
				$("#newIndctTermDayCnt").removeAttr("readonly");
			} else {
				$("#newIndctTermDayCnt").attr("readonly", true);
			}
		} else if (paramElement == "ATCHFILEUSE") { //첨부파일
			if ($("#atchFileUseYnY").is(':checked') == true) {
				$("#atchFileLmtCnt").removeAttr("readonly");
				$("#atchFileLmtSzMb").removeAttr("readonly");
				<c:if test="${!empty bbsAtchFileInfoList}">
				<c:forEach var="bbsAtchFData" items="${bbsAtchFileInfoList}" varStatus="status">
				$("#" + "${bbsAtchFData.fileExtnCd}").removeAttr("disabled");
				</c:forEach>
				</c:if>
			} else {
				$("#atchFileLmtCnt").attr("readonly", true);
				$("#atchFileLmtSzMb").attr("readonly", true);
				<c:if test="${!empty bbsAtchFileInfoList}">
				<c:forEach var="bbsAtchFData" items="${bbsAtchFileInfoList}" varStatus="status">
				$("#" + "${bbsAtchFData.fileExtnCd}").attr("disabled", true);
				</c:forEach>
				</c:if>
			}
			
		}
	}

	function goMovePrevPage() {
		history.back();
	}
	
	function goListBbsInfo() {
		let frm = document.frmBbsInfo;
		frm.action = contextPath + "/bbsStngMgt/bbsList.do";
		frm.submit();
	}
	
	
	function goEditBbsSave() {
		
		let frm = document.frmBbsInfo;
		let dupleChk = frm.chkDuplBbsId.value;
		if (cms_txt_is_empty(true, frm.bbsId)) { alert("게시판아이디를 입력해 주십시오."); return false;}
		
		const bigChk = /^[A-Z]{1,4}$/;
		if(bigChk.test(frm.bbsId.value) == false){
			alert("게시판아이디는 영대문자만 입력해 주십시오."); return false;
		}
		
		if(frm.srchWrtMode.value == "edit" && frm.bbsId.value == frm.srchBbsId.value){
		}
		else{
			if ("N" == dupleChk){alert("게시판 아이디 중복검사를 진행해 주십시오."); return false;}
		}
		if (cms_txt_is_empty(true, frm.bbsNm)) { alert("게시판명을 입력해 주십시오."); return false;}
		if (cms_select_is_empty(true, frm.bbsTypeCd)) { alert("게시판 유형을 선택해 주십시오."); return false;}
		
		//게시판 분류 
		let bbsClsfSttusValue = "";
		let bbsClsfCdValue = "";
		let bbsClsfNmValue = "";
		let bbsClsfSortValue = "";
		let bbsClsfUseYnValue = "";
		
		//게시판분류 parameter 초기화
		$("#bbsAllClsfCdStts").val(bbsClsfSttusValue);
		$("#bbsAllClsfCd").val(bbsClsfCdValue);
		$("#bbsAllClsfNm").val(bbsClsfNmValue);
		$("#bbsAllClsfSortSn").val(bbsClsfSortValue);
		$("#bbsAllClsfUseYn").val(bbsClsfUseYnValue);
		
		
		let chkRegExpChar = /[\{\}\[\]\/?.,;:||\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		let paramClsfNo;
		
		if (typeof(frm.clsfStts) != "undefined") {
			if (typeof(frm.clsfStts.length) != "undefined" ) {
				for (let ci = 0; ci < frm.clsfStts.length; ci++) {
					//삭제가 아닐 경우에만 유효성 체크
					if (frm.clsfStts[ci].value != "D") {
						if (cms_txt_is_empty(true, frm.clsfCd[ci])) {
							alert("분류 코드를 입력해 주십시오.");
							return false;
						} else {
							if (chkRegExpChar.test(frm.clsfCd[ci].value)) {
								alert("특수문자는 입력하실 수 없습니다." + ci);
								return false;
							} else {
								if (frm.clsfStts[ci].value != "D") {
									for (let ki = 0; ki < frm.clsfStts.length; ki++ ) {
										if ((ci != ki) && (frm.clsfStts[ki].value != "D") && (frm.clsfCd[ci].value == frm.clsfCd[ki].value)) {
											alert("중복된 분류 코드가 존재합니다.");
											return false;
										}
									}
								}
							}
						}
						if (cms_txt_is_empty(true, frm.clsfNm[ci])) {
							alert("분류 명을 입력해 주십시오.");
							return false;
						} else {
							if (chkRegExpChar.test(frm.clsfNm[ci].value)) {
								alert("특수문자는 입력하실 수 없습니다. Nm" + ci);
								return false;
							}
						}
						if (cms_txt_is_empty(true, frm.sortSn[ci])) { alert("정렬 순번을 입력해 주십시오."); return false;}
					}
					
					//수정인지 체크
					if (frm.clsfStts[ci].value == "M") {
						if ((frm.clsfNm[ci].value != frm.clsfNmHdn[ci].value) || (frm.sortSn[ci].value != frm.sortSnHdn[ci].value) || (frm.clsfUseYn[ci].value != frm.clsfUseYnHdn[ci].value)) {
							frm.clsfStts[ci].value = "U";
							paramClsfNo = frm.clsfNoHdn[ci].value;
							$("#clsfSttsView_" + paramClsfNo).text("U");
						}
					}
					
					if (bbsClsfSttusValue == "") {
						bbsClsfSttusValue = frm.clsfStts[ci].value;
						bbsClsfCdValue = frm.clsfCd[ci].value;
						bbsClsfNmValue =  frm.clsfNm[ci].value;
						bbsClsfSortValue =  frm.sortSn[ci].value;
						bbsClsfUseYnValue =  frm.clsfUseYn[ci].value;
					} else {
						bbsClsfSttusValue += "|" + frm.clsfStts[ci].value;
						bbsClsfCdValue += "|" + frm.clsfCd[ci].value;
						bbsClsfNmValue += "|" + frm.clsfNm[ci].value;
						bbsClsfSortValue += "|" + frm.sortSn[ci].value;
						bbsClsfUseYnValue += "|" + frm.clsfUseYn[ci].value;
					}
				}
			} else {
				
				//삭제가 아닐 경우에만 유효성 체크
				if (frm.clsfStts.value != "D") {
					if (cms_txt_is_empty(true, frm.clsfCd)) {
						alert("분류 코드를 입력해 주십시오.");
						return false;
					} else {
						if (chkRegExpChar.test(frm.clsfCd.value)) {
							alert("특수문자는 입력하실 수 없습니다.");
							return false;
						}
					}
					if (cms_txt_is_empty(true, frm.clsfNm)) {
						alert("분류 명을 입력해 주십시오.");
						return false;
					} else {
						if (chkRegExpChar.test(frm.clsfNm.value)) {
							alert("특수문자는 입력하실 수 없습니다. Nm");
							return false;
						}
					}
					if (cms_txt_is_empty(true, frm.sortSn)) { alert("정렬 순번을 입력해 주십시오."); return false;}
				}
				//수정인지 체크
				if (frm.clsfStts.value == "M") {
					if ((frm.clsfNm.value != frm.clsfNmHdn.value) || (frm.sortSn.value != frm.sortSnHdn.value) || (frm.clsfUseYn.value != frm.clsfUseYnHdn.value) ) {
						frm.clsfStts.value = "U";
						frm.clsfSttsView.innerHTML = "U";
					}
				}
				
				bbsClsfSttusValue = frm.clsfStts.value;
				bbsClsfCdValue = frm.clsfCd.value;
				bbsClsfNmValue = frm.clsfNm.value;
				bbsClsfSortValue = frm.sortSn.value;
				bbsClsfUseYnValue = frm.clsfUseYn.value;
			}
		
			$("#bbsAllClsfCdStts").val(bbsClsfSttusValue);
			$("#bbsAllClsfCd").val(bbsClsfCdValue);
			$("#bbsAllClsfNm").val(bbsClsfNmValue);
			$("#bbsAllClsfSortSn").val(bbsClsfSortValue);
			$("#bbsAllClsfUseYn").val(bbsClsfUseYnValue);
		}
		
		//첨부파일
		let bbsUseAtchFileValue = "";
		let bbsNotUseAtchFileValue = "";
		
		//첨부파일 parameter 초기화
		$("#bbsUseAtchFiles").val(bbsUseAtchFileValue);
		$("#bbsNotUseAtchFiles").val(bbsNotUseAtchFileValue);
		
		
		let bbsAtchFileCnt = $("input:checkbox[name=atchFileExtnCd]").length;
		if (bbsAtchFileCnt > 0) {
			$("input:checkbox[name=atchFileExtnCd]").each(function () {
				if($(this).is(":checked")==true) {
					if (bbsUseAtchFileValue == "") {
						bbsUseAtchFileValue = $(this).val();
					} else {
						bbsUseAtchFileValue += "|" + $(this).val();
					}
					
				} else {
					if (bbsNotUseAtchFileValue == "") {
						bbsNotUseAtchFileValue = $(this).val();
					} else {
						bbsNotUseAtchFileValue += "|" + $(this).val();
					}
				}
			})
			$("#bbsUseAtchFiles").val(bbsUseAtchFileValue);
			$("#bbsNotUseAtchFiles").val(bbsNotUseAtchFileValue);
		}
		
		if (confirm("저장하시겠습니까?")) {
			
			frm.action = contextPath + "/bbsStngMgt/bbsSave.do"
			frm.submit();
		}
	}
	
	function delBbsClsfCd(paramClsfNo) {
		let clsfRowStts = $("#clsfStts_" + paramClsfNo).val();
		
		if (clsfRowStts =="D") { //신규등록일 경우
			alert("이미 삭제로 변경되었습니다.");
		} else {
			if (confirm("분류를 삭제하시겠습니까?")) {
				$("#clsfCd_" + paramClsfNo).attr("readonly", true);
				$("#clsfNm_" + paramClsfNo).attr("readonly", true);
				$("#sortSn_" + paramClsfNo).attr("readonly", true);
				$("#clsfUseYn_" + paramClsfNo).attr("disabled", true);
				$("#clsfSttsView_" + paramClsfNo).text("D");
				$("#clsfStts_" + paramClsfNo).val("D");
			} else {
				return false;
			}
			
		}
	}
	
	function rstBbsClsfCd(paramClsfNo) {
		let clsfRowStts = $("#clsfStts_" + paramClsfNo).val();
		if (clsfRowStts == "M") {//데이터 변경이 없을 경우
			alert("복원할 대상이 아닙니다.");
		} else {
			if (confirm("분류를 복원하시겠습니까?")) {
				$("#clsfCd_" + paramClsfNo).removeAttr("readonly");
				$("#clsfNm_" + paramClsfNo).removeAttr("readonly");
				$("#sortSn_" + paramClsfNo).removeAttr("readonly");
				$("#clsfUseYn_" + paramClsfNo).removeAttr("disabled");
				$("#clsfCd_" + paramClsfNo).val($("#clsfCdHdn_" + paramClsfNo));
				$("#clsfNm_" + paramClsfNo).val($("#clsfNmHdn_" + paramClsfNo));
				$("#sortSn_" + paramClsfNo).val($("#sortSnHdn_" + paramClsfNo));
				$("#clsfUseYn_" + paramClsfNo).val($("#useYnHdn_" + paramClsfNo));
				$("#clsfSttsView_" + paramClsfNo).text("M");
				$("#clsfStts_" + paramClsfNo).val("M");
			} else {
				return false;
			}
		}
	}
	
	function addBbsClsfCd() {
		let tblBody, newRowNumber, newRow, newCell0, newCell1, newCell2, newCell3, newCell4, newCell5, newCell6;
		tblBody = $("#bbsCslfTbody");
		newRowNumber = tblBody[0].rows.length;
		newRow = tblBody[0].insertRow(newRowNumber);
		newCell0 = newRow.insertCell();
		newCell1 = newRow.insertCell();
		newCell2 = newRow.insertCell();
		newCell3 = newRow.insertCell();
		newCell4 = newRow.insertCell();
		newCell5 = newRow.insertCell();
		newCell6 = newRow.insertCell();
		
		viwRowNum = tblBody[0].rows.length;
		
		newCell0.innerHTML = "<span id=\"clsfSttsView_" + viwRowNum + "\" name=\"clsfSttsView\" class=\"\">I</span>";
		newCell0.innerHTML += "<input type=\"hidden\" id=\"clsfStts_" + viwRowNum + "\" name=\"clsfStts\" value=\"I\">";
		newCell1.innerHTML = "<span id=\"clsfNo_" + viwRowNum + "\" name=\"clsfNo\"  class=\"\">" + viwRowNum + "</span>";
		newCell1.innerHTML += "<input type=\"hidden\" id=\"clsfNo_" + viwRowNum + "\" name=\"clsfNoHdn\" value=\"" + viwRowNum + "\" readonly>";
		newCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"w150\"><input type=\"text\" id=\"clsfCd_" + viwRowNum + "\" name=\"clsfCd\"  maxlength=\"10\" value=\"\"></div>";
		newCell2.innerHTML += "<input type=\"hidden\" id=\"clsfCdHdn_" + viwRowNum + "\" name=\"clsfCdHdn\" value=\"\" readonly>";
		newCell3.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"clsfNm_" + viwRowNum + "\" name=\"clsfNm\"  class=\"\" value=\"\"></div>";
		newCell3.innerHTML += "<input type=\"hidden\" id=\"clsfNmHdn_" + viwRowNum + "\" name=\"clsfNmHdn\" value=\"\">";
		newCell4.innerHTML = "<div class=\"fm-ele\"><input type=\"text\" id=\"sortSn_" + viwRowNum + "\" name=\"sortSn\" class=\"\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\"  onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\"></div>";
		newCell4.innerHTML += "<input type=\"hidden\" id=\"sortSnHdn_" + viwRowNum + "\" name=\"sortSnHdn\" value=\"\">";
		newCell5.innerHTML += "<div class=\"fm-focus fm-select\" data-size=\"w100\"><select id=\"clsfUseYn_" + viwRowNum + "\" name=\"clsfUseYn\" class=\"\"><option value=\"Y\" selected>사용</option><option value=\"N\" >사용안함</option></select></div>";
		newCell5.innerHTML += "<input type=\"hidden\" id=\"clsfUseYnHdn_" + viwRowNum + "\" name=\"clsfUseYnHdn\" value=\"\">";
		newCell6.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnCtgryDel_" + viwRowNum + "\" onclick=\"javascript:delBbsClsfCd('" + viwRowNum + "'); return false;\">삭제</button>";
	}
	
	//게시판 아이디 중복여부 체크
	function checkDuplBbsId() {
		let frm = document.frmBbsInfo;
		if(frm.srchWrtMode.value == "edit" && frm.bbsId.value == frm.srchBbsId.value){
			alert("변경사항이 없습니다.");
			return false;
		}

		if (cms_txt_is_empty(true, frm.bbsId)) {
			alert("게시판 아이디를 입력해 주세요");
			return false;
		} 
		else {
			//게시판아이디 중복검사여부 초기화
			frm.chkDuplBbsId.value = "N";
			
			$.ajax({
				type : "GET",
				url : contextPath + "/bbsStngMgt/checkDuplBbsId.do",
				async : true,
				dataType : "text",
				data : {
					"checkData" : frm.bbsId.value,
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert(frm.bbsId.value + "는 이미 등록된 기관아이디입니다.");
						return false;
					} else {
						frm.chkDuplBbsId.value = "Y";
						alert("중복이 아닙니다. 계속 진행 하십시오.");
					}
				}, 
				error : function(request, status, error) {
					alert("중복검사가 미처리 되었습니다. 관리자에게 문의하십시오.");
				}
			});
			
		}
		
	}
	//체크버튼을 누른 후 값을 변경시 등록 유효성을 통과하는 버그를 발견해 oninput 이벤트를 통해 체크 통과해도 값변경시 등록 못하게 막음.
	function resetChk(){
		let frm = document.frmBbsInfo;
		//게시판아이디 중복검사여부 초기화
		frm.chkDuplBbsId.value = "N";
	}
</script>