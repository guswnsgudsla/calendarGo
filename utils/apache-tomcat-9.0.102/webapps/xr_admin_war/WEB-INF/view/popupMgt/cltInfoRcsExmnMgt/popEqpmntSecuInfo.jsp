<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>5.인프라 현황 - 4)정보보안장비 및 보안서비스 현황</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	
	<c:if test="${!empty oldPopRcsExmnEqpmntSecuInfo.frstRgtrId}">
	<div class="table-wrap write row-two-table">
		<h2>[이전 환경 조사]</h2>
		<div class="div-scroll">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="150px"></col>
					<col width="250px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="5">정보보안 장비 유무</th>
						<th>네트워크 보안</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd1 == 'NTWKSECU01'}">웹 방화벽<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd2 == 'NTWKSECU02'}">네트워크(시스템) 방화벽<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd3 == 'NTWKSECU03'}">침입방지시스템(IPS)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd4 == 'NTWKSECU04'}">DDoS 차단 시스템<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd5 == 'NTWKSECU05'}">통합보안시스템(UTM)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd6 == 'NTWKSECU06'}">가상사설망(VPN)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd7 == 'NTWKSECU07'}">네트워크접근제어(NAC)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd8 == 'NTWKSECU08'}">무선 네크워크 보안<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd9 == 'NTWKSECU09'}">모바일 보안</c:if>
						</td>
					</tr>
					<tr>
						<th>사용자 PC보안</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd1 == 'USRPCSEC01'}">PC 방화벽<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd2 == 'USRPCSEC02'}">Virus 백신<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd3 == 'USRPCSEC03'}">Anti 스파이웨어<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd4 == 'USRPCSEC04'}">Anti 피싱<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd5 == 'USRPCSEC05'}">스팸차단 S/W<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd6 == 'USRPCSEC06'}">보안운영체제<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd7 == 'USRPCSEC07'}">PC보안<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd8 == 'USRPCSEC08'}">보안 USB<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd9 == 'USRPCSEC09'}">디지털저작권관리(DRM)</c:if>
						</td>
					</tr>
					<tr>
						<th>서버 보안</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd1 == 'SRVRSECU01'}">DB보안(접근통제)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd2 == 'SRVRSECU02'}">DB암호</c:if>
						</td>
					</tr>
					<tr>
						<th>보안관리</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd1 == 'SECUMGT001'}">패치관리시스템(PMS)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd2 == 'SECUMGT002'}">자산관리시스템(RMS)</c:if>
						</td>
					</tr>
					<tr>
						<th>기타장비</th>
						<td>${oldPopRcsExmnEqpmntSecuInfo.etcSecuEqpmntCn}</td>
					</tr>
					<tr>
						<th rowspan="4">정보보안서비스 유무</th>
						<th>보안컨설팅</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd1 == 'SECUCSLT01'}">인증(ISO, G-ISMS)<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd2 == 'SECUCSLT02'}">안전진단/기반보호<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd3 == 'SECUCSLT03'}">진단 및 모의해킹<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd4 == 'SECUCSLT04'}">개인정보보호컨설팅<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd5 == 'SECUCSLT05'}">종합보안컨설팅<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd6 == 'SECUCSLT06'}">내부정보유출방지컨설팅<br/></c:if>
						</td>
					</tr>
					<tr>
						<th>보안관제유무</th>
						<td>${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcEnncYnNm}</td>
					</tr>
					<tr>
						<th>보안관제 서비스기관</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstTypeCd == 'SECSRVC001'}">한국문화정보센터</c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstTypeCd == 'SECSRVC002'}">사설업체(${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstNm})</c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstTypeCd == 'SECSRVC003'}">기타(${oldPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstNm})</c:if>
						</td>
					</tr>
					<tr>
						<th>보안 교육훈련</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuEduTrngCd1 == 'SECEDU0001'}">자체 교육 실시<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuEduTrngCd2 == 'SECEDU0002'}">외부 강의(교육) 실시</c:if>
						</td>
					</tr>
					<tr>
						<th rowspan="2">관심도 및 보안진단</th>
						<th>정보보호 이슈</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd1 == 'INFRMIS001'}">내부 중요정보에 대한 관리 및 유출 대착수립이 어려움<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd2 == 'INFRMIS002'}">개인정보보호법 시행에 따른 대책 수립의 어려움<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd3 == 'INFRMIS003'}">임직원들의 보안의식 강화의 어려움<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd4 == 'INFRMIS004'}">정보보호솔루션의 노후화<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd5 == 'INFRMIS005'}">모바일 디바이스 및 무선사용 증가로 인한 무선보안관리의 어려움<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd6 == 'INFRMIS006'}">보보호솔루션의 마스터플랜 수립의 어려움<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.infscrIsCd7 == 'INFRMIS007'}">이슈없음</c:if>
						</td>
					</tr>
					<tr>
						<th>보안 진단</th>
						<td>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd1 == 'SECUFIX001'}">서버진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd2 == 'SECUFIX002'}">보안솔루션진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd3 == 'SECUFIX003'}">네트워크장비진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd4 == 'SECUFIX004'}">웹어플리케이션 취약점진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd5 == 'SECUFIX005'}">모의침투 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd6 == 'SECUFIX006'}">어플리케이션 소스코드 진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd7 == 'SECUFIX007'}">무선진단 후 관련 정보보호 솔루션 대책 수립<br/></c:if>
							<c:if test="${oldPopRcsExmnEqpmntSecuInfo.secuInspCd8 == 'SECUFIX008'}">보안취약점진단 후 관련 정보보호 솔루션 대책 수립</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap">
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<h2>[환경조사]</h2>
		<div class="div-scroll pt0">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="150px"></col>
					<col width="250px"></col>
					<col width="*"></col>
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="5">정보보안 장비 유무</th>
						<th>네트워크 보안
							<button class="btn-tooltip"
							data-tooltip="
							<b>네트워크 보안 :</b>①웹 방화벽 ②네트워크(시스템) 방화벽 ③침입방지시스템(IPS) ④DDoS 차단 시스템 ⑤통합보안시스템(UTM) ⑥가상사설망(VPN)  ⑦네트워크접근제어(NAC) ⑧무선 네크워크 보안 ⑨모바일 보안을 명시
							">?</button>
						</th>
						<td class="tl pl10" style="text-align:left;">
							<input type="hidden" id="popNtwkSecuEqpmntCd1" name="popNtwkSecuEqpmntCd1" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd1}">
							<input type="hidden" id="popNtwkSecuEqpmntCd2" name="popNtwkSecuEqpmntCd2" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd2}">
							<input type="hidden" id="popNtwkSecuEqpmntCd3" name="popNtwkSecuEqpmntCd3" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd3}">
							<input type="hidden" id="popNtwkSecuEqpmntCd4" name="popNtwkSecuEqpmntCd4" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd4}">
							<input type="hidden" id="popNtwkSecuEqpmntCd5" name="popNtwkSecuEqpmntCd5" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd5}">
							<input type="hidden" id="popNtwkSecuEqpmntCd6" name="popNtwkSecuEqpmntCd6" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd6}">
							<input type="hidden" id="popNtwkSecuEqpmntCd7" name="popNtwkSecuEqpmntCd7" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd7}">
							<input type="hidden" id="popNtwkSecuEqpmntCd8" name="popNtwkSecuEqpmntCd8" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd8}">
							<input type="hidden" id="popNtwkSecuEqpmntCd9" name="popNtwkSecuEqpmntCd9" value="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd9}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_1" name="popNtwkSecuEqpmntCd" value="NTWKSECU01" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd1 == 'NTWKSECU01'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('1', 'NTWKSECU01');"/>
									<label for="popNtwkSecuEqpmntCd_1">웹 방화벽</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_2" name="popNtwkSecuEqpmntCd" value="NTWKSECU02" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd2 == 'NTWKSECU02'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('2', 'NTWKSECU02');"/>
									<label for="popNtwkSecuEqpmntCd_2">네트워크(시스템) 방화벽</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_3" name="popNtwkSecuEqpmntCd" value="NTWKSECU03" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd3 == 'NTWKSECU03'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('3', 'NTWKSECU03');"/>
									<label for="popNtwkSecuEqpmntCd_3">침입방지시스템(IPS)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_4" name="popNtwkSecuEqpmntCd" value="NTWKSECU04" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd4 == 'NTWKSECU04'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('4', 'NTWKSECU04');"/>
									<label for="popNtwkSecuEqpmntCd_4">DDoS 차단 시스템</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_5" name="popNtwkSecuEqpmntCd" value="NTWKSECU05" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd5 == 'NTWKSECU05'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('5', 'NTWKSECU05');"/>
									<label for="popNtwkSecuEqpmntCd_5">통합보안시스템(UTM)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_6" name="popNtwkSecuEqpmntCd" value="NTWKSECU06" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd6 == 'NTWKSECU06'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('6', 'NTWKSECU06');"/>
									<label for="popNtwkSecuEqpmntCd_6">가상사설망(VPN)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_7" name="popNtwkSecuEqpmntCd" value="NTWKSECU07" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd7 == 'NTWKSECU07'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('7', 'NTWKSECU07');"/>
									<label for="popNtwkSecuEqpmntCd_7">네트워크접근제어(NAC)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_8" name="popNtwkSecuEqpmntCd" value="NTWKSECU08" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd8 == 'NTWKSECU08'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('8', 'NTWKSECU08');"/>
									<label for="popNtwkSecuEqpmntCd_8">무선 네크워크 보안</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popNtwkSecuEqpmntCd_9" name="popNtwkSecuEqpmntCd" value="NTWKSECU09" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.ntwkSecuEqpmntCd9 == 'NTWKSECU09'}">checked</c:if> onclick="javascript:moveCheckNtwkSecuEqpmnt('9', 'NTWKSECU09');"/>
									<label for="popNtwkSecuEqpmntCd_9">모바일 보안</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>사용자 PC보안
							<button class="btn-tooltip"
							data-tooltip="
							<b>사용자 PC보안 :</b><br>① PC 방화벽<br>②Virus 백신<br> ③Anti 스파이웨어 <br>④Anti 피싱<br> ⑤스팸차단 S/W <br>⑥보안운영체제<br> ⑦PC보안<br> ⑧보안 USB <br>⑨디지털저작권관리(DRM)
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popCompSecuEqpmntCd1" name="popCompSecuEqpmntCd1" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd1}">
							<input type="hidden" id="popCompSecuEqpmntCd2" name="popCompSecuEqpmntCd2" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd2}">
							<input type="hidden" id="popCompSecuEqpmntCd3" name="popCompSecuEqpmntCd3" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd3}">
							<input type="hidden" id="popCompSecuEqpmntCd4" name="popCompSecuEqpmntCd4" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd4}">
							<input type="hidden" id="popCompSecuEqpmntCd5" name="popCompSecuEqpmntCd5" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd5}">
							<input type="hidden" id="popCompSecuEqpmntCd6" name="popCompSecuEqpmntCd6" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd6}">
							<input type="hidden" id="popCompSecuEqpmntCd7" name="popCompSecuEqpmntCd7" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd7}">
							<input type="hidden" id="popCompSecuEqpmntCd8" name="popCompSecuEqpmntCd8" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd8}">
							<input type="hidden" id="popCompSecuEqpmntCd9" name="popCompSecuEqpmntCd9" value="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd9}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_1" name="popCompSecuEqpmntCd" value="USRPCSEC01" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd1 == 'USRPCSEC01'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('1', 'USRPCSEC01');"/>
									<label for="popCompSecuEqpmntCd_1">PC 방화벽</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_2" name="popCompSecuEqpmntCd" value="USRPCSEC02" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd2 == 'USRPCSEC02'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('2', 'USRPCSEC02');"/>
									<label for="popCompSecuEqpmntCd_2">Virus 백신</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_3" name="popCompSecuEqpmntCd" value="USRPCSEC03" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd3 == 'USRPCSEC03'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('3', 'USRPCSEC03');"/>
									<label for="popCompSecuEqpmntCd_3">Anti 스파이웨어</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_4" name="popCompSecuEqpmntCd" value="USRPCSEC04" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd4 == 'USRPCSEC04'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('4', 'USRPCSEC04');"/>
									<label for="popCompSecuEqpmntCd_4">Anti 피싱</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_5" name="popCompSecuEqpmntCd" value="USRPCSEC05" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd5 == 'USRPCSEC05'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('5', 'USRPCSEC05');"/>
									<label for="popCompSecuEqpmntCd_5">스팸차단 S/W</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_6" name="popCompSecuEqpmntCd" value="USRPCSEC06" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd6 == 'USRPCSEC06'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('6', 'USRPCSEC06');"/>
									<label for="popCompSecuEqpmntCd_6">보안운영체제</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_7" name="popCompSecuEqpmntCd" value="USRPCSEC07" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd7 == 'USRPCSEC07'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('7', 'USRPCSEC07');"/>
									<label for="popCompSecuEqpmntCd_7">PC보안</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_8" name="popCompSecuEqpmntCd" value="USRPCSEC08" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd8 == 'USRPCSEC08'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('8', 'USRPCSEC08');"/>
									<label for="popCompSecuEqpmntCd_8">보안 USB</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popCompSecuEqpmntCd_9" name="popCompSecuEqpmntCd" value="USRPCSEC09" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.compSecuEqpmntCd9 == 'USRPCSEC09'}">checked</c:if> onclick="javascript:moveCheckCompSecuEqpmnt('9', 'USRPCSEC09');"/>
									<label for="popCompSecuEqpmntCd_9">디지털저작권관리(DRM)</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>서버 보안
							<button class="btn-tooltip"
							data-tooltip="
							<b>서버 보안 :</b>①DB보안(접근통제) <br>②DB암호
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popSrvrSecuEqpmntCd1" name="popSrvrSecuEqpmntCd1" value="${nowPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd1}">
							<input type="hidden" id="popSrvrSecuEqpmntCd2" name="popSrvrSecuEqpmntCd2" value="${nowPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd2}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popSrvrSecuEqpmntCd_1" name="popSrvrSecuEqpmntCd" value="SRVRSECU01" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd1 == 'SRVRSECU01'}">checked</c:if> onclick="javascript:moveCheckSrvrSecuEqpmnt('1', 'SRVRSECU01');"/>
									<label for="popSrvrSecuEqpmntCd_1">DB보안(접근통제)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSrvrSecuEqpmntCd_2" name="popSrvrSecuEqpmntCd" value="SRVRSECU02" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.srvrSecuEqpmntCd2 == 'SRVRSECU02'}">checked</c:if> onclick="javascript:moveCheckSrvrSecuEqpmnt('2', 'SRVRSECU02');"/>
									<label for="popSrvrSecuEqpmntCd_2">DB암호</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>보안관리
							<button class="btn-tooltip"
							data-tooltip="
							<b>보안관리 :</b>①패치관리시스템(PMS)<br> ②자산관리시스템(RMS)
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popSecuMngEqpmntCd1" name="popSecuMngEqpmntCd1" value="${nowPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd1}">
							<input type="hidden" id="popSecuMngEqpmntCd2" name="popSecuMngEqpmntCd2" value="${nowPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd2}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popSecuMngEqpmntCd_1" name="popSecuMngEqpmntCd" value="SECUMGT001" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd1 == 'SECUMGT001'}">checked</c:if> onclick="javascript:moveCheckSecuMngEqpmnt('1', 'SECUMGT001');"/>
									<label for="popSecuMngEqpmntCd_1">패치관리시스템(PMS)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuMngEqpmntCd_2" name="popSecuMngEqpmntCd" value="SECUMGT002" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngEqpmntCd2 == 'SECUMGT002'}">checked</c:if> onclick="javascript:moveCheckSecuMngEqpmnt('2', 'SECUMGT002');"/>
									<label for="popSecuMngEqpmntCd_2">자산관리시스템(RMS)</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>기타장비</th>
						<td style="text-align:left;">
							<div class="fm-ele" data-size="w700">
								<input type="text" id="popEtcSecuEqpmntCn" name="popEtcSecuEqpmntCn" value="${nowPopRcsExmnEqpmntSecuInfo.etcSecuEqpmntCn}"/>
							</div>
						</td>
					</tr>
					<tr>
						<th rowspan="4">정보보안서비스 유무</th>
						<th>보안컨설팅
							<button class="btn-tooltip"
							data-tooltip="
							<b>보안컨설팅 :</b><br>①인증(ISO, G-ISMS)<br> ②안전진단/기반보호 <br>③진단 및 모의해킹 <br>④개인정보보호컨설팅<br> ⑤종합보안컨설팅<br> ⑥내부정보유출방지컨설팅
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popSecuDscsnSrvcCd1" name="popSecuDscsnSrvcCd1" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd1}">
							<input type="hidden" id="popSecuDscsnSrvcCd2" name="popSecuDscsnSrvcCd2" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd2}">
							<input type="hidden" id="popSecuDscsnSrvcCd3" name="popSecuDscsnSrvcCd3" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd3}">
							<input type="hidden" id="popSecuDscsnSrvcCd4" name="popSecuDscsnSrvcCd4" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd4}">
							<input type="hidden" id="popSecuDscsnSrvcCd5" name="popSecuDscsnSrvcCd5" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd5}">
							<input type="hidden" id="popSecuDscsnSrvcCd6" name="popSecuDscsnSrvcCd6" value="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd6}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_1" name="popSecuDscsnSrvcCd" value="SECUCSLT01" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd1 == 'SECUCSLT01'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('1', 'SECUCSLT01');"/>
									<label for="popSecuDscsnSrvcCd_1">인증(ISO, G-ISMS)</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_2" name="popSecuDscsnSrvcCd" value="SECUCSLT02" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd2 == 'SECUCSLT02'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('2', 'SECUCSLT02');"/>
									<label for="popSecuDscsnSrvcCd_2">안전진단/기반보호</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_3" name="popSecuDscsnSrvcCd" value="SECUCSLT03" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd3 == 'SECUCSLT03'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('3', 'SECUCSLT03');"/>
									<label for="popSecuDscsnSrvcCd_3">진단 및 모의해킹</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_4" name="popSecuDscsnSrvcCd" value="SECUCSLT04" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd4 == 'SECUCSLT04'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('4', 'SECUCSLT04');"/>
									<label for="popSecuDscsnSrvcCd_4">개인정보보호컨설팅</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_5" name="popSecuDscsnSrvcCd" value="SECUCSLT05" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd5 == 'SECUCSLT05'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('5', 'SECUCSLT05');"/>
									<label for="popSecuDscsnSrvcCd_5">종합보안컨설팅</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuDscsnSrvcCd_6" name="popSecuDscsnSrvcCd" value="SECUCSLT06" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuDscsnSrvcCd6 == 'SECUCSLT06'}">checked</c:if> onclick="javascript:moveCheckSecuDscsnSrvcEqpmnt('6', 'SECUCSLT06');"/>
									<label for="popSecuDscsnSrvcCd_6">내부정보유출방지컨설팅</label>
								</span>
								
							</div>
						</td>
					</tr>
					<tr>
						<th>보안관제유무</th>
						<td style="text-align:left;">
							<div class="fm-select fm-focus">
								<select id="popSecuMngSrvcEnncYn" name="popSecuMngSrvcEnncYn" title="보안관제유무를 선택해 주십시오.">
									<option value="Y" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngSrvcEnncYn == 'Y'}">selected</c:if >>O</option>
									<option value="N" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngSrvcEnncYn == 'N'}">selected</c:if >>X</option>
								</select>
							</div>
							
						</td>
					</tr>
					<tr>
						<th>보안관제 서비스기관
							<button class="btn-tooltip"
							data-tooltip="
							<b>보안관제 서비스기관 :</b> <br> ①한국문화정보센터<br> ②사설업체(업체명)<br> ③기타(   )
							">?</button>
						</th>
						<td style="text-align:left;">
							<div class="fm-select fm-focus">
								<select id="popSecuMngSrvcInstTypeCd" name="popSecuMngSrvcInstTypeCd" title="보안관제서비스기관을 선택해 주십시오." onchange="javascript:moveSelectChangeInstTypeCd(); return false;">
				<c:if test="${!empty secuSrvcCmmnCdList}">
					<c:forEach var="secuSrvrCdData" items="${secuSrvcCmmnCdList}">
							<option value="${secuSrvrCdData.cdId}" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstTypeCd == secuSrvrCdData.cdId}">selected</c:if>>${secuSrvrCdData.cdNm}</option>
					</c:forEach>
				</c:if>
								</select>
							</div>
							<div class="fm-ele" data-size="w500">
								<input type="text" id="popSecuMngSrvcInstNm" name="popSecuMngSrvcInstNm" value="${nowPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstNm}" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuMngSrvcInstTypeCd == 'SECSRVC001'}">readonly</c:if>>
							</div>
						</td>
					</tr>
					<tr>
						<th>보안 교육훈련
							<button class="btn-tooltip"
							data-tooltip="
							<b>보안 교육훈련 :</b><br>①자체 교육 실시 <br>②외부 강의(교육) 실시
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popSecuEduTrngCd1" name="popSecuEduTrngCd1" value="${nowPopRcsExmnEqpmntSecuInfo.secuEduTrngCd1}">
							<input type="hidden" id="popSecuEduTrngCd2" name="popSecuEduTrngCd2" value="${nowPopRcsExmnEqpmntSecuInfo.secuEduTrngCd2}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popSecuEduTrngCd_1" name="popSecuEduTrngCd" value="SECEDU0001" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuEduTrngCd1 == 'SECEDU0001'}">checked</c:if> onclick="javascript:moveCheckSecuEduTrng('1', 'SECEDU0001');"/>
									<label for="popSecuEduTrngCd_1">자체 교육 실시</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuEduTrngCd_2" name="popSecuEduTrngCd" value="SECEDU0002" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuEduTrngCd2 == 'SECEDU0002'}">checked</c:if> onclick="javascript:moveCheckSecuEduTrng('2', 'SECEDU0002');"/>
									<label for="popSecuEduTrngCd_2">외부 강의(교육) 실시</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th rowspan="2">관심도 및 보안진단</th>
						<th>정보보호 이슈
							<button class="btn-tooltip"
							data-tooltip="
							<b>정보보호 이슈 :</b> <br>①내부 중요정보에 대한 관리 및 유출 대착수립이 어려움 <br>②개인정보보호법 시행에 따른 대책 수립의 어려움<br> ③임직원들의 보안의식 강화의 어려움 <br> ④정보보호솔루션의 노후화<br> ⑤모바일 디바이스 및 무선사용 증가로 인한 무선보안관리의 어려움 <br>⑥정보보호솔루션의 마스터플랜 수립의 어려움 <br> ⑦이슈없음
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popInfscrIsCd1" name="popInfscrIsCd1" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd1}">
							<input type="hidden" id="popInfscrIsCd2" name="popInfscrIsCd2" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd2}">
							<input type="hidden" id="popInfscrIsCd3" name="popInfscrIsCd3" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd3}">
							<input type="hidden" id="popInfscrIsCd4" name="popInfscrIsCd4" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd4}">
							<input type="hidden" id="popInfscrIsCd5" name="popInfscrIsCd5" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd5}">
							<input type="hidden" id="popInfscrIsCd6" name="popInfscrIsCd6" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd6}">
							<input type="hidden" id="popInfscrIsCd7" name="popInfscrIsCd7" value="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd7}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_1" name="popInfscrIsCd" value="INFRMIS001" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd1 == 'INFRMIS001'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('1', 'INFRMIS001');"/>
									<label for="popInfscrIsCd_1">내부 중요정보에 대한 관리 및 유출 대착수립이 어려움</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_2" name="popInfscrIsCd" value="INFRMIS002" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd2 == 'INFRMIS002'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('2', 'INFRMIS002');"/>
									<label for="popInfscrIsCd_2">개인정보보호법 시행에 따른 대책 수립의 어려움</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_3" name="popInfscrIsCd" value="INFRMIS003" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd3 == 'INFRMIS003'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('3', 'INFRMIS003');"/>
									<label for="popInfscrIsCd_3">임직원들의 보안의식 강화의 어려움</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_4" name="popInfscrIsCd" value="INFRMIS004" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd4 == 'INFRMIS004'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('4', 'INFRMIS004');"/>
									<label for="popInfscrIsCd_4">정보보호솔루션의 노후화</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_5" name="popInfscrIsCd" value="INFRMIS005" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd5 == 'INFRMIS005'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('5', 'INFRMIS005');"/>
									<label for="popInfscrIsCd_5">모바일 디바이스 및 무선사용 증가로 인한 무선보안관리의 어려움</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_6" name="popInfscrIsCd" value="INFRMIS006" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd6 == 'INFRMIS006'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('6', 'INFRMIS006');"/>
									<label for="popInfscrIsCd_6">보보호솔루션의 마스터플랜 수립의 어려움</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popInfscrIsCd_7" name="popInfscrIsCd" value="INFRMIS007" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.infscrIsCd7 == 'INFRMIS007'}">checked</c:if> onclick="javascript:moveCheckInfscrIs('7', 'INFRMIS007');"/>
									<label for="popInfscrIsCd_7">이슈없음</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>보안 진단
							<button class="btn-tooltip"
							data-tooltip="
							<b>보안 진단 :</b>①서버진단<br> ②보안솔루션진단<br> ③네트워크장비진단 <br> ④웹어플리케이션 취약점진단 <br>⑤모의침투<br> ⑥어플리케이션 소스코드 진단<br> ⑦무선진단<br> ⑧보안취약점진단 후 관련 정보보호 솔루션 대책 수립
							">?</button>
						</th>
						<td style="text-align:left;">
							<input type="hidden" id="popSecuInspCd1" name="popSecuInspCd1" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd1}">
							<input type="hidden" id="popSecuInspCd2" name="popSecuInspCd2" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd2}">
							<input type="hidden" id="popSecuInspCd3" name="popSecuInspCd3" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd3}">
							<input type="hidden" id="popSecuInspCd4" name="popSecuInspCd4" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd4}">
							<input type="hidden" id="popSecuInspCd5" name="popSecuInspCd5" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd5}">
							<input type="hidden" id="popSecuInspCd6" name="popSecuInspCd6" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd6}">
							<input type="hidden" id="popSecuInspCd7" name="popSecuInspCd7" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd7}">
							<input type="hidden" id="popSecuInspCd8" name="popSecuInspCd8" value="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd8}">
							<div class="fm-check fm-list">
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_1" name="popSecuInspCd" value="SECUFIX001" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd1 == 'SECUFIX001'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('1', 'SECUFIX001');"/>
									<label for="popSecuInspCd_1">서버진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_2" name="popSecuInspCd" value="SECUFIX002" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd2 == 'SECUFIX002'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('2', 'SECUFIX002');"/>
									<label for="popSecuInspCd_2">보안솔루션진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_3" name="popSecuInspCd" value="SECUFIX003" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd3 == 'SECUFIX003'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('3', 'SECUFIX003');"/>
									<label for="popSecuInspCd_3">네트워크장비진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_4" name="popSecuInspCd" value="SECUFIX004" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd4 == 'SECUFIX004'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('4', 'SECUFIX004');"/>
									<label for="popSecuInspCd_4">웹어플리케이션 취약점진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_5" name="popSecuInspCd" value="SECUFIX005" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd5 == 'SECUFIX005'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('5', 'SECUFIX005');"/>
									<label for="popSecuInspCd_5">모의침투 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_6" name="popSecuInspCd" value="SECUFIX006" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd6 == 'SECUFIX006'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('6', 'SECUFIX006');"/>
									<label for="popSecuInspCd_6">어플리케이션 소스코드 진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_7" name="popSecuInspCd" value="SECUFIX007" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd7 == 'SECUFIX007'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('7', 'SECUFIX007');"/>
									<label for="popSecuInspCd_7">무선진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								<span class="fm-ele">
									<input type="checkbox" id="popSecuInspCd_8" name="popSecuInspCd" value="SECUFIX008" <c:if test="${nowPopRcsExmnEqpmntSecuInfo.secuInspCd8 == 'SECUFIX008'}">checked</c:if> onclick="javascript:moveCheckSecuInsp('8', 'SECUFIX008');"/>
									<label for="popSecuInspCd_8">보안취약점진단 후 관련 정보보호 솔루션 대책 수립</label>
								</span>
								
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn-wrap align-right">
	<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0002'}">
		<c:if test="${UserAuthrtInfo.mdfcnAuthrtYn eq 'Y' or UserAuthrtInfo.wrtAuthrtYn eq 'Y'}">
			<c:if test="${popSrchRcsExmnInfo.paramRcsexmnStartYn eq 'Y' and popSrchRcsExmnInfo.paramRcsexmnEndYn eq 'N'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSecuInfo" name="btnPopSaveRcsexmnEqpmentSecuInfo" onclick="javascript:moveSaveRcsexmnEqpmentSecuInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
		<button type="button" class="btns" id="btnPopSaveRcsexmnEqpmentSecuInfo" name="btnPopSaveRcsexmnEqpmentSecuInfo" onclick="javascript:moveSaveRcsexmnEqpmentSecuInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnEqpmentSecuInfo" name="btnPopCloseRcsexmnEqpmentSecuInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	function moveCheckNtwkSecuEqpmnt(paramDataNo, paramDataValue) {
		if ($("#popNtwkSecuEqpmntCd_" +paramDataNo).is(":checked") == true) {
			$("#popNtwkSecuEqpmntCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popNtwkSecuEqpmntCd" + paramDataNo).val("");
		}
	}
	
	function moveCheckCompSecuEqpmnt(paramDataNo, paramDataValue) {
		if ($("#popCompSecuEqpmntCd_" +paramDataNo).is(":checked") == true) {
			$("#popCompSecuEqpmntCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popCompSecuEqpmntCd" + paramDataNo).val("");
		}
	}
	
	function moveCheckSrvrSecuEqpmnt(paramDataNo, paramDataValue) {
		if ($("#popSrvrSecuEqpmntCd_" +paramDataNo).is(":checked") == true) {
			$("#popSrvrSecuEqpmntCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popSrvrSecuEqpmntCd" + paramDataNo).val("");
		}
	}
	
	function moveCheckSecuMngEqpmnt(paramDataNo, paramDataValue) {
		if ($("#popSecuMngEqpmntCd_" +paramDataNo).is(":checked") == true) {
			$("#popSecuMngEqpmntCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popSecuMngEqpmntCd" + paramDataNo).val("");
		}
	}
	
	function moveCheckSecuDscsnSrvcEqpmnt(paramDataNo, paramDataValue) {
		if ($("#popSecuDscsnSrvcCd_" +paramDataNo).is(":checked") == true) {
			$("#popSecuDscsnSrvcCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popSecuDscsnSrvcCd" + paramDataNo).val("");
		}
	}
	
	function moveSelectChangeInstTypeCd() {
		if ($("#popSecuMngSrvcInstTypeCd").val() == "SECSRVC001") {
			$("#popSecuMngSrvcInstNm").attr("readonly", true);
		} else {
			$("#popSecuMngSrvcInstNm").attr("readonly", false);
		}
	}
	
	function moveCheckSecuEduTrng(paramDataNo, paramDataValue) {
		if ($("#popSecuEduTrngCd_" +paramDataNo).is(":checked") == true) {
			$("#popSecuEduTrngCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popSecuEduTrngCd" + paramDataNo).val("");
		}
	}
	
	//
	function moveCheckInfscrIs(paramDataNo, paramDataValue) {
		if ($("#popInfscrIsCd_" +paramDataNo).is(":checked") == true) {
			$("#popInfscrIsCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popInfscrIsCd" + paramDataNo).val("");
		}
	}
	
	//보완점유형
	function moveCheckSecuInsp(paramDataNo, paramDataValue) {
		if ($("#popSecuInspCd_" +paramDataNo).is(":checked") == true) {
			$("#popSecuInspCd" + paramDataNo).val(paramDataValue);
		} else {
			$("#popSecuInspCd" + paramDataNo).val("");
		}
	}
</script>