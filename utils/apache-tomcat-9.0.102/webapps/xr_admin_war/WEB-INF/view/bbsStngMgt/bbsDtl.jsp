<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
</style>
<div class="contants">
	<div class="table-wrap write">
		<form name="frmDtlSrch" id="frmDtlSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="<c:out value="${srchBbsStngInfo.paramPageNo}"/>">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchType" name="srchType" value="<c:out value="${srchBbsStngInfo.paramBbsSrchDiv}"/>">
			<input type="hidden" id="srchString" name="srchString" value="<c:out value="${srchBbsStngInfo.paramBbsSrchString}"/>">
			<input type="hidden" id="srchBbsType" name="srchBbsType" value="<c:out value="${srchBbsStngInfo.paramBbsTypeCd}"/>">
			<input type="hidden" id="srchUseYn" name="srchUseYn" value="<c:out value="${srchBbsStngInfo.paramUseYn}"/>">
			<input type="hidden" id="srchBbsId" name="srchBbsId" value="<c:out value="${srchBbsStngInfo.paramBbsId}"/>">
		</form>
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:15%"></col>
				<col style="width:35%"></col>
				<col style="width:15%"></col>
				<col style="width:35%"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>게시판 아이디</th>
					<td><c:out value="${bbsStngInfo.bbsId}"/></td>
					<th>게시판 유형</th>
					<td><c:out value="${bbsStngInfo.bbsTypeNm}"/></td>
				</tr>
				<tr>
					<th>게시판 명</th>
					<td colspan="3"><c:out value="${bbsStngInfo.bbsNm}"/></td>
				</tr>
				<tr>
					<th>게시판 설명</th>
					<td colspan="3"><c:out value="${bbsStngInfo.bbsExpln}"/></td>
				</tr>
				<tr>
					<th>게시판 분류</th>
					<td colspan="3">
						<div class="table-wrap table-small list">
							<table>
								<caption></caption>
								<colgroup>
									<col style="width:50px"></col>
									<col style="width:100px"></col>
									<col style="width:300px"></col>
									<col style="width:50px"></col>
									<col style="width:100px"></col>
									<col style="width:100px"></col>
									<col style="width:150px"></col>
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>분류코드</th>
										<th>분류명</th>
										<th>순번</th>
										<th>사용여부</th>
										<th>등록자</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${!empty bbsClsfCdList}">
									<c:forEach var="bbsClsfCdData" items="${bbsClsfCdList}" varStatus="status">
									<tr>
										<td><c:out value="${bbsClsfCdData.listClsfNo}"/></td>
										<td><c:out value="${bbsClsfCdData.clsfCd}"/></td>
										<td><c:out value="${bbsClsfCdData.clsfNm}"/></td>
										<td><c:out value="${bbsClsfCdData.sortSn}"/></td>
										<td><c:out value="${bbsClsfCdData.useYnNm}"/></td>
										<td><c:out value="${bbsClsfCdData.frstRgtrId}"/></td>
										<td><c:out value="${bbsClsfCdData.frstRegDtV19}"/></td>
									</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty bbsClsfCdList}">
									<tr>
										<td colspan="7" class="tc">No Data</td>
									</tr>
								</c:if>
								</tbody>
							</table>
						</div>
						<c:if test="${UserAuthrtInfo.wrtAuthrtYn == 'Y' or UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
						<div class="btn-wrap align-right">
							<button type="button" class="btns size-small" id="btnPopClsf" name="btnPopClsf" onclick="javascript:moveOpenPopupList('<c:out value="${bbsStngInfo.bbsId}"/>'); return false;">관리</button>
						</div>
						</c:if>
					</td>
				</tr>
				<tr style="display:none;">
					<th>답변 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="ansUseYnY" name="ansUseYn" value="Y" <c:if test="${bbsStngInfo.ansUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ANSUSE', 'ansUseYnY', 'ansUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ansUseYnY">ON</label></span>
							<span><input type="radio" id="ansUseYnN" name="ansUseYn" value="N" <c:if test="${bbsStngInfo.ansUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ANSUSE', 'ansUseYnY', 'ansUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ansUseYnN">OFF</label></span>
						</div>
					</td>
					<th>비공개 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="prvtUseYnY" name="prvtUseYn" value="Y" <c:if test="${bbsStngInfo.prvtUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('PRVTUSE', 'prvtUseYnY', 'prvtUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="prvtUseYn">ON</label></span>
							<span><input type="radio" id="prvtUseYnN" name="prvtUseYn" value="N" <c:if test="${bbsStngInfo.prvtUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('PRVTUSE', 'prvtUseYnY', 'prvtUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="prvtUseYn">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>통합검색 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="itgSrchYnY" name="itgSrchYn" value="Y" <c:if test="${bbsStngInfo.itgSrchYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ITGSRCH', 'itgSrchYnY', 'itgSrchYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="itgSrchYnY">ON</label></span>
							<span><input type="radio" id="itgSrchYnN" name="itgSrchYn" value="N" <c:if test="${bbsStngInfo.itgSrchYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ITGSRCH', 'itgSrchYnY', 'itgSrchYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="itgSrchYnN">OFF</label></span>
						</div>
					</td>
					<th>연결콘텐츠 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="lnkgContsUseYnY" name="lnkgContsUseYn" value="Y" <c:if test="${bbsStngInfo.lnkgContsUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('LNKGCONTSUSE', 'lnkgContsUseYnY', 'lnkgContsUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="lnkgContsUseYnY">ON</label></span>
							<span><input type="radio" id="lnkgContsUseYnN" name="lnkgContsUseYn" value="N" <c:if test="${bbsStngInfo.lnkgContsUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('LNKGCONTSUSE', 'lnkgContsUseYnY', 'lnkgContsUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="lnkgContsUseYnN">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>알림 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="ntfcUseYnY" name="ntfcUseYn" value="Y" <c:if test="${bbsStngInfo.ntfcUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NTFCUSE', 'ntfcUseYnY', 'ntfcUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntfcUseYnY">ON</label></span>
							<span><input type="radio" id="ntfcUseYnN" name="ntfcUseYn" value="N" <c:if test="${bbsStngInfo.ntfcUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NTFCUSE', 'ntfcUseYnY', 'ntfcUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntfcUseYnN">OFF</label></span>
						</div>
					</td>
					<th>확인 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="idntyUseYnY" name="idntyUseYn" value="Y" <c:if test="${bbsStngInfo.idntyUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('IDNTUSE', 'idntyUseYnY', 'idntyUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="idntyUseYnY">ON</label></span>
							<span><input type="radio" id="idntyUseYnN" name="idntyUseYn" value="N" <c:if test="${bbsStngInfo.idntyUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('IDNTUSE', 'idntyUseYnY', 'idntyUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="idntyUseYnN">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>진행상태 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="prgrsSttsUseYnY" name="prgrsSttsUseYn" value="Y" <c:if test="${bbsStngInfo.prgrsSttsUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('PRGRSSTTSUSE', 'prgrsSttsUseYnY', 'prgrsSttsUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="prgrsSttsUseYnY">ON</label></span>
							<span><input type="radio" id="prgrsSttsUseYnN" name="prgrsSttsUseYn" value="N" <c:if test="${bbsStngInfo.prgrsSttsUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('PRGRSSTTSUSE', 'prgrsSttsUseYnY', 'prgrsSttsUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="prgrsSttsUseYnN">OFF</label></span>
						</div>
					</td>
					<th>평점 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="rtngUseYnY" name="rtngUseYn" value="Y" <c:if test="${bbsStngInfo.rtngUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('RTNGUSE', 'rtngUseYnY', 'rtngUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="rtngUseYnY">ON</label></span>
							<span><input type="radio" id="rtngUseYnN" name="rtngUseYn" value="N" <c:if test="${bbsStngInfo.rtngUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('RTNGUSE', 'rtngUseYnY', 'rtngUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="rtngUseYnN">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>추천 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="rcmdtnUseYnY" name="rcmdtnUseYn" value="Y" <c:if test="${bbsStngInfo.rcmdtnUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('RCMDTNUSE', 'rcmdtnUseYnY', 'rcmdtnUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="rcmdtnUseYnY">ON</label></span>
							<span><input type="radio" id="rcmdtnUseYnN" name="rcmdtnUseYn" value="N" <c:if test="${bbsStngInfo.rcmdtnUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('RCMDTNUSE', 'rcmdtnUseYnY', 'rcmdtnUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="rcmdtnUseYnN">OFF</label></span>
						</div>
					</td>
					<th>비공감 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="opseUseYnY" name="opseUseYn" value="Y" <c:if test="${bbsStngInfo.opseUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('OPSEUSE', 'opseUseYnY', 'opseUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="opseUseYnY">ON</label></span>
							<span><input type="radio" id="opseUseYnN" name="opseUseYn" value="N" <c:if test="${bbsStngInfo.opseUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('OPSEUSE', 'opseUseYnY', 'opseUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="opseUseYnN">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>게시판 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="useYnY" name="useYn" value="Y" <c:if test="${bbsStngInfo.useYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('USE', 'useYnY', 'useYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="useYnY">ON</label></span>
							<span><input type="radio" id="useYnN" name="useYn" value="N" <c:if test="${bbsStngInfo.useYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('USE', 'useYnY', 'useYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="useYnN">OFF</label></span>
						</div>
					</td>
					<th>댓글 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="cmntUseYnY" name="cmntUseYn" value="Y" <c:if test="${bbsStngInfo.cmntUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('CMNTUSE', 'cmntUseYnY', 'cmntUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="cmntUseYnY">ON</label></span>
							<span><input type="radio" id="cmntUseYnN" name="cmntUseYn" value="N" <c:if test="${bbsStngInfo.cmntUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('CMNTUSE', 'cmntUseYnY', 'cmntUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="cmntUseYnN">OFF</label></span>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>공지 게시 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="ntcPstgUseYnY" name="ntcPstgUseYn" value="Y" <c:if test="${bbsStngInfo.ntcPstgUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NTCPSTGUSE', 'ntcPstgUseYnY', 'ntcPstgUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntcPstgUseYnY">ON</label></span>
							<span><input type="radio" id="ntcPstgUseYnN" name="ntcPstgUseYn" value="N" <c:if test="${bbsStngInfo.ntcPstgUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NTCPSTGUSE', 'ntcPstgUseYnY', 'ntcPstgUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="ntcPstgUseYnN">OFF</label></span>
						</div>
					</td>
					<th>공지 개수 / 게시 기한</th>
					<td>
						<c:choose>
							<c:when test="${bbsStngInfo.atchFileUseYn == 'Y'}">
								<c:if test="${bbsStngInfo.ntcPstgLmtCnt == 0}">제한 없음</c:if><c:if test="${bbsStngInfo.ntcPstgLmtCnt > 0}"><c:out value="${bbsStngInfo.ntcPstgLmtCnt}"/></c:if>
								/ <c:if test="${bbsStngInfo.ntcEndTermDayCnt == 0}">해제시</c:if><c:if test="${bbsStngInfo.ntcEndTermDayCnt > 0}"> 게시일로부터 <c:out value="${bbsStngInfo.ntcEndTermDayCnt}"/> 일</c:if>
							</c:when>
							<c:otherwise>
								사용 안함
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr style="display:none;">
					<th>신규 표시 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="newIndctYnY" name="newIndctYn" value="Y" <c:if test="${bbsStngInfo.newIndctYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NEWINDCT', 'newIndctYnY', 'newIndctYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="newIndctYnY">ON</label></span>
							<span><input type="radio" id="newIndctYnN" name="newIndctYn" value="N" <c:if test="${bbsStngInfo.newIndctYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('NEWINDCT', 'newIndctYnY', 'newIndctYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="newIndctYnN">OFF</label></span>
						</div>
					</td>
					<th>신규 표시 기한</th>
					<td>
						<c:choose>
							<c:when test="${bbsStngInfo.newIndctYn == 'Y'}">
								등록일로부터 ${bbsStngInfo.newIndctTermDayCnt} 일
							</c:when>
							<c:otherwise>
								사용 안함
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr style="display:none;">
					<th>첨부파일 사용 여부</th>
					<td>
						<div class="switch-button" data-size="w200">
							<span><input type="radio" id="atchFileUseYnY" name="atchFileUseYn" value="Y" <c:if test="${bbsStngInfo.atchFileUseYn == 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ATCHFILEUSE', 'atchFileUseYnY', 'atchFileUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="atchFileUseYnY">ON</label></span>
							<span><input type="radio" id="atchFileUseYnN" name="atchFileUseYn" value="N" <c:if test="${bbsStngInfo.atchFileUseYn != 'Y'}">checked</c:if> <c:if test="${srchBbsStngInfo.paramChangeBtnYn == 'Y'}">onclick="javascript:goChangeSwichUse('ATCHFILEUSE', 'atchFileUseYnY', 'atchFileUseYnN');"</c:if><c:if test="${srchBbsStngInfo.paramChangeBtnYn != 'Y'}">disabled</c:if>/><label for="atchFileUseYnN">OFF</label></span>
						</div>
					</td>
					<th>첨부파일 설정</th>
					<td>
						<span class="">최대 업로드 파일 수 : </span> <c:out value="${bbsStngInfo.atchFileLmtCnt}"/>
						/<span class="">최대 업로드 용량 : </span> 
							<c:if test="${bbsStngInfo.atchFileLmtSzMb == 0}">무제한</c:if><c:if test="${bbsStngInfo.atchFileLmtSzMb > 0}"><c:out value="${bbsStngInfo.atchFileLmtSzMb}"/> MB</c:if>
					</td>
				</tr>
				<tr style="display:none;">
					<th>첨부 가능 파일</th>
					<td colspan="3">
						<div class="fm-check">
							<c:if test="${!empty bbsAtchFileInfoList}">
								<c:forEach var="bbsAtchFileData" items="${bbsAtchFileInfoList}" varStatus="status">
								<span class="fm-ele">
									<input type="checkbox" id="<c:out value="${bbsAtchFileData.fileExtnCd}"/>" name="atchFileExtnCd" value="<c:out value="${bbsAtchFileData.fileExtnCd}"/>" <c:if test="${bbsAtchFileData.fileExtnUseYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
									<label for="<c:out value="${bbsAtchFileData.fileExtnCd}"/>"><c:out value="${bbsAtchFileData.fileExtnNm}"/></label>
								</span>
								</c:forEach>
							</c:if>
						</div>
					</td>
				</tr>
				<tr style="display:none;">
					<th>페이지 표시 수</th>
					<td><c:out value="${bbsStngInfo.pageOtptNocs}"/></td>
					<th>페이지 게시물 수</th>
					<td><c:out value="${bbsStngInfo.artclOtptNocs}"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="btnList" onclick="javascript:goListBbsInfo(); return false;">목록</button>
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn == 'Y'}">
		<button type="button" class="btns" id="btnEdit" onclick="javascript:goEditBbsInfo(); return false;">수정</button>
		</c:if>
	</div>
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:55%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script>
	function goChangeSwichUse(paramCheckData, paramElementId1, paramElementId2) {
		if (confirm("변경하시겠습니까?")) {
			if ($("#" + paramElementId1).is(':checked') == true) {
				paramUseValue = "Y";
			} else {
				paramUseValue = "N";
			}
			$.ajax({
				type : "GET",
				url : contextPath + "/bbsStngMgt/updateBbsStngUseInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"checkBbsId" : '${bbsStngInfo.bbsId}',
					"checkUseCd" : paramCheckData,
					"checkUseValue" : paramUseValue
				},
				success : function(rtnData) {
					if (rtnData == "Y") {
						alert("변경되었습니다.");
					} else {
						alert("데이터 이상으로 변경되지 못했습니다. 관리자에게 문의하십시오.");
						if (paramUseValue == "Y") {
							$("#" + paramElementId1).prop('checked', true);
						} else {
							$("#" + paramElementId2).prop('checked', true);
						}
						return false;
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			if (paramUseValue == "Y") {
				$("#" + paramElementId2).prop('checked', true);
			} else {
				$("#" + paramElementId1).prop('checked', true);
			}
			return false;
		}
	}
	
	function goListBbsInfo() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/bbsStngMgt/bbsList.do";
		frm.submit();
	}
	
	function goEditBbsInfo() {
		let frm = document.frmDtlSrch;
		frm.srchWrtMode.value = "edit";
		frm.action = contextPath + "/bbsStngMgt/bbsReg.do"
		frm.submit();
	}
	
	function moveOpenPopupList(paramDataString) {
		let paramUrl = contextPath + "/bbsStngMgt/popBbsClsfList.do";
		if (paramDataString != "") {
			$(".pop-layer").load(paramUrl + "?srchPopBbsId=" + paramDataString);
			admin.modalsShow('modals'); 
		}
	}
	
	function goBbsDtlReload() {
		let frmD = document.frmDtlSrch;
		frmD.action = contextPath + "/bbsStngMgt/bbsDtl.do";
		frmD.submit();
	} 
	
	//팝업 닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
		goBbsDtlReload();
	}
</script>