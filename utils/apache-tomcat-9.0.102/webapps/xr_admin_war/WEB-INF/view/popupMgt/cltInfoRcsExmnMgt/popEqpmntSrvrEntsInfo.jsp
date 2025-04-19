<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>5.인프라 현황 - 3)서버 외부위탁 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	
	<c:if test="${!empty oldPopRcsExmnEqpmntSrvrEntsInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll">
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="40px"></col>
				<col width="180px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="100px"></col>
				<col width="420px"></col>
				<col width="200px"></col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2"></th>
					<th rowspan="2">외부위탁업체명</th>
					<th colspan="2">상면비용(월)</th>
					<th colspan="2">호스팅 비용</th>
					<th colspan="2">회선 사용료(월)</th>
					<th colspan="2">기타 서비스 비용</th>
				</tr>
				<tr>
					<th>Rack 개수</th>
					<th>비용</th>
					<th>Rack 개수</th>
					<th>비용</th>
					<th>트래픽(MB) (대역폭)</th>
					<th>가격(원)</th>
					<th>서비스</th>
					<th>비용</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach var="oldEqpmntSrvrEntsData" items="${oldPopRcsExmnEqpmntSrvrEntsInfoList}" varStatus="status">
				<tr>
					<td><c:out value='${status.count}'/></td>
					<td><c:out value='${oldEqpmntSrvrEntsData.extlBzentyNm}'/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.hngrRackCnt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.hngrCost}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.hstnRackCnt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.hstnCost}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.wrdTrfcCpctCnt}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.wrdUtztnChrgCost}"/></td>
					<td style="text-align:left;">
					<c:out value='${oldEqpmntSrvrEntsData.etcSrvcCnDtl}'/>
					</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldEqpmntSrvrEntsData.etcSrvcCost}"/></td>
				</tr>
		</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap table-border">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<div class="between mt20">
			<h2>[환경조사]</h2>
			<button type="button" class="btns size-xsmall" id="btnPopAddEqpmntSrvrEntsInfo" name="btnPopAddEqpmntSrvrEntsInfo" onclick="javascript:moveAddEqpmntSrvrEntsInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll div-scroll-horizontal" style="max-height:350px;">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="40px"></col>
					<col width="180px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
					<col width="420px"></col>
					<col width="100px"></col>
					<col width="100px"></col>
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2"></th>
						<th rowspan="2">외부위탁업체명
							<button class="btn-tooltip"
							data-tooltip="
							<b>장비유지관리비용 :</b>민간업체, 기관 위탁 업체 명을 표기
							">?</button>
						</th>
						<th colspan="2">상면비용(월)
							<button class="btn-tooltip"
							data-tooltip="
							<b>상면 및 회선 :</b>상면의 경우1U, 2U, 4U, 1PC, 1/4Quarter Rack, 1/2Half Rack, Full Rack과 회선은 10Mbps, 50Mbps, 100Mbps 등
							">?</button>
						</th>
						<th colspan="2">호스팅 비용</th>
						<th colspan="2">회선 사용료(월)
							<button class="btn-tooltip"
							data-tooltip="
							<b>회선 사용료 :</b>월간 계약 트랙픽(대역폭)과 비용을 표기
							">?</button>
						</th>
						<th colspan="2">기타 서비스 비용
							<button class="btn-tooltip"
							data-tooltip="
							<b>기타 서비스 비용 :</b>OS설치, ARM(Apache_PHP_MySQL)설치, 메일, FTP및 DNS설치, 업데이트 설정, 백업설정, 이전서비스, NMS(방화벽, 트래픽 모니터링 등)서비스
							">?</button>
						</th>
						<th rowspan="2"></th>
					</tr>
					<tr>
						<th>Rack 개수</th>
						<th>비용</th>
						<th>Rack 개수</th>
						<th>비용</th>
						<th>트래픽(MB) (대역폭)</th>
						<th>가격(원)</th>
						<th>서비스</th>
						<th>비용</th>
					</tr>
				</thead>
				<tbody id="popTblTbody">
		<c:if test="${!empty nowPopRcsExmnEqpmntSrvrEntsInfoList}">
			<c:forEach var="nowEqpmntSrvrEntsData" items="${nowPopRcsExmnEqpmntSrvrEntsInfoList}" varStatus="status">
					<tr>
						<td><c:out value='${status.count}'/></td>
						<td>
							<div class="fm-ele" data-size="100p">
								<input type="hidden" id="popStts_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popStts" value="M">
								<input type="hidden" id="popExtlBzentySn_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popExtlBzentySn" value="${nowEqpmntSrvrEntsData.extlBzentySn}">
								<input type="text" id="popExtlBzentyNm_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popExtlBzentyNm" value="${nowEqpmntSrvrEntsData.extlBzentyNm}">
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHngrRackCnt_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popHngrRackCnt"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.hngrRackCnt}" style="ime-mode:disabled;" placeholder="Rack 개수 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHngrCost_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popHngrCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.hngrCost}" style="ime-mode:disabled;" placeholder="상면비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHstnRackCnt_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popHstnRackCnt"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.hstnRackCnt}" style="ime-mode:disabled;" placeholder="Rack 개수 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHstnCost_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popHstnCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.hstnCost}" style="ime-mode:disabled;" placeholder="호스팅 비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popWrdTrfcCpctCnt_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popWrdTrfcCpctCnt"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.wrdTrfcCpctCnt}" style="ime-mode:disabled;" placeholder="트래픽 대역폭 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popWrdUtztnChrgCost_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popWrdUtztnChrgCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.wrdUtztnChrgCost}" style="ime-mode:disabled;" placeholder="회선 가격 입력"></div></td>
						<td style="text-align:left;"><input type="hidden" id="popEtcSrvcCd1_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd1" value="${nowEqpmntSrvrEntsData.etcSrvcCd1}">
							<input type="hidden" id="popEtcSrvcCd2_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd2" value="${nowEqpmntSrvrEntsData.etcSrvcCd2}">
							<input type="hidden" id="popEtcSrvcCd3_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd3" value="${nowEqpmntSrvrEntsData.etcSrvcCd3}">
							<input type="hidden" id="popEtcSrvcCd4_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd4" value="${nowEqpmntSrvrEntsData.etcSrvcCd4}">
							<input type="hidden" id="popEtcSrvcCd5_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd5" value="${nowEqpmntSrvrEntsData.etcSrvcCd5}">
							<input type="hidden" id="popEtcSrvcCd6_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd6" value="${nowEqpmntSrvrEntsData.etcSrvcCd6}">
							<input type="hidden" id="popEtcSrvcCd7_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCd7" value="${nowEqpmntSrvrEntsData.etcSrvcCd7}">
							<div class="fm-check fm-list">
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0001_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0001" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd1 == 'ETCSVC0001'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0001', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0001_${nowEqpmntSrvrEntsData.extlBzentySn}">OS설치</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0002_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0002" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd2 == 'ETCSVC0002'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0002', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0002_${nowEqpmntSrvrEntsData.extlBzentySn}">ARM(Apach+PHP+MySQL)설치</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0003_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0003" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd3 == 'ETCSVC0003'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0003', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0003_${nowEqpmntSrvrEntsData.extlBzentySn}">메일, FTP및DNS설치</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0004_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0004" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd4 == 'ETCSVC0004'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0004', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0004_${nowEqpmntSrvrEntsData.extlBzentySn}">업데이트설정</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0005_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0005" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd5 == 'ETCSVC0005'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0005', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0005_${nowEqpmntSrvrEntsData.extlBzentySn}">백업설정</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0006_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0006" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd6 == 'ETCSVC0006'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0006', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0006_${nowEqpmntSrvrEntsData.extlBzentySn}">이전서비스</label></span>
								<span class="fm-ele"><input type="checkbox" id="ETCSVC0007_${nowEqpmntSrvrEntsData.extlBzentySn}" value="ETCSVC0007" name="popEtcSrvcCd_${nowEqpmntSrvrEntsData.extlBzentySn}" <c:if test="${nowEqpmntSrvrEntsData.etcSrvcCd7 == 'ETCSVC0007'}">checked</c:if> onclick="javascript:moveChangeEtcSrvcCd('ETCSVC0007', '${nowEqpmntSrvrEntsData.extlBzentySn}');"><label for="ETCSVC0007_${nowEqpmntSrvrEntsData.extlBzentySn}">NMS(방화벽,트래픽모니터링등)서비스</label></span>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100P"><input type="text" id="popEtcSrvcCost_${nowEqpmntSrvrEntsData.extlBzentySn}" name="popEtcSrvcCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="${nowEqpmntSrvrEntsData.etcSrvcCost}" style="ime-mode:disabled;" placeholder="기타서비스 비용 입력"></div></td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteSrvrEntsRow_${nowEqpmntSrvrEntsData.extlBzentySn}" name="btnPopDeleteSrvrEntsRow" onclick="javascript:moveDeleteEqpmntSrvrEntsInfo('${nowEqpmntSrvrEntsData.extlBzentySn}'); return false;">삭제</button></td>
					</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty nowPopRcsExmnEqpmntSrvrEntsInfoList}">
					<tr>
						<td>1</td>
						<td>
							<div class="fm-ele" data-size="100p">
								<input type="hidden" id="popStts_1" name="popStts" value="I">
								<input type="hidden" id="popExtlBzentySn_1" name="popExtlBzentySn" value="0">
								<input type="text" id="popExtlBzentyNm_1" name="popExtlBzentyNm" value="">
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHngrRackCnt_1" name="popHngrRackCnt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="Rack 개수 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHngrCost_1" name="popHngrCost" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="상면비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHstnRackCnt_1" name="popHstnRackCnt" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="Rack 개수 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popHstnCost_1" name="popHstnCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="호스팅 비용 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popWrdTrfcCpctCnt_1" name="popWrdTrfcCpctCnt"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="트래픽 대역폭 입력"></div></td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popWrdUtztnChrgCost_1" name="popWrdUtztnChrgCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="회선 가격 입력"></div></td>
						<td style="text-align:left;"><input type="hidden" id="popEtcSrvcCd1_1" name="popEtcSrvcCd1" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd2_1" name="popEtcSrvcCd2" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd3_1" name="popEtcSrvcCd3" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd4_1" name="popEtcSrvcCd4" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd5_1" name="popEtcSrvcCd5" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd6_1" name="popEtcSrvcCd6" value="EMPTY">
							<input type="hidden" id="popEtcSrvcCd7_1" name="popEtcSrvcCd7" value="EMPTY">
							<div class="fm-check fm-list" data-size="100p">
				<c:if test="${!empty srvrEntEtcSvcTypeCmmnCdList}">
					<c:forEach var="srvrEtcSvcTypeCdData" items="${srvrEntEtcSvcTypeCmmnCdList}">
								<span class="fm-ele"><input type="checkbox" id="${srvrEtcSvcTypeCdData.cdId}_1" value="${srvrEtcSvcTypeCdData.cdId}" name="popEtcSrvcCd_1" onclick="javascript:moveChangeEtcSrvcCd('${srvrEtcSvcTypeCdData.cdId}', '1');"><label for="${srvrEtcSvcTypeCdData.cdId}_1">${srvrEtcSvcTypeCdData.cdNm}</label></span>
					</c:forEach>
				</c:if>
							</div>
						</td>
						<td><div class="fm-ele" data-size="100p"><input type="text" id="popEtcSrvcCost_1" name="popEtcSrvcCost"  class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="" style="ime-mode:disabled;" placeholder="기타서비스 비용 입력"></div></td>
						<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteSrvrEntsRow_1" name="btnPopDeleteSrvrEntsRow" onclick="javascript:moveDeleteEqpmntSrvrEntsInfo('1'); return false;">삭제</button></td>
					</tr>
		</c:if>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSrvrEntsInfo" name="btnPopSaveRcsexmnEqpmentSrvrEntsInfo" onclick="javascript:moveSaveRcsexmnEqpmentSrvrEntsInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSrvrEntsInfo" name="btnPopSaveRcsexmnEqpmentSrvrEntsInfo" onclick="javascript:moveSaveRcsexmnEqpmentSrvrEntsInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnEqpmentSrvrEntsInfo" name="btnPopCloseRcsexmnEqpmentSrvrEntsInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
	
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowPopRcsExmnEqpmntSrvrEntsInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getEtcSvcCheckBoxData(paramNum) {
		let etcSvcCheckBoxText = "";
		<c:if test="${!empty srvrEntEtcSvcTypeCmmnCdList}">
			<c:forEach var="srvrEtcSvcTypeCdData" items="${srvrEntEtcSvcTypeCmmnCdList}">
			etcSvcCheckBoxText +="<span class=\"fm-ele\"><input type=\"checkbox\" id=\"${srvrEtcSvcTypeCdData.cdId}_" + paramNum  + "\" value=\"${srvrEtcSvcTypeCdData.cdId}\" name=\"popEtcSrvcCd_" + paramNum  + "\" onclick=\"javascript:moveChangeEtcSrvcCd(\'${srvrEtcSvcTypeCdData.cdId}\', \'" + paramNum + "\');\"><label for=\"${srvrEtcSvcTypeCdData.cdId}_" + paramNum  + "\">${srvrEtcSvcTypeCdData.cdNm}</label></span>";
			</c:forEach>
		</c:if>
		return etcSvcCheckBoxText;
	}
	
	function moveChangeEtcSrvcCd(paramCode, paramDataNo) {
		if (paramCode == "ETCSVC0001") {
			if ($("#ETCSVC0001_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd1_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd1_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0002") {
			if ($("#ETCSVC0002_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd2_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd2_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0003") {
			if ($("#ETCSVC0003_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd3_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd3_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0004") {
			if ($("#ETCSVC0004_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd4_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd4_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0005") {
			if ($("#ETCSVC0005_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd5_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd5_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0006") {
			if ($("#ETCSVC0006_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd6_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd6_" + paramDataNo).val("EMPTY");
			}
		} else if (paramCode == "ETCSVC0007") {
			if ($("#ETCSVC0007_" + paramDataNo).is(":checked") == true) {
				$("#popEtcSrvcCd7_" + paramDataNo).val(paramCode);
			} else {
				$("#popEtcSrvcCd7_" + paramDataNo).val("EMPTY");
			}
		}
	}
	
	
	function moveDeleteEqpmntSrvrEntsInfo(paramDataNo) {
		let oldPopStts = $("#popStts_" + paramDataNo).val();
		if (oldPopStts == "D") {
			alert("이미 삭제로 설정된 정보입니다.");
		} else {
			$("#popExtlBzentyNm_" + paramDataNo).attr("readonly", true);
			$("#popHngrRackCnt_" + paramDataNo).attr("readonly", true);
			$("#popHngrCost_" + paramDataNo).attr("readonly", true);
			$("#popHstnRackCnt_" + paramDataNo).attr("readonly", true);
			$("#popHstnCost_" + paramDataNo).attr("readonly", true);
			$("#popWrdTrfcCpctCnt_" + paramDataNo).attr("readonly", true);
			$("#popWrdUtztnChrgCost_" + paramDataNo).attr("readonly", true);
			$("input[name=popEtcSrvcCd_" + paramDataNo + "]").attr("disabled", true);
			$("#popEtcSrvcCost_" + paramDataNo).attr("readonly", true);
			$("#popViewStts_" + paramDataNo).text("D");
			$("#popStts_" + paramDataNo).val("D");
		}
	}
	
	
	function moveAddEqpmntSrvrEntsInfo() {
		let popTblTbody, popNewRowNumber, popNewRow, popViewRowNum, popNewCell0, popNewCell1, popNewCell2, popNewCell3, popNewCell4, popNewCell5, popNewCell6, popNewCell7, popNewCell8, popNewCell9, popNewCell10;
		
		let etcSvcCheckBoxText = "";
		
		popTblTbody = $("#popTblTbody");
		popNewRowNumber = popTblTbody[0].rows.length;
		popNewRow = popTblTbody[0].insertRow(popNewRowNumber);
		popNewCell0 = popNewRow.insertCell();
		popNewCell1 = popNewRow.insertCell();
		popNewCell2 = popNewRow.insertCell();
		popNewCell3 = popNewRow.insertCell();
		popNewCell4 = popNewRow.insertCell();
		popNewCell5 = popNewRow.insertCell();
		popNewCell6 = popNewRow.insertCell();
		popNewCell7 = popNewRow.insertCell();
		popNewCell8 = popNewRow.insertCell();
		popNewCell9 = popNewRow.insertCell();
		popNewCell10 = popNewRow.insertCell();
		
		popNewCell8.style.textAlign = "left";
		
		popViewRowNum = popTblTbody[0].rows.length;
		
		etcSvcCheckBoxText = getEtcSvcCheckBoxData(popViewRowNum);
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		popNewCell0.innerHTML = nowListLen;
		popNewCell1.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\">"
							  + "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\">"
							  + "<input type=\"hidden\" id=\"popExtlBzentySn_" + popViewRowNum + "\" name=\"popExtlBzentySn\" value=\"0\">"
							  + "<input type=\"text\" id=\"popExtlBzentyNm_" + popViewRowNum + "\" name=\"popExtlBzentyNm\" value=\"\">"
							  + "</div>";
		popNewCell2.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popHngrRackCnt_" + popViewRowNum + "\" name=\"popHngrRackCnt\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"Rack 개수 입력\"></div>";
		popNewCell3.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popHngrCost_" + popViewRowNum + "\" name=\"popHngrCost\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"상면비용 입력\"></div>";
		popNewCell4.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popHstnRackCnt_" + popViewRowNum + "\" name=\"popHstnRackCnt\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"Rack 개수 입력\"></div>";
		popNewCell5.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popHstnCost_" + popViewRowNum + "\" name=\"popHstnCost\"  class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"호스팅 비용 입력\"></div>";
		popNewCell6.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popWrdTrfcCpctCnt_" + popViewRowNum + "\" name=\"popWrdTrfcCpctCnt\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"트래픽 대역폭 입력\"></div>";
		popNewCell7.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popWrdUtztnChrgCost_" + popViewRowNum + "\" name=\"popWrdUtztnChrgCost\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"회선 가격 입력\"></div>";
		popNewCell8.innerHTML = "<input type=\"hidden\" id=\"popEtcSrvcCd1_" + popViewRowNum + "\" name=\"popEtcSrvcCd1\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd2_" + popViewRowNum + "\" name=\"popEtcSrvcCd2\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd3_" + popViewRowNum + "\" name=\"popEtcSrvcCd3\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd4_" + popViewRowNum + "\" name=\"popEtcSrvcCd4\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd5_" + popViewRowNum + "\" name=\"popEtcSrvcCd5\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd6_" + popViewRowNum + "\" name=\"popEtcSrvcCd6\" value=\"EMPTY\"><input type=\"hidden\" id=\"popEtcSrvcCd7_" + popViewRowNum + "\" name=\"popEtcSrvcCd7\" value=\"EMPTY\"><div class=\"fm-check fm-list\" data-size=\"100p\">" + etcSvcCheckBoxText + "</div>";
		popNewCell9.innerHTML = "<div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popEtcSrvcCost_" + popViewRowNum + "\" name=\"popEtcSrvcCost\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" value=\"\" style=\"ime-mode:disabled;\" placeholder=\"기타서비스 비용 입력\"></div>";
		popNewCell10.innerHTML = "<button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteSrvrEntsRow_" + popViewRowNum + "\" name=\"btnPopDeleteSrvrEntsRow\" onclick=\"javascript:moveDeleteEqpmntSrvrEntsInfo(\'" + popViewRowNum + "\'); return false;\">삭제</button>";
	}
	
</script>