<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>5.인프라 현황 - 1)클라우드 구축 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnCludCnstInfo.rcsexmnId}">
	<div class="table-wrap write table-brow-two-table-table">
		<h2>[이전 환경 조사]</h2>
		<div class="div-scroll pt0">
			<table class="">
				<caption></caption>
				<colgroup>
					<col width="220px"></col>
					<col width="*"></col>
					<col width="220px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>현재 클라우드 이용 여부</th>
						<td>${oldPopRcsExmnCludCnstInfo.cludUtztnYnNm}</td>
						<th>이용 클라우드</th>
						<td>${oldPopRcsExmnEqpmentCludInfo.cludUtlzTypeNm}</td>
					</tr>
					<tr <c:if test="${oldPopRcsExmnCludCnstInfo.cludUtztnYn != 'Y'}">style="display:none;"</c:if>>
						<th>클라우드 정보</th>
						<td colspan="3" class="pl10 pt10">
						<c:if test="${oldPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001'}">
							<table class="table-small">
								<caption></caption>
								<colgroup>
									<col width="220px"></col>
									<col width="220px"></col>
									<col width="300px"></col>
									<col width="220px"></col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="4">민간 클라우드</th>
									</tr>
									<tr>
										<th>연간 이용요금(백만원)</th>
										<th>클라우드 제공 업체명</th>
										<th>이용 클라우드</th>
										<th>도입연도</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align:center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnEqpmentCludInfo.cludFyerCost}"/></td>
										<td style="text-align:center">${oldPopRcsExmnEqpmentCludInfo.cludBzentyNm}</td>
										<td style="text-align:center">
											<div class="fm-check">
												<span class="fm-ele">
													<input type="checkbox" id="pulbicCloudIaaS" name="pulbicCloudIaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludIaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="pulbicCloudIaaS">IaaS</label>
												</span>
												<span class="fm-ele">
													<input type="checkbox" id="pulbicCloudSaaS" name="pulbicCloudSaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludSaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="pulbicCloudSaaS">SaaS</label>
												</span>
												
												<span class="fm-ele">
													<input type="checkbox" id="pulbicCloudPaaS" name="pulbicCloudPaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludPaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="pulbicCloudPaaS">Paas</label>
												</span>
											</div>
											
										</td>
										<td style="text-align:center">${oldPopRcsExmnEqpmentCludInfo.itdiYr}</td>
									</tr>
								</tbody>
							</table>
						</c:if>
						<c:if test="${oldPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003'}">
							<table class="table-small">
								<caption></caption>
								<colgroup>
									<col width="220px"></col>
									<col width="*"></col>
									<col width="120px"></col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="3">자체 클라우드</th>
									</tr>
									<tr>
										<th>연간 유지비(백만원)</th>
										<th>클라우드 수준</th>
										<th>도입연도</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align:center"><div class="fm-ele"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldPopRcsExmnEqpmentCludInfo.cludFyerCost}"/></div></td>
										<td style="text-align:center">
											<div class="fm-check">
												<span class="fm-ele">
													<input type="checkbox" id="privateCloudIaaS" name="privateCloudIaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludIaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="privateCloudIaaS">IaaS</label>
												</span>
												<span class="fm-ele">
													<input type="checkbox" id="privateCloudSaaS" name="privateCloudSaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludSaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="privateCloudSaaS">SaaS</label>
												</span>
												
												<span class="fm-ele">
													<input type="checkbox" id="privateCloudPaaS" name="privateCloudPaaS" value="Y" <c:if test="${oldPopRcsExmnEqpmentCludInfo.cludPaasYn == 'Y'}">checked</c:if> onclick="javascript:return false;"/>
													<label for="privateCloudPaaS">PaaS</label>
												</span>
											</div>
											
										</td>
										<td style="text-align:center">
											<div class="fm-ele"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
		</c:if>
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<div class="table-wrap table-border">
			<h2>[환경조사]</h2>
			<table>
				<caption></caption>
				<colgroup>
					<col width="220px"></col>
					<col width="*"></col>
					<col width="220px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
					<tr>
						<th>현재 클라우드 이용 여부</th>
						<td style="text-align:left;">
							<div class="fm-focus fm-select" data-size="w200">
								<select id="popCludUtztnYn" name="popCludUtztnYn" onchange="moveChangeCludUtztnYn(); return false;">
									<option value="Y" <c:if test="${nowPopRcsExmnCludCnstInfo.cludUtztnYn == 'Y'}">selected</c:if>>사용</option> 
									<option value="N" <c:if test="${nowPopRcsExmnCludCnstInfo.cludUtztnYn != 'Y'}">selected</c:if>>사용안함</option> 
								</select>
							</div>
						</td>
						<th>이용 클라우드
							<button class="btn-tooltip"
							data-tooltip="
								<b>클라우드 분류 :</b> <br>
								- IaaS : IT 서비스를 제공하기 위한 주요 인프라 자원(CPU자원, 메모리, 디스크, 네트워크 환경)을 공유 자원 형태로 관리하고 이를 나눠서 제공하는 서비스이며, 서비스 사용자는 이러한 인프라 위에 자원(resource)을 할당받아 OS와 미들웨어(데이터베이스, 웹서버)를 설치하여 서비스를 이용하는 형태<br>
								- SaaS : 클라우드 서비스 모델 중 소프트웨어 서비스를 제공하는 형태를 말하며, 예전의 ASP(Applicarion Service Provider)와 유사하게 완성된 형태의 응용 소프트웨어(이메일, CRM, ERP 등)를 서비스하고 사용자가 응용 소프트웨어의 사용량에 따라서 비용을 지불하는 형태<br>
								- PaaS : 소프트웨어를 개발할 수 있는 플랫폼(프로그램을 실행할 수 있는 윈도우, 리눅스와 같은 운영체제를 말하며, 특정 프로그램 언어를 개발하기 위해 만든 개발 환경 포함)을 제공하는 환경을 의미
							">?</button>
						</th>
						<td style="text-align:left;">
							<div class="fm-focus fm-select" data-size="w300">
								<select id="popCludUtlzTypeCd" name="popCludUtlzTypeCd" onchange="moveChangeCludUtlzTypeCd(); return false;" <c:if test="${empty nowPopRcsExmnCludCnstInfo or nowPopRcsExmnCludCnstInfo.cludUtztnYn == 'N'}">disabled</c:if>>
									<option value="" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == ''}">selected</c:if>>선택</option>
				<c:if test="${!empty cludUtlzTypeCmmnCdList}">
					<c:forEach var="cludUtlzTCdData" items="${cludUtlzTypeCmmnCdList}">
							<option value="${cludUtlzTCdData.cdId}" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == cludUtlzTCdData.cdId}">selected</c:if>>${cludUtlzTCdData.cdNm}</option>
					</c:forEach>
				</c:if>
								</select>
								
							</div>
							<input type="hidden" id="popCludSn" name="popCludSn" value="${nowPopRcsExmnEqpmentCludInfo.cludSn}">
							<input type="hidden" id="popCludFyerCost" name="popCludFyerCost" value="${nowPopRcsExmnEqpmentCludInfo.cludFyerCost}">
							<input type="hidden" id="popCludBzentyNm" name="popCludBzentyNm" value="${nowPopRcsExmnEqpmentCludInfo.cludBzentyNm}">
							<input type="hidden" id="popCludIaasYn" name="popCludIaasYn" value="${nowPopRcsExmnEqpmentCludInfo.cludIaasYn}">
							<input type="hidden" id="popCludSaasYn" name="popCludSaasYn" value="${nowPopRcsExmnEqpmentCludInfo.cludSaasYn}">
							<input type="hidden" id="popCludPaasYn" name="popCludPaasYn" value="${nowPopRcsExmnEqpmentCludInfo.cludPaasYn}">
							<input type="hidden" id="popItdiYr" name="popItdiYr" value="${nowPopRcsExmnEqpmentCludInfo.itdiYr}">
						</td>
					</tr>
					<tr id="cloudTrArea" <c:if test="${empty nowPopRcsExmnCludCnstInfo or nowPopRcsExmnCludCnstInfo.cludUtztnYn != 'Y' or nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0002'}">style="display:none"</c:if>>
						<th>클라우드 정보</th>
						<td colspan="3" class="pl10 pt10">
							<table id="popTblPublicCloud" class="table-small" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd != 'CLUDTY0001'}">style="display:none"</c:if>>
								<caption></caption>
								<colgroup>
									<col width="220px"></col>
									<col width="220px"></col>
									<col width="300px"></col>
									<col width="220px"></col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="4">민간 클라우드</th>
									</tr>
									<tr>
										<th>연간 이용요금(백만원)</th>
										<th>클라우드 제공 업체명</th>
										<th>이용 클라우드</th>
										<th>도입연도</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><div class="fm-ele" data-size="w200"><input type="text" id="popPublicCludFyerCost" name="popPublicCludFyerCost" value="<c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001'}">${nowPopRcsExmnEqpmentCludInfo.cludFyerCost}</c:if>" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"></div></td>
										<td><div class="fm-ele" data-size="100p"><input text="text" id="popPublicCludBzentyNm" name="popPublicCludBzentyNm" value="<c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001'}">${nowPopRcsExmnEqpmentCludInfo.cludBzentyNm}</c:if>"></div></td>
										<td>
											<div class="fm-check">
												<span class="fm-ele">
													<input type="checkbox" id="popPulbicCloudIaaS" name="popPulbicCloudIaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001' and nowPopRcsExmnEqpmentCludInfo.cludIaasYn == 'Y'}">checked</c:if>/>
													<label for="popPulbicCloudIaaS">IaaS</label>
												</span>
												<span class="fm-ele">
													<input type="checkbox" id="popPulbicCloudSaaS" name="popPulbicCloudSaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001' and nowPopRcsExmnEqpmentCludInfo.cludSaasYn == 'Y'}">checked</c:if>/>
													<label for="popPulbicCloudSaaS">SaaS</label>
												</span>
												
												<span class="fm-ele">
													<input type="checkbox" id="popPulbicCloudPaaS" name="popPulbicCloudPaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001' and nowPopRcsExmnEqpmentCludInfo.cludPaasYn == 'Y'}">checked</c:if>/>
													<label for="popPulbicCloudPaaS">Paas</label>
												</span>
											</div>
											
										</td>
										<td>
											<div class="fm-ele" data-size="w200">
												<input type="text" id="popPublicItdiYr" name="popPublicItdiYr" value="<c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0001'}">${nowPopRcsExmnEqpmentCludInfo.itdiYr}</c:if>" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" maxklength="4">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<table id="popTblPrivateCloud" class="table-small" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd != 'CLUDTY0003'}">style="display:none"</c:if>>
								<caption></caption>
								<colgroup>
									<col width="220px"></col>
									<col width="300px"></col>
									<col width="220px"></col>
								</colgroup>
								<thead>
									<tr>
										<th colspan="3">자체 클라우드</th>
									</tr>
									<tr>
										<th>연간 유지비(백만원)</th>
										<th>클라우드 수준</th>
										<th>도입연도</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><div class="fm-ele" data-size="w200"><input type="text" id="popPrivateCludFyerCost" name="popPrivateCludFyerCost" value="<c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003'}">${nowPopRcsExmnEqpmentCludInfo.cludFyerCost}</c:if>" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"></div></td>
										<td>
											<div class="fm-check">
												<span class="fm-ele">
													<input type="checkbox" id="popPrivateCloudIaaS" name="popPrivateCloudIaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003' and nowPopRcsExmnEqpmentCludInfo.cludIaasYn == 'Y'}">checked</c:if>/>
													<label for="popPrivateCloudIaaS">IaaS</label>
												</span>
												<span class="fm-ele">
													<input type="checkbox" id="popPrivateCloudSaaS" name="popPrivateCloudSaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003' and nowPopRcsExmnEqpmentCludInfo.cludSaasYn == 'Y'}">checked</c:if>/>
													<label for="popPrivateCloudSaaS">SaaS</label>
												</span>
												
												<span class="fm-ele">
													<input type="checkbox" id="popPrivateCloudPaaS" name="popPrivateCloudPaaS" value="Y" <c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003' and nowPopRcsExmnEqpmentCludInfo.cludPaasYn == 'Y'}">checked</c:if>/>
													<label for="popPrivateCloudPaaS">PaaS</label>
												</span>
											</div>
											
										</td>
										<td>
											<div class="fm-ele" data-size="w200">
												<input type="text" id="popPrivateItdiYr" name="popPrivateItdiYr" value="<c:if test="${nowPopRcsExmnEqpmentCludInfo.cludUtlzTypeCd == 'CLUDTY0003'}">${nowPopRcsExmnEqpmentCludInfo.itdiYr}</c:if>" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" maxklength="4">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnCludEqpmentInfo" name="btnPopSaveRcsexmnCludEqpmentInfo" onclick="javascript:moveSaveRcsexmnCludEqpmentInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnCludEqpmentInfo" name="btnPopSaveRcsexmnCludEqpmentInfo" onclick="javascript:moveSaveRcsexmnCludEqpmentInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnCludEqpmentInfo" name="btnPopCloseRcsexmnCludEqpmentInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function moveChangeCludUtztnYn() {
		if (confirm("입력하였던 값이 모두 초기화됩니다. 변경하시겠습니까?")) {
			let cludeUseYnValue = $("#popCludUtztnYn").val();
			if (cludeUseYnValue == "Y") {
				$("#popCludUtlzTypeCd").attr("disabled", false);
				if ($("#popCludUtlzTypeCd").val() == "CLUDTY0001") {
					$("#popTblPublicCloud").show();
				} else if ($("#popCludUtlzTypeCd").val() == "CLUDTY0003") {
					$("#popTblPrivateCloud").show();
				} else {
					$("#popTblPublicCloud").hide();
					$("#popTblPrivateCloud").hide();
				}
			} else {
				$("#popCludUtlzTypeCd").attr("disabled", true);
				$("#popCludUtlzTypeCd").val("");
				$("#popTblPublicCloud").hide();
				$("#popTblPrivateCloud").hide();
			}
		}
	}
	
	function moveChangeCludUtlzTypeCd() {
		let cludUtlzTypeCd = $("#popCludUtlzTypeCd").val();
		if (cludUtlzTypeCd == "CLUDTY0001") {
			$("#cloudTrArea").show();
			$("#popTblPublicCloud").show();
			$("#popTblPrivateCloud").hide();
			//민간클라우드
			$("#popPublicCludFyerCost").attr("readonly", false);
			$("#popPublicCludBzentyNm").attr("readonly", false);
			$("#popPulbicCloudIaaS").attr("disabled", false);
			$("#popPulbicCloudSaaS").attr("disabled", false);
			$("#popPulbicCloudPaaS").attr("disabled", false);
			$("#popPublicItdiYr").attr("readonly", false);
			//자체클라우드 
			$("#popPrivateCludFyerCost").attr("readonly", true);
			$("#popPrivateCloudIaaS").attr("disabled", true);
			$("#popPrivateCloudSaaS").attr("disabled", true);
			$("#popPrivateCloudPaaS").attr("disabled", true);
			$("#popPrivateItdiYr").attr("readonly", true);
			//데이터 변경
			$("#popCludFyerCost").val($("#popPublicCludFyerCost").val());
			$("#popCludBzentyNm").val($("#popPublicCludBzentyNm").val());
			if ($("#popPulbicCloudIaaS").is(":checked") == true) {
				$("#popCludIaasYn").val("Y");
			} else {
				$("#popCludIaasYn").val("N");
			}
			if ($("#popPulbicCloudSaaS").is(":checked") == true) {
				$("#popCludSaasYn").val("Y");
			} else {
				$("#popCludSaasYn").val("N");
			}
			if ($("#popPulbicCloudPaaS").is(":checked") == true) {
				$("#popCludPaasYn").val("Y");
			} else {
				$("#popCludPaasYn").val("N");
			}
			$("#popItdiYr").val($("#popPublicItdiYr").val());
			
		} else if (cludUtlzTypeCd == "CLUDTY0002") {
			$("#cloudTrArea").hide();
			$("#popTblPublicCloud").hide();
			$("#popTblPrivateCloud").hide();
			//민간클라우드
			$("#popPublicCludFyerCost").attr("readonly", true);
			$("#popPublicCludBzentyNm").attr("readonly", true);
			$("#popPulbicCloudIaaS").attr("disabled", true);
			$("#popPulbicCloudSaaS").attr("disabled", true);
			$("#popPulbicCloudPaaS").attr("disabled", true);
			$("#popPublicItdiYr").attr("readonly", true);
			//자체클라우드 
			$("#popPrivateCludFyerCost").attr("readonly", true);
			$("#popPrivateCloudIaaS").attr("disabled", true);
			$("#popPrivateCloudSaaS").attr("disabled", true);
			$("#popPrivateCloudPaaS").attr("disabled", true);
			$("#popPrivateItdiYr").attr("readonly", true);
			//데이터 변경
			$("#popCludFyerCost").val("");
			$("#popCludBzentyNm").val("");
			$("#popCludIaasYn").val("");
			$("#popCludSaasYn").val("");
			$("#popCludPaasYn").val("");
			$("#popItdiYr").val($("#popPublicItdiYr").val())
		} else if (cludUtlzTypeCd == "CLUDTY0003") {
			$("#cloudTrArea").show();
			$("#popTblPublicCloud").hide();
			$("#popTblPrivateCloud").show();
			//민간클라우드
			$("#popPublicCludFyerCost").attr("readonly", true);
			$("#popPublicCludBzentyNm").attr("readonly", true);
			$("#popPulbicCloudIaaS").attr("disabled", true);
			$("#popPulbicCloudSaaS").attr("disabled", true);
			$("#popPulbicCloudPaaS").attr("disabled", true);
			$("#popPublicItdiYr").attr("readonly", true);
			//자체클라우드 
			$("#popPrivateCludFyerCost").attr("readonly", false);
			$("#popPrivateCloudIaaS").attr("disabled", false);
			$("#popPrivateCloudSaaS").attr("disabled", false);
			$("#popPrivateCloudPaaS").attr("disabled", false);
			$("#popPrivateItdiYr").attr("readonly", false);
			//데이터 변경
			$("#popCludFyerCost").val($("#popPrivateCludFyerCost").val());
			$("#popCludBzentyNm").val("");
			if ($("#popPrivateCloudIaaS").is(":checked") == true) {
				$("#popCludIaasYn").val("Y");
			} else {
				$("#popCludIaasYn").val("N");
			}
			if ($("#popPrivateCloudSaaS").is(":checked") == true) {
				$("#popCludSaasYn").val("Y");
			} else {
				$("#popCludSaasYn").val("N");
			}
			if ($("#popPrivateCloudPaaS").is(":checked") == true) {
				$("#popCludPaasYn").val("Y");
			} else {
				$("#popCludPaasYn").val("N");
			}
			$("#popItdiYr").val($("#popPrivateItdiYr").val());
		}
	}
	
	
</script>