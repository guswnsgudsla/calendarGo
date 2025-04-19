<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap table-border">
		<div class="title between">
			<h2>3.문화정보/ 디지털콘텐츠 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnCltContsInfoList}">
	<div class="table-wrap table-border row-two-table">
		<h2>[이전 환경조사]</h2>
		<div class="div-scroll pt0">
			<table class="scroll-wrap table-small">
				<caption></caption>
				<colgroup>
					<col width="*"></col>
				</colgroup>
				<tbody>
		<c:forEach var="oldCltContsData" items="${oldPopRcsExmnCltContsInfoList}" varStatus="status">
					<tr>
						<td>
							<table class="list">
								<caption></caption>
								<colgroup>
									<col width="40px"></col>
									<col width="140px"></col>
									<col width="320px;"></col>
									<col width="140px"></col>
									<col width="400px;"></col>
								</colgroup>
								<tbody>
									<tr>
										<td>${status.count}</td>
										<th>사이트명</th>
										<td>${oldCltContsData.siteNm}</td>
										<th>사이트URL</th>
										<td>${oldCltContsData.siteUrlAddr}</td>
									</tr>
								</tbody>
							</table>
							<table class="list" style="margin-top:0px;">
								<caption></caption>
								<colgroup>
									<col width="150px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="150px"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="2">정보(DB)/콘텐츠명</th>
										<th rowspan="2">구축단계</th>
										<th rowspan="2">건수</th>
										<th colspan="7">구성요소별</th>
										<th rowspan="2">저작권보유주체</th>
										<th rowspan="2">공개제한범위</th>
										<th rowspan="2">대국민서비스여부</th>
										<th rowspan="2">공개방법</th>
									</tr>
									<tr>
										<th>텍스트</th>
										<th>이미지</th>
										<th>동영상</th>
										<th>사운드</th>
										<th>XR 데이터</th>
										<th>기타</th>
										<th>소계</th>
									</tr>
									<tr>
										<td rowspan="4">${oldCltContsData.contsInfoNm}</td>
										<td>구축대상</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtSumNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtLtrsNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtImgNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtVdoNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtSndNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtXrNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtEtcNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstTrgtSbtotNocs}"/></td>
										<td rowspan="4"><c:if test="${oldCltContsData.cpyrInstKeepYn == 'Y'}">기관자체보유</c:if>
											<c:if test="${oldCltContsData.cpyrSctnKeepYn == 'Y'}"><br/>일부자체 보유</c:if>
											<c:if test="${oldCltContsData.cpyrMakrKeepYn == 'Y'}"><br/>정보제작자 보유</c:if>
											<c:if test="${oldCltContsData.cpyrKeepUnwnYn == 'Y'}"><br/>보유 여부 미상</c:if>
											<c:if test="${oldCltContsData.cpyrEnncYn == 'Y'}"><br/>저작권 없음</c:if>
										</td>
										<td rowspan="4">${oldCltContsData.rlsLmtScpNm}</td>
										<td rowspan="4">${oldCltContsData.mrfnTrgtSrvcNm}</td>
										<td rowspan="4">${oldCltContsData.rlsMthdNm}</td>
									</tr>
									<tr>
										<td>구축완료</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnLtrsNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnImgNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnVdoNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnSndNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnXrNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnEtcNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstCmptnSbtotNocs}"/></td>
									</tr>
									<tr>
										<td>서비스</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcLtrsCnt}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcImgCnt}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcVdoCnt}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcSndCnt}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcXrNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcEtcNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.srvcSumCnt}"/></td>
									</tr>
									<tr>
										<td>합계</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumLtrsNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumImgNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumVdoNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumSndNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumXrNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumEtcNocs}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oldCltContsData.cnstSumSbtotNocs}"/></td>
									</tr>
								</tbody>
							</table>
						</td>
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
		<div class="between">
			<h2>[환경조사]</h2>
			<button type="button" class="btns size-xsmall" id="btnPopAddCltContsInfo" name="btnPopAddCltContsInfo" onclick="javascript:moveAddCltContsInfo(); return false;">추가</button>
		</div>
		<div class="div-scroll pt0" style="height:300px;">
			<table class="table-small">
				<caption></caption>
				<colgroup>
					<col width="*"></col>
				</colgroup>
				<tbody id="popCltContsTbody">
	<c:if test="${!empty nowPopRcsExmnCltContsInfoList}">
		<c:forEach var="nowCltContsData" items="${nowPopRcsExmnCltContsInfoList}" varStatus="status">
					<tr>
						<td class="pt0">
							<table class="mt0">
								<caption></caption>
								<colgroup>
									<col width="40px"></col>
									<col width="100px"></col>
									<col width="320px;"></col>
									<col width="140px"></col>
									<col width="320px;"></col>
									<col width="80px"></col>
								</colgroup>
								<tbody>
									<tr>
										<td>${status.count}</td>
										<th>사이트명</th>
										<td>
											<div class="fm-ele" data-size="100p">
												<input type="hidden" id="popStts_${nowCltContsData.contsSn}" name="popStts" value="M">
												<input type="hidden" id="popContsSn_${nowCltContsData.contsSn}" name="popContsSn" value="${nowCltContsData.contsSn}">
												<input type="text" id="popSiteNm_${nowCltContsData.contsSn}" name="popSiteNm" value="${nowCltContsData.siteNm}"/>
											</div>
										</td>
										<th>사이트URL</th>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSiteUrlAddr_${nowCltContsData.contsSn}" name="popSiteUrlAddr" value="${nowCltContsData.siteUrlAddr}"/></div></td>
										<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteCltContsInfoRow_${nowCltContsData.contsSn}" name="btnPopDeleteCltContsInfoRow" onclick="javascript:moveDeleteCltContsInfo('${nowCltContsData.contsSn}'); return false;">삭제</button></td>
									</tr>
								</tbody>
							</table>
							<table class="mt0">
								<caption></caption>
								<colgroup>
									<col width="150px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="150px"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="2">정보(DB)/콘텐츠명
											<button class="btn-tooltip"
											data-tooltip="
											<b>정보(DB)/콘텐츠명 :</b>해당 사이트에서 서비스 단위(또는 메뉴 단위)를 기준으로 보유하고 있는 문화정보/콘텐츠의 명칭으로<br>2개 이상 보유하고 있는 경우 복수의 문화정보/콘텐츠 명칭 각각 기입(작성 예시 1, 2 참조)		
											">?</button>
											
										</th>
										<th rowspan="2">구축단계
											<button class="btn-tooltip"
											data-tooltip="
											<b>구축단계 :</b><br>① 구축대상 : 앞으로 시스템 내 정보(DB)/디지털콘텐츠로 구축해야 할 대상 건수(있는 경우에 만 해당) 예) 아날로그 형태 자원인 LP판이 있으면 건수 기입<br>
											② 구축완료 : 해당 시스템 내 정보(DB)/디지털콘텐츠로 구축이 완료된 건수<br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스 : 구축완료 건수 중 현재 사이트를 통해 서비스되고 있는 건수
											">?</button>
										</th>
										<th rowspan="2">건수
											<button class="btn-tooltip"
											data-tooltip="
											<b>건수 :</b>정보의 구별(식별)단위에 대한 건수를 기재
											">?</button>
										</th>
										<th colspan="7">구성요소별
											<button class="btn-tooltip"
											data-tooltip="
											<b>구성요소별 :</b>정보를 구성하고 있는 요소로 텍스트, 이미지, 동영상, 사운드, XR데이터와 그 외 기타 등이 있는 경우에 해당 각각의 건수를 표기
											">?</button>
										</th>
										<th rowspan="2">저작권보유주체
											<button class="btn-tooltip"
											data-tooltip="
											<b>저작권보유주체 :</b>①기관 자체 보유, ②일부 자체 보유, ③정보제작자 보유, ④보유 여부 미상, ⑤저작권 없음 중 관련 번호 입력(중복가능)
											">?</button>
										</th>
										<th rowspan="2">공개제한범위
											<button class="btn-tooltip"
											data-tooltip="
											<b>공개제한범위 :</b>보유한 정보에 대한 공개 가능정도로써 ①공개제한없음, ②기관내 사이트에서만 대국민 공개, ③내부직원 또는 특정인에게만 공개, ④공개 불가
											">?</button>
										</th>
										<th rowspan="2">대국민서비스여부
											<button class="btn-tooltip"
											data-tooltip="
											<b>대국민서비스여부 :</b>①서비스 중, ②일부 서비스 중, ③서비스 안함
											">?</button>
										</th>
										<th rowspan="2">공개방법
											<button class="btn-tooltip"
											data-tooltip="
											<b>공개방법 :</b>홈페이지 보편적 서비스 외에 대국민 정보공유 및 타기관<br>공유･연계 ①Open API,②REST,③RSS,④한국문화정보센터Agent연계 등
											">?</button>
										</th>
									</tr>
									<tr>
										<th>텍스트</th>
										<th>이미지</th>
										<th>동영상</th>
										<th>사운드</th>
										<th>XR 데이터
											<button class="btn-tooltip"
											data-tooltip="
											<b>XR 데이터 :</b>3D데이터(STL, PLY, OBJ, FBX, STEP, IGES 확장자), AR, VR, 홀로그램, XR(혼합콘텐츠), 실감형 콘텐츠, 360&#176; 입체형 콘텐츠 등 4차산업 신기술 콘텐츠
											">?</button>
										</th>
										<th>기타</th>
										<th>소계</th>
									</tr>
									<tr>
										<td rowspan="4"><div class="fm-ele" data-size="100p"><input type="text" id="popContsInfoNm_${nowCltContsData.contsSn}" name="popContsInfoNm" value="${nowCltContsData.contsInfoNm}"/></div></td>
										<td>구축대상</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSumNocs_${nowCltContsData.contsSn}" name="popCnstTrgtSumNocs" value="${nowCltContsData.cnstTrgtSumNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtLtrsNocs_${nowCltContsData.contsSn}" name="popCnstTrgtLtrsNocs" value="${nowCltContsData.cnstTrgtLtrsNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtImgNocs_${nowCltContsData.contsSn}" name="popCnstTrgtImgNocs" value="${nowCltContsData.cnstTrgtImgNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtVdoNocs_${nowCltContsData.contsSn}" name="popCnstTrgtVdoNocs" value="${nowCltContsData.cnstTrgtVdoNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSndNocs_${nowCltContsData.contsSn}" name="popCnstTrgtSndNocs" value="${nowCltContsData.cnstTrgtSndNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtXrNocs_${nowCltContsData.contsSn}" name="popCnstTrgtXrNocs" value="${nowCltContsData.cnstTrgtXrNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtEtcNocs_${nowCltContsData.contsSn}" name="popCnstTrgtEtcNocs" value="${nowCltContsData.cnstTrgtEtcNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSbtotNocs_${nowCltContsData.contsSn}" name="popCnstTrgtSbtotNocs" value="${nowCltContsData.cnstTrgtSbtotNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td rowspan="4" class="tl pl10">
											<input type="hidden" id="popCpyrInstKeepYn_${nowCltContsData.contsSn}" name="popCpyrInstKeepYn" value="${nowCltContsData.cpyrInstKeepYn}">
											<input type="hidden" id="popCpyrSctnKeepYn_${nowCltContsData.contsSn}" name="popCpyrSctnKeepYn" value="${nowCltContsData.cpyrSctnKeepYn}">
											<input type="hidden" id="popCpyrMakrKeepYn_${nowCltContsData.contsSn}" name="popCpyrMakrKeepYn" value="${nowCltContsData.cpyrMakrKeepYn}">
											<input type="hidden" id="popCpyrKeepUnwnYn_${nowCltContsData.contsSn}" name="popCpyrKeepUnwnYn" value="${nowCltContsData.cpyrKeepUnwnYn}">
											<input type="hidden" id="popCpyrEnncYn_${nowCltContsData.contsSn}" name="popCpyrEnncYn" value="${nowCltContsData.cpyrEnncYn}">
											<div class="fm-check fm-list">
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrInstKeepYn_${nowCltContsData.contsSn}" name="popViewCpyrInstKeepYn" value="Y" <c:if test="${nowCltContsData.cpyrInstKeepYn == 'Y'}">checked</c:if> onclick="javascript:setChangeCpyrInstKeepYn('${nowCltContsData.contsSn}');"/><label for="popViewCpyrInstKeepYn_${nowCltContsData.contsSn}">기관 자체 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrSctnKeepYn_${nowCltContsData.contsSn}" name="popViewCpyrSctnKeepYn" value="Y" <c:if test="${nowCltContsData.cpyrSctnKeepYn == 'Y'}">checked</c:if> onclick="javascript:setChangeCpyrSctnKeepYn('${nowCltContsData.contsSn}');" /><label for="popViewCpyrSctnKeepYn_${nowCltContsData.contsSn}">일부 자체 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrMakrKeepYn_${nowCltContsData.contsSn}" name="popViewCpyrMakrKeepYn" value="Y" <c:if test="${nowCltContsData.cpyrMakrKeepYn == 'Y'}">checked</c:if> onclick="javascript:setChangeCpyrMakrKeepYn('${nowCltContsData.contsSn}');" /><label for="popViewCpyrMakrKeepYn_${nowCltContsData.contsSn}">정보제작자 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrKeepUnwnYn_${nowCltContsData.contsSn}" name="popViewCpyrKeepUnwnYn" value="Y" <c:if test="${nowCltContsData.cpyrKeepUnwnYn == 'Y'}">checked</c:if> onclick="javascript:setChangeCpyrKeepUnwnYn('${nowCltContsData.contsSn}');" /><label for="popViewCpyrKeepUnwnYn_${nowCltContsData.contsSn}">보유 여부 미상</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrEnncYn_${nowCltContsData.contsSn}" name="popViewCpyrEnncYn" value="Y" <c:if test="${nowCltContsData.cpyrEnncYn == 'Y'}">checked</c:if> onclick="javascript:setChangeCpyrEnncYn('${nowCltContsData.contsSn}');" /><label for="popViewCpyrEnncYn_${nowCltContsData.contsSn}">저작권 없음</label></span>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popRlsLmtScpCd_${nowCltContsData.contsSn}" name="popRlsLmtScpCd">
													<option value="" <c:if test="${nowCltContsData.rlsLmtScpCd == ''}">selected</c:if>>선택</option>
										<c:if test="${!empty rlsLmtScpCdList}">
											<c:forEach var="rlsLmtScpCdData" items="${rlsLmtScpCdList}">
													<option value="${rlsLmtScpCdData.cdId}" <c:if test="${nowCltContsData.rlsLmtScpCd == rlsLmtScpCdData.cdId}">selected</c:if>>${rlsLmtScpCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popMrfnTrgtSrvcCd_${nowCltContsData.contsSn}" name="popMrfnTrgtSrvcCd">
													<option value="" <c:if test="${nowCltContsData.mrfnTrgtSrvcCd == ''}">selected</c:if>>선택</option>
										<c:if test="${!empty mrfnTrgtCdList}">
											<c:forEach var="mrfnTrgtCdData" items="${mrfnTrgtCdList}">
													<option value="${mrfnTrgtCdData.cdId}" <c:if test="${nowCltContsData.mrfnTrgtSrvcCd == mrfnTrgtCdData.cdId}">selected</c:if>>${mrfnTrgtCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popRlsMthdCd_${nowCltContsData.contsSn}" name="popRlsMthdCd">
													<option value="" <c:if test="${nowCltContsData.rlsMthdCd == ''}">selected</c:if>>선택</option>
										<c:if test="${!empty rlsMthdCdList}">
											<c:forEach var="rlsMthdCdData" items="${rlsMthdCdList}">
													<option value="${rlsMthdCdData.cdId}" <c:if test="${nowCltContsData.rlsMthdCd == rlsMthdCdData.cdId}">selected</c:if>>${rlsMthdCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td>구축완료</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnNocs_${nowCltContsData.contsSn}" name="popCnstCmptnNocs" value="${nowCltContsData.cnstCmptnNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnLtrsNocs_${nowCltContsData.contsSn}" name="popCnstCmptnLtrsNocs" value="${nowCltContsData.cnstCmptnLtrsNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnImgNocs_${nowCltContsData.contsSn}" name="popCnstCmptnImgNocs" value="${nowCltContsData.cnstCmptnImgNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnVdoNocs_${nowCltContsData.contsSn}" name="popCnstCmptnVdoNocs" value="${nowCltContsData.cnstCmptnVdoNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnSndNocs_${nowCltContsData.contsSn}" name="popCnstCmptnSndNocs" value="${nowCltContsData.cnstCmptnSndNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnXrNocs_${nowCltContsData.contsSn}" name="popCnstCmptnXrNocs" value="${nowCltContsData.cnstCmptnXrNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnEtcNocs_${nowCltContsData.contsSn}" name="popCnstCmptnEtcNocs" value="${nowCltContsData.cnstCmptnEtcNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('${nowCltContsData.contsSn}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnSbtotNocs_${nowCltContsData.contsSn}" name="popCnstCmptnSbtotNocs" value="${nowCltContsData.cnstCmptnSbtotNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
									<tr>
										<td>서비스</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcNocs_${nowCltContsData.contsSn}" name="popSrvcNocs" value="${nowCltContsData.srvcNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcLtrsCnt_${nowCltContsData.contsSn}" name="popSrvcLtrsCnt" value="${nowCltContsData.srvcLtrsCnt}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcImgCnt_${nowCltContsData.contsSn}" name="popSrvcImgCnt" value="${nowCltContsData.srvcImgCnt}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcVdoCnt_${nowCltContsData.contsSn}" name="popSrvcVdoCnt" value="${nowCltContsData.srvcVdoCnt}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcSndCnt_${nowCltContsData.contsSn}" name="popSrvcSndCnt" value="${nowCltContsData.srvcSndCnt}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcXrNocs_${nowCltContsData.contsSn}" name="popSrvcXrNocs" value="${nowCltContsData.srvcXrNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcEtcNocs_${nowCltContsData.contsSn}" name="popSrvcEtcNocs" value="${nowCltContsData.srvcEtcNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('${nowCltContsData.srvcNocs}');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcSumCnt_${nowCltContsData.contsSn}" name="popSrvcSumCnt" value="${nowCltContsData.srvcSumCnt}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
									<tr>
										<td>합계</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumNocs_${nowCltContsData.contsSn}" name="popCnstSumNocs" value="${nowCltContsData.cnstSumNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumLtrsNocs_${nowCltContsData.contsSn}" name="popCnstSumLtrsNocs" value="${nowCltContsData.cnstSumLtrsNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumImgNocs_${nowCltContsData.contsSn}" name="popCnstSumImgNocs" value="${nowCltContsData.cnstSumImgNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumVdoNocs_${nowCltContsData.contsSn}" name="popCnstSumVdoNocs" value="${nowCltContsData.cnstSumVdoNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumSndNocs_${nowCltContsData.contsSn}" name="popCnstSumSndNocs" value="${nowCltContsData.cnstSumSndNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumXrNocs_${nowCltContsData.contsSn}" name="popCnstSumXrNocs" value="${nowCltContsData.cnstSumXrNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumEtcNocs_${nowCltContsData.contsSn}" name="popCnstSumEtcNocs" value="${nowCltContsData.cnstSumEtcNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumSbtotNocs_${nowCltContsData.contsSn}" name="popCnstSumSbtotNocs" value="${nowCltContsData.cnstSumSbtotNocs}" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty nowPopRcsExmnCltContsInfoList}">
					<tr>
						<td class="pt0">
							<table class="mt0">
								<caption></caption>
								<colgroup>
									<col width="40px"></col>
									<col width="100px"></col>
									<col width="320px;"></col>
									<col width="140px"></col>
									<col width="320px;"></col>
									<col width="80px"></col>
								</colgroup>
								<tbody>
									<tr>
										<td>1</td>
										<th>사이트명</th>
										<td>
											<div class="fm-ele" data-size="100p">
												<input type="hidden" id="popStts_1" name="popStts" value="I">
												<input type="hidden" id="popContsSn_1" name="popContsSn" value="0">
												<input type="text" id="popSiteNm_1" name="popSiteNm" value=""/>
											</div>
										</td>
										<th>사이트URL</th>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSiteUrlAddr_1" name="popSiteUrlAddr" value=""/></div></td>
										<td><button type="button" class="btns size-xsmall color-red" id="btnPopDeleteCltContsInfoRow_1" name="btnPopDeleteCltContsInfoRow" onclick="javascript:moveDeleteCltContsInfo('1'); return false;">삭제</button></td>
									</tr>
								</tbody>
							</table>
							<table class="mt0">
								<caption></caption>
								<colgroup>
									<col width="150px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="110px"></col>
									<col width="150px"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
									<col width="110px;"></col>
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="2">정보(DB)/콘텐츠명
											<button class="btn-tooltip"
											data-tooltip="
											<b>정보(DB)/콘텐츠명 :</b>해당 사이트에서 서비스 단위(또는 메뉴 단위)를 기준으로 보유하고 있는 문화정보/콘텐츠의 명칭으로<br>2개 이상 보유하고 있는 경우 복수의 문화정보/콘텐츠 명칭 각각 기입(작성 예시 1, 2 참조)
											">?</button>
										</th>
										<th rowspan="2">구축단계
											<button class="btn-tooltip"
											data-tooltip="
												<b>구축단계 :</b><br>① 구축대상 : 앞으로 시스템 내 정보(DB)/디지털콘텐츠로 구축해야 할 대상 건수(있는 경우에 만 해당) 예) 아날로그 형태 자원인 LP판이 있으면 건수 기입<br>
													② 구축완료 : 해당 시스템 내 정보(DB)/디지털콘텐츠로 구축이 완료된 건수<br>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스 : 구축완료 건수 중 현재 사이트를 통해 서비스되고 있는 건수
											">?</button>
										</th>
										<th rowspan="2">건수
											<button class="btn-tooltip"
											data-tooltip="
											<b>건수 :</b>정보의 구별(식별)단위에 대한 건수를 기재
											">?</button>
										</th>
										<th colspan="7">구성요소별
											<button class="btn-tooltip"
											data-tooltip="
											<b>구성요소별 :</b>정보를 구성하고 있는 요소로 텍스트, 이미지, 동영상, 사운드, XR데이터와 그 외 기타 등이 있는 경우에 해당 각각의 건수를 표기
											">?</button>
										</th>
										<th rowspan="2">저작권보유주체
											<button class="btn-tooltip"
											data-tooltip="
											<b>저작권보유주체 :</b>①기관 자체 보유, ②일부 자체 보유, ③정보제작자 보유, ④보유 여부 미상, ⑤저작권 없음 중 관련 번호 입력(중복가능)
											">?</button>
										</th>
										<th rowspan="2">공개제한범위
											<button class="btn-tooltip"
											data-tooltip="
											<b>공개제한범위 :</b>보유한 정보에 대한 공개 가능정도로써 ①공개제한없음, ②기관내 사이트에서만 대국민 공개, ③내부직원 또는 특정인에게만 공개, ④공개 불가
											">?</button>
										</th>
										<th rowspan="2">대국민서비스여부
											<button class="btn-tooltip"
											data-tooltip="
											<b>대국민서비스여부 :</b>①서비스 중, ②일부 서비스 중, ③서비스 안함
											">?</button>
										</th>
										<th rowspan="2">공개방법
											<button class="btn-tooltip"
											data-tooltip="
											<b>공개방법 :</b>홈페이지 보편적 서비스 외에 대국민 정보공유 및 타기관<br>공유･연계①Open API,②REST,③RSS,④한국문화정보센터Agent연계 등
											">?</button>
										</th>
									</tr>
									<tr>
										<th>텍스트</th>
										<th>이미지</th>
										<th>동영상</th>
										<th>사운드</th>
										<th>XR 데이터
											<button class="btn-tooltip"
											data-tooltip="
											<b>XR 데이터 :</b>3D데이터(STL, PLY, OBJ, FBX, STEP, IGES 확장자), AR, VR, 홀로그램, XR(혼합콘텐츠), 실감형 콘텐츠, 360&#176; 입체형 콘텐츠 등 4차산업 신기술 콘텐츠
											">?</button>
										</th>
										<th>기타</th>
										<th>소계</th>
									</tr>
									<tr>
										<td rowspan="4"><div class="fm-ele" data-size="100p"><input type="text" id="popContsInfoNm_1" name="popContsInfoNm" value=""/></div></td>
										<td>구축대상</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSumNocs_1" name="popCnstTrgtSumNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtLtrsNocs_1" name="popCnstTrgtLtrsNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtImgNocs_1" name="popCnstTrgtImgNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtVdoNocs_1" name="popCnstTrgtVdoNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSndNocs_1" name="popCnstTrgtSndNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtXrNocs_1" name="popCnstTrgtXrNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtEtcNocs_1" name="popCnstTrgtEtcNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstTrgtSbtotNocs_1" name="popCnstTrgtSbtotNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td rowspan="4" class="tl pl10">
											<input type="hidden" id="popCpyrInstKeepYn_1" name="popCpyrInstKeepYn" value="N">
											<input type="hidden" id="popCpyrSctnKeepYn_1" name="popCpyrSctnKeepYn" value="N">
											<input type="hidden" id="popCpyrMakrKeepYn_1" name="popCpyrMakrKeepYn" value="N">
											<input type="hidden" id="popCpyrKeepUnwnYn_1" name="popCpyrKeepUnwnYn" value="N">
											<input type="hidden" id="popCpyrEnncYn_1" name="popCpyrEnncYn" value="N">
											<div class="fm-check fm-list">
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrInstKeepYn_1" name="popViewCpyrInstKeepYn" value="Y" onclick="javascript:setChangeCpyrInstKeepYn('1');"/><label for="popViewCpyrInstKeepYn_1">기관 자체 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrSctnKeepYn_1" name="popViewCpyrSctnKeepYn" value="Y" onclick="javascript:setChangeCpyrSctnKeepYn('1');" /><label for="popViewCpyrSctnKeepYn_1">일부 자체 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrMakrKeepYn_1" name="popViewCpyrMakrKeepYn" value="Y" onclick="javascript:setChangeCpyrMakrKeepYn('1');" /><label for="popViewCpyrMakrKeepYn_1">정보제작자 보유</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrKeepUnwnYn_1" name="popViewCpyrKeepUnwnYn" value="Y" onclick="javascript:setChangeCpyrKeepUnwnYn('1');" /><label for="popViewCpyrKeepUnwnYn_1">보유 여부 미상</label></span>
												<span class="fm-ele"><input type="checkbox" id="popViewCpyrEnncYn_1" name="popViewCpyrEnncYn" value="Y" onclick="javascript:setChangeCpyrEnncYn('1');" /><label for="popViewCpyrEnncYn_1">저작권 없음</label></span>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popRlsLmtScpCd_1" name="popRlsLmtScpCd">
													<option value="">선택</option>
										<c:if test="${!empty rlsLmtScpCdList}">
											<c:forEach var="rlsLmtScpCdData" items="${rlsLmtScpCdList}">
													<option value="${rlsLmtScpCdData.cdId}">${rlsLmtScpCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popMrfnTrgtSrvcCd_1" name="popMrfnTrgtSrvcCd">
													<option value="">선택</option>
										<c:if test="${!empty mrfnTrgtCdList}">
											<c:forEach var="mrfnTrgtCdData" items="${mrfnTrgtCdList}">
													<option value="${mrfnTrgtCdData.cdId}">${mrfnTrgtCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
										<td rowspan="4">
											<div class="fm-focus fm-select" data-size="100p">
												<select id="popRlsMthdCd_1" name="popRlsMthdCd">
													<option value="">선택</option>
										<c:if test="${!empty rlsMthdCdList}">
											<c:forEach var="rlsMthdCdData" items="${rlsMthdCdList}">
													<option value="${rlsMthdCdData.cdId}">${rlsMthdCdData.cdNm}</option>
											</c:forEach>
										</c:if>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td>구축완료</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnNocs_1" name="popCnstCmptnNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnLtrsNocs_1" name="popCnstCmptnLtrsNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnImgNocs_1" name="popCnstCmptnImgNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnVdoNocs_1" name="popCnstCmptnVdoNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnSndNocs_1" name="popCnstCmptnSndNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnXrNocs_1" name="popCnstCmptnXrNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnEtcNocs_1" name="popCnstCmptnEtcNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountTgrt('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstCmptnSbtotNocs_1" name="popCnstCmptnSbtotNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
									<tr>
										<td>서비스</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcNocs_1" name="popSrvcNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcLtrsCnt_1" name="popSrvcLtrsCnt" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcImgCnt_1" name="popSrvcImgCnt" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcVdoCnt_1" name="popSrvcVdoCnt" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcSndCnt_1" name="popSrvcSndCnt" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcXrNocs_1" name="popSrvcXrNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcEtcNocs_1" name="popSrvcEtcNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event); setPopSumContCountSrvc('1');" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;"/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popSrvcSumCnt_1" name="popSrvcSumCnt" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
									<tr>
										<td>합계</td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumNocs_1" name="popCnstSumNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumLtrsNocs_1" name="popCnstSumLtrsNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumImgNocs_1" name="popCnstSumImgNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumVdoNocs_1" name="popCnstSumVdoNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumSndNocs_1" name="popCnstSumSndNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumXrNocs_1" name="popCnstSumXrNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumEtcNocs_1" name="popCnstSumEtcNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
										<td><div class="fm-ele" data-size="100p"><input type="text" id="popCnstSumSbtotNocs_1" name="popCnstSumSbtotNocs" value="" class="tr pr10" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)" onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" style="ime-mode:disabled;" readonly/></div></td>
									</tr>
								</tbody>
							</table>
						</td>
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
		<button type="button" class="btns" id="btnPopSaveRcsexmnCltContInfo" name="btnPopSaveRcsexmnCltContInfo" onclick="javascript:moveSaveRcsexmnCltContInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnCltContInfo" name="btnPopSaveRcsexmnCltContInfo" onclick="javascript:moveSaveRcsexmnCltContInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnCltContInfo" name="btnPopCloseRcsexmnCltContInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	var nowListLen = ${fn:length(nowPopRcsExmnCltContsInfoList) };
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function getSelectRlsLmtScpCdData() {
		let rlsLmtScpCdData = "";
		<c:if test="${!empty rlsLmtScpCdList}">
			<c:forEach var="rlsLmtScpCdData" items="${rlsLmtScpCdList}">
		rlsLmtScpCdData += "<option value=\"${rlsLmtScpCdData.cdId}\">${rlsLmtScpCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		return rlsLmtScpCdData;
	}
	
	function getSelectMrfnTrgtCdData() {
		let mrfnTrgtCdData = "";
		<c:if test="${!empty mrfnTrgtCdList}">
			<c:forEach var="mrfnTrgtCdData" items="${mrfnTrgtCdList}">
		mrfnTrgtCdData += "<option value=\"${mrfnTrgtCdData.cdId}\">${mrfnTrgtCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		return mrfnTrgtCdData;
	}
	
	function getSelectRlsMthdCdData() {
		let rlsMthdCdData = "";
		<c:if test="${!empty rlsMthdCdList}">
			<c:forEach var="rlsMthdCdData" items="${rlsMthdCdList}">
		rlsMthdCdData += "<option value=\"${rlsMthdCdData.cdId}\">${rlsMthdCdData.cdNm}</option>";
			</c:forEach>
		</c:if> 
		return rlsMthdCdData;
		
	}
	
	function moveDeleteCltContsInfo(paramData) {
		let oldDataStt = $("#popStts_" + paramData).val();
		if (oldDataStt == "D") {
			alert("이미 삭제로 설정된 데이터입니다. ");
			return false;
		} else {
			//headerTable
			$("#popSiteNm_" + paramData).attr("readonly", true);
			$("#popSiteUrlAddr_" + paramData).attr("readonly", true);
			$("#popViewStts_" + paramData).text('D');
			$("#popStts_" + paramData).val('D');
			//bodyTable
			$("#popContsInfoNm_" + paramData).attr("readonly", true);
			$("#popCnstTrgtSumNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtLtrsNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtImgNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtVdoNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtSndNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtXrNocs_" + paramData).attr("readonly", true);
			$("#popCnstTrgtEtcNocs_" + paramData).attr("readonly", true);
			
			$("#popViewCpyrInstKeepYn_" + paramData).attr("disabled", true);
			$("#popViewCpyrSctnKeepYn_" + paramData).attr("disabled", true);
			$("#popViewCpyrMakrKeepYn_" + paramData).attr("disabled", true);
			$("#popViewCpyrKeepUnwnYn_" + paramData).attr("disabled", true);
			$("#popViewCpyrEnncYn_" + paramData).attr("disabled", true);
			
			$("#popCpyrInstKeepYn_" + paramData).attr("readonly", true);
			$("#popCpyrSctnKeepYn_" + paramData).attr("readonly", true);
			$("#popCpyrMakrKeepYn_" + paramData).attr("readonly", true);
			$("#popCpyrKeepUnwnYn_" + paramData).attr("readonly", true);
			$("#popCpyrEnncYn_" + paramData).attr("readonly", true);
			
			$("#popRlsLmtScpCd_" + paramData).attr("disabled", true);
			$("#popMrfnTrgtSrvcYn_" + paramData).attr("disabled", true);
			$("#popRlsMthdCd_" + paramData).attr("disabled", true);
			
			$("#popCnstCmptnNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnLtrsNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnImgNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnVdoNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnSndNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnXrNocs_" + paramData).attr("readonly", true);
			$("#popCnstCmptnEtcNocs_" + paramData).attr("readonly", true);
			
			$("#popSrvcNocs_" + paramData).attr("readonly", true);
			$("#popSrvcLtrsCnt_" + paramData).attr("readonly", true);
			$("#popSrvcImgCnt_" + paramData).attr("readonly", true);
			$("#popSrvcVdoCnt_" + paramData).attr("readonly", true);
			$("#popSrvcSndCnt_" + paramData).attr("readonly", true);
			$("#popSrvcXrNocs_" + paramData).attr("readonly", true);
			$("#popSrvcEtcNocs_" + paramData).attr("readonly", true);
		}
	}
	
	//저작권 기관 자체 보유 여부
	function setChangeCpyrInstKeepYn(paramData) {
		if ($("#popViewCpyrInstKeepYn_" + paramData).is(":checked") == true) {
			$("#popCpyrInstKeepYn_" + paramData).val("Y");
		} else {
			$("#popCpyrInstKeepYn_" + paramData).val("N");
		}
		
	}
	//저작원 일부 자체 보유 여부
	function setChangeCpyrSctnKeepYn(paramData) {
		if ($("#popViewCpyrSctnKeepYn_" + paramData).is(":checked") == true) {
			$("#popCpyrSctnKeepYn_" + paramData).val("Y");
		} else {
			$("#popCpyrSctnKeepYn_" + paramData).val("N");
		}
		
	}
	//저작권 정보제작자 보유
	function setChangeCpyrMakrKeepYn(paramData) {
		if ($("#popViewCpyrMakrKeepYn_" + paramData).is(":checked") == true) {
			$("#popCpyrMakrKeepYn_" + paramData).val("Y");
		} else {
			$("#popCpyrMakrKeepYn_" + paramData).val("N");
		}
		
	}
	//저작권 보유여부 미상
	function setChangeCpyrKeepUnwnYn(paramData) {
		if ($("#popViewCpyrKeepUnwnYn_" + paramData).is(":checked") == true) {
			$("#popCpyrKeepUnwnYn_" + paramData).val("Y");
		} else {
			$("#popCpyrKeepUnwnYn_" + paramData).val("N");
		}
		
	}
	//저작권 없음
	function setChangeCpyrEnncYn(paramData) {
		if ($("#popViewCpyrEnncYn_" + paramData).is(":checked") == true) {
			$("#popCpyrEnncYn_" + paramData).val("Y");
		} else {
			$("#popCpyrEnncYn_" + paramData).val("N");
		}
		
	}
	
	function setPopSumContCountTgrt(paramData) {
		
		//구축대상
		let popCnstTrgtSumNocs = $("#popCnstTrgtSumNocs_" + paramData).val();
		
		let popCnstTrgtLtrsNocs = $("#popCnstTrgtLtrsNocs_" + paramData).val();
		let popCnstTrgtImgNocs = $("#popCnstTrgtImgNocs_" + paramData).val();
		let popCnstTrgtVdoNocs = $("#popCnstTrgtVdoNocs_" + paramData).val();
		let popCnstTrgtSndNocs = $("#popCnstTrgtSndNocs_" + paramData).val();
		let popCnstTrgtXrNocs = $("#popCnstTrgtXrNocs_" + paramData).val();
		let popCnstTrgtEtcNocs = $("#popCnstTrgtEtcNocs_" + paramData).val();
		let popCnstTrgtSbtotNocs = "";
		if (popCnstTrgtSumNocs == "" || popCnstTrgtSumNocs == null) {
			popCnstTrgtSumNocs = "0";
			$("#popCnstTrgtSumNocs_" + paramData).val(popCnstTrgtSumNocs);
		}
		
		if (popCnstTrgtLtrsNocs == "" || popCnstTrgtLtrsNocs == null) {
			popCnstTrgtLtrsNocs = "0";
			$("#popCnstTrgtLtrsNocs_" + paramData).val(popCnstTrgtLtrsNocs)
		}
		
		if (popCnstTrgtImgNocs == "" || popCnstTrgtImgNocs == null) {
			popCnstTrgtImgNocs = "0";
			$("#popCnstTrgtImgNocs_" + paramData).val(popCnstTrgtImgNocs);
		}
		if (popCnstTrgtVdoNocs == "" || popCnstTrgtVdoNocs == null) {
			popCnstTrgtVdoNocs = "0";
			$("#popCnstTrgtVdoNocs_" + paramData).val(popCnstTrgtVdoNocs);
		}
		if (popCnstTrgtSndNocs == "" || popCnstTrgtSndNocs == null) {
			popCnstTrgtSndNocs = "0";
			$("#popCnstTrgtSndNocs_" + paramData).val(popCnstTrgtSndNocs);
		}
		if (popCnstTrgtXrNocs == "" || popCnstTrgtXrNocs == null) {
			popCnstTrgtXrNocs = "0";
			$("#popCnstTrgtXrNocs_" + paramData).val(popCnstTrgtXrNocs);
		}
		if (popCnstTrgtEtcNocs == "" || popCnstTrgtEtcNocs == null) {
			popCnstTrgtEtcNocs = "0";
			$("#popCnstTrgtEtcNocs_" + paramData).val(popCnstTrgtEtcNocs);
		}
		popCnstTrgtSbtotNocs = parseInt(popCnstTrgtLtrsNocs, 10) + parseInt(popCnstTrgtImgNocs, 10) + parseInt(popCnstTrgtVdoNocs, 10) + parseInt(popCnstTrgtSndNocs, 10) + parseInt(popCnstTrgtXrNocs, 10) + parseInt(popCnstTrgtEtcNocs, 10);
		
		$("#popCnstTrgtSbtotNocs_" + paramData).val(popCnstTrgtSbtotNocs);
		
		//구축완료
		let popCnstCmptnNocs = $("#popCnstCmptnNocs_" + paramData).val();
		
		let popCnstCmptnLtrsNocs = $("#popCnstCmptnLtrsNocs_" + paramData).val();
		let popCnstCmptnImgNocs = $("#popCnstCmptnImgNocs_" + paramData).val();
		let popCnstCmptnVdoNocs = $("#popCnstCmptnVdoNocs_" + paramData).val();
		let popCnstCmptnSndNocs = $("#popCnstCmptnSndNocs_" + paramData).val();
		let popCnstCmptnXrNocs = $("#popCnstCmptnXrNocs_" + paramData).val();
		let popCnstCmptnEtcNocs = $("#popCnstCmptnEtcNocs_" + paramData).val();
		let popCnstCmptnSbtotNocs = "";
		if (popCnstCmptnNocs == "" || popCnstCmptnNocs == null) {
			popCnstCmptnNocs = "0";
			$("#popCnstCmptnNocs_" + paramData).val(popCnstCmptnNocs);
		}
		if (popCnstCmptnLtrsNocs == "" || popCnstCmptnLtrsNocs == null) {
			popCnstCmptnLtrsNocs = "0";
			$("#popCnstCmptnLtrsNocs_" + paramData).val(popCnstCmptnLtrsNocs);
		}
		if (popCnstCmptnImgNocs == "" || popCnstCmptnImgNocs == null) {
			popCnstCmptnImgNocs = "0";
			$("#popCnstCmptnImgNocs_" + paramData).val(popCnstCmptnImgNocs);
		}
		if (popCnstCmptnVdoNocs == "" || popCnstCmptnVdoNocs == null) {
			popCnstCmptnVdoNocs = "0";
			$("#popCnstCmptnVdoNocs_" + paramData).val(popCnstCmptnVdoNocs);
		}
		if (popCnstCmptnSndNocs == "" || popCnstCmptnSndNocs == null) {
			popCnstCmptnSndNocs = "0";
			$("#popCnstCmptnSndNocs_" + paramData).val(popCnstCmptnSndNocs);
		}
		if (popCnstCmptnXrNocs == "" || popCnstCmptnXrNocs == null) {
			popCnstCmptnXrNocs = "0";
			$("#popCnstCmptnXrNocs_" + paramData).val(popCnstCmptnXrNocs);
		}
		if (popCnstCmptnEtcNocs == "" || popCnstCmptnEtcNocs == null) {
			popCnstCmptnEtcNocs = "0";
			$("#popCnstCmptnEtcNocs_" + paramData).val(popCnstCmptnEtcNocs);
		}
		popCnstCmptnSbtotNocs = parseInt(popCnstCmptnLtrsNocs, 10) + parseInt(popCnstCmptnImgNocs, 10) + parseInt(popCnstCmptnVdoNocs, 10) + parseInt(popCnstCmptnSndNocs, 10) + parseInt(popCnstCmptnXrNocs, 10) + parseInt(popCnstCmptnEtcNocs, 10);
		$("#popCnstCmptnSbtotNocs_" + paramData).val(popCnstCmptnSbtotNocs);
		
		
		//서비스
		let popSrvcNocs = $("#popSrvcNocs_" + paramData).val();
		
		let popSrvcLtrsCnt = $("#popSrvcLtrsCnt_" + paramData).val();
		let popSrvcImgCnt = $("#popSrvcImgCnt_" + paramData).val();
		let popSrvcVdoCnt = $("#popSrvcVdoCnt_" + paramData).val();
		let popSrvcSndCnt = $("#popSrvcSndCnt_" + paramData).val();
		let popSrvcXrNocs = $("#popSrvcXrNocs_" + paramData).val();
		let popSrvcEtcNocs = $("#popSrvcEtcNocs_" + paramData).val();
		let popSrvcSumCnt = "";
		
		if (popSrvcNocs == "" || popSrvcNocs == null) {
			popSrvcNocs = "0";
			$("#popSrvcNocs_" + paramData).val(popSrvcNocs);
		}
		if (popSrvcLtrsCnt == "" || popSrvcLtrsCnt == null) {
			popSrvcLtrsCnt = "0";
			$("#popSrvcLtrsCnt_" + paramData).val(popSrvcLtrsCnt);
		}
		if (popSrvcImgCnt == "" || popSrvcImgCnt == null) {
			popSrvcImgCnt = "0";
			$("#popSrvcImgCnt_" + paramData).val(popSrvcImgCnt);
		}
		if (popSrvcVdoCnt == "" || popSrvcVdoCnt == null) {
			popSrvcVdoCnt = "0";
			$("#popSrvcVdoCnt_" + paramData).val(popSrvcVdoCnt);
		}
		if (popSrvcSndCnt == "" || popSrvcSndCnt == null) {
			popSrvcSndCnt = "0";
			$("#popSrvcSndCnt_" + paramData).val(popSrvcSndCnt);
		}
		if (popSrvcXrNocs == "" || popSrvcXrNocs == null) {
			popSrvcXrNocs = "0";
			$("#popSrvcXrNocs_" + paramData).val(popSrvcXrNocs);
		}
		if (popSrvcEtcNocs == "" || popSrvcEtcNocs == null) {
			popSrvcEtcNocs = "0";
			$("#popSrvcEtcNocs_" + paramData).val(popSrvcEtcNocs);
		}
		
		popSrvcSumCnt = parseInt(popSrvcLtrsCnt, 10) + parseInt(popSrvcImgCnt, 10) + parseInt(popSrvcVdoCnt, 10) + parseInt(popSrvcSndCnt, 10) + parseInt(popSrvcXrNocs, 10) + parseInt(popSrvcEtcNocs, 10);
		$("#popSrvcSumCnt_" + paramData).val(popSrvcSumCnt);
		
		
		
		//구축합계(구축건수)
		let popCnstSumNocs = "0";
		popCnstSumNocs = parseInt(popCnstTrgtSumNocs, 10) + parseInt(popCnstCmptnNocs, 10)+ parseInt(popSrvcNocs, 10);
		$("#popCnstSumNocs_" + paramData).val(popCnstSumNocs);
		
		let popCnstSumLtrsNocs = "0";
		let popCnstSumImgNocs = "0";
		let popCnstSumVdoNocs = "0";
		let popCnstSumSndNocs = "0";
		let popCnstSumXrNocs = "0";
		let popCnstSumEtcNocs = "0";
		
		popCnstSumLtrsNocs = parseInt(popCnstTrgtLtrsNocs, 10) + parseInt(popCnstCmptnLtrsNocs, 10) + parseInt(popSrvcLtrsCnt, 10);
		popCnstSumImgNocs = parseInt(popCnstTrgtImgNocs, 10) + parseInt(popCnstCmptnImgNocs, 10) + parseInt(popSrvcImgCnt, 10);
		popCnstSumVdoNocs = parseInt(popCnstTrgtVdoNocs, 10) + parseInt(popCnstCmptnVdoNocs, 10) + parseInt(popSrvcVdoCnt, 10);
		popCnstSumSndNocs = parseInt(popCnstTrgtSndNocs, 10) + parseInt(popCnstCmptnSndNocs, 10)+ parseInt(popSrvcSndCnt, 10);
		popCnstSumXrNocs = parseInt(popCnstTrgtXrNocs, 10) + parseInt(popCnstCmptnXrNocs, 10) + parseInt(popSrvcXrNocs, 10);
		popCnstSumEtcNocs = parseInt(popCnstTrgtEtcNocs, 10) + parseInt(popCnstCmptnEtcNocs, 10)+ parseInt(popSrvcEtcNocs, 10);
		
		$("#popCnstSumLtrsNocs_" + paramData).val(popCnstSumLtrsNocs);
		$("#popCnstSumImgNocs_" + paramData).val(popCnstSumImgNocs);
		$("#popCnstSumVdoNocs_" + paramData).val(popCnstSumVdoNocs);
		$("#popCnstSumSndNocs_" + paramData).val(popCnstSumSndNocs);
		$("#popCnstSumXrNocs_" + paramData).val(popCnstSumXrNocs);
		$("#popCnstSumEtcNocs_" + paramData).val(popCnstSumEtcNocs);
		
		
		//구축합계의 소계
		let popCnstSumLtrsNocsData = $("#popCnstSumLtrsNocs_" + paramData).val();
		let popCnstSumImgNocsData = $("#popCnstSumImgNocs_" + paramData).val();
		let popCnstSumVdoNocsData = $("#popCnstSumVdoNocs_" + paramData).val();
		let ppopCnstSumSndNocsData = $("#popCnstSumSndNocs_" + paramData).val();
		let popCnstSumXrNocsData = $("#popCnstSumXrNocs_" + paramData).val();
		let popCnstSumEtcNocsData = $("#popCnstSumEtcNocs_" + paramData).val();
		let popCnstSumSbtotNocsData = "";
		
		popCnstSumSbtotNocsData = parseInt(popCnstSumLtrsNocsData, 10) + parseInt(popCnstSumImgNocsData, 10) + parseInt(popCnstSumVdoNocsData, 10) + parseInt(ppopCnstSumSndNocsData, 10) + parseInt(popCnstSumXrNocsData, 10) + parseInt(popCnstSumEtcNocsData, 10);
		$("#popCnstSumSbtotNocs_" + paramData).val(popCnstSumSbtotNocsData);
	}
	
	function setPopSumContCountSrvc(paramData) {
		
		let popSrvcNocs = $("#popSrvcNocs_" + paramData).val();
		
		let popSrvcLtrsCnt = $("#popSrvcLtrsCnt_" + paramData).val();
		let popSrvcImgCnt = $("#popSrvcImgCnt_" + paramData).val();
		let popSrvcVdoCnt = $("#popSrvcVdoCnt_" + paramData).val();
		let popSrvcSndCnt = $("#popSrvcSndCnt_" + paramData).val();
		let popSrvcXrNocs = $("#popSrvcXrNocs_" + paramData).val();
		let popSrvcEtcNocs = $("#popSrvcEtcNocs_" + paramData).val();
		let popSrvcSumCnt = "";
		
		if (popSrvcNocs == "" || popSrvcNocs == null) {
			popSrvcNocs = "0";
			$("#popSrvcNocs_" + paramData).val(popSrvcNocs);
		}
		if (popSrvcLtrsCnt == "" || popSrvcLtrsCnt == null) {
			popSrvcLtrsCnt = "0";
			$("#popSrvcLtrsCnt_" + paramData).val(popSrvcLtrsCnt);
		}
		if (popSrvcImgCnt == "" || popSrvcImgCnt == null) {
			popSrvcImgCnt = "0";
			$("#popSrvcImgCnt_" + paramData).val(popSrvcImgCnt);
		}
		if (popSrvcVdoCnt == "" || popSrvcVdoCnt == null) {
			popSrvcVdoCnt = "0";
			$("#popSrvcVdoCnt_" + paramData).val(popSrvcVdoCnt);
		}
		if (popSrvcSndCnt == "" || popSrvcSndCnt == null) {
			popSrvcSndCnt = "0";
			$("#popSrvcSndCnt_" + paramData).val(popSrvcSndCnt);
		}
		if (popSrvcXrNocs == "" || popSrvcXrNocs == null) {
			popSrvcXrNocs = "0";
			$("#popSrvcXrNocs_" + paramData).val(popSrvcXrNocs);
		}
		if (popSrvcEtcNocs == "" || popSrvcEtcNocs == null) {
			popSrvcEtcNocs = "0";
			$("#popSrvcEtcNocs_" + paramData).val(popSrvcEtcNocs);
		}
		
		popSrvcSumCnt = parseInt(popSrvcLtrsCnt, 10) + parseInt(popSrvcImgCnt, 10) + parseInt(popSrvcVdoCnt, 10) + parseInt(popSrvcSndCnt, 10) + parseInt(popSrvcXrNocs, 10) + parseInt(popSrvcEtcNocs, 10);
		$("#popSrvcSumCnt_" + paramData).val(popSrvcSumCnt);
	}
	
	
	function moveAddCltContsInfo() {
		let popTblBody, popNewRowNumber, popNewRow, popViewRowNum,  popNewCell0;
		let popRlsLmtScpCdData, popMrfnTrgtCdData, popRlsMthdCdData, popHeaderTableText, popBodyTableText;
		
		popRlsLmtScpCdData = getSelectRlsLmtScpCdData();
		popMrfnTrgtCdData = getSelectMrfnTrgtCdData();
		popRlsMthdCdData = getSelectRlsMthdCdData();
		
		
		popTblBody = $("#popCltContsTbody");
		popNewRowNumber = popTblBody[0].rows.length;
		popNewRow = popTblBody[0].insertRow(popNewRowNumber);
		popNewCell0 = popNewRow.insertCell();
		
		popViewRowNum = popTblBody[0].rows.length;
		
		if (nowListLen == 0) {
			nowListLen = 2;
		} else {
			nowListLen++;
		}
		
		//상위테이블
		popHeaderTableText = "";
		popHeaderTableText += "<table class=\"mt0\"><caption></caption><colgroup><col width=\"40px\"><col width=\"100px\"></col><col width=\"320px\"></col><col width=\"140px\"></col><col width=\"320px\"></col><col width=\"80px\"></col></colgroup>";
		popHeaderTableText += "<tbody><tr>";
		popHeaderTableText += "<td>"+nowListLen+"</td>";
		popHeaderTableText += "<th>사이트명</th><td><div class=\"fm-ele\" data-size=\"100p\">";
		popHeaderTableText += "<input type=\"hidden\" id=\"popStts_" + popViewRowNum + "\" name=\"popStts\" value=\"I\"><input type=\"hidden\" id=\"popContsSn_" + popViewRowNum + "\" name=\"popContsSn\" value=\"0\">";
		popHeaderTableText += "<input type=\"text\" id=\"popSiteNm_" + popViewRowNum + "\" name=\"popSiteNm\" value=\"\"/></div></td>";
		popHeaderTableText += "<th>사이트URL</th><td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSiteUrlAddr_" + popViewRowNum + "\" name=\"popSiteUrlAddr\" value=\"\"/></div></td>";
		popHeaderTableText += "<td><button type=\"button\" class=\"btns size-xsmall color-red\" id=\"btnPopDeleteCltContsInfoRow_" + popViewRowNum + "\" name=\"btnPopDeleteCltContsInfoRow\" onclick=\"javascript:moveDeleteCltContsInfo(\'" + popViewRowNum + "\'); return false;\">삭제</button></td>";
		popHeaderTableText += "</tr></tbody>";
		popHeaderTableText += "</table>";
		//데이터테이블
		popBodyTableText = "";
		popBodyTableText += "<table class=\"mt0\"><caption></caption><colgroup><col width=\"150px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"110px\"></col><col width=\"150px\"></col><col width=\"110px;\"></col><col width=\"110px;\"></col><col width=\"110px;\"></col></colgroup>";
		popBodyTableText += "<tbody>";
		popBodyTableText += "<tr><th rowspan=\"2\">정보(DB)/콘텐츠명<button class='btn-tooltip'	data-tooltip='<b>정보(DB)/콘텐츠명 :</b>해당 사이트에서 서비스 단위(또는 메뉴 단위)를 기준으로 보유하고 있는 문화정보/콘텐츠의 명칭으로<br>2개 이상 보유하고 있는 경우 복수의 문화정보/콘텐츠 명칭 각각 기입(작성 예시 1, 2 참조)'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">구축단계<button class='btn-tooltip' data-tooltip='<b>구축단계 :</b><br>① 구축대상 : 앞으로 시스템 내 정보(DB)/디지털콘텐츠로 구축해야 할 대상 건수(있는 경우에 만 해당) 예) 아날로그 형태 자원인 LP판이 있으면 건수 기입<br>② 구축완료 : 해당 시스템 내 정보(DB)/디지털콘텐츠로 구축이 완료된 건수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스 : 구축완료 건수 중 현재 사이트를 통해 서비스되고 있는 건수'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">건수<button class='btn-tooltip' data-tooltip='<b>건수 :</b>정보의 구별(식별)단위에 대한 건수를 기재'>?</button></th>";
		popBodyTableText += "<th colspan=\"7\">구성요소별<button class='btn-tooltip' data-tooltip='<b>구성요소별 :</b>정보를 구성하고 있는 요소로 텍스트, 이미지, 동영상, 사운드, XR데이터와 그 외 기타 등이 있는 경우에 해당 각각의 건수를 표기'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">저작권보유주체<button class='btn-tooltip' data-tooltip='<b>저작권보유주체 :</b>①기관 자체 보유, ②일부 자체 보유, ③정보제작자 보유, ④보유 여부 미상, ⑤저작권 없음 중 관련 번호 입력(중복가능)'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">공개제한범위<button class='btn-tooltip' data-tooltip='<b>공개제한범위 :</b>보유한 정보에 대한 공개 가능정도로써 ①공개제한없음, ②기관내 사이트에서만 대국민 공개, ③내부직원 또는 특정인에게만 공개, ④공개 불가'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">대국민서비스여부<button class='btn-tooltip' data-tooltip='<b>대국민서비스여부 :</b>①서비스 중, ②일부 서비스 중, ③서비스 안함'>?</button></th>";
		popBodyTableText += "<th rowspan=\"2\">공개방법<button class='btn-tooltip' data-tooltip='<b>공개방법 :</b>홈페이지 보편적 서비스 외에 대국민 정보공유 및 타기관<br>공유･연계 ①Open API,②REST,③RSS,④한국문화정보센터Agent연계 등'>?</button></th>";
		popBodyTableText += "</tr>";
		popBodyTableText += "<tr><th>텍스트</th><th>이미지</th>	<th>동영상</th><th>사운드</th>";
		popBodyTableText += "<th>XR 데이터<button class='btn-tooltip' data-tooltip='<b>XR 데이터 :</b>3D데이터(STL, PLY, OBJ, FBX, STEP, IGES 확장자), AR, VR, 홀로그램, XR(혼합콘텐츠), 실감형 콘텐츠, 360&#176; 입체형 콘텐츠 등 4차산업 신기술 콘텐츠'>?</button></th>";
		popBodyTableText += "<th>기타</th><th>소계</th></tr>";
		popBodyTableText += "<tr><td rowspan=\"4\"><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popContsInfoNm_" + popViewRowNum + "\" name=\"popContsInfoNm\" value=\"\"/></div></td>";
		popBodyTableText += "<td>구축대상</td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtSumNocs_" + popViewRowNum + "\" name=\"popCnstTrgtSumNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtLtrsNocs_" + popViewRowNum + "\" name=\"popCnstTrgtLtrsNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtImgNocs_" + popViewRowNum + "\" name=\"popCnstTrgtImgNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtVdoNocs_" + popViewRowNum + "\" name=\"popCnstTrgtVdoNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtSndNocs_" + popViewRowNum + "\" name=\"popCnstTrgtSndNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtXrNocs_" + popViewRowNum + "\" name=\"popCnstTrgtXrNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtEtcNocs_" + popViewRowNum + "\" name=\"popCnstTrgtEtcNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstTrgtSbtotNocs_" + popViewRowNum + "\" name=\"popCnstTrgtSbtotNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td rowspan=\"4\" class=\"tl pl10\">";
		popBodyTableText += "<input type=\"hidden\" id=\"popCpyrInstKeepYn_" + popViewRowNum + "\" name=\"popCpyrInstKeepYn\" value=\"N\">";
		popBodyTableText += "<input type=\"hidden\" id=\"popCpyrSctnKeepYn_" + popViewRowNum + "\" name=\"popCpyrSctnKeepYn\" value=\"N\">";
		popBodyTableText += "<input type=\"hidden\" id=\"popCpyrMakrKeepYn_" + popViewRowNum + "\" name=\"popCpyrMakrKeepYn\" value=\"N\">";
		popBodyTableText += "<input type=\"hidden\" id=\"popCpyrKeepUnwnYn_" + popViewRowNum + "\" name=\"popCpyrKeepUnwnYn\" value=\"N\">";
		popBodyTableText += "<input type=\"hidden\" id=\"popCpyrEnncYn_" + popViewRowNum + "\" name=\"popCpyrEnncYn\" value=\"N\">";
		popBodyTableText += "<div class=\"fm-check fm-list\">";
		popBodyTableText += "<span class=\"fm-ele\"><input type=\"checkbox\" id=\"popViewCpyrInstKeepYn_" + popViewRowNum + "\" name=\"popViewCpyrInstKeepYn\" value=\"Y\" onclick=\"javascript:setChangeCpyrInstKeepYn(\'" + popViewRowNum + "\');\"/><label for=\"popViewCpyrInstKeepYn_" + popViewRowNum + "\">기관 자체 보유</label></span>";
		popBodyTableText += "<span class=\"fm-ele\"><input type=\"checkbox\" id=\"popViewCpyrSctnKeepYn_" + popViewRowNum + "\" name=\"popViewCpyrSctnKeepYn\" value=\"Y\" onclick=\"javascript:setChangeCpyrSctnKeepYn(\'" + popViewRowNum + "\');\" /><label for=\"popViewCpyrSctnKeepYn_" + popViewRowNum + "\">일부 자체 보유</label></span>";
		popBodyTableText += "<span class=\"fm-ele\"><input type=\"checkbox\" id=\"popViewCpyrMakrKeepYn_" + popViewRowNum + "\" name=\"popViewCpyrMakrKeepYn\" value=\"Y\" onclick=\"javascript:setChangeCpyrMakrKeepYn(\'" + popViewRowNum + "\');\" /><label for=\"popViewCpyrMakrKeepYn_" + popViewRowNum + "\">정보제작자 보유</label></span>";
		popBodyTableText += "<span class=\"fm-ele\"><input type=\"checkbox\" id=\"popViewCpyrKeepUnwnYn_" + popViewRowNum + "\" name=\"popViewCpyrKeepUnwnYn\" value=\"Y\" onclick=\"javascript:setChangeCpyrKeepUnwnYn(\'" + popViewRowNum + "\');\" /><label for=\"popViewCpyrKeepUnwnYn_" + popViewRowNum + "\">보유 여부 미상</label></span>";
		popBodyTableText += "<span class=\"fm-ele\"><input type=\"checkbox\" id=\"popViewCpyrEnncYn_" + popViewRowNum + "\" name=\"popViewCpyrEnncYn\" value=\"Y\" onclick=\"javascript:setChangeCpyrEnncYn(\'" + popViewRowNum + "\');\" /><label for=\"popViewCpyrEnncYn_" + popViewRowNum + "\">저작권 없음</label></span>";
		popBodyTableText += "</div>";
		popBodyTableText += "</td>";
		popBodyTableText += "<td rowspan=\"4\"><div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popRlsLmtScpCd_" + popViewRowNum + "\" name=\"popRlsLmtScpCd\"><option value=\"\">선택</option>" + popRlsLmtScpCdData + "</select></div>	</td>";
		popBodyTableText += "<td rowspan=\"4\"><div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popMrfnTrgtSrvcCd_" + popViewRowNum + "\" name=\"popMrfnTrgtSrvcCd\"><option value=\"\">선택</option>" + popMrfnTrgtCdData + "</select></div></td>";
		popBodyTableText += "<td rowspan=\"4\"><div class=\"fm-focus fm-select\" data-size=\"100p\"><select id=\"popRlsMthdCd_" + popViewRowNum + "\" name=\"popRlsMthdCd\"><option value=\"\">선택</option>" + popRlsMthdCdData + "</select></div></td></tr>";
		popBodyTableText += "<tr><td>구축완료</td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnNocs_" + popViewRowNum + "\" name=\"popCnstCmptnNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnLtrsNocs_" + popViewRowNum + "\" name=\"popCnstCmptnLtrsNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnImgNocs_" + popViewRowNum + "\" name=\"popCnstCmptnImgNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnVdoNocs_" + popViewRowNum + "\" name=\"popCnstCmptnVdoNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnSndNocs_" + popViewRowNum + "\" name=\"popCnstCmptnSndNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnXrNocs_" + popViewRowNum + "\" name=\"popCnstCmptnXrNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnEtcNocs_" + popViewRowNum + "\" name=\"popCnstCmptnEtcNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstCmptnSbtotNocs_" + popViewRowNum + "\" name=\"popCnstCmptnSbtotNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td></tr>";
		popBodyTableText += "<tr><td>서비스</td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcNocs_" + popViewRowNum + "\" name=\"popSrvcNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcLtrsCnt_" + popViewRowNum + "\" name=\"popSrvcLtrsCnt\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcImgCnt_" + popViewRowNum + "\" name=\"popSrvcImgCnt\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcVdoCnt_" + popViewRowNum + "\" name=\"popSrvcVdoCnt\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcSndCnt_" + popViewRowNum + "\" name=\"popSrvcSndCnt\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcXrNocs_" + popViewRowNum + "\" name=\"popSrvcXrNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcEtcNocs_" + popViewRowNum + "\" name=\"popSrvcEtcNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event); setPopSumContCountSrvc(\'" + popViewRowNum + "\'); setPopSumContCountTgrt(\'" + popViewRowNum + "\');\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\"/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popSrvcSumCnt_" + popViewRowNum + "\" name=\"popSrvcSumCnt\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td></tr>";
		popBodyTableText += "<tr><td>합계</td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumNocs_" + popViewRowNum + "\" name=\"popCnstSumNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumLtrsNocs_" + popViewRowNum + "\" name=\"popCnstSumLtrsNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumImgNocs_" + popViewRowNum + "\" name=\"popCnstSumImgNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumVdoNocs_" + popViewRowNum + "\" name=\"popCnstSumVdoNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumSndNocs_" + popViewRowNum + "\" name=\"popCnstSumSndNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumXrNocs_" + popViewRowNum + "\" name=\"popCnstSumXrNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumEtcNocs_" + popViewRowNum + "\" name=\"popCnstSumEtcNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td>";
		popBodyTableText += "<td><div class=\"fm-ele\" data-size=\"100p\"><input type=\"text\" id=\"popCnstSumSbtotNocs_" + popViewRowNum + "\" name=\"popCnstSumSbtotNocs\" value=\"\" class=\"tr pr10\" onkeypress=\"cms_input_only_number()\" onblur=\"cms_input_only_remove_char(event)\" onkeydown=\"cms_input_only_number_check(event)\" onkeyup=\"cms_input_only_remove_char(event)\" style=\"ime-mode:disabled;\" readonly/></div></td></tr>";
		popBodyTableText += "</tbody>";
		popBodyTableText += "</table>";
		
		popNewCell0.style.paddingTop = "0px";
		popNewCell0.innerHTML = "" + popHeaderTableText + "" + popBodyTableText;
		
	}
	
</script>