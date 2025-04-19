<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	
	<div class="table-wrap write">
		<form name="frmDtlSrch" id="frmDtlSrch" method="post" action="#">
			<input type="hidden" id="srchPageNo" name="srchPageNo" value="${srchInstRcsExmnInfo.paramPageNo}">
			<input type="hidden" id="srchRecordCnt" name="srchRecordCnt" value="${srchInstRcsExmnInfo.paramRecordCnt}">
			<input type="hidden" id="srchRcsexmnId" name="srchRcsexmnId" value="${srchInstRcsExmnInfo.paramRcsexmnId}">
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="${srchInstRcsExmnInfo.paramWrtMode}">
			<input type="hidden" id="srchRcsexmnYr" name="srchRcsexmnYr" value="${srchInstRcsExmnInfo.paramRcsexmnYr}">
			<input type="hidden" id="srchRcsexmnDiv" name="srchRcsexmnDiv" value="${srchInstRcsExmnInfo.paramSrchRcsexmnDiv}">
			<input type="hidden" id="srchRcsexmnString" name="srchRcsexmnString" value="${srchInstRcsExmnInfo.paramSrchRcsexmnString}">
			<input type="hidden" id="srchBgngYr" name="srchBgngYr" value="${srchInstRcsExmnInfo.paramBgngYr}">
			<input type="hidden" id="srchEndYr" name="srchEndYr" value="${srchInstRcsExmnInfo.paramEndYr}">
			<input type="hidden" id="srchTabInstListPageNo" name="srchTabInstListPageNo" value="${srchInstRcsExmnInfo.paramTabInstListPageNo}">
			<input type="hidden" id="srchTabInstListRecordCnt" name="srchTabInstListRecordCnt" value="${srchInstRcsExmnInfo.paramTabInstListRecordCnt}">
			<input type="hidden" id="srchRcsexmnInstId" name="srchRcsexmnInstId" value="${srchInstRcsExmnInfo.paramInstId}">
			<input type="hidden" id="rcsexmnInstTypeCd" name="rcsexmnInstTypeCd" value="${rcsExmnTrgtInstInfo.instTypeCd}">
			<input type="hidden" id="rcsexmnStartYn" name="rcsexmnStartYn" value="${instRcsexmnPrgrsRsltInfo.exmnStartYn}">
			<input type="hidden" id="rcsexmnEndYn" name="rcsexmnEndYn" value="${instRcsexmnPrgrsRsltInfo.exmnEndYn}">
		</form>
		<table>
			<caption></caption>
			<colgroup>
				<col width="200px"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="*"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>환경조사명</th>
					<td colspan="3">${rcsExmnTrgtInstInfo.rcsexmnNm} (${rcsExmnTrgtInstInfo.rcsexmnId})</td>
				</tr>
				<tr>
					<th>기관명(기관코드)</th>
					<td>${rcsExmnTrgtInstInfo.instNm} (${rcsExmnTrgtInstInfo.instCd})</td>
					<th>유형</th>
					<td>${rcsExmnTrgtInstInfo.instTypeNm} / ${rcsExmnTrgtInstInfo.fildTypeNm}</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>${rcsExmnTrgtInstInfo.deptNm}</td>
					<th>조사자명</th>
					<td>${rcsExmnTrgtInstInfo.exmnrNm}</td>
				</tr>
				<tr>
					<th>조사자 전화번호</th>
					<td>${rcsExmnTrgtInstInfo.exmnrTelno}</td>
					<th>조사자메일</th>
					<td>${rcsExmnTrgtInstInfo.exmnrEmlAddr}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-wrap align-right mb50">
		<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0001'}">
		<button type="button" class="btns" id="btnMoveDtlPage" name="btnMoveDtlPage" onclick="javascript:moveDtlRcsExmnInfo(); return false;">조사 상세</button>
		</c:if>
		<button type="button" class="btns color-gray" id="btnMoveListPage" name="btnMoveListPage" onclick="javascript:moveListRcsExmnInfo(); return false;">목록</button>
	</div>
	
	<div class="table-wrap table-border">
		<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0001' or UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<div class="btn-wrap align-right">
			<button type="button" class="btns size-xsmall color-orange" id="btnPopViewRawData" name="btnPopViewRawData" onclick="javascript:movePopInstRcsExmnRawData(); return false;">Raw Data 보기</button>
			<%--<button type="button" class="btns size-xsmall color-gray" id="btnPopExcelDwnld" name="btnPopExcelDwnld" onclick="javascript:moveExcelDwnldPopInstRcsExmnRawData(); return false;">Raw Data Excel Download</button> --%>
		</div>
		</c:if>
		<table class="list">
			<caption></caption>
			<colgroup>
				<col width="*"></col>
				<col width="*"></col>
				<col width="200px"></col>
				<col width="100px"></col>
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">조사항목</th>
					<th>조사일시</th>
					<th>조사</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2" class="tl pl30">조사시작</td>
					<td>${rcsExmnTrgtInstInfo.exmnBgngDtV19}</td>
					<td>
						<c:if test="${UserAuthrtInfo.authrtTypeCd == 'USERTY0002' and rcsExmnTrgtInstInfo.exmnBgngYn ne 'Y' and instRcsexmnPrgrsRsltInfo.exmnStartYn eq 'Y' and instRcsexmnPrgrsRsltInfo.exmnEndYn eq 'N'}">
						<button type="button" name="btnInstRcsExmnStart" id="btnInstRcsExmnStart" class="btns size-xsmall" onclick="javascript:setInstRcsExmnStatus(); return false;">시작</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<td rowspan="3" class="tl pl30">1. 일반현황</td>
					<td class="tl pl10">정보화 및 정보보호 인력 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.infrmnmprRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnInfrmNmpr" id="btnInstRcsExmnInfrmNmpr" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('INFRMNMPR'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">정보화 예산 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.infrmbgtRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnInfrmBgt" id="btnInstRcsExmnInfrmBgt" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('INFRMBGT'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">정보화 예산 세부 내역</td>
					<td>${instRcsexmnPrgrsRsltInfo.infrmbgtdtlRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnInfrmBgtDtl" id="btnInstRcsExmnInfrmBgtDtl" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('INFRMBGTDTL'); return false;">보기</button></td>
				</tr>
				<tr>
					<td colspan="2" class="tl pl30">2. 정보화사업 추진 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.infrmbizprgrsRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnInfrmBizPrgrs" id="btnInstRcsExmnInfrmBizPrgrs" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('INFRMBIZPRGRS'); return false;">보기</button></td>
				</tr>
				<tr>
					<td colspan="2" class="tl pl30">3. 문화정보(DB)/디지털 콘텐츠 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.cltcontsRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnCltConts" id="btnInstRcsExmnCltConts" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('CLTCONTS'); return false;">보기</button></td>
				</tr>
				<tr>
					<td rowspan="2" class="tl pl30">4. 정보 서비스 현황</td>
					<td class="tl pl10">모바일 웹/앱 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.mbaplRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnMbApl" id="btnInstRcsExmnMbApl" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('MBAPL'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">기관별 SNS 홍보채널 운영 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.instprchnlRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnInstPrChnl" id="btnInstRcsExmnInstPrChnl" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('INSTPRCHNL'); return false;">보기</button></td>
				</tr>
				<tr>
					<td rowspan="4" class="tl pl30">5. 인프라 현황</td>
					<td class="tl pl10">클라우드 구축 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.eqpmntcludRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnEqpmntClud" id="btnInstRcsExmnEqpmntClud" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('EQPMNTCLUD'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">서버 장비 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.eqpmntsrvrRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnEqpmntSrvr" id="btnInstRcsExmnEqpmntSrvr" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('EQPMNTSRVR'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">서버 외부위탁 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.eqpmntsrvrentsRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnEqpmntSrvrEnts" id="btnInstRcsExmnEqpmntSrvrEnts" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('EQPMNTSRVRENTS'); return false;">보기</button></td>
				</tr>
				<tr>
					<td class="tl pl10">서버 보안장비 및 보안서비스 현황</td>
					<td>${instRcsexmnPrgrsRsltInfo.eqpmntsecuRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnEqpmntSecu" id="btnInstRcsExmnEqpmntSecu" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('EQPMNTSECU'); return false;">보기</button></td>
				</tr>
				<tr>
					<td colspan="2" class="tl pl30">6. 문화정보 자원 품질관리 수준 진단</td>
					<td>${instRcsexmnPrgrsRsltInfo.qltmnglvlRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnQltMngLvl" id="btnInstRcsExmnQltMngLvl" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('QLTMNGLVL'); return false;">보기</button></td>
				</tr>
				<tr>
					<td colspan="2" class="tl pl30">조사자 입력</td>
					<td>${instRcsexmnPrgrsRsltInfo.exmnrinfoRcsexmnCmptnDtV19}</td>
					<td><button type="button" name="btnInstRcsExmnExmnr" id="btnInstRcsExmnExmnr" class="btns size-xsmall" onclick="javascript:movePopOpenInstRcsExmn('EXMNRINFO'); return false;">보기</button></td>
				</tr>
				<tr>
					<td colspan="2" class="tl pl30">조사완료</td>
					<td>${instRcsexmnPrgrsRsltInfo.exmnrinfoRcsexmnCmptnDtV19}</td>
					<td>
					<c:if test="${UserAuthrtInfo.authrtTypeCd == 'USERTY0002' and rcsExmnTrgtInstInfo.exmnCmptnYn ne 'Y' and instRcsexmnPrgrsRsltInfo.exmnStartYn eq 'Y' and instRcsexmnPrgrsRsltInfo.exmnEndYn eq 'N'}">
						<button type="button" name="btnIInstRcsExmnCmptn" id="btnIInstRcsExmnCmptn" class="btns size-xsmall" onclick="javascript:setCmptnInstRcsExmnStatus(); return false;">완료</button>
					</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<%-- Modal layout Start --%>
<div class="modals" id="modals">
	<div class="pop-layer" style="width:80%;">
		
	</div>
</div>
<%-- Modal layout End --%>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
<script>

	function moveInstRcsExmnDtlReload() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/instRcsExmnDtl.do";
		frm.submit();
	}
	
	function moveDtlRcsExmnInfo() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnDtl.do";
		frm.submit();
	}
	
	function moveListRcsExmnInfo() {
		let frm = document.frmDtlSrch;
		frm.action = contextPath + "/cltInfoRcsExmnMgt/rcsExmnList.do";
		frm.submit();
	}
	
	function setInstRcsExmnStatus() {
		let frm = document.frmDtlSrch;
		if (confirm("조사를 시작하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/setCltInfoRcsExmnStart.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"srchPopRcsexmnId" : $("#srchRcsexmnId").val(),
					"srchPopRcsexmnInstId" : $("#srchRcsexmnInstId").val()
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 조사 시작이 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	
	function movePopOpenInstRcsExmn(checkParam) {
		let paramPopUrl = "";
		let paramRcsexmnId = $("#srchRcsexmnId").val();
		let paramRcsexmnInstId = $("#srchRcsexmnInstId").val();
		let paramRcsexmnStartYn = $("#rcsexmnStartYn").val();
		let paramRcsexmnEndYn = $("#rcsexmnEndYn").val();
		if (checkParam == "INFRMNMPR") {
			//일반현황 중 정보화 및 정보보호 인력 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerInfrmNmprInfo.do";
		} else if (checkParam == "INFRMBGT") {
			//일반현황 중 정보화 예산 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerInfrmBgtInfo.do";
		} else if (checkParam == "INFRMBGTDTL") {
			//일반현황 중 정보화 예산 세부 내역
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerInfrmBgtDtlInfo.do";
		} else if (checkParam == "INFRMBIZPRGRS") {
			//정보화 사업 추진 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerInfrmBizPrgrsInfo.do";
		} else if (checkParam == "CLTCONTS") {
			//문화정보(DB)/디지털 콘텐츠 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerCltContsInfo.do";
		} else if (checkParam == "MBAPL") {
			//정보화 서비스 현황 중 모바일앱/웹 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerMbAplInfo.do";
		} else if (checkParam == "INSTPRCHNL") {
			//정보화 서비스 현황 중 기관별 SNS 홍보채널 운영현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerInstPrChnlInfo.do";
		} else if (checkParam == "EQPMNTCLUD") {
			//인프라 현황 중 클라우드 구축 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerCludEqpmntInfo.do";
		} else if (checkParam == "EQPMNTSRVR") {
			//인프라 현황 중 서버 장비 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerEqpmntSrvrInfo.do";
		} else if (checkParam == "EQPMNTSRVRENTS") {
			//인프라 현황 중 서버 외부위탁 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerEqpmntSrvrEntsInfo.do";
		} else if (checkParam == "EQPMNTSECU") {
			//인프라 현황 중 서버 보안장비 및 보안서비스 현황
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerEqpmntSecuInfo.do";
		} else if (checkParam == "QLTMNGLVL") {
			//문화정보 자원 품질관리 수준 진단
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerQltMngLvlInfo.do";
		} else if (checkParam == "EXMNRINFO") {
			//조사자 정보 입력
			paramPopUrl = "/cltInfoRcsExmnMgt/popLayerExmnrInfo.do";
		}
		
		if (paramPopUrl != "" && paramRcsexmnId != "" && paramRcsexmnInstId != "" ) {
			paramPopUrl += "?srchPopRcsexmnId=" + paramRcsexmnId;
			paramPopUrl += "&srchPopRcsexmnInstId=" + paramRcsexmnInstId;
			paramPopUrl += "&srchPopRcsexmnStartYn=" + paramRcsexmnStartYn;
			paramPopUrl += "&srchPopRcsexmnEndYn=" + paramRcsexmnEndYn;
			if (checkParam == "INFRMNMPR") {
				paramPopUrl += "&srchPopRcsexmnInstTypeCd=" + $("#rcsexmnInstTypeCd").val();
			}
			let paramPopUrlTxt = contextPath + paramPopUrl;
			$(".pop-layer").load(paramPopUrlTxt);
			admin.modalsShow('modals'); 
		} else {
			alert("필요 정보가 존재하지 않습니다.");
			alert("paramPopUrl : " + paramPopUrl)
			alert("paramRcsexmnId : " + paramRcsexmnId)
			alert("paramRcsexmnInstId : " + paramRcsexmnInstId)
			return false;
		}
	}
	
	//1.일반현황 - 1)정보화 및 정보보호 인력 현황
	function moveSaveRcsexmnInfrmNmprInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopInstTypeCd = $("#popTypeCd").val();
		let paramPopWholCpctCnt = $("#popWholCpctCnt").val();
		let paramPopInfrmNope = $("#popInfrmNope").val();
		let paramPopInfscrNope = $("#popInfscrNope").val();
		let paramPopInfrmInfscrSumNope = $("#popInfrmInfscrSumNope").val();
		
		if (paramPopWholCpctCnt <= 0) {
			alert("기관 전체 인원(정원)을 입력해 주십시오.");
			return false;
		}
		if (paramPopInfrmNope < 0) {
			alert("정보화 인력(수)를 입력해 주십시오.");
			return false;
		}
		if (paramPopInfscrNope < 0) {
			alert("정보보호 인력(수)를 입력해 주십시오.");
			return false;
		}
		
		if (confirm("일반현황 - 정보화 및 정보보호 인력 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnInfrmNmprInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popInstTypeCd" : paramPopInstTypeCd,
					"popWholCpctCnt" : paramPopWholCpctCnt,
					"popInfrmNope" : paramPopInfrmNope,
					"popInfscrNope" : paramPopInfscrNope,
					"popInfrmInfscrSumNope" : paramPopInfrmInfscrSumNope
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 일반현황 - 정보화 및 정보보호 인력 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//1.일반현황 - 2)정보화 예산 현황
	function moveSaveRcsexmnInfrmBgtInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopBgtYr = $("#popBgtYr").val();
		let paramPopStcfGnrlBgtAmt = $("#popStcfGnrlBgtAmt").val();
		let paramPopStcfInfrmBgtAmt = $("#popStcfInfrmBgtAmt").val();
		let paramPopFundGnrlBgtAmt = $("#popFundGnrlBgtAmt").val();
		let paramPopFundInfrmBgtAmt = $("#popFundInfrmBgtAmt").val();
		let paramPopEtcBgtAmt = $("#popEtcBgtAmt").val();
		let paramPopBgtSumAmt = $("#popBgtSumAmt").val();
		
		if (paramPopBgtYr == "" || paramPopBgtYr == null) {
			alert("연도를 입력해 주십시오.");
			$("#popBgtYr").focus();
			return false;
		}
		if (paramPopStcfGnrlBgtAmt == "" || paramPopStcfGnrlBgtAmt == null) {
			paramPopStcfGnrlBgtAmt = "0"
		}
		if (paramPopStcfInfrmBgtAmt == "" || paramPopStcfInfrmBgtAmt == null) {
			paramPopStcfInfrmBgtAmt = "0"
		}
		if (paramPopFundGnrlBgtAmt == "" || paramPopFundGnrlBgtAmt == null) {
			paramPopFundGnrlBgtAmt = "0"
		}
		if (paramPopFundInfrmBgtAmt == "" || paramPopFundInfrmBgtAmt == null) {
			paramPopFundInfrmBgtAmt = "0"
		}
		if (paramPopEtcBgtAmt == "" || paramPopEtcBgtAmt == null) {
			paramPopEtcBgtAmt = "0"
		}
		if (paramPopBgtSumAmt == "" || paramPopBgtSumAmt == null) {
			paramPopBgtSumAmt = "0"
		}
		
		if (confirm("일반현황 - 정보화 예산 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnInfrmBgtInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popBgtYr" : paramPopBgtYr,
					"popStcfGnrlBgtAmt" : paramPopStcfGnrlBgtAmt,
					"popStcfInfrmBgtAmt" : paramPopStcfInfrmBgtAmt,
					"popFundGnrlBgtAmt" : paramPopFundGnrlBgtAmt,
					"popFundInfrmBgtAmt" : paramPopFundInfrmBgtAmt,
					"popEtcBgtAmt" : paramPopEtcBgtAmt,
					"popBgtSumAmt" : paramPopBgtSumAmt
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 일반현황 - 정보화 예산 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//1.일반현황 - 3)정보화 예산 세부내역
	function moveSaveRcsexmnInfrmBgtDtlInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopBgtYr = $("#popBgtYr").val();
		let paramPopPlngBgtAmt = $("#popPlngBgtAmt").val();
		let paramPopDevCnstBgtAmt = $("#popDevCnstBgtAmt").val();
		let paramPopOperMngBgtAmt = $("#popOperMngBgtAmt").val();
		let paramPopAstAcqsBgtAmt = $("#popAstAcqsBgtAmt").val();
		let paramPopEtcBgtAmt = $("#popEtcBgtAmt").val();
		let paramPopSumBgtAmt = $("#popSumBgtAmt").val();
		let paramPopPlngFircsSeCd = $("#popPlngFircsSeCd").val();
		let paramPopDevCnstFircsSeCd = $("#popDevCnstFircsSeCd").val();
		let paramPopOperMngFircsSeCd = $("#popOperMngFircsSeCd").val();
		let paramPopAstAcqsFircsSeCd = $("#popAstAcqsFircsSeCd").val();
		let paramPopEtcFircsSeCd = $("#popEtcFircsSeCd").val();
		
		if (paramPopBgtYr == "" || paramPopBgtYr == null) {
			alert("연도를 입력해 주십시오.");
			$("#popBgtYr").focus();
			return false;
		}
		if (paramPopPlngBgtAmt == "" || paramPopPlngBgtAmt == null) {
			paramPopPlngBgtAmt = "0";
		} else if (parseInt(paramPopPlngBgtAmt, 10) > 0 ) {
			if (paramPopPlngFircsSeCd == "") {
				alert("기획예산 재원을 선택해 주십시오.");
				$("#popPlngFircsSeCd").focus();
				return false;
			}
		}
		if (paramPopDevCnstBgtAmt == "" || paramPopDevCnstBgtAmt == null) {
			paramPopDevCnstBgtAmt = "0";
		} else if (parseInt(paramPopDevCnstBgtAmt, 10) > 0 ) {
			if (paramPopDevCnstFircsSeCd == "") {
				alert("개발구축 예산 재원을 선택해 주십시오.");
				$("#popDevCnstFircsSeCd").focus();
				return false;
			}
		}
		if (paramPopOperMngBgtAmt == "" || paramPopOperMngBgtAmt == null) {
			paramPopOperMngBgtAmt = "0";
		} else if (parseInt(paramPopOperMngBgtAmt, 10) > 0 ) {
			if (paramPopOperMngFircsSeCd == "") {
				alert("운영관리 예산 재원을 선택해 주십시오.");
				$("#popOperMngFircsSeCd").focus();
				return false;
			}
		}
		if (paramPopAstAcqsBgtAmt == "" || paramPopAstAcqsBgtAmt == null) {
			paramPopAstAcqsBgtAmt = "0";
		} else if (parseInt(paramPopAstAcqsBgtAmt, 10) > 0 ) {
			if (paramPopAstAcqsFircsSeCd == "") {
				alert("자산취득 예산 재원을 선택해 주십시오.");
				$("#popAstAcqsFircsSeCd").focus();
				return false;
			}
		}
		if (paramPopEtcBgtAmt == "" || paramPopEtcBgtAmt == null) {
			paramPopEtcBgtAmt = "0";
		} else if (parseInt(paramPopEtcBgtAmt, 10) > 0 ) {
			if (paramPopEtcFircsSeCd == "") {
				alert("기타 예산 재원을 선택해 주십시오.");
				$("#popEtcFircsSeCd").focus();
				return false;
			}
		}
		
		if (confirm("일반현황 - 정보화 예산 세부내역 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnInfrmBgtDtlInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popBgtYr" : paramPopBgtYr,
					"popPlngBgtAmt" : paramPopPlngBgtAmt,
					"popDevCnstBgtAmt" : paramPopDevCnstBgtAmt,
					"popOperMngBgtAmt" : paramPopOperMngBgtAmt,
					"popAstAcqsBgtAmt" : paramPopAstAcqsBgtAmt,
					"popEtcBgtAmt" : paramPopEtcBgtAmt,
					"popSumBgtAmt" : paramPopSumBgtAmt,
					"popPlngFircsSeCd" : paramPopPlngFircsSeCd,
					"popDevCnstFircsSeCd" : paramPopDevCnstFircsSeCd,
					"popOperMngFircsSeCd" : paramPopOperMngFircsSeCd,
					"popAstAcqsFircsSeCd" : paramPopAstAcqsFircsSeCd,
					"popEtcFircsSeCd" : paramPopEtcFircsSeCd
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 일반현황 -정보화 예산 세부내역 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//2.정보화사업 추진현황
	function moveSaveRcsexmnInfrmBizPrgrsInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopStts = "";
		let paramPobBizSn = "";
		let paramPopBgtBizNm = "";
		let paramPopDtlBizNm = "";
		let paramPopBizTypeCdCn = "";
		let paramPopBizBgngYmd = "";
		let paramPopBizEndYmd = "";
		let paramPopFircsSeCd = "";
		let paramPopBgtAmt = "";
		let newParamPopBgtBizNm = "";
		let newParamPopDtlBizNm = "";
		let newParamPopBizTypeCdCn = "";
		let newParamPopBizBgngYmd = "";
		let newParamPopBizEndYmd = "";
		let newParamPopFircsSeCd = "";
		let newParamPopBgtAmt = "";
		
		let rcsExmnInfrmBizPrgrsInfoList = [];
		if (typeof($("input[name=popBgtBizNm]")) != "undefined") {
			if (typeof($("input[name=popBgtBizNm]").length) != "undefined" ) {
				for (let bi = 0; bi < $("input[name=popBgtBizNm]").length; bi++) {
					newParamPopBgtBizNm = "";
					newParamPopDtlBizNm = "";
					newParamPopBizTypeCdCn = "";
					newParamPopBizBgngYmd = "";
					newParamPopBizEndYmd = "";
					newParamPopFircsSeCd = "";
					newParamPopBgtAmt = "";
					if ($("input[name=popStts]").eq(bi).val() != "D") {
						if ($("input[name=popBgtBizNm]").eq(bi).val() == "") {
							alert("예산사업명을 입력해 주십시오.");
							$("input[name=popBgtBizNm]").eq(bi).focus();
							return false;
						} else {
							newParamPopBgtBizNm = $("input[name=popBgtBizNm]").eq(bi).val();
						}
						if ($("input[name=popDtlBizNm]").eq(bi).val() == "") {
							alert("세부사업명을 입력해 주십시오.");
							$("input[name=popDtlBizNm]").eq(bi).focus();
							return false;
						} else {
							newParamPopDtlBizNm = $("input[name=popDtlBizNm]").eq(bi).val()
						}
						if ($("select[name=popBizTypeCdCn]").eq(bi).val() == "") {
							alert("사업유형을 선택해 주십시오.");
							$("select[name=popBizTypeCdCn]").eq(bi).focus();
							return false;
						} else {
							newParamPopBizTypeCdCn = $("select[name=popBizTypeCdCn]").eq(bi).val()
						}
						if ($("input[name=popBizBgngYmdV10]").eq(bi).val() == "") {
							alert("사업시작일을 입력해 주십시오.");
							$("input[name=popBizBgngYmdV10]").eq(bi).focus();
							return false;
						} else {
							newParamPopBizBgngYmd = $("input[name=popBizBgngYmdV10]").eq(bi).val().replace(/-/g, "");
						}
						if ($("input[name=popBizEndYmdV10]").eq(bi).val() == "") {
							alert("사업종료일을 입력해 주십시오.");
							$("input[name=popBizEndYmdV10]").eq(bi).focus();
							return false;
						} else {
							newParamPopBizEndYmd = $("input[name=popBizEndYmdV10]").eq(bi).val().replace(/-/g, "");
						}
						if ($("select[name=popFircsSeCd]").eq(bi).val() == "") {
							alert("재원을 선택해 주십시오.");
							$("select[name=popFircsSeCd]").eq(bi).focus();
							return false;
						} else {
							newParamPopFircsSeCd = $("select[name=popFircsSeCd]").eq(bi).val();
						}
						if ($("input[name=popBgtAmt]").eq(bi).val() == "") {
							alert("예산금액을 입력해 주십시오.");
							$("input[name=popBgtAmt]").eq(bi).focus();
							return false;
						} else {
							newParamPopBgtAmt = $("input[name=popBgtAmt]").eq(bi).val();
						}
					} else {
						newParamPopBgtBizNm = "EMPTY";
						newParamPopDtlBizNm = "EMPTY";
						newParamPopBizTypeCdCn = "EMPTY";
						newParamPopBizBgngYmd = "EMPTY";
						newParamPopBizEndYmd = "EMPTY";
						newParamPopFircsSeCd = "EMPTY";
						newParamPopBgtAmt = "EMPTY";
					}
					
					let rcsExmnInfrmBizPrgrsInfoObj = {
						status : $("input[name=popStts]").eq(bi).val(),
						rcsexmnId : paramPopRcsexmnId,
						instId : paramPopInstId,
						bizSn : $("input[name=popBizSn]").eq(bi).val(),
						bgtBizNm : newParamPopBgtBizNm,
						dtlBizNm : newParamPopDtlBizNm,
						bizTypeCdCn : newParamPopBizTypeCdCn,
						bizBgngYmd : newParamPopBizBgngYmd,
						bizEndYmd : newParamPopBizEndYmd,
						fircsSeCd : newParamPopFircsSeCd,
						bgtAmt : newParamPopBgtAmt
					};
					rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
				}
				
			} else {
				if ($("input[name=popStts]").val() != "D") {
					if ($("input[name=popBgtBizNm]").val() == "") {
						alert("예산사업명을 입력해 주십시오.");
						$("input[name=popBgtBizNm]").focus();
						return false;
					}
					
					if ($("input[name=popDtlBizNm]").val() == "") {
						alert("세부사업명을 입력해 주십시오.");
						$("input[name=popDtlBizNm]").focus();
						return false;
					}
					
					if ($("select[name=popBizTypeCdCn]").val() == "") {
						alert("사업유형을 선택해 주십시오.");
						$("select[name=popBizTypeCdCn]").focus();
						return false;
					}
					if ($("input[name=popBizBgngYmdV10]").val() == "") {
						alert("사업시작일을 입력해 주십시오.");
						$("input[name=popBizBgngYmdV10]").focus();
						return false;
					}
					if ($("input[name=popBizEndYmdV10]").val() == "") {
						alert("사업종료일을 입력해 주십시오.");
						$("input[name=popBizEndYmdV10]").focus();
						return false;
					}
					if ($("select[name=popFircsSeCd]").val() == "") {
						alert("재원을 선택해 주십시오.");
						$("select[name=popFircsSeCd]").focus();
						return false;
					}
					if ($("input[name=popBgtAmt]").val() == "") {
						alert("예산금액을 입력해 주십시오.");
						$("input[name=popBgtAmt]").focus();
						return false;
					}

					let rcsExmnInfrmBizPrgrsInfoObj = {
						status : $("input[name=popStts]").val(),
						rcsexmnId : paramPopRcsexmnId,
						instId : paramPopInstId,
						bizSn : $("input[name=popBizSn]").eq(bi).val(),
						bgtBizNm : $("input[name=popBgtBizNm]").val(),
						dtlBizNm : $("input[name=popDtlBizNm]").val(),
						bizTypeCdCn : $("input[name=popBizTypeCdCn]").val(),
						bizBgngYmd : $("input[name=popBizBgngYmdV10]").val().replace(/-/g, ""),
						bizEndYmd : $("input[name=popBizEndYmdV10]").val().replace(/-/g, ""),
						fircsSeCd : $("input[name=popFircsSeCd]").val(),
						bgtAmt : $("input[name=popBgtAmt]").val()
					};
					rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
				}
			}
		}
		
		if (rcsExmnInfrmBizPrgrsInfoList.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return false;
		}
		
		if (confirm("정보화사업 추진현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnInfrmBizPrgrsInfo.do",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				data : JSON.stringify(rcsExmnInfrmBizPrgrsInfoList),
				success : function(rtnData) {
					if (rtnData.result == "N") {
						alert(" 데이터 이상으로 정보화사업 추진현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	
	//3.문화정보(DB)/디지털 콘텐츠 현황 저장
	function moveSaveRcsexmnCltContInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopStts = "";
		let paramPopContsSn = "";
		let paramPopSiteNm = "";
		let paramPopSiteUrlAddr = "";
		let paramPopContsInfoNm = "";
		let paramPopCnstTrgtSumNocs = "";
		let paramPopCnstTrgtLtrsNocs = "";
		let paramPopCnstTrgtImgNocs = "";
		let paramPopCnstTrgtVdoNocs = "";
		let paramPopCnstTrgtSndNocs = "";
		let paramPopCnstTrgtXrNocs = "";
		let paramPopCnstTrgtEtcNocs = "";
		let paramPopCnstTrgtSbtotNocs = "";
		let paramPopCnstCmptnNocs = "";
		let paramPopCnstCmptnLtrsNocs = "";
		let paramPopCnstCmptnImgNocs = "";
		let paramPopCnstCmptnVdoNocs = "";
		let paramPopCnstCmptnSndNocs = "";
		let paramPopCnstCmptnXrNocs = "";
		let paramPopCnstCmptnEtcNocs = "";
		let paramPopCnstCmptnSbtotNocs = "";
		let paramPopSrvcNocs = "";
		let paramPopSrvcLtrsCnt = "";
		let paramPopSrvcImgCnt = "";
		let paramPopSrvcVdoCnt = "";
		let paramPopSrvcSndCnt = "";
		let paramPopSrvcXrNocs = "";
		let paramPopSrvcEtcNocs = "";
		let paramPopSrvcSumCnt = "";
		let paramPopCnstSumNocs = "";
		let paramPopCnstSumLtrsNocs = "";
		let paramPopCnstSumImgNocs = "";
		let paramPopCnstSumVdoNocs = "";
		let paramPopCnstSumSndNocs = "";
		let paramPopCnstSumXrNocs = "";
		let paramPopCnstSumEtcNocs = "";
		let paramPopCnstSumSbtotNocs = "";
		let paramPopCpyrInstKeepYn = "";
		let paramPopCpyrSctnKeepYn = "";
		let paramPopCpyrMakrKeepYn = "";
		let paramPopCpyrKeepUnwnYn = "";
		let paramPopCpyrEnncYn = "";
		let paramPopRlsLmtScpCd = "";
		let paramPopMrfnTrgtSrvcCd = "";
		let paramPopRlsMthdCd = "";
		
		let newParamPopSiteNm = "";
		let newParamPopSiteUrlAddr = "";
		let newParamPopContsInfoNm = "";
		let newParamPopCnstTrgtSumNocs = "";
		let newParamPopCnstTrgtLtrsNocs = "";
		let newParamPopCnstTrgtImgNocs = "";
		let newParamPopCnstTrgtVdoNocs = "";
		let newParamPopCnstTrgtSndNocs = "";
		let newParamPopCnstTrgtXrNocs = "";
		let newParamPopCnstTrgtEtcNocs = "";
		let newParamPopCnstTrgtSbtotNocs = "";
		let newParamPopCnstCmptnNocs = "";
		let newParamPopCnstCmptnLtrsNocs = "";
		let newParamPopCnstCmptnImgNocs = "";
		let newParamPopCnstCmptnVdoNocs = "";
		let newParamPopCnstCmptnSndNocs = "";
		let newParamPopCnstCmptnXrNocs = "";
		let newParamPopCnstCmptnEtcNocs = "";
		let newParamPopCnstCmptnSbtotNocs = "";
		let newParamPopSrvcNocs = "";
		let newParamPopSrvcLtrsCnt = "";
		let newParamPopSrvcImgCnt = "";
		let newParamPopSrvcVdoCnt = "";
		let newParamPopSrvcSndCnt = "";
		let newParamPopSrvcXrNocs = "";
		let newParamPopSrvcEtcNocs = "";
		let newParamPopSrvcSumCnt = "";
		let newParamPopCnstSumNocs = "";
		let newParamPopCnstSumLtrsNocs = "";
		let newParamPopCnstSumImgNocs = "";
		let newParamPopCnstSumVdoNocs = "";
		let newParamPopCnstSumSndNocs = "";
		let newParamPopCnstSumXrNocs = "";
		let newParamPopCnstSumEtcNocs = "";
		let newParamPopCnstSumSbtotNocs = "";
		let newParamPopCpyrInstKeepYn = "";
		let newParamPopCpyrSctnKeepYn = "";
		let newParamPopCpyrMakrKeepYn = "";
		let newParamPopCpyrKeepUnwnYn = "";
		let newParamPopCpyrEnncYn = "";
		let newParamPopRlsLmtScpCd = "";
		let newParamPopMrfnTrgtSrvcCd = "";
		let newParamPopRlsMthdCd = "";
		
		let rcsexmnCltContInfoList = [];
		if (typeof($("input[name=popStts]")) != "undefined") {
			if (typeof($("input[name=popStts]").length) != "undefined" ) {
				
				for (let ci = 0; ci < $("input[name=popStts]").length; ci++) {
					
					newParamPopSiteNm = "";
					newParamPopSiteUrlAddr = "";
					newParamPopContsInfoNm = "";
					newParamPopCnstTrgtSumNocs = "";
					newParamPopCnstTrgtLtrsNocs = "";
					newParamPopCnstTrgtImgNocs = "";
					newParamPopCnstTrgtVdoNocs = "";
					newParamPopCnstTrgtSndNocs = "";
					newParamPopCnstTrgtXrNocs = "";
					newParamPopCnstTrgtEtcNocs = "";
					newParamPopCnstTrgtSbtotNocs = "";
					newParamPopCnstCmptnNocs = "";
					newParamPopCnstCmptnLtrsNocs = "";
					newParamPopCnstCmptnImgNocs = "";
					newParamPopCnstCmptnVdoNocs = "";
					newParamPopCnstCmptnSndNocs = "";
					newParamPopCnstCmptnXrNocs = "";
					newParamPopCnstCmptnEtcNocs = "";
					newParamPopCnstCmptnSbtotNocs = "";
					newParamPopSrvcNocs = "";
					newParamPopSrvcLtrsCnt = "";
					newParamPopSrvcImgCnt = "";
					newParamPopSrvcVdoCnt = "";
					newParamPopSrvcSndCnt = "";
					newParamPopSrvcXrNocs = "";
					newParamPopSrvcEtcNocs = "";
					newParamPopSrvcSumCnt = "";
					newParamPopCnstSumNocs = "";
					newParamPopCnstSumLtrsNocs = "";
					newParamPopCnstSumImgNocs = "";
					newParamPopCnstSumVdoNocs = "";
					newParamPopCnstSumSndNocs = "";
					newParamPopCnstSumXrNocs = "";
					newParamPopCnstSumEtcNocs = "";
					newParamPopCnstSumSbtotNocs = "";
					newParamPopCpyrInstKeepYn = "";
					newParamPopCpyrSctnKeepYn = "";
					newParamPopCpyrMakrKeepYn = "";
					newParamPopCpyrKeepUnwnYn = "";
					newParamPopCpyrEnncYn = "";
					newParamPopRlsLmtScpCd = "";
					newParamPopMrfnTrgtSrvcCd = "";
					newParamPopRlsMthdCd = "";
					
					if ($("input[name=popStts]").eq(ci).val() != "D") {
						
						if ($("input[name=popSiteNm]").eq(ci).val() == "") {
							alert("사이트명을 입력해 주십시오.");
							$("input[name=popSiteNm]").eq(ci).focus();
							return false;
						} else {
							newParamPopSiteNm = $("input[name=popSiteNm]").eq(ci).val()
						}
						if ($("input[name=popSiteUrlAddr]").eq(ci).val() == "") {
							alert("사이트URL을 입력해 주십시오.");
							$("input[name=popSiteUrlAddr]").eq(ci).focus();
							return false;
						} else {
							newParamPopSiteUrlAddr = $("input[name=popSiteUrlAddr]").eq(ci).val();
						}
						if ($("input[name=popContsInfoNm]").eq(ci).val() == "") {
							alert("정보(DB)/콘텐츠명을 입력해 주십시오.");
							$("input[name=popContsInfoNm]").eq(ci).focus();
							return false;
						} else {
							newParamPopContsInfoNm = $("input[name=popContsInfoNm]").eq(ci).val();
						}
						if ($("input[name=popSrvcSumCnt]").eq(ci).val() == "") {
							alert("서비스 건수를 입력해 주십시오.");
							return false;
						}
						if ($("input[name=popCnstSumSbtotNocs]").eq(ci).val() == "") {
							alert("구축건수를 입력해 주십시오.");
							return false;
						}
						//구축대상
						if ($("input[name=popCnstTrgtSumNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtSumNocs = "0";
						} else {
							newParamPopCnstTrgtSumNocs = $("input[name=popCnstTrgtSumNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtLtrsNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtLtrsNocs = "0";
						} else {
							newParamPopCnstTrgtLtrsNocs = $("input[name=popCnstTrgtLtrsNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtImgNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtImgNocs = "0";
						} else {
							newParamPopCnstTrgtImgNocs = $("input[name=popCnstTrgtImgNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtVdoNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtVdoNocs = "0";
						} else {
							newParamPopCnstTrgtVdoNocs = $("input[name=popCnstTrgtVdoNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtSndNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtSndNocs = "0";
						} else {
							newParamPopCnstTrgtSndNocs = $("input[name=popCnstTrgtSndNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtXrNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtXrNocs = "0";
						} else {
							newParamPopCnstTrgtXrNocs = $("input[name=popCnstTrgtXrNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtEtcNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtEtcNocs = "0";
						} else {
							newParamPopCnstTrgtEtcNocs = $("input[name=popCnstTrgtEtcNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstTrgtSbtotNocs]").eq(ci).val() == "") {
							newParamPopCnstTrgtSbtotNocs = "0";
						} else {
							newParamPopCnstTrgtSbtotNocs = $("input[name=popCnstTrgtSbtotNocs]").eq(ci).val();
						}
						
						//구축완료
						if ($("input[name=popCnstCmptnNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnNocs = "0";
						} else {
							newParamPopCnstCmptnNocs = $("input[name=popCnstCmptnNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnLtrsNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnLtrsNocs = "0";
						} else {
							newParamPopCnstCmptnLtrsNocs = $("input[name=popCnstCmptnLtrsNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnImgNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnImgNocs = "0";
						} else {
							newParamPopCnstCmptnImgNocs = $("input[name=popCnstCmptnImgNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnVdoNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnVdoNocs = "0";
						} else {
							newParamPopCnstCmptnVdoNocs = $("input[name=popCnstCmptnVdoNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnSndNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnSndNocs = "0";
						} else {
							newParamPopCnstCmptnSndNocs = $("input[name=popCnstCmptnSndNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnXrNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnXrNocs = "0";
						} else {
							newParamPopCnstCmptnXrNocs = $("input[name=popCnstCmptnXrNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnEtcNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnEtcNocs = "0";
						} else {
							newParamPopCnstCmptnEtcNocs = $("input[name=popCnstCmptnEtcNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstCmptnSbtotNocs]").eq(ci).val() == "") {
							newParamPopCnstCmptnSbtotNocs = "0";
						} else {
							newParamPopCnstCmptnSbtotNocs = $("input[name=popCnstCmptnSbtotNocs]").eq(ci).val();
						}
						
						//서비스
						if ($("input[name=popSrvcNocs]").eq(ci).val() == "") {
							newParamPopSrvcNocs = "0";
						} else {
							newParamPopSrvcNocs = $("input[name=popSrvcNocs]").eq(ci).val();
						}
						if ($("input[name=popSrvcLtrsCnt]").eq(ci).val() == "") {
							newParamPopSrvcLtrsCnt = "0";
						} else {
							newParamPopSrvcLtrsCnt = $("input[name=popSrvcLtrsCnt]").eq(ci).val();
						}
						if ($("input[name=popSrvcImgCnt]").eq(ci).val() == "") {
							newParamPopSrvcImgCnt = "0";
						} else {
							newParamPopSrvcImgCnt = $("input[name=popSrvcImgCnt]").eq(ci).val();
						}
						if ($("input[name=popSrvcVdoCnt]").eq(ci).val() == "") {
							newParamPopSrvcVdoCnt = "0";
						} else {
							newParamPopSrvcVdoCnt = $("input[name=popSrvcVdoCnt]").eq(ci).val();
						}
						if ($("input[name=popSrvcSndCnt]").eq(ci).val() == "") {
							newParamPopSrvcSndCnt = "0";
						} else {
							newParamPopSrvcSndCnt = $("input[name=popSrvcSndCnt]").eq(ci).val();
						}
						if ($("input[name=popSrvcXrNocs]").eq(ci).val() == "") {
							newParamPopSrvcXrNocs = "0";
						} else {
							newParamPopSrvcXrNocs = $("input[name=popSrvcXrNocs]").eq(ci).val();
						}
						if ($("input[name=popSrvcEtcNocs]").eq(ci).val() == "") {
							newParamPopSrvcEtcNocs = "0";
						} else {
							newParamPopSrvcEtcNocs = $("input[name=popSrvcEtcNocs]").eq(ci).val();
						}
						if ($("input[name=popSrvcSumCnt]").eq(ci).val() == "") {
							newParamPopSrvcSumCnt = "0";
						} else {
							newParamPopSrvcSumCnt = $("input[name=popSrvcSumCnt]").eq(ci).val();
						}
						
						//합계
						if ($("input[name=popCnstSumNocs]").eq(ci).val() == "") {
							newParamPopCnstSumNocs = "0";
						} else {
							newParamPopCnstSumNocs = $("input[name=popCnstSumNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumLtrsNocs]").eq(ci).val() == "") {
							newParamPopCnstSumLtrsNocs = "0";
						} else {
							newParamPopCnstSumLtrsNocs = $("input[name=popCnstSumLtrsNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumImgNocs]").eq(ci).val() == "") {
							newParamPopCnstSumImgNocs = "0";
						} else {
							newParamPopCnstSumImgNocs = $("input[name=popCnstSumImgNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumVdoNocs]").eq(ci).val() == "") {
							newParamPopCnstSumVdoNocs = "0";
						} else {
							newParamPopCnstSumVdoNocs = $("input[name=popCnstSumVdoNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumSndNocs]").eq(ci).val() == "") {
							newParamPopCnstSumSndNocs = "0";
						} else {
							newParamPopCnstSumSndNocs = $("input[name=popCnstSumSndNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumXrNocs]").eq(ci).val() == "") {
							newParamPopCnstSumXrNocs = "0";
						} else {
							newParamPopCnstSumXrNocs = $("input[name=popCnstSumXrNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumEtcNocs]").eq(ci).val() == "") {
							newParamPopCnstSumEtcNocs = "0";
						} else {
							newParamPopCnstSumEtcNocs = $("input[name=popCnstSumEtcNocs]").eq(ci).val();
						}
						if ($("input[name=popCnstSumSbtotNocs]").eq(ci).val() == "") {
							newParamPopCnstSumSbtotNocs = "0";
						} else {
							newParamPopCnstSumSbtotNocs = $("input[name=popCnstSumSbtotNocs]").eq(ci).val();
						}
						if (($("input[name=popCpyrInstKeepYn]").eq(ci).val() == "N") 
								&& ($("input[name=popCpyrSctnKeepYn]").eq(ci).val() == "N")
								&& ($("input[name=popCpyrMakrKeepYn]").eq(ci).val() == "N")
								&& ($("input[name=popCpyrKeepUnwnYn]").eq(ci).val() == "N")
								&& ($("input[name=popCpyrEnncYn]").eq(ci).val() == "N")) {
							alert("저작권 보유에 대해 설정해 주십시오.");
							return false;
						} else {
							newParamPopCpyrInstKeepYn = $("input[name=popCpyrInstKeepYn]").eq(ci).val();
							newParamPopCpyrSctnKeepYn = $("input[name=popCpyrSctnKeepYn]").eq(ci).val();
							newParamPopCpyrMakrKeepYn = $("input[name=popCpyrMakrKeepYn]").eq(ci).val();
							newParamPopCpyrKeepUnwnYn = $("input[name=popCpyrKeepUnwnYn]").eq(ci).val();
							newParamPopCpyrEnncYn = $("input[name=popCpyrEnncYn]").eq(ci).val();
						}
						if ($("select[name=popRlsLmtScpCd]").eq(ci).val() == "") {
							alert("공개제한범위를 선택해 주십시오.");
							$("select[name=popAplTypeCd]").eq(ci).focus();
							return false;
						} else {
							newParamPopRlsLmtScpCd = $("select[name=popRlsLmtScpCd]").eq(ci).val();
						}
						if ($("select[name=popMrfnTrgtSrvcCd]").eq(ci).val() == "") {
							alert("국민대상서비스여부를 선택해 주십시오.");
							$("select[name=popAplTypeCd]").eq(ci).focus();
							return false;
						} else {
							newParamPopMrfnTrgtSrvcCd = $("select[name=popMrfnTrgtSrvcCd]").eq(ci).val();
						}
						if ($("select[name=popRlsMthdCd]").eq(ci).val() == "") {
							alert("공개방법을 선택해 주십시오.");
							$("select[name=popAplTypeCd]").eq(ci).focus();
							return false;
						} else {
							newParamPopRlsMthdCd = $("select[name=popRlsMthdCd]").eq(ci).val();
						}
					} else {
						newParamPopSiteNm = "EMPTY";
						newParamPopSiteUrlAddr = "EMPTY";
						newParamPopContsInfoNm = "EMPTY";
						newParamPopCnstTrgtSumNocs = "0";
						newParamPopCnstTrgtLtrsNocs = "0";
						newParamPopCnstTrgtImgNocs = "0";
						newParamPopCnstTrgtVdoNocs = "0";
						newParamPopCnstTrgtSndNocs = "0";
						newParamPopCnstTrgtXrNocs = "0";
						newParamPopCnstTrgtEtcNocs = "0";
						newParamPopCnstTrgtSbtotNocs = "0";
						newParamPopCnstCmptnNocs = "0";
						newParamPopCnstCmptnLtrsNocs = "0";
						newParamPopCnstCmptnImgNocs = "0";
						newParamPopCnstCmptnVdoNocs = "0";
						newParamPopCnstCmptnSndNocs = "0";
						newParamPopCnstCmptnXrNocs = "0";
						newParamPopCnstCmptnEtcNocs = "0";
						newParamPopCnstCmptnSbtotNocs = "0";
						newParamPopSrvcNocs = "0";
						newParamPopSrvcLtrsCnt = "0";
						newParamPopSrvcImgCnt = "0";
						newParamPopSrvcVdoCnt = "0";
						newParamPopSrvcSndCnt = "0";
						newParamPopSrvcXrNocs = "0";
						newParamPopSrvcEtcNocs = "0";
						newParamPopSrvcSumCnt = "0";
						newParamPopCnstSumNocs = "0";
						newParamPopCnstSumLtrsNocs = "0";
						newParamPopCnstSumImgNocs = "0";
						newParamPopCnstSumVdoNocs = "0";
						newParamPopCnstSumSndNocs = "0";
						newParamPopCnstSumXrNocs = "0";
						newParamPopCnstSumEtcNocs = "0";
						newParamPopCnstSumSbtotNocs = "0";
						newParamPopCpyrInstKeepYn = "N";
						newParamPopCpyrSctnKeepYn = "N";
						newParamPopCpyrMakrKeepYn = "N";
						newParamPopCpyrKeepUnwnYn = "N";
						newParamPopCpyrEnncYn = "N";
						newParamPopRlsLmtScpCd = "EMPTY";
						newParamPopMrfnTrgtSrvcCd = "EMPTY";
						newParamPopRlsMthdCd = "EMPTY";
					}
					
					if (paramPopStts =="") {
						
						paramPopStts = $("input[name=popStts]").eq(ci).val();
						paramPopContsSn = $("input[name=popContsSn]").eq(ci).val();
						paramPopSiteNm = newParamPopSiteNm;
						paramPopSiteUrlAddr = newParamPopSiteUrlAddr;
						paramPopContsInfoNm = newParamPopContsInfoNm;
						paramPopCnstTrgtSumNocs = newParamPopCnstTrgtSumNocs;
						paramPopCnstTrgtLtrsNocs = newParamPopCnstTrgtLtrsNocs;
						paramPopCnstTrgtImgNocs = newParamPopCnstTrgtImgNocs;
						paramPopCnstTrgtVdoNocs = newParamPopCnstTrgtVdoNocs;
						paramPopCnstTrgtSndNocs = newParamPopCnstTrgtSndNocs;
						paramPopCnstTrgtXrNocs = newParamPopCnstTrgtXrNocs;
						paramPopCnstTrgtEtcNocs = newParamPopCnstTrgtEtcNocs;
						paramPopCnstTrgtSbtotNocs = newParamPopCnstTrgtSbtotNocs;
						paramPopCnstCmptnNocs = newParamPopCnstCmptnNocs;
						paramPopCnstCmptnLtrsNocs = newParamPopCnstCmptnLtrsNocs;
						paramPopCnstCmptnImgNocs = newParamPopCnstCmptnImgNocs;
						paramPopCnstCmptnVdoNocs = newParamPopCnstCmptnVdoNocs;
						paramPopCnstCmptnSndNocs = newParamPopCnstCmptnSndNocs;
						paramPopCnstCmptnXrNocs = newParamPopCnstCmptnXrNocs;
						paramPopCnstCmptnEtcNocs = newParamPopCnstCmptnEtcNocs;
						paramPopCnstCmptnSbtotNocs = newParamPopCnstCmptnSbtotNocs;
						paramPopSrvcNocs = newParamPopSrvcNocs;
						paramPopSrvcLtrsCnt = newParamPopSrvcLtrsCnt;
						paramPopSrvcImgCnt = newParamPopSrvcImgCnt;
						paramPopSrvcVdoCnt = newParamPopSrvcVdoCnt;
						paramPopSrvcSndCnt = newParamPopSrvcSndCnt;
						paramPopSrvcXrNocs = newParamPopSrvcXrNocs;
						paramPopSrvcEtcNocs = newParamPopSrvcEtcNocs;
						paramPopSrvcSumCnt = newParamPopSrvcSumCnt;
						paramPopCnstSumNocs = newParamPopCnstSumNocs;
						paramPopCnstSumLtrsNocs = newParamPopCnstSumLtrsNocs;
						paramPopCnstSumImgNocs = newParamPopCnstSumImgNocs;
						paramPopCnstSumVdoNocs = newParamPopCnstSumVdoNocs;
						paramPopCnstSumSndNocs = newParamPopCnstSumSndNocs;
						paramPopCnstSumXrNocs = newParamPopCnstSumXrNocs;
						paramPopCnstSumEtcNocs = newParamPopCnstSumEtcNocs;
						paramPopCnstSumSbtotNocs = newParamPopCnstSumSbtotNocs;
						paramPopCpyrInstKeepYn = newParamPopCpyrInstKeepYn;
						paramPopCpyrSctnKeepYn = newParamPopCpyrSctnKeepYn;
						paramPopCpyrMakrKeepYn = newParamPopCpyrMakrKeepYn;
						paramPopCpyrKeepUnwnYn = newParamPopCpyrKeepUnwnYn;
						paramPopCpyrEnncYn = newParamPopCpyrEnncYn;
						paramPopRlsLmtScpCd = newParamPopRlsLmtScpCd;
						paramPopMrfnTrgtSrvcCd = newParamPopMrfnTrgtSrvcCd;
						paramPopRlsMthdCd = newParamPopRlsMthdCd;
						
					} else {
						paramPopStts += "|" + $("input[name=popStts]").eq(ci).val();
						paramPopContsSn += "|" + $("input[name=popContsSn]").eq(ci).val();
						paramPopSiteNm += "|" + newParamPopSiteNm;
						paramPopSiteUrlAddr += "|" + newParamPopSiteUrlAddr;
						paramPopContsInfoNm += "|" + newParamPopContsInfoNm;
						paramPopCnstTrgtSumNocs += "|" + newParamPopCnstTrgtSumNocs;
						paramPopCnstTrgtLtrsNocs += "|" + newParamPopCnstTrgtLtrsNocs;
						paramPopCnstTrgtImgNocs += "|" + newParamPopCnstTrgtImgNocs;
						paramPopCnstTrgtVdoNocs += "|" + newParamPopCnstTrgtVdoNocs;
						paramPopCnstTrgtSndNocs += "|" + newParamPopCnstTrgtSndNocs;
						paramPopCnstTrgtXrNocs += "|" + newParamPopCnstTrgtXrNocs;
						paramPopCnstTrgtEtcNocs += "|" + newParamPopCnstTrgtEtcNocs;
						paramPopCnstTrgtSbtotNocs += "|" + newParamPopCnstTrgtSbtotNocs;
						paramPopCnstCmptnNocs += "|" + newParamPopCnstCmptnNocs;
						paramPopCnstCmptnLtrsNocs += "|" + newParamPopCnstCmptnLtrsNocs;
						paramPopCnstCmptnImgNocs += "|" + newParamPopCnstCmptnImgNocs;
						paramPopCnstCmptnVdoNocs += "|" + newParamPopCnstCmptnVdoNocs;
						paramPopCnstCmptnSndNocs += "|" + newParamPopCnstCmptnSndNocs;
						paramPopCnstCmptnXrNocs += "|" + newParamPopCnstCmptnXrNocs;
						paramPopCnstCmptnEtcNocs += "|" + newParamPopCnstCmptnEtcNocs;
						paramPopCnstCmptnSbtotNocs += "|" + newParamPopCnstCmptnSbtotNocs;
						paramPopSrvcNocs += "|" + newParamPopSrvcNocs;
						paramPopSrvcLtrsCnt += "|" + newParamPopSrvcLtrsCnt;
						paramPopSrvcImgCnt += "|" + newParamPopSrvcImgCnt;
						paramPopSrvcVdoCnt += "|" + newParamPopSrvcVdoCnt;
						paramPopSrvcSndCnt += "|" + newParamPopSrvcSndCnt;
						paramPopSrvcXrNocs += "|" + newParamPopSrvcXrNocs;
						paramPopSrvcEtcNocs += "|" + newParamPopSrvcEtcNocs;
						paramPopSrvcSumCnt += "|" + newParamPopSrvcSumCnt;
						paramPopCnstSumNocs += "|" + newParamPopCnstSumNocs;
						paramPopCnstSumLtrsNocs += "|" + newParamPopCnstSumLtrsNocs;
						paramPopCnstSumImgNocs += "|" + newParamPopCnstSumImgNocs;
						paramPopCnstSumVdoNocs += "|" + newParamPopCnstSumVdoNocs;
						paramPopCnstSumSndNocs += "|" + newParamPopCnstSumSndNocs;
						paramPopCnstSumXrNocs += "|" + newParamPopCnstSumXrNocs;
						paramPopCnstSumEtcNocs += "|" + newParamPopCnstSumEtcNocs;
						paramPopCnstSumSbtotNocs += "|" + newParamPopCnstSumSbtotNocs;
						paramPopCpyrInstKeepYn += "|" + newParamPopCpyrInstKeepYn;
						paramPopCpyrSctnKeepYn += "|" + newParamPopCpyrSctnKeepYn;
						paramPopCpyrMakrKeepYn += "|" + newParamPopCpyrMakrKeepYn;
						paramPopCpyrKeepUnwnYn += "|" + newParamPopCpyrKeepUnwnYn;
						paramPopCpyrEnncYn += "|" + newParamPopCpyrEnncYn;
						paramPopRlsLmtScpCd += "|" + newParamPopRlsLmtScpCd;
						paramPopMrfnTrgtSrvcCd += "|" + newParamPopMrfnTrgtSrvcCd;
						paramPopRlsMthdCd += "|" + newParamPopRlsMthdCd;
					}
					
					let rcsexmnCltContInfoObj = {
							
							status : $("input[name=popStts]").eq(ci).val(),
							
							contsSn : $("input[name=popContsSn]").eq(ci).val(),
							
							rcsexmnId : paramPopRcsexmnId,
							
							instId : paramPopInstId,
							
							siteNm : newParamPopSiteNm,
							
							siteUrlAddr : newParamPopSiteUrlAddr,
							
							contsInfoNm : newParamPopContsInfoNm,
							 
							cnstTrgtSumNocs : newParamPopCnstTrgtSumNocs,
							
							cnstTrgtLtrsNocs : newParamPopCnstTrgtLtrsNocs,
							 
							cnstTrgtImgNocs : newParamPopCnstTrgtImgNocs,
							 
							cnstTrgtVdoNocs : newParamPopCnstTrgtVdoNocs,
							 
							cnstTrgtSndNocs : newParamPopCnstTrgtSndNocs,
							
							cnstTrgtXrNocs : newParamPopCnstTrgtXrNocs,
							
							cnstTrgtEtcNocs : newParamPopCnstTrgtEtcNocs,
							
							cnstTrgtSbtotNocs : newParamPopCnstTrgtSbtotNocs,
							
							cnstCmptnNocs : newParamPopCnstCmptnNocs,
							
							cnstCmptnLtrsNocs : newParamPopCnstCmptnLtrsNocs,
							
							cnstCmptnImgNocs : newParamPopCnstCmptnImgNocs,
							
							cnstCmptnVdoNocs : newParamPopCnstCmptnVdoNocs,
							
							cnstCmptnSndNocs : newParamPopCnstCmptnSndNocs,
							
							cnstCmptnXrNocs : newParamPopCnstCmptnXrNocs,
							
							cnstCmptnEtcNocs : newParamPopCnstCmptnEtcNocs,
							
							cnstCmptnSbtotNocs : newParamPopCnstCmptnSbtotNocs,
							
							srvcNocs : newParamPopSrvcNocs,
							
							srvcLtrsCnt : newParamPopSrvcLtrsCnt,
							 
							srvcImgCnt : newParamPopSrvcImgCnt,
							
							srvcVdoCnt : newParamPopSrvcVdoCnt,
							
							srvcSndCnt : newParamPopSrvcSndCnt,
							
							srvcXrNocs : newParamPopSrvcXrNocs,
							
							srvcEtcNocs : newParamPopSrvcEtcNocs,
							
							srvcSumCnt : newParamPopSrvcSumCnt,
							
							cnstSumNocs : newParamPopCnstSumNocs,
							
							cnstSumLtrsNocs : newParamPopCnstSumLtrsNocs,
							
							cnstSumImgNocs : newParamPopCnstSumImgNocs,
							
							cnstSumVdoNocs : newParamPopCnstSumVdoNocs,
							
							cnstSumSndNocs : newParamPopCnstSumSndNocs,
							
							cnstSumXrNocs : newParamPopCnstSumXrNocs,
							
							cnstSumEtcNocs : newParamPopCnstSumEtcNocs,
							
							cnstSumSbtotNocs : newParamPopCnstSumSbtotNocs,
							
							cpyrInstKeepYn : newParamPopCpyrInstKeepYn,
							
							cpyrSctnKeepYn : newParamPopCpyrSctnKeepYn,
							
							cpyrMakrKeepYn : newParamPopCpyrMakrKeepYn,
							
							cpyrKeepUnwnYn : newParamPopCpyrKeepUnwnYn,
							
							cpyrEnncYn : newParamPopCpyrEnncYn,
							
							rlsLmtScpCd : newParamPopRlsLmtScpCd,
							
							mrfnTrgtSrvcCd : newParamPopMrfnTrgtSrvcCd,
							
							rlsMthdCd : newParamPopRlsMthdCd		
							
					};
					rcsexmnCltContInfoList.push(rcsexmnCltContInfoObj);
				}
				
			} else {
				if ($("input[name=popStts]").val() != "D") {
					if ($("input[name=popSiteNm]").val() == "") {
						alert("사이트명을 입력해 주십시오.");
						$("input[name=popSiteNm]").focus();
						return false;
					}
					if ($("input[name=popSiteUrlAddr]").val() == "") {
						alert("사이트URL을 입력해 주십시오.");
						$("input[name=popSiteUrlAddr]").focus();
						return false;
					}
					if ($("input[name=popContsInfoNm]").val() == "") {
						alert("정보(DB)/콘텐츠명을 입력해 주십시오.");
						$("input[name=popContsInfoNm]").focus();
						return false;
					}
					if ($("input[name=popSrvcSumCnt]").val() == "") {
						alert("서비스 건수를 입력해 주십시오.");
						return false;
					}
					if ($("input[name=popCnstSumSbtotNocs]").val() == "") {
						alert("구축건수를 입력해 주십시오.");
						return false;
					}
					if (($("input[name=popCpyrInstKeepYn]").val() == "N") 
							&& ($("input[name=popCpyrSctnKeepYn]").val() == "N")
							&& ($("input[name=popCpyrMakrKeepYn]").val() == "N")
							&& ($("input[name=popCpyrKeepUnwnYn]").val() == "N")
							&& ($("input[name=popCpyrEnncYn]").val() == "N")) {
						alert("저작권 보유에 대해 설정해 주십시오.");
						return false;
					}
					if ($("select[name=popRlsLmtScpCd]").val() == "") {
						alert("공개제한범위를 선택해 주십시오.");
						$("select[name=popAplTypeCd]").focus();
						return false;
					}
					if ($("select[name=popMrfnTrgtSrvcCd]").val() == "") {
						alert("국민대상서비스여부를 선택해 주십시오.");
						$("select[name=popAplTypeCd]").focus();
						return false;
					}
					if ($("select[name=popRlsMthdCd]").val() == "") {
						alert("공개방법을 선택해 주십시오.");
						$("select[name=popAplTypeCd]").focus();
						return false;
					}
					
					paramPopStts = $("input[name=popStts]").val();;
					paramPopContsSn = $("input[name=popContsSn]").val();;
					paramPopSiteNm = $("input[name=popSiteNm]").val();
					paramPopSiteUrlAddr = $("input[name=popSiteUrlAddr]").val();
					paramPopContsInfoNm = $("input[name=popContsInfoNm]").val();
					
					paramPopCnstTrgtSumNocs = $("input[name=popCnstTrgtSumNocs]").val();
					paramPopCnstTrgtLtrsNocs = $("input[name=popCnstTrgtLtrsNocs]").val();
					paramPopCnstTrgtImgNocs = $("input[name=popCnstTrgtImgNocs]").val();
					paramPopCnstTrgtVdoNocs = $("input[name=popCnstTrgtVdoNocs]").val();
					paramPopCnstTrgtSndNocs = $("input[name=popCnstTrgtSndNocs]").val();
					paramPopCnstTrgtXrNocs = $("input[name=popCnstTrgtXrNocs]").val();
					paramPopCnstTrgtEtcNocs = $("input[name=popCnstTrgtEtcNocs]").val();
					paramPopCnstTrgtSbtotNocs = $("input[name=popCnstTrgtSbtotNocs]").val();
					
					paramPopCnstCmptnNocs = $("input[name=popCnstCmptnNocs]").val();
					paramPopCnstCmptnLtrsNocs = $("input[name=popCnstCmptnLtrsNocs]").val();
					paramPopCnstCmptnImgNocs = $("input[name=popCnstCmptnImgNocs]").val();
					paramPopCnstCmptnVdoNocs = $("input[name=popCnstCmptnVdoNocs]").val();
					paramPopCnstCmptnSndNocs = $("input[name=popCnstCmptnSndNocs]").val();
					paramPopCnstCmptnXrNocs = $("input[name=popCnstCmptnXrNocs]").val();
					paramPopCnstCmptnEtcNocs = $("input[name=popCnstCmptnEtcNocs]").val();
					paramPopCnstCmptnSbtotNocs = $("input[name=popCnstCmptnSbtotNocs]").val();
					
					paramPopSrvcNocs = $("input[name=popSrvcNocs]").val();
					paramPopSrvcLtrsCnt = $("input[name=popSrvcLtrsCnt]").val();
					paramPopSrvcImgCnt = $("input[name=popSrvcImgCnt]").val();
					paramPopSrvcVdoCnt = $("input[name=popSrvcVdoCnt]").val();
					paramPopSrvcSndCnt = $("input[name=popSrvcSndCnt]").val();
					paramPopSrvcXrNocs = $("input[name=popSrvcXrNocs]").val();
					paramPopSrvcEtcNocs = $("input[name=popSrvcEtcNocs]").val();
					paramPopSrvcSumCnt = $("input[name=popSrvcSumCnt]").val();
					
					paramPopCnstSumNocs = $("input[name=popCnstSumNocs]").val();
					paramPopCnstSumLtrsNocs = $("input[name=popCnstSumLtrsNocs]").val();
					paramPopCnstSumImgNocs = $("input[name=popCnstSumImgNocs]").val();
					paramPopCnstSumVdoNocs = $("input[name=popCnstSumVdoNocs]").val();
					paramPopCnstSumSndNocs = $("input[name=popCnstSumSndNocs]").val();
					paramPopCnstSumXrNocs = $("input[name=popCnstSumXrNocs]").val();
					paramPopCnstSumEtcNocs = $("input[name=popCnstSumEtcNocs]").val();
					paramPopCnstSumSbtotNocs = $("input[name=popCnstSumSbtotNocs]").val();
					
					paramPopCpyrInstKeepYn = $("input[name=popCpyrInstKeepYn]").val();
					paramPopCpyrSctnKeepYn = $("input[name=popCpyrSctnKeepYn]").val();
					paramPopCpyrMakrKeepYn = $("input[name=popCpyrMakrKeepYn]").val();
					paramPopCpyrKeepUnwnYn = $("input[name=popCpyrKeepUnwnYn]").val();
					paramPopCpyrEnncYn = $("input[name=popCpyrEnncYn]").val();
					
					paramPopRlsLmtScpCd = $("select[name=popRlsLmtScpCd]").val();
					paramPopMrfnTrgtSrvcCd = $("select[name=popMrfnTrgtSrvcCd]").val();
					paramPopRlsMthdCd = $("select[name=popRlsMthdCd]").val();
				} else {
					paramPopStts = "";
					paramPopContsSn = "";
				}
			}
		}
		
		if (paramPopStts == "" || (paramPopStts == "D" && paramPopContsSn == "0")) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return false;
		}

		if (confirm("문화정보(DB)/디지털콘텐츠 현황 정보를를 저장하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnCltContInfo.do",
				async : true,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(rcsexmnCltContInfoList),
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 문화정보(DB)/디지털콘텐츠 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//4.정보 서비스현황 -1) 모바일앱/웹 현황
	function moveSaveRcsexmnMbAplInfo() {
		
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopStts = "";
		let paramPopAplSn = "";
		let paramPopAplTypeCd = "";
		let paramPopAplNm = "";
		let paramPopAplWebUrlAddr = "";
		let paramPopOsNm = "";
		let paramPopDevYr = "";
		let paramPopDevBgtAmt = "";
		
		let newParamPopAplTypeCd = "";
		let newParamPopAplNm = "";
		let newParamPopAplWebUrlAddr = "";
		let newParamPopOsNm = "";
		let newParamPopDevYr = "";
		let newParamPopDevBgtAmt = "";
		
		let rcsExmnInfrmBizPrgrsInfoList = [];
		
		if (typeof($("input[name=popStts]")) != "undefined") {
			if (typeof($("input[name=popStts]").length) != "undefined" ) {
				
				for (let mi = 0; mi < $("input[name=popStts]").length; mi++) {
					newParamPopAplTypeCd = "";
					newParamPopAplNm = "";
					newParamPopAplWebUrlAddr = "";
					newParamPopOsNm = "";
					newParamPopDevYr = "";
					newParamPopDevBgtAmt = "";
					
					
					if ($("input[name=popStts]").eq(mi).val() != "D") {	
						
						if ($("select[name=popAplTypeCd]").eq(mi).val() == "") {
							alert("유형을 선택해 주십시오.");
							$("select[name=popAplTypeCd]").eq(mi).focus();
							return false;
						} else {
							newParamPopAplTypeCd = $("select[name=popAplTypeCd]").eq(mi).val();
						}
						
						if ($("input[name=popAplNm]").eq(mi).val() == "") {
							alert("명칭을 입력해 주십시오.");
							$("input[name=popAplNm]").eq(mi).focus();
							return false;
						} else {
							newParamPopAplNm = $("input[name=popAplNm]").eq(mi).val();
						}
						
						if ($("input[name=popAplWebUrlAddr]").eq(mi).val() == "") {
							newParamPopAplWebUrlAddr = "EMPTY";
						} else {
							newParamPopAplWebUrlAddr = $("input[name=popAplWebUrlAddr]").eq(mi).val();
						}
						
						if ($("input[name=popOsNm]").eq(mi).val() == "") {
							newParamPopOsNm = "EMPTY";
						} else {
							newParamPopOsNm = $("input[name=popOsNm]").eq(mi).val();
						}
						if ($("input[name=popDevYr]").eq(mi).val() == "") {
							alert("개발연도를 입력해 주십시오.");
							$("input[name=popDevYr]").eq(mi).focus();
							return false;
						} else {
							newParamPopDevYr = $("input[name=popDevYr]").eq(mi).val();
						}
						if ($("input[name=popDevBgtAmt]").eq(mi).val() == "") {
							alert("개발예산을 입력해 주십시오.");
							$("input[name=popDevBgtAmt]").eq(mi).focus();
							return false;
						} else {
							newParamPopDevBgtAmt = $("input[name=popDevBgtAmt]").eq(mi).val();
						}
						
					} else {
						newParamPopAplTypeCd = "EMPTY";
						newParamPopAplNm = "EMPTY";
						newParamPopAplWebUrlAddr = "EMPTY";
						newParamPopOsNm = "EMPTY";
						newParamPopDevYr = "EMPTY";
						newParamPopDevBgtAmt = "EMPTY";
					}
					
						
					
					if (paramPopStts =="") {
						paramPopStts = $("input[name=popStts]").eq(mi).val();
						paramPopAplSn = $("input[name=popAplSn]").eq(mi).val();
						paramPopAplTypeCd = newParamPopAplTypeCd;
						paramPopAplNm = newParamPopAplNm;
						paramPopAplWebUrlAddr = newParamPopAplWebUrlAddr;
						paramPopOsNm = newParamPopOsNm;
						paramPopDevYr = newParamPopDevYr;
						paramPopDevBgtAmt = newParamPopDevBgtAmt;
						
						let rcsExmnInfrmBizPrgrsInfoObj = {
							status : $("input[name=popStts]").eq(mi).val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							aplSn : $("input[name=popAplSn]").eq(mi).val(),
							aplTypeCd : newParamPopAplTypeCd,
							aplNm : newParamPopAplNm,
							aplWebUrlAddr : newParamPopAplWebUrlAddr,
							osNm : newParamPopOsNm,
							devYr : newParamPopDevYr,
							devBgtAmt : newParamPopDevBgtAmt,
						};
						rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
					} else {
						paramPopStts += "|" + $("input[name=popStts]").eq(mi).val();
						paramPopAplSn += "|" + $("input[name=popAplSn]").eq(mi).val();
						paramPopAplTypeCd += "|" + newParamPopAplTypeCd;
						paramPopAplNm += "|" + newParamPopAplNm;
						paramPopAplWebUrlAddr += "|" + newParamPopAplWebUrlAddr;
						paramPopOsNm += "|" + newParamPopOsNm;
						paramPopDevYr += "|" + newParamPopDevYr;
						paramPopDevBgtAmt += "|" + newParamPopDevBgtAmt;
						
						
						let rcsExmnInfrmBizPrgrsInfoObj = {
							status : $("input[name=popStts]").eq(mi).val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							aplSn : $("input[name=popAplSn]").eq(mi).val(),
							aplTypeCd : newParamPopAplTypeCd,
							aplNm : newParamPopAplNm,
							aplWebUrlAddr : newParamPopAplWebUrlAddr,
							osNm : newParamPopOsNm,
							devYr : newParamPopDevYr,
							devBgtAmt : newParamPopDevBgtAmt,
						};
						rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
					}
				}
				
				
			} else {
				if ($("input[name=popStts]").val() != "D") {
					if ($("select[name=popAplTypeCd]").val() == "") {
						alert("유형을 선택해 주십시오.");
						$("select[name=popAplTypeCd]").focus();
						return false;
					}
					if ($("input[name=popAplNm]").val() == "") {
						alert("명칭을 입력해 주십시오.");
						$("input[name=popAplNm]").focus();
						return false;
					} 
					if ($("input[name=popDevYr]").val() == "") {
						alert("개발연도를 입력해 주십시오.");
						$("input[name=popDevYr]").focus();
						return false;
					}
					if ($("input[name=popDevBgtAmt]").val() == "") {
						alert("개발예산을 입력해 주십시오.");
						$("input[name=popDevBgtAmt]").focus();
						return false;
					}
					
					paramPopStts = $("input[name=popStts]").val();
					paramPopAplSn = $("input[name=popAplSn]").val();
					paramPopAplTypeCd = $("select[name=popAplTypeCd]").val();
					paramPopAplNm = $("input[name=popAplNm]").val();
					paramPopAplWebUrlAddr = $("input[name=popAplWebUrlAddr]").val();
					paramPopOsNm = $("input[name=popOsNm]").val();
					paramPopDevYr = $("input[name=popDevYr]").val();
					paramPopDevBgtAmt = $("input[name=popDevBgtAmt]").val();
					
					let rcsExmnInfrmBizPrgrsInfoObj = {
						status : $("input[name=popStts]").eq(mi).val(),
						rcsexmnId : paramPopRcsexmnId,
						instId : paramPopInstId,
						aplSn : $("input[name=popAplSn]").eq(mi).val(),
						aplTypeCd : newParamPopAplTypeCd,
						aplNm : newParamPopAplNm,
						aplWebUrlAddr : newParamPopAplWebUrlAddr,
						osNm : newParamPopOsNm,
						devYr : newParamPopDevYr,
						devBgtAmt : newParamPopDevBgtAmt,
					};
					rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
				} else {
					paramPopStts = "";
					paramPopAplSn = "";
				}
			}
		}
		
		if (paramPopStts == "" || (paramPopStts == "D" && paramPopAplSn == "0")) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return false;
		}

		if (confirm("정보서비스 현황 - 모바일앱/웹 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnMbAplInfo.do",
				dataType : "json",
				contentType : "application/json",
				async : true,
				data : JSON.stringify(rcsExmnInfrmBizPrgrsInfoList),
				success : function(rtnData) {
					if (rtnData.result == "N") {
						alert(" 데이터 이상으로 정보서비스 현황 - 모바일앱/웹 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//4.정보 서비스 현황 - 2) 기관별 SNS 홍보채널 운영 현황
	function moveSaveRcsexmnInstPrChnlInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopStts = "";
		let paramPopChnlSn = "";
		let paramPopChnlTypeCd = "";
		let paramPopChnlAddr = "";
		let paramPopOperMnbdTypeCd = "";
		let paramPopSrvcPrpsExpln = "";
		

		let newParamPopChnlTypeCd = "";
		let newParamPopChnlAddr = "";
		let newParamPopOperMnbdTypeCd = "";
		let newParamPopSrvcPrpsExpln = "";
		
		let rcsexmnInstPrChnlInfoList = [];
		if (typeof($("input[name=popStts]")) != "undefined") {
			if (typeof($("input[name=popStts]").length) != "undefined" ) {
				for (let pci = 0; pci < $("input[name=popStts]").length; pci++) {
					
					newParamPopChnlTypeCd = "";
					newParamPopChnlAddr = "";
					newParamPopOperMnbdTypeCd = "";
					newParamPopSrvcPrpsExpln = "";
					
					if ($("input[name=popStts]").eq(pci).val() != "D") {	
					
						if ($("select[name=popChnlTypeCd]").eq(pci).val() == "") {
							alert("SNS채널유형을 선택해 주십시오.");
							$("select[name=popChnlTypeCd]").focus();
							return false;
						}
						if ($("input[name=popChnlAddr]").eq(pci).val() == "") {
							alert("SNS채널주소를 입력해 주십시오.");
							$("input[name=popChnlAddr]").eq(pci).focus();
							return false;
						}
						if ($("select[name=popOperMnbdTypeCd]").eq(pci).val() == "") {
							alert("운영주체를 선택해 주십시오.");
							$("select[name=popOperMnbdTypeCd]").eq(pci).focus();
							return false;
						}
						if ($("input[name=popSrvcPrpsExpln]").eq(pci).val() == "") {
							alert("서비스 목적을 입력해 주십시오.");
							$("input[name=popSrvcPrpsExpln]").eq(pci).focus();
							return false;
						}
						
					} else {
						newParamPopChnlTypeCd = "EMPTY";
						newParamPopChnlAddr = "EMPTY";
						newParamPopOperMnbdTypeCd = "EMPTY";
						newParamPopSrvcPrpsExpln = "EMPTY";
					}
					
					
					if (paramPopStts =="") {
						paramPopStts = $("input[name=popStts]").eq(pci).val();
						paramPopChnlSn = $("input[name=popChnlSn]").eq(pci).val();
						paramPopChnlTypeCd = $("select[name=popChnlTypeCd]").eq(pci).val() 
						paramPopChnlAddr = $("input[name=popChnlAddr]").eq(pci).val();
						paramPopOperMnbdTypeCd = $("select[name=popOperMnbdTypeCd]").eq(pci).val() 
						paramPopSrvcPrpsExpln = $("input[name=popSrvcPrpsExpln]").eq(pci).val();
					} else {
						paramPopStts += "|" + $("input[name=popStts]").eq(pci).val();
						paramPopChnlSn += "|" + $("input[name=popChnlSn]").eq(pci).val();
						paramPopChnlTypeCd += "|" + $("select[name=popChnlTypeCd]").eq(pci).val() 
						paramPopChnlAddr += "|" + $("input[name=popChnlAddr]").eq(pci).val();
						paramPopOperMnbdTypeCd += "|" + $("select[name=popOperMnbdTypeCd]").eq(pci).val() 
						paramPopSrvcPrpsExpln += "|" + $("input[name=popSrvcPrpsExpln]").eq(pci).val();
					}
					
					let rcsexmnInstPrChnlInfoObj = {
						
						status : $("input[name=popStts]").eq(pci).val(),
						
						rcsexmnId : paramPopRcsexmnId,
						
						instId : paramPopInstId,
						
						chnlSn : $("input[name=popChnlSn]").eq(pci).val(),
						
						chnlTypeCd : $("select[name=popChnlTypeCd]").eq(pci).val(),
						
						chnlAddr : $("input[name=popChnlAddr]").eq(pci).val(),
						
						operMnbdTypeCd : $("select[name=popOperMnbdTypeCd]").eq(pci).val(),
						
						srvcPrpsExpln : $("input[name=popSrvcPrpsExpln]").eq(pci).val()
						};
					rcsexmnInstPrChnlInfoList.push(rcsexmnInstPrChnlInfoObj);
					
				}
				
			} else {
				if ($("input[name=popStts]").val() != "D") {
					
					if ($("select[name=popChnlTypeCd]").val() == "") {
						alert("SNS채널유형을 선택해 주십시오.");
						$("select[name=popChnlTypeCd]").focus();
						return false;
					}
					if ($("input[name=popChnlAddr]").val() == "") {
						alert("SNS채널주소를 입력해 주십시오.");
						$("input[name=popChnlAddr]").focus();
						return false;
					}
					if ($("select[name=popOperMnbdTypeCd]").val() == "") {
						alert("운영주체를 선택해 주십시오.");
						$("select[name=popChnlTypeCd]").focus();
						return false;
					}
					if ($("input[name=popSrvcPrpsExpln]").val() == "") {
						alert("서비스 목적을 입력해 주십시오.");
						$("input[name=popSrvcPrpsExpln]").focus();
						return false;
					}
					
					paramPopStts = $("input[name=popStts]").val();
					paramPopChnlSn = $("input[name=popChnlSn]").val();
					paramPopChnlTypeCd = $("select[name=popChnlTypeCd]").val();
					paramPopChnlAddr = $("input[name=popChnlAddr]").val();
					paramPopOperMnbdTypeCd = $("select[name=popOperMnbdTypeCd]").val();
					paramPopSrvcPrpsExpln = $("input[name=popSrvcPrpsExpln]").val();
					
				} else {
					paramPopStts = "";
					paramPopChnlSn = "";
				}
				
				let rcsexmnInstPrChnlInfoObj = {
						
					/* 수정여부? */
					status : $("input[name=popStts]").eq(pci).val(),
					/* 자원조사아이디 */
					rcsexmnId : paramPopRcsexmnId,
					/* 기관아이디 */
					instId : paramPopInstId,
					/* 채널일련번호 */
					chnlSn : $("input[name=popChnlSn]").eq(pci).val(),
					/* 채널유형코드 */
					chnlTypeCd : $("select[name=popChnlTypeCd]").eq(pci).val(),
					/* 채널주소 */
					chnlAddr : $("input[name=popChnlAddr]").eq(pci).val(),
					/* 운영주체유형코드 */
					operMnbdTypeCd : $("select[name=popOperMnbdTypeCd]").eq(pci).val(),
					/* 서비스목적설명 */
					srvcPrpsExpln : $("input[name=popSrvcPrpsExpln]").eq(pci).val()
					};
				rcsexmnInstPrChnlInfoList.push(rcsexmnInstPrChnlInfoObj);
			}
		}
		
		if (paramPopStts == "" || (paramPopStts == "D" && paramPopChnlSn == "0")) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return false;
		}
		
		if (confirm("기관별 SNS 홍보채널 운영 현황 정보를 저장하시겠습니까?")) {
			
			$.ajax({
				type : "POST",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnInstPrChnlInfo.do",
				async : true,
				contentType : "application/json",
				dataType : "json",
				data : JSON.stringify(rcsexmnInstPrChnlInfoList),
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 기관별 SNS 홍보채널 운영 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//5.인프라 현황 - 1)클라우드 구축 현황
	function moveSaveRcsexmnCludEqpmentInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopCludUtztnYn = $("#popCludUtztnYn").val();
		let paramPopCludSn = $("#popCludSn").val();
		let paramPopCludUtlzTypeCd = "";
		let paramPopCludFyerCost = "";
		let paramPopCludBzentyNm = "";
		let paramPopCludIaasYn = "";
		let paramPopCludSaasYn = "";
		let paramPopCludPaasYn = "";
		let paramPopItdiYr = "";
		
		if (paramPopCludUtztnYn == "Y") {
			paramPopCludUtlzTypeCd = $("#popCludUtlzTypeCd").val();
			paramPopCludSn = $("#popCludSn").val();
			if (paramPopCludUtlzTypeCd == "") {
				alert("이용 클라우드를 선택해 주십비시오.")
				$("#popCludUtlzTypeCd").focus();
				return false;
			} else {
				if (paramPopCludUtlzTypeCd == "CLUDTY0001") { //민간클라우드
					if ($("#popPublicCludFyerCost").val() == "") {
						alert("연간 이용요금(백만원)을 입력해 주십시오.");
						$("#popPublicCludFyerCost").focus();
						return false;
					} else {
						paramPopCludFyerCost = $("#popPublicCludFyerCost").val()
					}
					if ($("#popPublicCludBzentyNm").val() == "") {
						alert("클라우드 제공 업체명을 입력해 주십시오.");
						$("#popPublicCludBzentyNm").focus();
						return false;
					} else {
						paramPopCludBzentyNm = $("#popPublicCludBzentyNm").val()
					}
					if (($("#popPulbicCloudIaaS").is(":checked") == false) && ($("#popPulbicCloudSaaS").is(":checked") == false) && ($("#popPulbicCloudPaaS").is(":checked") == false)) {
						alert("이용 클라우드를 선택해 주십시오");
						return false;
					} else {
						if ($("#popPulbicCloudIaaS").is(":checked") == true) {
							paramPopCludIaasYn = "Y";
						} else {
							paramPopCludIaasYn = "N";
						}
						if ($("#popPulbicCloudSaaS").is(":checked") == true) {
							paramPopCludSaasYn = "Y";
						} else {
							paramPopCludSaasYn = "N";
						}
						if ($("#popPulbicCloudPaaS").is(":checked") == true) {
							paramPopCludPaasYn = "Y";
						} else {
							paramPopCludPaasYn = "N";
						}
					}
					if ($("#popPublicItdiYr").val() == "") {
						alert("도입연도를 입력해 주십시오.");
						$("#popPublicItdiYr").focus();
						return false;
					} else {
						paramPopItdiYr = $("#popPublicItdiYr").val()
					}
				} else if (paramPopCludUtlzTypeCd == "CLUDTY0002") { //국가정보자원관리원 클라우드
					paramPopCludFyerCost = "";
					paramPopCludBzentyNm = "";
					paramPopCludIaasYn = "";
					paramPopCludSaasYn = "";
					paramPopCludPaasYn = "";
					paramPopItdiYr = "";
					
				} else if (paramPopCludUtlzTypeCd == "CLUDTY0003") { //자체클라우드(Private Cloud)
					paramPopCludBzentyNm = "";
					
					if ($("#popPrivateCludFyerCost").val() == "") {
						alert("연간 유지비(백만원)을 입력해 주십시오.");
						$("#popPrivateCludFyerCost").focus();
						return false;
					} else {
						paramPopCludFyerCost = $("#popPrivateCludFyerCost").val()
					}
					if (($("#popPrivateCloudIaaS").is(":checked") == false) && ($("#popPrivateCloudSaaS").is(":checked") == false) && ($("#popPrivateCloudPaaS").is(":checked") == false)) {
						alert("이용 클라우드를 선택해 주십시오");
						return false;
					} else {
						if ($("#popPrivateCloudIaaS").is(":checked") == true) {
							paramPopCludIaasYn = "Y";
						} else {
							paramPopCludIaasYn = "N";
						}
						if ($("#popPrivateCloudSaaS").is(":checked") == true) {
							paramPopCludSaasYn = "Y";
						} else {
							paramPopCludSaasYn = "N";
						}
						if ($("#popPrivateCloudPaaS").is(":checked") == true) {
							paramPopCludPaasYn = "Y";
						} else {
							paramPopCludPaasYn = "N";
						}
					}
					if ($("#popPrivateItdiYr").val() == "") {
						alert("도입연도를 입력해 주십시오.");
						$("#popPrivateItdiYr").focus();
						return false;
					} else {
						paramPopItdiYr = $("#popPrivateItdiYr").val()
					}
					
				} else {
					alert("시스템 이상입니다. 관리자에게 문의해 주십시오.")
					return false;
				}
			}
			
		}
		
		if (confirm("클라우드 구축 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnCludEqpmentInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popCludUtztnYn" : paramPopCludUtztnYn,
					"popCludSn" : paramPopCludSn,
					"popCludUtlzTypeCd" : paramPopCludUtlzTypeCd,
					"popCludFyerCost" : paramPopCludFyerCost,
					"popCludBzentyNm" : paramPopCludBzentyNm,
					"popCludIaasYn" : paramPopCludIaasYn,
					"popCludSaasYn" : paramPopCludSaasYn,
					"popCludPaasYn" : paramPopCludPaasYn,
					"popItdiYr" : paramPopItdiYr
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 클라우드 구축 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	
	//5.인프라 현황 - 2)서버 장비 현황
	function moveSaveRcsexmnEqpmentSrvrInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		
		let paramPopStts = "";
		let paramPopSrvrSn = "";
		let paramPopSrvrTypeCd = "";
		let paramPopItemNm = "";
		let paramPopMdlNm = "";
		let paramPopOsNm = "";
		let paramPopMkrNm = "";
		let paramPopSrvrCpuNm = "";
		let paramPopSrvrMmryNm = "";
		let paramPopStrSzCn = "";
		let paramPopKeepTypeCn = "";
		let paramPopSrvrEqpmntCnt = "";
		let paramPopItdiYr = "";
		let paramPopVrAplcnYn = "";
		let paramPopItdiCost = "";
		let paramPopOperCost = "";
		let paramPopUsgExpln = "";
		

		let newParamPopSrvrTypeCd = "";
		let newParamPopItemNm = "";
		let newParamPopMdlNm = "";
		let newParamPopOsNm = "";
		let newParamPopMkrNm = "";
		let newParamPopSrvrCpuNm = "";
		let newParamPopSrvrMmryNm = "";
		let newParamPopStrSzCn = "";
		let newParamPopKeepTypeCn = "";
		let newParamPopSrvrEqpmntCnt = "";
		let newParamPopItdiYr = "";
		let newParamPopVrAplcnYn = "";
		let newParamPopItdiCost = "";
		let newParamPopOperCost = "";
		let newParamPopUsgExpln = "";
		
		let rcsExmnInfrmBizPrgrsInfoList = [];
		
		if (typeof($("input[name=popStts]")) != "undefined") {
			if (typeof($("input[name=popStts]").length) != "undefined" ) {
				
				for (let si = 0; si < $("input[name=popStts]").length; si++) {
					newParamPopSrvrTypeCd = "";
					newParamPopItemNm = "";
					newParamPopMdlNm = "";
					newParamPopOsNm = "";
					newParamPopMkrNm = "";
					newParamPopSrvrCpuNm = "";
					newParamPopSrvrMmryNm = "";
					newParamPopStrSzCn = "";
					newParamPopKeepTypeCn = "";
					newParamPopSrvrEqpmntCnt = "";
					newParamPopItdiYr = "";
					newParamPopVrAplcnYn = "";
					newParamPopItdiCost = "";
					newParamPopOperCost = "";
					newParamPopUsgExpln = "";
					
					if ($("input[name=popStts]").eq(si).val() != "D") {
						
						if ($("select[name=popSrvrTypeCd]").eq(si).val() == "") {
							alert("서버 구분을 선택해 주십시오.");
							$("select[name=popSrvrTypeCd]").eq(si).focus();
							return false;
						} else {
							newParamPopSrvrTypeCd = $("select[name=popSrvrTypeCd]").eq(si).val();
						}
						if ($("input[name=popItemNm]").eq(si).val() == "") {
							alert("품목을 입력해 주십시오.");
							$("input[name=popItemNm]").eq(si).focus();
							return false;
						} else {
							newParamPopItemNm = $("input[name=popItemNm]").eq(si).val();
						}
						if ($("input[name=popMdlNm]").eq(si).val() == "") {
							alert("품명(모델명)을 입력해 주십시오.");
							$("input[name=popMdlNm]").eq(si).focus();
							return false;
						} else {
							newParamPopMdlNm  = $("input[name=popMdlNm]").eq(si).val();
						}
						if ($("input[name=popOsNm]").eq(si).val() == "") {
							alert("OS및 버전 정보를 입력해 주십시오.");
							$("input[name=popOsNm]").eq(si).focus();
							return false;
						} else {
							newParamPopOsNm = $("input[name=popOsNm]").eq(si).val();
						}
						if ($("input[name=popMkrNm]").eq(si).val() == "") {
							newParamPopMkrNm = "EMPTY";
						} else {
							newParamPopMkrNm = $("input[name=popMkrNm]").eq(si).val();
						}

						if ($("input[name=popSrvrCpuNm]").eq(si).val() == "") {
							newParamPopSrvrCpuNm = "EMPTY";
						} else {
							newParamPopSrvrCpuNm = $("input[name=popSrvrCpuNm]").eq(si).val();
						}

						if ($("input[name=popSrvrMmryNm]").eq(si).val() == "") {
							newParamPopSrvrMmryNm = "EMPTY";
						} else {
							newParamPopSrvrMmryNm = $("input[name=popSrvrMmryNm]").eq(si).val();
						}
						if ($("input[name=popStrSzCn]").eq(si).val() == "") {
							newParamPopStrSzCn = "EMPTY";
						} else {
							newParamPopStrSzCn = $("input[name=popStrSzCn]").eq(si).val();
						}
						
						if ($("input[name=popKeepTypeCn]").eq(si).val() == "") {
							alert("보유형태를를 입력해 주십시오.");
							$("input[name=popKeepTypeCn]").eq(si).focus();
							return false;
						} else {
							newParamPopKeepTypeCn = $("input[name=popKeepTypeCn]").eq(si).val();
						}
						
						if ($("input[name=popSrvrEqpmntCnt]").eq(si).val() == "") {
							newParamPopSrvrEqpmntCnt = "EMPTY";
						} else {
							newParamPopSrvrEqpmntCnt = $("input[name=popSrvrEqpmntCnt]").eq(si).val();
						}
						
						if ($("input[name=popItdiYr]").eq(si).val() == "") {
							alert("도입연도를 입력해 주십시오.");
							$("input[name=popItdiYr]").eq(si).focus();
							return false;
						} else {
							newParamPopItdiYr = $("input[name=popItdiYr]").eq(si).val();
						}
						
						if ($("select[name=popVrAplcnYn]").eq(si).val() == "") {
							newParamPopVrAplcnYn = "N";
						} else {
							newParamPopVrAplcnYn = $("select[name=popVrAplcnYn]").eq(si).val();
						}
						if ($("input[name=popItdiCost]").eq(si).val() == "") {
							newParamPopItdiCost = "EMPTY";
						} else {
							newParamPopItdiCost = $("input[name=popItdiCost]").eq(si).val();
						}
						if ($("input[name=popOperCost]").eq(si).val() == "") {
							newParamPopOperCost = "EMPTY";
						} else {
							newParamPopOperCost = $("input[name=popOperCost]").eq(si).val();
						}
						
						if ($("input[name=popUsgExpln]").eq(si).val() == "") {
							alert("용도를 입력해 주십시오.");
							$("input[name=popUsgExpln]").eq(si).focus();
							return false;
						} else {
							newParamPopUsgExpln = $("input[name=popUsgExpln]").eq(si).val();
						}
					} else {
						newParamPopSrvrTypeCd = "EMPTY";
						newParamPopItemNm = "EMPTY";
						newParamPopMdlNm = "EMPTY";
						newParamPopOsNm = "EMPTY";
						newParamPopMkrNm = "EMPTY";
						newParamPopSrvrCpuNm = "EMPTY";
						newParamPopSrvrMmryNm = "EMPTY";
						newParamPopStrSzCn = "EMPTY";
						newParamPopKeepTypeCn = "EMPTY";
						newParamPopSrvrEqpmntCnt = "EMPTY";
						newParamPopItdiYr = "EMPTY";
						newParamPopVrAplcnYn = "N";
						newParamPopItdiCost = "EMPTY";
						newParamPopOperCost = "EMPTY";
						newParamPopUsgExpln = "EMPTY";
					}
					
					if (paramPopStts =="") {
						paramPopStts = $("input[name=popStts]").eq(si).val();
						paramPopSrvrSn = $("input[name=popSrvrSn]").eq(si).val();
						paramPopSrvrTypeCd = newParamPopSrvrTypeCd;
						paramPopItemNm = newParamPopItemNm;
						paramPopMdlNm = newParamPopMdlNm;
						paramPopOsNm = newParamPopOsNm;
						paramPopMkrNm = newParamPopMkrNm;
						paramPopSrvrCpuNm = newParamPopSrvrCpuNm;
						paramPopSrvrMmryNm = newParamPopSrvrMmryNm;
						paramPopStrSzCn = newParamPopStrSzCn;
						paramPopKeepTypeCn = newParamPopKeepTypeCn;
						paramPopSrvrEqpmntCnt = newParamPopSrvrEqpmntCnt;
						paramPopItdiYr = newParamPopItdiYr;
						paramPopVrAplcnYn = newParamPopVrAplcnYn;
						paramPopItdiCost = newParamPopItdiCost;
						paramPopOperCost = newParamPopOperCost;
						paramPopUsgExpln = newParamPopUsgExpln;
						
						let rcsExmnInfrmBizPrgrsInfoObj = {
							status : $("input[name=popStts]").eq(si).val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							srvrSn : $("input[name=popSrvrSn]").eq(si).val(),
							srvrTypeCd : paramPopSrvrTypeCd,
							itemNm : paramPopItemNm,
							mdlNm : paramPopMdlNm,
							osNm : paramPopOsNm,
							mkrNm : paramPopMkrNm,
							srvrCpuNm : paramPopSrvrCpuNm,
							srvrMmryNm : paramPopSrvrMmryNm,
							strSzCn : paramPopStrSzCn,
							keepTypeCn : paramPopKeepTypeCn,
							srvrEqpmntCnt : paramPopSrvrEqpmntCnt,
							itdiYr : paramPopItdiYr,
							vrAplcnYn : paramPopVrAplcnYn,
							itdiCost : paramPopItdiCost,
							operCost : paramPopOperCost,
							usgExpln : paramPopUsgExpln
						};
						rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
					} else {
						paramPopStts += "|" + $("input[name=popStts]").eq(si).val();
						paramPopSrvrSn += "|" + $("input[name=popSrvrSn]").eq(si).val();
						paramPopSrvrTypeCd += "|" + newParamPopSrvrTypeCd;
						paramPopItemNm += "|" + newParamPopItemNm;
						paramPopMdlNm += "|" + newParamPopMdlNm;
						paramPopOsNm += "|" + newParamPopOsNm;
						paramPopMkrNm += "|" + newParamPopMkrNm;
						paramPopSrvrCpuNm += "|" + newParamPopSrvrCpuNm;
						paramPopSrvrMmryNm += "|" + newParamPopSrvrMmryNm;
						paramPopStrSzCn += "|" + newParamPopStrSzCn;
						paramPopKeepTypeCn += "|" + newParamPopKeepTypeCn;
						paramPopSrvrEqpmntCnt += "|" + newParamPopSrvrEqpmntCnt;
						paramPopItdiYr += "|" + newParamPopItdiYr;
						paramPopVrAplcnYn += "|" + newParamPopVrAplcnYn;
						paramPopItdiCost += "|" + newParamPopItdiCost;
						paramPopOperCost += "|" + newParamPopOperCost;
						paramPopUsgExpln += "|" + newParamPopUsgExpln;
						
						let rcsExmnInfrmBizPrgrsInfoObj = {
							status : $("input[name=popStts]").eq(si).val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							srvrSn : $("input[name=popSrvrSn]").eq(si).val(),
							srvrTypeCd : newParamPopSrvrTypeCd,
							itemNm : newParamPopItemNm,
							mdlNm : newParamPopMdlNm,
							osNm : newParamPopOsNm,
							mkrNm : newParamPopMkrNm,
							srvrCpuNm : newParamPopSrvrCpuNm,
							srvrMmryNm : newParamPopSrvrMmryNm,
							strSzCn : newParamPopStrSzCn,
							keepTypeCn : newParamPopKeepTypeCn,
							srvrEqpmntCnt : newParamPopSrvrEqpmntCnt,
							itdiYr : newParamPopItdiYr,
							vrAplcnYn : newParamPopVrAplcnYn,
							itdiCost : newParamPopItdiCost,
							operCost : newParamPopOperCost,
							usgExpln : newParamPopUsgExpln
						};
						rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
					}
				}
				
			} else {
				if ($("input[name=popStts]").val() != "D") {
					
					if ($("select[name=popSrvrTypeCd]").val() == "") {
						alert("서버 구분을 선택해 주십시오.");
						$("select[name=popSrvrTypeCd]").focus();
						return false;
					}
					if ($("input[name=popItemNm]").val() == "") {
						alert("품목을 입력해 주십시오.");
						$("input[name=popItemNm]").focus();
						return false;
					}
					if ($("input[name=popMdlNm]").val() == "") {
						alert("품명(모델명)을 입력해 주십시오.");
						$("input[name=popMdlNm]").focus();
						return false;
					}
					if ($("input[name=popOsNm]").val() == "") {
						alert("OS및 버전 정보를 입력해 주십시오.");
						$("input[name=popMdlNm]").focus();
						return false;
					}
					if ($("input[name=popKeepTypeCn]").val() == "") {
						alert("보유형태를를 입력해 주십시오.");
						$("input[name=popKeepTypeCn]").focus();
						return false;
					}
					if ($("input[name=popItdiYr]").val() == "") {
						alert("도입연도를 입력해 주십시오.");
						$("input[name=popItdiYr]").focus();
						return false;
					} 
					if ($("input[name=popUsgExpln]").val() == "") {
						alert("용도를 입력해 주십시오.");
						$("input[name=popUsgExpln]").focus();
						return false;
					}
					
					paramPopStts = $("input[name=popStts]").val();
					paramPopSrvrSn = $("input[name=popSrvrSn]").val();
					paramPopSrvrTypeCd = $("select[name=popSrvrTypeCd]").val();
					paramPopItemNm = $("input[name=popItemNm]").val();
					paramPopMdlNm = $("input[name=popMdlNm]").val();
					paramPopOsNm = $("input[name=popOsNm]").val();
					paramPopMkrNm = $("input[name=popMkrNm]").val();
					paramPopSrvrCpuNm = $("input[name=popSrvrCpuNm]").val();
					paramPopSrvrMmryNm = $("input[name=popSrvrMmryNm]").val();
					paramPopStrSzCn = $("input[name=popStrSzCn]").val();
					paramPopKeepTypeCn = $("input[name=popKeepTypeCn]").val();
					paramPopSrvrEqpmntCnt = $("input[name=popSrvrEqpmntCnt]").val();
					paramPopItdiYr = $("input[name=popItdiYr]").val();
					paramPopVrAplcnYn = $("select[name=popVrAplcnYn]").val();
					paramPopItdiCost = $("input[name=popItdiCost]").val();
					paramPopOperCost = $("input[name=popOperCost]").val();
					paramPopUsgExpln = $("input[name=popUsgExpln]").val();
					
					let rcsExmnInfrmBizPrgrsInfoObj = {
						status : $("input[name=popStts]").eq(si).val(),
						rcsexmnId : paramPopRcsexmnId,
						instId : paramPopInstId,
						srvrSn : $("input[name=popSrvrSn]").eq(si).val(),
						srvrTypeCd : newParamPopSrvrTypeCd,
						itemNm : paramPopItemNm,
						mdlNm : paramPopMdlNm,
						osNm : paramPopOsNm,
						mkrNm : paramPopMkrNm,
						srvrCpuNm : paramPopSrvrCpuNm,
						srvrMmryNm : paramPopSrvrMmryNm,
						strSzCn : paramPopStrSzCn,
						keepTypeCn : paramPopKeepTypeCn,
						srvrEqpmntCnt : paramPopSrvrEqpmntCnt,
						itdiYr : paramPopItdiYr,
						vrAplcnYn : paramPopVrAplcnYn,
						itdiCost : paramPopItdiCost,
						operCost : paramPopOperCost,
						usgExpln : paramPopUsgExpln
					};
					rcsExmnInfrmBizPrgrsInfoList.push(rcsExmnInfrmBizPrgrsInfoObj);
					
					
				} else {
					paramPopStts = "";
					paramPopSrvrSn = "";
				}
				
			}
		}
		
		if (paramPopStts == "" || (paramPopStts == "D" && paramPopSrvrSn == "0")) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return false;
		}
		
		if (confirm("서버 장비 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnEqpmentSrvrInfo.do",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				data : JSON.stringify(rcsExmnInfrmBizPrgrsInfoList),
				success : function(rtnData) {
					if (rtnData.result == "N") {
						alert(" 데이터 이상으로 서버 장비 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//5.인프라 현황 - 3)서버 외부위탁 현황
	function moveSaveRcsexmnEqpmentSrvrEntsInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopStts = "";
		let paramPopExtlBzentySn = "";
		let paramPopExtlBzentyNm = "";
		let paramPopHngrRackCnt = "";
		let paramPopHngrCost = "";
		let paramPopHstnRackCnt = "";
		let paramPopHstnCost = "";
		let paramPopWrdTrfcCpctCnt = "";
		let paramPopWrdUtztnChrgCost = "";
		let paramPopSEtcSrvcCd1 = "";
		let paramPopSEtcSrvcCd2 = "";
		let paramPopSEtcSrvcCd3 = "";
		let paramPopSEtcSrvcCd4 = "";
		let paramPopSEtcSrvcCd5 = "";
		let paramPopSEtcSrvcCd6 = "";
		let paramPopSEtcSrvcCd7 = "";
		let paramPopEtcSrvcCost = "";
		

		let newParamPopExtlBzentyNm = "";
		let newParamPopHngrRackCnt = "";
		let newParamPopHngrCost = "";
		let newParamPopHstnRackCnt = "";
		let newParamPopHstnCost = "";
		let newParamPopWrdTrfcCpctCnt = "";
		let newParamPopWrdUtztnChrgCost = "";
		let newParamPopSEtcSrvcCd1 = "";
		let newParamPopSEtcSrvcCd2 = "";
		let newParamPopSEtcSrvcCd3 = "";
		let newParamPopSEtcSrvcCd4 = "";
		let newParamPopSEtcSrvcCd5 = "";
		let newParamPopSEtcSrvcCd6 = "";
		let newParamPopSEtcSrvcCd7 = "";
		let newParamPopEtcSrvcCost = "";
		
		let rcsExmnEqpmntSrvrEntsInfoList = [];
		if (typeof($("input[name=popStts]")) != "undefined") {
			if (typeof($("input[name=popStts]").length) != "undefined" ) {
				
				for (let esi = 0; esi < $("input[name=popStts]").length; esi++) {
					newParamPopExtlBzentyNm = "";
					newParamPopHngrRackCnt = "";
					newParamPopHngrCost = "";
					newParamPopHstnRackCnt = "";
					newParamPopHstnCost = "";
					newParamPopWrdTrfcCpctCnt = "";
					newParamPopWrdUtztnChrgCost = "";
					newParamPopSEtcSrvcCd1 = "";
					newParamPopSEtcSrvcCd2 = "";
					newParamPopSEtcSrvcCd3 = "";
					newParamPopSEtcSrvcCd4 = "";
					newParamPopSEtcSrvcCd5 = "";
					newParamPopSEtcSrvcCd6 = "";
					newParamPopSEtcSrvcCd7 = "";
					newParamPopEtcSrvcCost = "";
					
					if ($("input[name=popStts]").eq(esi).val() != "D") {
						
						if ($("input[name=popExtlBzentyNm]").eq(esi).val() == "") {
							alert("외부위탁업체명을 입력해 주십시오.");
							$("input[name=popExtlBzentyNm]").eq(esi).focus();
							return false;
						} else {
							newParamPopExtlBzentyNm = $("input[name=popExtlBzentyNm]").eq(esi).val();
						}
						if ($("input[name=popHngrRackCnt]").eq(esi).val() == "") {
							alert("상면 Rack수를 입력해 주십시오.");
							$("input[name=popHngrRackCnt]").eq(esi).focus();
							return false;
						} else {
							newParamPopHngrRackCnt = $("input[name=popHngrRackCnt]").eq(esi).val();
						}
						if ($("input[name=popHngrCost]").eq(esi).val() == "") {
							alert("상면비용을 입력해 주십시오.");
							$("input[name=popHngrCost]").eq(esi).focus();
							return false;
						} else {
							newParamPopHngrCost = $("input[name=popHngrCost]").eq(esi).val();
						}
						if ($("input[name=popHstnRackCnt]").eq(esi).val() == "") {
							alert("호스팅 Rack수를 입력해 주십시오.");
							$("input[name=popHstnRackCnt]").eq(esi).focus();
							return false;
						} else {
							newParamPopHstnRackCnt = $("input[name=popHstnRackCnt]").eq(esi).val();
						}
						if ($("input[name=popHstnCost]").eq(esi).val() == "") {
							alert("호스팅비용을 입력해 주십시오.");
							$("input[name=popHstnCost]").eq(esi).focus();
							return false;
						} else {
							newParamPopHstnCost = $("input[name=popHstnCost]").eq(esi).val();
						}
						if ($("input[name=popWrdTrfcCpctCnt]").eq(esi).val() == "") {
							alert("트래픽대역폭을 입력해 주십시오.");
							$("input[name=popWrdTrfcCpctCnt]").eq(esi).focus();
							return false;
						} else {
							newParamPopWrdTrfcCpctCnt = $("input[name=popWrdTrfcCpctCnt]").eq(esi).val();
						}
						if ($("input[name=popWrdUtztnChrgCost]").eq(esi).val() == "") {
							alert("회선이용료를 입력해 주십시오.");
							$("input[name=popWrdUtztnChrgCost]").eq(esi).focus();
							return false;
						} else {
							newParamPopWrdUtztnChrgCost = $("input[name=popWrdUtztnChrgCost]").eq(esi).val();
						}
						if ($("input[name=popEtcSrvcCost]").eq(esi).val() == "") {
							alert("기타서비스비용을 입력해 주십시오.");
							$("input[name=popEtcSrvcCost]").eq(esi).focus();
							return false;
						} else {
							newParamPopEtcSrvcCost = $("input[name=popEtcSrvcCost]").eq(esi).val();
						}
						
						newParamPopSEtcSrvcCd1 = $("input[name=popEtcSrvcCd1]").eq(esi).val();
						newParamPopSEtcSrvcCd2 = $("input[name=popEtcSrvcCd2]").eq(esi).val();;
						newParamPopSEtcSrvcCd3 = $("input[name=popEtcSrvcCd3]").eq(esi).val();;
						newParamPopSEtcSrvcCd4 = $("input[name=popEtcSrvcCd4]").eq(esi).val();;
						newParamPopSEtcSrvcCd5 = $("input[name=popEtcSrvcCd5]").eq(esi).val();;
						newParamPopSEtcSrvcCd6 = $("input[name=popEtcSrvcCd6]").eq(esi).val();;
						newParamPopSEtcSrvcCd7 = $("input[name=popEtcSrvcCd7]").eq(esi).val();;
						
					} else {
						
						newParamPopExtlBzentyNm = "EMPTY";
						newParamPopHngrRackCnt = "EMPTY";
						newParamPopHngrCost = "EMPTY";
						newParamPopHstnRackCnt = "EMPTY";
						newParamPopHstnCost = "EMPTY";
						newParamPopWrdTrfcCpctCnt = "EMPTY";
						newParamPopWrdUtztnChrgCost = "EMPTY";
						newParamPopSEtcSrvcCd1 = "EMPTY";
						newParamPopSEtcSrvcCd2 = "EMPTY";
						newParamPopSEtcSrvcCd3 = "EMPTY";
						newParamPopSEtcSrvcCd4 = "EMPTY";
						newParamPopSEtcSrvcCd5 = "EMPTY";
						newParamPopSEtcSrvcCd6 = "EMPTY";
						newParamPopSEtcSrvcCd7 = "EMPTY";
						newParamPopEtcSrvcCost = "EMPTY";
					}
					
					let etcSrvcCdArray = [];					
					
					if (newParamPopSEtcSrvcCd1 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd1);
					if (newParamPopSEtcSrvcCd2 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd2);
					if (newParamPopSEtcSrvcCd3 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd3);
					if (newParamPopSEtcSrvcCd4 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd4);
					if (newParamPopSEtcSrvcCd5 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd5);
					if (newParamPopSEtcSrvcCd6 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd6);
					if (newParamPopSEtcSrvcCd7 !== "EMPTY") etcSrvcCdArray.push(newParamPopSEtcSrvcCd7);
					
					let newParamPopEtcSrvcCn = etcSrvcCdArray.join(",");
					
					let rcsExmnEqpmntSrvrEntsInfoObj = {
							status : $("input[name=popStts]").eq(esi).val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							extlBzentySn : $("input[name=popExtlBzentySn]").eq(esi).val(),
							extlBzentyNm : newParamPopExtlBzentyNm,
							hngrRackCnt : newParamPopHngrRackCnt,
							hngrCost : newParamPopHstnCost,
							hstnRackCnt : newParamPopHstnRackCnt,
							hstnCost : newParamPopHstnCost,
							wrdTrfcCpctCnt : newParamPopWrdTrfcCpctCnt,
							wrdUtztnChrgCost : newParamPopWrdUtztnChrgCost,
							etcSrvcCn : newParamPopEtcSrvcCn,
							etcSrvcCost : newParamPopEtcSrvcCost
						};
					    rcsExmnEqpmntSrvrEntsInfoList.push(rcsExmnEqpmntSrvrEntsInfoObj);
					}
						
			} else {
				
				if ($("input[name=popStts]").val() != "D") {
					
					if ($("input[name=popExtlBzentyNm]").val() == "") {
						alert("외부위탁업체명을 입력해 주십시오.");
						$("input[name=popExtlBzentyNm]").focus();
						return false;
					}
					if ($("input[name=popHngrRackCnt]").val() == "") {
						alert("상면 Rack수를 입력해 주십시오.");
						$("input[name=popHngrRackCnt]").focus();
						return false;
					}
					if ($("input[name=popHngrCost]").val() == "") {
						alert("상면비용을 입력해 주십시오.");
						$("input[name=popHngrCost]").focus();
						return false;
					}
					if ($("input[name=popHstnRackCnt]").val() == "") {
						alert("호스팅 Rack수를 입력해 주십시오.");
						$("input[name=popHstnRackCnt]").focus();
						return false;
					}
					if ($("input[name=popHstnCost]").val() == "") {
						alert("호스팅비용을 입력해 주십시오.");
						$("input[name=popHstnCost]").focus();
						return false;
					}
					if ($("input[name=popWrdTrfcCpctCnt]").val() == "") {
						alert("트래픽대역폭을 입력해 주십시오.");
						$("input[name=popWrdTrfcCpctCnt]").focus();
						return false;
					}
					if ($("input[name=popWrdUtztnChrgCost]").val() == "") {
						alert("회선이용료를 입력해 주십시오.");
						$("input[name=popWrdUtztnChrgCost]").focus();
						return false;
					}
					if ($("input[name=popEtcSrvcCost]").val() == "") {
						alert("기타서비스비용을 입력해 주십시오.");
						$("input[name=popEtcSrvcCost]").focus();
						return false;
					}
					
				    let etcSrvcCdArray = [
				        $("input[name=popEtcSrvcCd1]").val(),
				        $("input[name=popEtcSrvcCd2]").val(),
				        $("input[name=popEtcSrvcCd3]").val(),
				        $("input[name=popEtcSrvcCd4]").val(),
				        $("input[name=popEtcSrvcCd5]").val(),
				        $("input[name=popEtcSrvcCd6]").val(),
				        $("input[name=popEtcSrvcCd7]").val()
				    ].filter(function (value) {
				        return value !== ""; 
				    });
				    				    
				    
					let etcSrvcCn = etcSrvcCdArray.join(",");					
					
					let rcsExmnEqpmntSrvrEntsInfoObj = {
							status : $("input[name=popStts]").val(),
							rcsexmnId : paramPopRcsexmnId,
							instId : paramPopInstId,
							extlBzentySn : $("input[name=popExtlBzentySn]").eq(esi).val(),
							extlBzentyNm : $("input[name=popExtlBzentyNm]").val(),
							hngrRackCnt : $("input[name=popHngrRackCnt]").val(),
							hngrCost : $("input[name=popHstnCost]").val(),
							hstnRackCnt : $("input[name=popHstnRackCnt]").val(),
							hstnCost : $("input[name=popHstnCost]").val(),
							wrdTrfcCpctCnt : $("input[name=popWrdTrfcCpctCnt]").val(),
							wrdUtztnChrgCost : $("input[name=popWrdUtztnChrgCost]").val(),
							etcSrvcCn : etcSrvcCn,
							etcSrvcCost : $("input[name=popEtcSrvcCost]").val()
						};
					    rcsExmnEqpmntSrvrEntsInfoList.push(rcsExmnEqpmntSrvrEntsInfoObj);					
					
					}
				}
			}					
		
		let hasValidData = false;
		
		if (rcsExmnEqpmntSrvrEntsInfoList.length > 0) {
		    for (let item of rcsExmnEqpmntSrvrEntsInfoList) {
		      if ((item.status !== "D" && item.status.trim() !== "") || (item.status === "D" && item.extlBzentySn.trim() !== "" && item.extlBzentySn !== "0")) {
		        hasValidData = true;
		        break; 
		      }
		    }
		}
		
		if (!hasValidData) {
		  alert("저장할 데이터가 존재하지 않습니다.");
		  return false;
		}
		
		if (confirm("서버 외부위탁 현황 정보를 저장하시겠습니까?")) {
			$.ajax({
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnEqpmentSrvrEntsInfo.do",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				data : JSON.stringify(rcsExmnEqpmntSrvrEntsInfoList),
				success : function(rtnData) {
					if (rtnData.result == "N") {
						alert(" 데이터 이상으로 서버 외부위탁 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	
	//5.인프라 현황 - 4)정보보안장비 및 보안서비스 현황
	function moveSaveRcsexmnEqpmentSecuInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopNtwkSecuEqpmntCdCn = "";
		let paramPopCompSecuEqpmntCdCn = "";
		let paramPopSrvrSecuEqpmntCdCn = "";
		let paramPopSecuMngEqpmntCdCn = "";
		let paramPopEtcSecuEqpmntCn = "";
		let paramPopSecuDscsnSrvcCdCn = "";
		let paramPopSecuMngSrvcEnncYn = "";
		let paramPopSecuMngSrvcInstTypeCd = "";
		let paramPopSecuMngSrvcInstNm = "";
		let paramPopSecuEduTrngCdCn = "";
		let paramPopInfscrIsCn = "";
		let paramPopSecuInspCdCn = "";
		
		
		
		//네트워크보안
		if ($("#popNtwkSecuEqpmntCd1").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd1").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd1").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd2").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd2").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd2").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd3").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd3").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd3").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd4").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd4").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd4").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd5").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd5").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd5").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd6").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd6").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd6").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd7").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd7").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd7").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd8").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd8").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd8").val();
			}
		}
		if ($("#popNtwkSecuEqpmntCd9").val() != "") {
			if (paramPopNtwkSecuEqpmntCdCn == "") {
				paramPopNtwkSecuEqpmntCdCn = $("#popNtwkSecuEqpmntCd9").val();
			} else {
				paramPopNtwkSecuEqpmntCdCn += "," + $("#popNtwkSecuEqpmntCd9").val();
			}
		}
		
		//사용자PC보안	
		if ($("#popCompSecuEqpmntCd1").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd1").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd1").val();
			}
		}
		if ($("#popCompSecuEqpmntCd2").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd2").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd2").val();
			}
		}
		if ($("#popCompSecuEqpmntCd3").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd3").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd3").val();
			}
		}
		if ($("#popCompSecuEqpmntCd4").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd4").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd4").val();
			}
		}
		if ($("#popCompSecuEqpmntCd5").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd5").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd5").val();
			}
		}
		if ($("#popCompSecuEqpmntCd6").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd6").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd6").val();
			}
		}
		if ($("#popCompSecuEqpmntCd7").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd7").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd7").val();
			}
		}
		if ($("#popCompSecuEqpmntCd8").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd8").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd8").val();
			}
		}
		if ($("#popCompSecuEqpmntCd9").val() != "") {
			if (paramPopCompSecuEqpmntCdCn == "") {
				paramPopCompSecuEqpmntCdCn = $("#popCompSecuEqpmntCd9").val();
			} else {
				paramPopCompSecuEqpmntCdCn += "," + $("#popCompSecuEqpmntCd9").val();
			}
		}
		
		//서버보안
		if ($("#popSrvrSecuEqpmntCd1").val() != "") {
			if (paramPopSrvrSecuEqpmntCdCn == "") {
				paramPopSrvrSecuEqpmntCdCn = $("#popSrvrSecuEqpmntCd1").val();
			} else {
				paramPopSrvrSecuEqpmntCdCn += "," + $("#popSrvrSecuEqpmntCd1").val();
			}
		}
		if ($("#popSrvrSecuEqpmntCd2").val() != "") {
			if (paramPopSrvrSecuEqpmntCdCn == "") {
				paramPopSrvrSecuEqpmntCdCn = $("#popSrvrSecuEqpmntCd2").val();
			} else {
				paramPopSrvrSecuEqpmntCdCn += "," + $("#popSrvrSecuEqpmntCd2").val();
			}
		}
		
		//보안관리
		if ($("#popSecuMngEqpmntCd1").val() != "") {
			if (paramPopSecuMngEqpmntCdCn == "") {
				paramPopSecuMngEqpmntCdCn = $("#popSecuMngEqpmntCd1").val();
			} else {
				paramPopSecuMngEqpmntCdCn += "," + $("#popSecuMngEqpmntCd1").val();
			}
		}
		if ($("#popSecuMngEqpmntCd2").val() != "") {
			if (paramPopSecuMngEqpmntCdCn == "") {
				paramPopSecuMngEqpmntCdCn = $("#popSecuMngEqpmntCd2").val();
			} else {
				paramPopSecuMngEqpmntCdCn += "," + $("#popSecuMngEqpmntCd2").val();
			}
		}
		//기타장비
		paramPopEtcSecuEqpmntCn = $("#popEtcSecuEqpmntCn").val();
		
		//보안컨설팅
		if ($("#popSecuDscsnSrvcCd1").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd1").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd1").val();
			}
		}
		if ($("#popSecuDscsnSrvcCd2").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd2").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd2").val();
			}
		}
		if ($("#popSecuDscsnSrvcCd3").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd3").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd3").val();
			}
		}
		if ($("#popSecuDscsnSrvcCd4").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd4").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd4").val();
			}
		}
		if ($("#popSecuDscsnSrvcCd5").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd5").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd5").val();
			}
		}
		if ($("#popSecuDscsnSrvcCd6").val() != "") {
			if (paramPopSecuDscsnSrvcCdCn == "") {
				paramPopSecuDscsnSrvcCdCn = $("#popSecuDscsnSrvcCd6").val();
			} else {
				paramPopSecuDscsnSrvcCdCn += "," + $("#popSecuDscsnSrvcCd6").val();
			}
		}
		//보안관제 유무
		paramPopSecuMngSrvcEnncYn = $("#popSecuMngSrvcEnncYn").val();
		
		//보안관제서비스기관
		paramPopSecuMngSrvcInstTypeCd = $("#popSecuMngSrvcInstTypeCd").val();
		if (paramPopSecuMngSrvcInstTypeCd == "SECSRVC001") {
			paramPopSecuMngSrvcInstNm = "";
		} else {
			if ($("#popSecuMngSrvcInstNm").val() == "") {
				alert("보안관제서비스 기관명을 입력해 주십시오.");
				return false;
			} else {
			paramPopSecuMngSrvcInstNm = $("#popSecuMngSrvcInstNm").val();
			}
		}
		//보안 교육/훈련
		if ($("#popSecuEduTrngCd1").val() != "") {
			if (paramPopSecuEduTrngCdCn == "") {
				paramPopSecuEduTrngCdCn = $("#popSecuEduTrngCd1").val();
			} else {
				paramPopSecuEduTrngCdCn += "," + $("#popSecuEduTrngCd1").val();
			}	
		}
		if ($("#popSecuEduTrngCd2").val() != "") {
			if (paramPopSecuEduTrngCdCn == "") {
				paramPopSecuEduTrngCdCn = $("#popSecuEduTrngCd2").val();
			} else {
				paramPopSecuEduTrngCdCn += "," + $("#popSecuEduTrngCd2").val();
			}	
		}
		
		//정보보호이슈
		if ($("#popInfscrIsCd1").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd1").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd1").val();
			}
		}
		if ($("#popInfscrIsCd2").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd2").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd2").val();
			}
		}
		if ($("#popInfscrIsCd3").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd3").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd3").val();
			}
		}
		if ($("#popInfscrIsCd4").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd4").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd4").val();
			}
		}
		if ($("#popInfscrIsCd5").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd5").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd5").val();
			}
		}
		if ($("#popInfscrIsCd6").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd6").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd6").val();
			}
		}
		if ($("#popInfscrIsCd7").val() != "") {
			if (paramPopInfscrIsCn == "") {
				paramPopInfscrIsCn = $("#popInfscrIsCd7").val();
			} else {
				paramPopInfscrIsCn += "," + $("#popInfscrIsCd7").val();
			}
		}
		
		//보안진단
		if ($("#popSecuInspCd1").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd1").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd1").val();
			}
		}
		if ($("#popSecuInspCd2").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd2").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd2").val();
			}
		}
		if ($("#popSecuInspCd3").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd3").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd3").val();
			}
		}
		if ($("#popSecuInspCd4").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd4").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd4").val();
			}
		}
		if ($("#popSecuInspCd5").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd5").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd5").val();
			}
		}
		if ($("#popSecuInspCd6").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd6").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd6").val();
			}
		}
		if ($("#popSecuInspCd7").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd7").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd7").val();
			}
		}
		if ($("#popSecuInspCd8").val() != "") {
			if (paramPopSecuInspCdCn == "") {
				paramPopSecuInspCdCn = $("#popSecuInspCd8").val();
			} else {
				paramPopSecuInspCdCn += "," + $("#popSecuInspCd8").val();
			}
		}
		
		
		console.log("paramPopRcsexmnId : " + paramPopRcsexmnId);
		console.log("paramPopInstId : " + paramPopInstId);
		console.log("paramPopNtwkSecuEqpmntCdCn : " + paramPopNtwkSecuEqpmntCdCn);
		console.log("paramPopCompSecuEqpmntCdCn : " + paramPopCompSecuEqpmntCdCn);
		console.log("paramPopSrvrSecuEqpmntCdCn : " + paramPopSrvrSecuEqpmntCdCn);
		console.log("paramPopSecuMngEqpmntCdCn : " + paramPopSecuMngEqpmntCdCn);
		console.log("paramPopEtcSecuEqpmntCn : " + paramPopEtcSecuEqpmntCn);
		console.log("paramPopSecuDscsnSrvcCdCn : " + paramPopSecuDscsnSrvcCdCn);
		console.log("paramPopSecuMngSrvcEnncYn : " + paramPopSecuMngSrvcEnncYn);
		console.log("paramPopSecuMngSrvcInstTypeCd : " + paramPopSecuMngSrvcInstTypeCd);
		console.log("paramPopSecuMngSrvcInstNm : " + paramPopSecuMngSrvcInstNm);
		console.log("paramPopSecuEduTrngCdCn : " + paramPopSecuEduTrngCdCn);
		console.log("paramPopInfscrIsCn = : " + paramPopInfscrIsCn);
		console.log("paramPopSecuInspCdCn = : " + paramPopSecuInspCdCn);
		
		if (confirm("정보보안장비 및 보안서비스 현황을 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnEqpmentSecuInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popNtwkSecuEqpmntCdCn" : paramPopNtwkSecuEqpmntCdCn,
					"popCompSecuEqpmntCdCn" : paramPopCompSecuEqpmntCdCn,
					"popSrvrSecuEqpmntCdCn" : paramPopSrvrSecuEqpmntCdCn,
					"popSecuMngEqpmntCdCn" : paramPopSecuMngEqpmntCdCn,
					"popEtcSecuEqpmntCn" : paramPopEtcSecuEqpmntCn,
					"popSecuDscsnSrvcCdCn" : paramPopSecuDscsnSrvcCdCn,
					"popSecuMngSrvcEnncYn" : paramPopSecuMngSrvcEnncYn,
					"popSecuMngSrvcInstTypeCd" : paramPopSecuMngSrvcInstTypeCd,
					"popSecuMngSrvcInstNm" : paramPopSecuMngSrvcInstNm,
					"popSecuEduTrngCdCn" : paramPopSecuEduTrngCdCn,
					"popInfscrIsCn" : paramPopInfscrIsCn,
					"popSecuInspCdCn" : paramPopSecuInspCdCn
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 정보보안장비 및 보안서비스 현황 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	
	//6.문화정보 자원 품질관리 수준 진단
	function moveSaveRcsexmnQltMngLvlInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopPlanQltPlcyEstbScr = $("input[name=popPlanQltPlcyEstbScr]:checked").val();
		let paramPopPlanQltOgnzCpstScr = $("input[name=popPlanQltOgnzCpstScr]:checked").val();
		let paramPopPlanQltPlanEstbScr = $("input[name=popPlanQltPlanEstbScr]:checked").val();
		let paramPopPlanQltEduKnldSharScr = $("input[name=popPlanQltEduKnldSharScr]:checked").val();
		let paramPopCnstStdDfntScr = $("input[name=popCnstStdDfntScr]:checked").val();
		let paramPopCnstStdChckActnScr = $("input[name=popCnstStdChckActnScr]:checked").val();
		let paramPopCnstStrrDfntScr = $("input[name=popCnstStrrDfntScr]:checked").val();
		let paramPopCnstStrrChckActnScr = $("input[name=popCnstStrrChckActnScr]:checked").val();
		let paramPopCnstRcsDfntScr = $("input[name=popCnstRcsDfntScr]:checked").val();
		let paramPopCnstRcsChckActnScr = $("input[name=popCnstRcsChckActnScr]:checked").val();
		let paramPopOperTaskRuleDfntScr = $("input[name=popOperTaskRuleDfntScr]:checked").val();
		let paramPopOperRcsQltInspScr = $("input[name=popOperRcsQltInspScr]:checked").val();
		let paramPopOperRcsQltBtmntScr = $("input[name=popOperRcsQltBtmntScr]:checked").val();
		let paramPopCnjtRcsFrmtScr = $("input[name=popCnjtRcsFrmtScr]:checked").val();
		let paramPopCnjtRcsMntnScr = $("input[name=popCnjtRcsMntnScr]:checked").val();
		let paramPopCnjtRcsChckActnScr = $("input[name=popCnjtRcsChckActnScr]:checked").val();
		
		//계획
		if (paramPopPlanQltPlcyEstbScr == "" || paramPopPlanQltPlcyEstbScr == null) {
			alert("문화정보 자원 품질정책 수립 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopPlanQltOgnzCpstScr == "" || paramPopPlanQltOgnzCpstScr == null) {
			alert("문화정보 자원 품질조직 구성 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopPlanQltPlanEstbScr == "" || paramPopPlanQltPlanEstbScr == null) {
			alert("문화정보 자원 품질계획 수립 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopPlanQltEduKnldSharScr == "" || paramPopPlanQltEduKnldSharScr == null) {
			alert("문화정보 자원 품질관리 교육 및 지식 공유 레벨을 선택해 주십시오.");
			return false;
		}
		//구축
		if (paramPopCnstStdDfntScr == "" || paramPopCnstStdDfntScr == null) {
			alert("문화정보 자원 표준 정의 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnstStdChckActnScr == "" || paramPopCnstStdChckActnScr == null) {
			alert("문화정보 자원 표준 점검 및 조치 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnstStrrDfntScr == "" || paramPopCnstStrrDfntScr == null) {
			alert("문화정보 자원 구조 정의 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnstStrrChckActnScr == "" || paramPopCnstStrrChckActnScr == null) {
			alert("문화정보 자원 구조 점검 및 조치 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnstRcsDfntScr == "" || paramPopCnstRcsDfntScr == null) {
			alert("문화정보 자원 자원 정의 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnstRcsChckActnScr == "" || paramPopCnstRcsChckActnScr == null) {
			alert("문화정보 자원 자원 점검 및 조치 레벨을 선택해 주십시오.");
			return false;
		}
		//운영
		if (paramPopOperTaskRuleDfntScr == "" || paramPopOperTaskRuleDfntScr == null) {
			alert("업무규칙 정의 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopOperRcsQltInspScr == "" || paramPopOperRcsQltInspScr == null) {
			alert("문화정보 자원 품질진단 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopOperRcsQltBtmntScr == "" || paramPopOperRcsQltBtmntScr == null) {
			alert("문화정보 자원 품질개선 레벨을 선택해 주십시오.");
			return false;
		}
		//활용
		if (paramPopCnjtRcsFrmtScr == "" || paramPopCnjtRcsFrmtScr == null) {
			alert("개방문화정보 자원의 오픈 포맷 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnjtRcsMntnScr == "" || paramPopCnjtRcsMntnScr == null) {
			alert("개방문화정보 자원의 최신화 레벨을 선택해 주십시오.");
			return false;
		}
		if (paramPopCnjtRcsChckActnScr == "" || paramPopCnjtRcsChckActnScr == null) {
			alert("개방문화정보 자원의 활용 점검 및 조치 레벨을 선택해 주십시오.");
			return false;
		}
		
		if (confirm("문화정보 자원 품질관리 수준 진단 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsexmnQltMngLvlInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popPlanQltPlcyEstbScr" : paramPopPlanQltPlcyEstbScr,
					"popPlanQltOgnzCpstScr" : paramPopPlanQltOgnzCpstScr,
					"popPlanQltPlanEstbScr" : paramPopPlanQltPlanEstbScr,
					"popPlanQltEduKnldSharScr" : paramPopPlanQltEduKnldSharScr,
					"popCnstStdDfntScr" : paramPopCnstStdDfntScr,
					"popCnstStdChckActnScr" : paramPopCnstStdChckActnScr,
					"popCnstStrrDfntScr" : paramPopCnstStrrDfntScr,
					"popCnstStrrChckActnScr" : paramPopCnstStrrChckActnScr,
					"popCnstRcsDfntScr" : paramPopCnstRcsDfntScr,
					"popCnstRcsChckActnScr" : paramPopCnstRcsChckActnScr,
					"popOperTaskRuleDfntScr" : paramPopOperTaskRuleDfntScr,
					"popOperRcsQltInspScr" : paramPopOperRcsQltInspScr,
					"popOperRcsQltBtmntScr" : paramPopOperRcsQltBtmntScr,
					"popCnjtRcsFrmtScr" : paramPopCnjtRcsFrmtScr,
					"popCnjtRcsMntnScr" : paramPopCnjtRcsMntnScr,
					"popCnjtRcsChckActnScr" : paramPopCnjtRcsChckActnScr
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 문화정보 자원 품질관리 수준 진단 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	//환경조사자 정보 입력
	function moveSaveRcsexmnExmnrInfo() {
		let paramPopRcsexmnId = $("#popRcsexmnId").val();
		let paramPopInstId = $("#popInstId").val();
		let paramPopDeptNm = $("#popDeptNm").val();
		let paramPopExmnrNm = $("#popExmnrNm").val();
		let paramPopExmnrTelno = $("#popExmnrTelno").val();
		let paramPopExmnrEmlAddr = $("#popExmnrEmlAddr").val();
		
		if (paramPopDeptNm == "" || paramPopDeptNm == null) {
			alert("부서명을 입력해 주십시오.");
			$("#popDeptNm").focus();
			return false;
		}
		if (paramPopExmnrNm == "" || paramPopExmnrNm == null) {
			alert("조사자명을 입력해 주십시오.");
			$("#popExmnrNm").focus();
			return false;
		}
		if (paramPopExmnrTelno == "" || paramPopExmnrTelno == null) {
			alert("전화번호를 입력해 주십시오.");
			$("#popExmnrTelno").focus();
			return false;
		}
		if (paramPopExmnrEmlAddr == "" || paramPopExmnrEmlAddr == null) {
			alert("이메일을 입력해 주십시오.");
			$("#popExmnrEmlAddr").focus();
			return false;
		} else {
			if (paramPopExmnrEmlAddr.search(/(\S+)@(\S+)\.(\S+)/) == -1 ) {
				alert("이메일 형식에 맞지 않습니다.");
				$("#popExmnrEmlAddr").focus();
				return false;
			}
		}
		
		if (confirm("조사자 정보를 저장하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/saveRcsExmnTrgtInstInfo.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : paramPopRcsexmnId,
					"popInstId" : paramPopInstId,
					"popDeptNm" : paramPopDeptNm,
					"popExmnrNm" : paramPopExmnrNm,
					"popExmnrTelno" : paramPopExmnrTelno,
					"popExmnrEmlAddr" : paramPopExmnrEmlAddr
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 조사사 정보가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
		
	}
	

	
	function setCmptnInstRcsExmnStatus() {
		let frm = document.frmDtlSrch;
		if (confirm("조사를 완료하시겠습니까?")) {
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/setCltInfoRcsExmnCmptn.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"srchPopRcsexmnId" : $("#srchRcsexmnId").val(),
					"srchPopRcsexmnInstId" : $("#srchRcsexmnInstId").val()
				},
				success : function(rtnData) {
					if (rtnData == "N") {
						alert(" 데이터 이상으로 조사 완료가 반영되지 않았습니다.\n 관리자에게 문의해 주십시오.");
						return false;
					} else {
						alert(" 반영되었습니다.");
						moveInstRcsExmnDtlReload();
					}
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
	function movePopInstRcsExmnRawData() {
		let popRcsexmnId = $("#srchRcsexmnId").val();
		let popRcsexmnInstId = $("#srchRcsexmnInstId").val();
		let popExclMode = "Inst";
		let paramPopUrl = "/cltInfoRcsExmnMgt/popInstRcsExmnRawData.do";
		paramPopUrl += "?popRcsexmnId=" + popRcsexmnId;
		paramPopUrl += "&popExclMode=" + popExclMode;
		paramPopUrl += "&popRcsexmnInstId=" + popRcsexmnInstId;
		
		let paramPopUrlTxt = contextPath + paramPopUrl;
		$(".pop-layer").load(paramPopUrlTxt);
		admin.modalsShow('modals');
	}
	
	function moveExcelDwnldPopInstRcsExmnRawData() {
		if (confirm("엑셀 파일을 다운로드하시겠습니까?")) {
			let popRcsexmnId = $("#srchRcsexmnId").val();
			let popRcsexmnInstId = $("#srchRcsexmnInstId").val();
			excelUrl = "";
			location.href = ""
			$.ajax({
				type : "GET",
				url : contextPath + "/cltInfoRcsExmnMgt/instRcsExmnExcelRawDataExclPoi.do",
				async : true,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : {
					"popRcsexmnId" : popRcsexmnId,
					"popRcsexmnInstId" : popRcsexmnInstId
				},
				success : function() {
					
				}, 
				error : function(request, status, error) {
					console.log(error);
				}
			});
		} else {
			return false;
		}
	}
	
</script>