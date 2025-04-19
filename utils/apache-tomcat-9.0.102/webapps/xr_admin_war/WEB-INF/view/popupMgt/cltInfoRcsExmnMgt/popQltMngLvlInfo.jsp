<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/css/popLayer.css'/>?ver=1.0">
<div class="pop-contants">
	<div class="title-wrap">
		<div class="title between">
			<h2>6.문화정보 자원 품질관리 수준 진단</h2>
			<button type="button" class="closeBtn btnClose" onclick="javascript:moveClosePopupList(); return false;">X</button>
		</div>
	</div>
	<c:if test="${!empty oldPopRcsExmnQltMngLvlInfo.rcsexmnId}">
	<div class="table-wrap row-two-table">
		<h2>[이전 환경 조사]</h2>
		<div class="div-scroll">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="100px"></col>
					<col width="200px"></col>
					<col width="300px"></col>
					<col width="400px"></col>
				</colgroup>
				<thead>
					<tr>
						<th>영역</th>
						<th>평가지표</th>
						<th>지표설명</th>
						<th>평가기준 레벨</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="4">계획</td>
						<td>문화정보 자원 품질정책 수립</td>
						<td class="tl">● 문화정보 자원 품질관리 규정(또는 지침)을 수립하여 관리한다.</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlcyEstbScr1" name="oldplanQltPlcyEstbScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlcyEstbScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlcyEstbScr2" name="oldplanQltPlcyEstbScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlcyEstbScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlcyEstbScr3" name="oldplanQltPlcyEstbScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlcyEstbScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlcyEstbScr4" name="oldplanQltPlcyEstbScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlcyEstbScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlcyEstbScr5" name="oldplanQltPlcyEstbScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlcyEstbScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질조직 구성</td>
						<td class="tl">● 문화정보 자원 품질관리 조직을 구성하고, 문화정보 자원 품질관리를 위한 의사소통활동을 수행한다 </td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldplanQltOgnzCpstScr1" name="oldplanQltOgnzCpstScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltOgnzCpstScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltOgnzCpstScr2" name="oldplanQltOgnzCpstScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltOgnzCpstScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltOgnzCpstScr3" name="oldplanQltOgnzCpstScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltOgnzCpstScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltOgnzCpstScr4" name="oldplanQltOgnzCpstScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltOgnzCpstScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltOgnzCpstScr5" name="oldplanQltOgnzCpstScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltOgnzCpstScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질계획 수립</td>
						<td class="tl"> ● 문화정보 자원 품질관리 계획을 수립한다</br>● 문화정보 자원 품질관리를 위한 예산을 확보하여 적절히 집행한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlanEstbScr1" name="oldplanQltPlanEstbScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlanEstbScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlanEstbScr2" name="oldplanQltPlanEstbScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlanEstbScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlanEstbScr3" name="oldplanQltPlanEstbScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlanEstbScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlanEstbScr4" name="oldplanQltPlanEstbScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlanEstbScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltPlanEstbScr5" name="oldplanQltPlanEstbScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltPlanEstbScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질관리 교육 및 지식공유</td>
						<td class="tl">● 문화정보 자원 품질관리 역량 강화를 위한 교육을 실시하고, 관련 지식, 사례 등을 공유한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldplanQltEduKnldSharScr1" name="oldplanQltEduKnldSharScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltEduKnldSharScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltEduKnldSharScr2" name="oldplanQltEduKnldSharScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltEduKnldSharScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltEduKnldSharScr3" name="oldplanQltEduKnldSharScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltEduKnldSharScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltEduKnldSharScr4" name="oldplanQltEduKnldSharScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltEduKnldSharScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldplanQltEduKnldSharScr5" name="oldplanQltEduKnldSharScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldplanQltEduKnldSharScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="6">구축</td>
						<td>문화정보 자원 표준 정의</td>
						<td class="tl">● 문화정보 자원 표준(코드, 도메인, 용어)를 정의한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdDfntScr1" name="oldcnstStdDfntScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdDfntScr2" name="oldcnstStdDfntScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdDfntScr3" name="oldcnstStdDfntScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdDfntScr4" name="oldcnstStdDfntScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdDfntScr5" name="oldcnstStdDfntScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 표준 점검 및 조치</td>
						<td class="tl">● 문화정보 자원 표준의 준수 상태를 점검하고 필요한 조치를 수행한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdChckActnScr1" name="oldcnstStdChckActnScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdChckActnScr2" name="oldcnstStdChckActnScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdChckActnScr3" name="oldcnstStdChckActnScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdChckActnScr4" name="oldcnstStdChckActnScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStdChckActnScr5" name="oldcnstStdChckActnScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStdChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 구조 정의</td>
						<td class="tl"> ● 문화정보 자원 구조를 정의하고 있다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrDfntScr1" name="oldcnstStrrDfntScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrDfntScr2" name="oldcnstStrrDfntScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrDfntScr3" name="oldcnstStrrDfntScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrDfntScr4" name="oldcnstStrrDfntScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrDfntScr5" name="oldcnstStrrDfntScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 구조 점검 및 조치</td>
						<td class="tl">● 문화정보 자원 구조의 현행화 및 완전성을 점검하고, 조치한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrChckActnScr1" name="oldcnstStrrChckActnScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrChckActnScr2" name="oldcnstStrrChckActnScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrChckActnScr3" name="oldcnstStrrChckActnScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrChckActnScr4" name="oldcnstStrrChckActnScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstStrrChckActnScr5" name="oldcnstStrrChckActnScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstStrrChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>연계 문화정보 자원 정의</td>
						<td class="tl">● 다른 DB와 주고받는 연계문화정보 자원을 정의한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsDfntScr1" name="oldcnstRcsDfntScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsDfntScr2" name="oldcnstRcsDfntScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsDfntScr3" name="oldcnstRcsDfntScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsDfntScr4" name="oldcnstRcsDfntScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsDfntScr5" name="oldcnstRcsDfntScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>연계 문화정보 자원 점검 및 조치</td>
						<td class="tl">● 연계문화정보 자원의 정합성을 점검하고 문제점을 조치한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsChckActnScr1" name="oldcnstRcsChckActnScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsChckActnScr2" name="oldcnstRcsChckActnScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsChckActnScr3" name="oldcnstRcsChckActnScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsChckActnScr4" name="oldcnstRcsChckActnScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnstRcsChckActnScr5" name="oldcnstRcsChckActnScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnstRcsChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					
					<tr>
						<td rowspan="3">운영</td>
						<td>업무규칙 정의</td>
						<td class="tl">● 문화정보 자원 품질진단을 위한 업무규칙을 정의한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldoperTaskRuleDfntScr1" name="oldoperTaskRuleDfntScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperTaskRuleDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperTaskRuleDfntScr2" name="oldoperTaskRuleDfntScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperTaskRuleDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperTaskRuleDfntScr3" name="oldoperTaskRuleDfntScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperTaskRuleDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperTaskRuleDfntScr4" name="oldoperTaskRuleDfntScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperTaskRuleDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperTaskRuleDfntScr5" name="oldoperTaskRuleDfntScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperTaskRuleDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질진단</td>
						<td class="tl">● 문화정보 자원 품질진단을 실시하여 오류문화정보 자원을 파악한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltInspScr1" name="oldoperRcsQltInspScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltInspScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltInspScr2" name="oldoperRcsQltInspScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltInspScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltInspScr3" name="oldoperRcsQltInspScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltInspScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltInspScr4" name="oldoperRcsQltInspScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltInspScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltInspScr5" name="oldoperRcsQltInspScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltInspScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질개선</td>
						<td class="tl"> ● 문화정보 자원 품질진단에 따른 오류 문화정보 자원 개선(정제)를 실시한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltBtmntScr1" name="oldoperRcsQltBtmntScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltBtmntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltBtmntScr2" name="oldoperRcsQltBtmntScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltBtmntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltBtmntScr3" name="oldoperRcsQltBtmntScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltBtmntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltBtmntScr4" name="oldoperRcsQltBtmntScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltBtmntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldoperRcsQltBtmntScr5" name="oldoperRcsQltBtmntScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldoperRcsQltBtmntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="3">활용</td>
						<td>개방문화정보 자원의 오픈 포맷</td>
						<td class="tl">● 개방문화정보 자원은 수정, 변환, 추출 등이 자유로운 오픈 포맷 형태로 제공한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsFrmtScr1" name="oldcnjtRcsFrmtScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsFrmtScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsFrmtScr2" name="oldcnjtRcsFrmtScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsFrmtScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsFrmtScr3" name="oldcnjtRcsFrmtScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsFrmtScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsFrmtScr4" name="oldcnjtRcsFrmtScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsFrmtScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsFrmtScr5" name="oldcnjtRcsFrmtScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsFrmtScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>개방문화정보 자원의 최신화</td>
						<td class="tl">● 개방문화정보 자원은 최신화하여 제공한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsMntnScr1" name="oldcnjtRcsMntnScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsMntnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsMntnScr2" name="oldcnjtRcsMntnScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsMntnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsMntnScr3" name="oldcnjtRcsMntnScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsMntnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsMntnScr4" name="oldcnjtRcsMntnScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsMntnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsMntnScr5" name="oldcnjtRcsMntnScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsMntnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>개방문화정보 자원의 활용 점검 및 조치</td>
						<td class="tl">● 개방문화정보 자원 활용 현황을 점검하여 적절한 시정조치를 수행한다</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsChckActnScr1" name="oldcnjtRcsChckActnScr" value="1" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '1'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsChckActnScr2" name="oldcnjtRcsChckActnScr" value="2" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '2'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsChckActnScr3" name="oldcnjtRcsChckActnScr" value="3" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '3'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsChckActnScr4" name="oldcnjtRcsChckActnScr" value="4" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '4'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="oldcnjtRcsChckActnScr5" name="oldcnjtRcsChckActnScr" value="5" <c:if test="${oldPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '5'}">checked</c:if> onclick="javascript:return false;" /><label for="oldcnjtRcsChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
	<div class="table-wrap">
		<h2>[환경조사]</h2>
		<input type="hidden" id="popRcsexmnId" name="popRcsexmnId" value="${popSrchRcsExmnInfo.paramRcsexmnId}">
		<input type="hidden" id="popInstId" name="popInstId" value="${popSrchRcsExmnInfo.paramInstId}">
		<div class="div-scroll">
			<table class="list">
				<caption></caption>
				<colgroup>
					<col width="100px"></col>
					<col width="200px"></col>
					<col width="300px"></col>
					<col width="400px"></col>
				</colgroup>
				<thead>
					<tr>
						<th>영역</th>
						<th>평가지표
							<button class="btn-tooltip"
							data-tooltip="
							<b>평가지표 :</b>평가영력별 평가지표 설명 참조하여 평가기준 레벨 기입
							">?</button>
						</th>
						<th>지표설명</th>
						<th>평가기준 레벨</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="4">계획</td>
						<td>문화정보 자원 품질정책 수립</td>
						<td class="tl">
							● 문화정보 자원 품질관리 규정(또는 지침)을 수립하여 관리한다.
							<button class="btn-tooltip"
							data-tooltip="
							공공문화정보 자원의 안정적 품질관리를 위해서는 품질관리 목적, 범위, 추진체계, 품질관리 주요활동을 포함하는 관련 규정을 마련하고, 기관장(또는 승인권자)의 승인을 통해 이를 공식화하며, 품질관리 정책, 관련법령, 제도 등을 반영하여 지속적으로 관리한다.
							<br/>2레벨(도입)
							<br/>문화정보 자원 품질관리 규정이 선언적(또는 형식적) 수준으로 존재하고 있다. 
							<br/> - 타 규정에 문화정보 자원 품질관리 규정이 포함되거나, 문화정보 자원 품질관리 규정이 선언적(형식적) 수준으로 존재하고 있다.
							<br/>3레벨(관리화)
							<br/>문화정보 자원 품질관리 규정이 관리 가능한 수준으로 존재하고 있다.
							<br/> - 문화정보 자원 품질관리 규정은 품질관리 목적, 범위, 추진체계, 주요 품질관리 활동 등을 정의하고 있다.
							<br/>4레벨(체계화)
							<br/>문화정보 자원 품질관리 규정을 공식화(승인 및 배포)하고 있다.
							<br/> - 문화정보 자원 품질관리 규정의 공식화는 최종 승인권자의 결재를 득하여 관련 이해관계자 또는 조직 전체로 공유(배포)하고 있다.
							<br/>5레벨(최적화)
							<br/>조직차원의 문화정보 자원 품질관리를 위한 관련 규정의 적절성을 검토하여 지속적으로 개선하고 있다.(최근 2년간, 1회 이상)
							<br/> - 품질관리 정책, 관련법령, 제도 등의 변경에 따른 문화정보 자원 품질관리 규정을 검토한 내역이나 개정 이력이 존재하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlcyEstbScr1" name="popPlanQltPlcyEstbScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '1'}">checked</c:if> /><label for="popPlanQltPlcyEstbScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlcyEstbScr2" name="popPlanQltPlcyEstbScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '2'}">checked</c:if> /><label for="popPlanQltPlcyEstbScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlcyEstbScr3" name="popPlanQltPlcyEstbScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '3'}">checked</c:if> /><label for="popPlanQltPlcyEstbScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlcyEstbScr4" name="popPlanQltPlcyEstbScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '4'}">checked</c:if> /><label for="popPlanQltPlcyEstbScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlcyEstbScr5" name="popPlanQltPlcyEstbScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlcyEstbScr == '5'}">checked</c:if> /><label for="popPlanQltPlcyEstbScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질조직 구성</td>
						<td class="tl">● 문화정보 자원 품질관리 조직을 구성하고, 문화정보 자원 품질관리를 위한 의사소통활동을 수행한다 
							<button class="btn-tooltip"
							data-tooltip="
							- 문화정보 자원 품질관리 업무를 수행하기 위한 조직(책임자, 실무자 등)을 구성하고, 품질관리 업무담당자를 지정한다.
							<br/> - 공공문화정보 자원 품질관리를 위해 상위수준의 의사소통 활동과 실무 담당자 및 관련 이해관계자가 참여하는 의사소통 활동을 주기적으로 수행한다.
							<br/> ※ 의사소통 활동은 위원회, 협의회, 자문회의, 검토·심의회의 등 조직의 특성에 따라 다양한 형태로 수행될 수 있다.
							<br/>2레벨(도입)
							<br/>공공문화정보 자원법 제12조에 근거하여 ‘공공문화정보 자원제공책임관’ 및 ‘실무자’를 임명하여 기관 홈페이지에 공표하고 있다.
							<br/>문화정보 자원 품질관리를 위한 의사소통 활동을 비정기적으로 실시하고 있다.(최근 2년간, 1회 이상)
							<br/> - 문화정보 자원 품질관리 실무 담당자 및 관련 이해관계자가 참여하는 검토회의 등 의사소통 활동을 비정기적으로 실시하고 있다.
							<br/>3레벨(관리화)
							<br/>문화정보 자원 품질관리 담당부서(담당자)를 구성하고, 역할과 책임을 정의하고 있다.
								<br/>문화정보 자원 품질관리 담당자 및 관련 이해관계자가 참여하는 의사소통 활동을 실시하고 있다.(최근 1년간, 1회 이상)
							<br/>4레벨(체계화)  
							<br/>문화정보 자원 품질관리 담당자 및 관련 이해관계자가 참여하는 의사소통 활동을 실시하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>의사결정권자(기관장, 책임관 등)에게 문화정보 자원 품질 관련 주요사항을 보고하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>5레벨(최적화)  
							<br/>조직차원의 문화정보 자원 품질관리를 위한 의사결정권자(기관장, 책임관 등)가 직접 참여하는 의사소통 체계(품질관리 정책협의회 등)를 구성하고, 의사소통 활동을 실시하고 있다.								
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popPlanQltOgnzCpstScr1" name="popPlanQltOgnzCpstScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '1'}">checked</c:if> /><label for="popPlanQltOgnzCpstScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltOgnzCpstScr2" name="popPlanQltOgnzCpstScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '2'}">checked</c:if> /><label for="popPlanQltOgnzCpstScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltOgnzCpstScr3" name="popPlanQltOgnzCpstScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '3'}">checked</c:if> /><label for="popPlanQltOgnzCpstScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltOgnzCpstScr4" name="popPlanQltOgnzCpstScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '4'}">checked</c:if> /><label for="popPlanQltOgnzCpstScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltOgnzCpstScr5" name="popPlanQltOgnzCpstScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltOgnzCpstScr == '5'}">checked</c:if> /><label for="popPlanQltOgnzCpstScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질계획 수립</td>
						<td class="tl"> ● 문화정보 자원 품질관리 계획을 수립한다</br>● 문화정보 자원 품질관리를 위한 예산을 확보하여 적절히 집행한다
							<button class="btn-tooltip"
							data-tooltip="
							- 문화정보 자원 품질관리를 위한 목표, 추진전략, 중·장기 로드맵 등을 포함하는 문화정보 자원 품질관리 계획을 수립하여 기관장(또는 승인권자)의 결재를 득하여 조직 구성원과 공유한다.
							<br/> ※ 품질관리 계획은 목표, 현황 및 문제점, 주요 추진과제, 수행주체, 추진일정, 소요예산 등을 포함한다.
							<br/>- 문화정보 자원 품질관리에 필요한 예산을 지속적으로 확보하고, 중요도나 시급성 등을 고려하여 예산을 적절히 분배하고 집행한다.
							<br/> ※ 품질관리 예산이라 함은 문화정보 자원 표준, 문화정보 자원 구조, 문화정보 자원 품질 진단 및 정제, 연계문화정보 자원 관리, 개방문화정보 자원 활용 등 문화정보 자원 품질 관련 시스템 도입·운영, 컨설팅, 교육·홍보 등을 의미한다.
							<br/>2레벨(도입)
							<br/>문화정보 자원 품질관리 계획이 존재하고 있다.
							<br/> - 문화정보 자원 품질관리를 위한 사업계획서, 프로젝트 발주 등을 위한 제안요청서 등
							<br/>문화정보 자원 품질관리를 위한 예산을 확보(국가차원의 지원사업 예산 포함)하여 집행한 실적이 존재하고 있다.(최근 3년간, 1회 이상)
							<br/>3레벨(관리화)
							<br/>연간 문화정보 자원 품질관리 계획을 수립하여 공식화(승인, 배포) 하고 있다.
							<br/>- 평가대상 DB에 대한 개별적인 품질관리 계획이 존재하거나, 기관차원의 문화정보 자원 품질관리 계획에 포함
								<br/>자체적인 문화정보 자원 품질관리 예산을 확보하여 집행하고 있다.(최근 1년간, 1회 이상)
							<br/>4레벨(체계화)  
							<br/>품질관리 계획이나 목표 대비 실행 성과를 평가하고, 평가결과를 차년도 품질관리 계획에 반영하고 있다.
							<br/>자체적인 문화정보 자원 품질관리 예산을 확보하여 집행하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>5레벨(최적화)  
							<br/>문화정보 자원 품질관리를 위한 조직차원의 중장기 품질관리 계획을 수립하여 공식화하고 있다.
							<br/>자체적인 문화정보 자원 품질관리 예산을 확보하여 집행하고 있다.(최근 3년간, 매년 1회 이상)
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlanEstbScr1" name="popPlanQltPlanEstbScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '1'}">checked</c:if> /><label for="popPlanQltPlanEstbScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlanEstbScr2" name="popPlanQltPlanEstbScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '2'}">checked</c:if> /><label for="popPlanQltPlanEstbScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlanEstbScr3" name="popPlanQltPlanEstbScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '3'}">checked</c:if> /><label for="popPlanQltPlanEstbScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlanEstbScr4" name="popPlanQltPlanEstbScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '4'}">checked</c:if> /><label for="popPlanQltPlanEstbScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltPlanEstbScr5" name="popPlanQltPlanEstbScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltPlanEstbScr == '5'}">checked</c:if> /><label for="popPlanQltPlanEstbScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질관리 교육 및 지식공유</td>
						<td class="tl">● 문화정보 자원 품질관리 역량 강화를 위한 교육을 실시하고, 관련 지식, 사례 등을 공유한다
							<button class="btn-tooltip"
							data-tooltip="
							문화정보 자원 품질관리 담당자, 정보화부서 담당자, 현업부서 담당자 등 이해관계자를 대상으로 필요한 교육을 계획하고 실시한다.
							<br/> ※ 문화정보 자원 품질관리 교육이란, 품질관리 규정(또는 지침), 문화정보 자원표준, 문화정보 자원구조, 문화정보 자원 품질진단 및 개선, 연계문화정보 자원관리, 개방문화정보 자원 관리 및 활용 등 문화정보 자원 품질관리 역량 강화를 위한 교육(1시간 이상)을 의미한다.
							<br/> - 문화정보 자원 품질관리 업무를 수행하면서 축적한 관련 지식, 교훈, 사례 등을 체계화하여 기록(또는 문서화)하고, 관련 이해관계자들과 지속적으로 공유하며, 조직 전체로 확산한다.
							<br/>2레벨(도입)
							<br/>문화정보 자원 품질관리 교육을 비정기적으로 실시하고 있다.(최근 2년간, 1회 이상)
							<br/>3레벨(관리화)
							<br/>문화정보 자원 품질관리 교육계획을 수립하고, 품질관리 담당자와 정보화부서(또는 사업자)를 포함하는 교육을 실시하고 있다.(최근 1년간, 1회 이상)
								<br/>자체적인 문화정보 자원 품질관리 예산을 확보하여 집행하고 있다.(최근 1년간, 1회 이상)
							<br/>4레벨(체계화)  
							<br/>현업부서를 포함하는 품질관리 교육을 실시하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>5레벨(최적화)  
							<br/>의사결정권자(기관장, 책임관 등)가 참여하는 문화정보 자원 품질관리 교육을 실시하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>문화정보 자원 품질관리 수행을 통해 축적한 관련 지식, 교훈, 사례 등을 기록하고 이해관계자(또는 조직전체)와 공유하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popPlanQltEduKnldSharScr1" name="popPlanQltEduKnldSharScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '1'}">checked</c:if> /><label for="popPlanQltEduKnldSharScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltEduKnldSharScr2" name="popPlanQltEduKnldSharScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '2'}">checked</c:if> /><label for="popPlanQltEduKnldSharScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltEduKnldSharScr3" name="popPlanQltEduKnldSharScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '3'}">checked</c:if> /><label for="popPlanQltEduKnldSharScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltEduKnldSharScr4" name="popPlanQltEduKnldSharScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '4'}">checked</c:if> /><label for="popPlanQltEduKnldSharScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popPlanQltEduKnldSharScr5" name="popPlanQltEduKnldSharScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.planQltEduKnldSharScr == '5'}">checked</c:if> /><label for="popPlanQltEduKnldSharScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="6">구축</td>
						<td>문화정보 자원 표준 정의</td>
						<td class="tl">● 문화정보 자원 표준(코드, 도메인, 용어)를 정의한다. 
							<button class="btn-tooltip"
							data-tooltip="
							문화정보 자원 표준 수립에 필요한 절차와 생성규칙 등을 정의하고, 문화정보 자원 표준(코드, 도메인, 용어)의 주요 관리항목을 포함하여 표준(코드, 도메인, 용어)을 정의한다.
							<br/>2레벨(도입)
							<br/>문화정보 자원 표준(코드, 도메인, 용어)을 정의하고 있다.
							<br/> - 표준코드는 주요 관리항목(‘코드명’, ‘코드 값’, ‘코드 값 의미’)을 포함하고 있다.
							<br/> - 표준도메인은 주요 관리항목(도메인명, 도메인정의, 문화정보 자원타입, 문화정보 자원길이, 도메인분류 등)을 포함하고 있다.
							<br/> - 표준용어는 주요 관리항목(용어명, 영문명, 영문약어명, 용어정의 등)을 포함하고 있다.
							<br/>3레벨(관리화)
							<br/>문화정보 자원 표준 수립 절차를 정의하여 준수하고 있다.
							<br/>문화정보 자원 표준 생성 규칙을 정의하여 준수하고 있다.
								<br/>문화정보 자원 표준 처리(생성, 변경, 삭제) 이력을 관리하고 있다.
							<br/>4레벨(체계화)  
							<br/>비표준 매핑을 관리하고 있다.
							<br/>문화정보 자원 표준의 문제점을 파악하여 조치하고 있다.
							<br/> - 문화정보 자원 표준 중복(동의어, 유사어), 불 충분한 문화정보 자원 표준 설명, 생성 규칙에 위배되는 문화정보 자원 표준 등의 문제점을 파악하여 조치하고 있다.
							<br/>5레벨(최적화)  
							<br/>조직차원의 문화정보 자원 표준(코드, 도메인, 용어)을 정의하고 있다.
							<br/>DB차원의 문화정보 자원 표준이 조직차원의 문화정보 자원 표준을 준수하고 있다.
							<br/> ※ 업무(DB) 특성에 따라 DB차원의 별도 문화정보 자원 표준을 정의한 경우라도 조직차원으로 공통 적용해야 할 문화정보 자원 표준(코드, 도메인, 용어)을 준수해야 한다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstStdDfntScr1" name="popCnstStdDfntScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '1'}">checked</c:if> /><label for="popCnstStdDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdDfntScr2" name="popCnstStdDfntScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '2'}">checked</c:if> /><label for="popCnstStdDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdDfntScr3" name="popCnstStdDfntScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '3'}">checked</c:if> /><label for="popCnstStdDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdDfntScr4" name="popCnstStdDfntScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '4'}">checked</c:if> /><label for="popCnstStdDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdDfntScr5" name="popCnstStdDfntScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdDfntScr == '5'}">checked</c:if> /><label for="popCnstStdDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 표준 점검 및 조치</td>
						<td class="tl">● 문화정보 자원 표준의 준수 상태를 점검하고 필요한 조치를 수행한다. 
							<button class="btn-tooltip"
							data-tooltip="
							정보시스템 (신규·변경 포함)구축을 위한 문화정보 자원베이스 설계 시 문화정보 자원 모델, DB의 문화정보 자원 표준 적용 현황을 점검하여 개선하는 활동을 수행한다.
							</br>문화정보 자원 표준 관리 절차의 준수 여부 및 운영 실태를 주기적으로 점검하여 조치하고, 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 공유한다.
							<br/>2레벨(도입)
							<br/>DB의 표준 준수 상태를 비정기적으로 점검 및 조치하고 있다.(최근 2년간, 1회 이상)
							<br/>3레벨(관리화)
							<br/>문화정보 자원 표준을 문화정보 자원 모델 설계 및 DB 구축에 적용하는 절차를 정의하여 준수하고 있다.
							<br/> ※ 표준이 정의된 이후 생성되는 DB는 표준을 준수해야 한다.
									<br/>DB의 표준 준수 상태를 점검 및 조치하고 있다.(최근 1년간, 1회 이상)
							<br/>4레벨(체계화)  
							<br/>DB의 표준 준수 상태를 점검 및 조치하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>표준 점검결과를 상위관리자에게 보고하고, 이해관계자와 공유하고 있다.(최근 2년간, 매년 1회 이상)
							<br/>5레벨(최적화)  
							<br/>DB의 표준 적용내역이 조직차원의 표준을 준수하고 있는지 점검 및 조치하고 있다.
							<br/>표준 준수율 향상을 위한 중장기 계획을 수립하여 수행하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstStdChckActnScr1" name="popCnstStdChckActnScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '1'}">checked</c:if> /><label for="popCnstStdChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdChckActnScr2" name="popCnstStdChckActnScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '2'}">checked</c:if> /><label for="popCnstStdChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdChckActnScr3" name="popCnstStdChckActnScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '3'}">checked</c:if> /><label for="popCnstStdChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdChckActnScr4" name="popCnstStdChckActnScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '4'}">checked</c:if> /><label for="popCnstStdChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStdChckActnScr5" name="popCnstStdChckActnScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStdChckActnScr == '5'}">checked</c:if> /><label for="popCnstStdChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 구조 정의</td>
						<td class="tl"> ● 문화정보 자원 구조를 정의하고 있다.
							<button class="btn-tooltip"
							data-tooltip="
							문화정보 자원 구조 수립 절차를 준수하고 문화정보 자원 구조 관리를 위한 엔터티 정의서, 테이블 정의서, 컬럼 정의서, 속성 정의서 등 주요 관리항목을 포함하여 정의한다.
							<br/>2레벨(도입)
							<br/>문화정보 자원 구조 산출물을 정의하고 있다.
							<br/> - 문화정보 자원 구조 산출물은 테이블·컬럼 정의서, ERD, 테이블 관계 목록 등이다.
							<br/>3레벨(관리화)
							<br/>문화정보 자원 구조 수립 절차를 정의하여 준수하고 있다.
							<br/> - 절차는 문화정보 자원 모델링 기준, 가이드, 규칙, 표기법 등을 포함한다.
								<br/>문화정보 자원 구조의 처리(생성, 변경, 삭제) 이력을 관리하고 있다.
							<br/>4레벨(체계화)  
							<br/>문화정보 자원 구조의 문제점을 파악하여 조치하고 있다.
							<br/> - 문화정보 자원 품질에 영향을 미치는 문화정보 자원 구조의 문제점(정규화/비정규화, 잘못된 구조 설계 등)을 파악하여 조치하고 있다.
							<br/>5레벨(최적화)  
							<br/>조직차원의 문화정보 자원 구조 통합관리를 수행하고 있다.
							<br/> - 평가대상DB의 문화정보 자원 구조가 조직차원의 구조 통합관리에 포함되어 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrDfntScr1" name="popCnstStrrDfntScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '1'}">checked</c:if> /><label for="popCnstStrrDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrDfntScr2" name="popCnstStrrDfntScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '2'}">checked</c:if> /><label for="popCnstStrrDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrDfntScr3" name="popCnstStrrDfntScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '3'}">checked</c:if> /><label for="popCnstStrrDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrDfntScr4" name="popCnstStrrDfntScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '4'}">checked</c:if> /><label for="popCnstStrrDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrDfntScr5" name="popCnstStrrDfntScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrDfntScr == '5'}">checked</c:if> /><label for="popCnstStrrDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 구조 점검 및 조치</td>
						<td class="tl">● 문화정보 자원 구조의 현행화 및 완전성을 점검하고, 조치한다.
							<button class="btn-tooltip"
							data-tooltip="
								정기적으로 문화정보 자원 구조의 현행화 및 완전성을 점검하여 비효율적인 DBMS 사용, 중복 문화정보 자원 발생, DB성능 저하 등의 원인이 되는 오류를 식별하여 조치한다.
								<br/>문화정보 자원 구조 관리 절차의 준수 여부 및 운영 실태를 주기적으로 점검하여 조치하고, 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 공유한다.
								<br/>2레벨(도입)
								<br/>문화정보 자원 구조 산출물의 현행화 점검 및 조치를 비정기적으로 실시하고 있다.(최근 2년간, 1회 이상)
								<br/>문화정보 자원 구조의 완전성 점검* 및 조치를 비정기적으로 실시하고 있다.(최근 2년간, 1회 이상)
								<br/> * 완전성 점검 : 미사용 테이블/컬럼, 테이블 중복, 기본키 누락 등을 점검하는 활동
								<br/>3레벨(관리화)
								<br/>DB와 문화정보 자원모델 간의 현행화 및 완전성을 점검하는 절차를 정의하여 준수하고 있다.
								<br/>문화정보 자원 구조의 산출물 현행화, 완전성을 점검 및 조치하고 있다.(최근 1년간, 1회 이상)
								<br/>4레벨(체계화)  
								<br/>문화정보 자원 구조의 산출물 현행화, 완전성을 점검 및 조치하고 있다.(최근 2년간, 매년 1회 이상)
								<br/> ※ 컬럼 신규·변경이 거의 발생하지 않는 DB의 경우, 변경 시 점검을 수행해야 함 
								<br/>구조 점검결과를 상위관리자에게 보고하고, 이해관계자와 공유하고 있다. (최근 2년간, 매년 1회 이상)
								<br/>5레벨(최적화)  
								<br/>DB의 문화정보 자원 구조 변경내역이 조칙차원의 문화정보 자원 구조 통합관리에 반영되어 있는지 점검 및 조치하고 있다. 
								<br/>조직차원의 목표 문화정보 자원 아키텍처(목표 개념모델)에 따른 문화정보 자원 모델 최적화하는 활동을 지속적으로 수행하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrChckActnScr1" name="popCnstStrrChckActnScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '1'}">checked</c:if> /><label for="popCnstStrrChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrChckActnScr2" name="popCnstStrrChckActnScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '2'}">checked</c:if> /><label for="popCnstStrrChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrChckActnScr3" name="popCnstStrrChckActnScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '3'}">checked</c:if> /><label for="popCnstStrrChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrChckActnScr4" name="popCnstStrrChckActnScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '4'}">checked</c:if> /><label for="popCnstStrrChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstStrrChckActnScr5" name="popCnstStrrChckActnScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstStrrChckActnScr == '5'}">checked</c:if> /><label for="popCnstStrrChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>연계 문화정보 자원 정의</td>
						<td class="tl">● 다른 DB와 주고받는 연계문화정보 자원을 정의한다 
							<button class="btn-tooltip"
							data-tooltip="
								연계문화정보 자원 관리 절차에 근거하여 타 기관(또는 DB)에서 제공하거나 타 기관으로부터 제공받아 활용 중인 연계 문화정보 자원의 정합성 확보를 위해 연계문화정보 자원 목록 및 송수신내역을 작성하여 관리한다.
								<br/>2레벨(도입)
								<br/>다른 DB와 송·수신하는 연계문화정보 자원을 정의하고 있다.
								<br/> - 물리적으로 DB가 분리되어 있는 경우, 해당 연계문화정보 자원을 목록으로 정의하고 있다.
								<br/>3레벨(관리화)
								<br/>연계문화정보 자원의 송·수신 내역을 기록하고 있다.
								<br/> - 연계문화정보 자원의 송·수신에 따른 문화정보 자원의 누락 등을 파악할 수 있는 기록, 로그(Log), 점검 활동이 확인되어야 한다.
								<br/>4레벨(체계화)  
								<br/>연계문화정보 자원 목록을 정의하고 있다.
								<br/> - 주요 관리항목을 포함하여 체계적으로 관리하고 있다.
								<br/> ※ 연계문화정보 자원 목록 주요 관리항목 : 연계문화정보 자원명, 송·수신구분, 연계문화정보 자원 목록별 소스-타겟 매핑정보, 연계주기, 연계문화정보 자원 송·수신 기관(또는 담당자) 등
								<br/> ※ 연계문화정보 자원 목록 관리항목은 「공공정보품질관리매뉴얼(v1.1)」 - 붙임1. 관련서식(서식20. 연계문화정보 자원목록)을 참조
								<br/>내·외부 업무(또는 정보시스템) 변경 등에 따른 효율적인 연계를 위한 연계방법, 연계주기 등을 검토·적용하고, 연계문화정보 자원 목록을 최신화하여 관리하고 있다. 
								<br/>5레벨(최적화)  
								<br/>조직차원의 연계문화정보 자원 통합관리를 수행하고 있다.
								<br/> - 평가대상DB의 연계문화정보 자원이 조직차원의 연계문화정보 자원 통합관리에 포함되어 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsDfntScr1" name="popCnstRcsDfntScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '1'}">checked</c:if> /><label for="popCnstRcsDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsDfntScr2" name="popCnstRcsDfntScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '2'}">checked</c:if> /><label for="popCnstRcsDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsDfntScr3" name="popCnstRcsDfntScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '3'}">checked</c:if> /><label for="popCnstRcsDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsDfntScr4" name="popCnstRcsDfntScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '4'}">checked</c:if> /><label for="popCnstRcsDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsDfntScr5" name="popCnstRcsDfntScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsDfntScr == '5'}">checked</c:if> /><label for="popCnstRcsDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>연계 문화정보 자원 점검 및 조치</td>
						<td class="tl">● 연계문화정보 자원의 정합성을 점검하고 문제점을 조치한다 
							<button class="btn-tooltip"
							data-tooltip="
								연계문화정보 자원의 정합성 확보를 위해 (송·수신)연계 기관 및 관련이해당사자 간 긴밀한 협조체계를 구축하여 연계문화정보 자원의 정합성을 점검하고 조치한다.
								<br/>연계문화정보 자원 관리 절차의 준수 여부 및 운영 실태를 주기적으로 점검하여 조치하고, 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 공유한다.
								<br/>2레벨(도입)
								<br/>송·수신하고 있는 연계문화정보 자원의 정합성을 비정기적으로 점검 및 조치하고 있다.(최근 2년간, 1회 이상)
								<br/> - 정합성 점검 시 연계문화정보 자원 송·수신에 따른 문화정보 자원 누락건수 점검을 포함하고 있다.
								<br/>3레벨(관리화)
								<br/>연계문화정보 자원의 정합성을 점검하는 절차를 정의하여 준수하고 있다.
								<br/>송·수신하고 있는 연계문화정보 자원의 정합성을 점검 및 조치하고 있다.(최근 1년간, 1회 이상)
								<br/> - 문화정보 자원 오너십이 외부기관에 있을 경우 오류내역을 해당기관에 통보하고 있다.
								<br/>4레벨(체계화)  
								<br/>연계문화정보 자원 정합성을 점검 및 조치하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>연계문화정보 자원 오류점검 및 조치현황을 상위 관리자에게 보고하고, 관련 이해관계자와 공유하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>5레벨(최적화)  
								<br/>DB의 연계문화정보 자원 변경내역이 조칙차원의 연계문화정보 자원 통합관리에 반영되어 있는지 점검 및 조치하고 있다. 
								<br/>연계문화정보 자원 정합성 점검을 위한 연계문화정보 자원 관련 조직차원의 협조체계를 확보하고 있다.
								<br/> - 송·수신하는 연계문화정보 자원의 변경(또는 품질오류) 발생 시 관련 이해관계자에게 통보하고 조치결과를 재점검하여 피드백하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsChckActnScr1" name="popCnstRcsChckActnScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '1'}">checked</c:if> /><label for="popCnstRcsChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsChckActnScr2" name="popCnstRcsChckActnScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '2'}">checked</c:if> /><label for="popCnstRcsChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsChckActnScr3" name="popCnstRcsChckActnScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '3'}">checked</c:if> /><label for="popCnstRcsChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsChckActnScr4" name="popCnstRcsChckActnScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '4'}">checked</c:if> /><label for="popCnstRcsChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnstRcsChckActnScr5" name="popCnstRcsChckActnScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnstRcsChckActnScr == '5'}">checked</c:if> /><label for="popCnstRcsChckActnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					
					<tr>
						<td rowspan="3">운영</td>
						<td>업무규칙 정의</td>
						<td class="tl">● 문화정보 자원 품질진단을 위한 업무규칙을 정의한다.
							<button class="btn-tooltip"
							data-tooltip="
								업무규칙 정의 절차에 근거하여 대상DB 관련 법령, 규정, 지침, 업무매뉴얼, 품질 오류신고 내용 등을 기반으로 업무규칙을 주기적으로 발굴하여 정의하고 있다.
								<br/>2레벨(도입)
								<br/>문화정보 자원 유효성 검증을 위한 업무규칙을 정의하고 있다.
								<br/> ※ 문화정보 자원 유효성 : 유무(여부), 날짜, 코드, 번호
								<br/> ※ 업무규칙은 현장평가 시 시스템(또는 SQL) 실행을 통해 실효성이 확인되어야 함
								<br/>3레벨(관리화)
								<br/>업무규칙을 지속적으로 발굴하여 정의하는 절차를 정의하여 준수하고 있다.
								<br/>문화정보 자원 상호 간의 관계 정합성 검증을 위한 업무규칙을 정의하고 있다.
								<br/> ※ 문화정보 자원 정합성 : 참조값, 식별자
								<br/> ※ 업무규칙은 현장평가 시 시스템(또는 SQL) 실행을 통해 실효성이 확인되어야 함
								<br/>내·외부에서 접수 된 오류 문화정보 자원을 점검하는 규칙을 정의하고 있다.
								<br/>4레벨(체계화)  
								<br/>업무규정·법령·지침 등에 위배되는 문화정보 자원 검증을 위한 업무규칙을 정의하고 있다.
								<br/> ※ 업무규칙은 현장평가 시 시스템(또는 SQL) 실행을 통해 실효성이 확인되어야 함
								<br/>정의된 업무규칙을 점검하여 현행화하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>업무규칙 관리 현황을 계량화(지표)하여 관리하고 있다.
								<br/>5레벨(최적화)  
								<br/>업무규칙을 발굴하고 정의하는데 현업이 참여하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popOperTaskRuleDfntScr1" name="popOperTaskRuleDfntScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '1'}">checked</c:if> /><label for="popOperTaskRuleDfntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperTaskRuleDfntScr2" name="popOperTaskRuleDfntScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '2'}">checked</c:if> /><label for="popOperTaskRuleDfntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperTaskRuleDfntScr3" name="popOperTaskRuleDfntScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '3'}">checked</c:if> /><label for="popOperTaskRuleDfntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperTaskRuleDfntScr4" name="popOperTaskRuleDfntScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '4'}">checked</c:if> /><label for="popOperTaskRuleDfntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperTaskRuleDfntScr5" name="popOperTaskRuleDfntScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operTaskRuleDfntScr == '5'}">checked</c:if> /><label for="popOperTaskRuleDfntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질진단</td>
						<td class="tl">● 문화정보 자원 품질진단을 실시하여 오류문화정보 자원을 파악한다.
							<button class="btn-tooltip"
							data-tooltip="
								대상DB의 문화정보 자원 품질 확보를 위해 정기적으로 「공공정보품질관리매뉴얼」 또는 자체 문화정보 자원 값의 품질진단 기준에 따라 품질 측정하여 문화정보 자원 품질 오류를 식별한다.
								<br/>문화정보 자원 품질진단 절차의 준수 여부 및 운영 실태를 주기적으로 점검하여 조치하고, 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 공유한다.
								<br/>2레벨(도입)
								<br/>품질진단에 따른 오류율은 1% 미만을 유지하고 있다.
								<br/> ※ 문화정보 자원 유효성, 정합성 오류율 기준
								<br/> ※ 제시된 오류율은 확인점검 평가 시 검증되어야 함 
								<br/>3레벨(관리화)
								<br/>문화정보 자원 품질진단 절차(진단대상, 진단범위, 진단기준 등 포함)를 정의하여 준수하고 있다.
								<br/>품질진단에 따른 오류율은 0.5% 미만을 유지하고 있다.
								<br/> ※ 문화정보 자원 유효성, 정합성 오류율 기준
								<br/> ※ 제시된 오류율은 확인점검 평가 시 검증되어야 함
								<br/>4레벨(체계화)  
								<br/>업무규정·법령·지침 등에 위배되는 문화정보 자원 검증을 위한 업무규칙을 활용하여 품질오류 점검을 수행하고 있다.(최근 2년간, 매년 1회이상)
								<br/>품질진단 현황을 상위 관리자에게 보고하고, 관련 이해관계자와 공유하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>품질진단에 따른 오류율은 0.1% 미만을 유지하고 있다.
								<br/> ※ 문화정보 자원 유효성, 정합성 오류율 기준
								<br/> ※ 제시된 오류율은 확인점검 평가 시 검증되어야 함
								<br/>5레벨(최적화)  
								<br/>현업(문화정보 자원 오너십을 갖는 조직 또는 담당자)이 품질오류 점검에 상시적으로 참여하고 있다.
								<br/>품질진단에 따른 오류율은 0.01% 미만을 유지하고 있다.
								<br/> ※ 문화정보 자원 유효성, 정합성 오류율 기준
								<br/> ※ 제시된 오류율은 확인점검 평가 시 검증되어야 함
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltInspScr1" name="popOperRcsQltInspScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '1'}">checked</c:if> /><label for="popOperRcsQltInspScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltInspScr2" name="popOperRcsQltInspScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '2'}">checked</c:if> /><label for="popOperRcsQltInspScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltInspScr3" name="popOperRcsQltInspScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '3'}">checked</c:if> /><label for="popOperRcsQltInspScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltInspScr4" name="popOperRcsQltInspScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '4'}">checked</c:if> /><label for="popOperRcsQltInspScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltInspScr5" name="popOperRcsQltInspScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltInspScr == '5'}">checked</c:if> /><label for="popOperRcsQltInspScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>문화정보 자원 품질개선</td>
						<td class="tl">● 문화정보 자원 품질진단에 따른 오류 문화정보 자원 개선(정제)를 실시한다 
							<button class="btn-tooltip"
							data-tooltip="
								문화정보 자원 품질 진단 결과 도출된 오류문화정보 자원을 확인하여 개선(정제) 대상을 정의하고, 담당자 지정을 통해 오류문화정보 자원 개선(정제)를 수행한다.
								<br/>문화정보 자원 개선(정제) 절차의 준수 여부 및 운영 실태를 주기적으로 점검하여 조치하고, 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 공유한다.
								<br/>오류 문화정보 자원 개선(정제)에도 불구하고, 지속·반복적으로 발생하는 문화정보 자원 품질 오류에 대하여 근본 원인을 분석하고 개선방인을 마련하여, 구체적인 세부 조치계획을 수립한다.
								<br/>2레벨(도입)
								<br/>식별된 오류문화정보 자원을 개선하고 있다.(최근 2년간, 1회 이상)
								<br/>3레벨(관리화)
								<br/>품질오류신고(접수, 조치, 결과통보)를 관리하고 있다.
								<br/>식별된 오류문화정보 자원을 개선하고 있다.(최근 1년간, 1회 이상)
								<br/> - 문화정보 자원 품질개선 이력을 관리하고 있다.
								<br/>문화정보 자원 품질개선 절차를 정의하여 준수하고 있다.
								<br/> - 문화정보 자원 품질 향상을 위한 문화정보 자원 개선(정제) 대상을 정의하여, 개선을 실시하는 절차가 있다.
								<br/>4레벨(체계화)  
								<br/>식별된 오류 문화정보 자원을 개선하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>품질개선 결과를 상위관리자에게 보고하고, 이해관계자와 공유하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>문화정보 자원 품질 오류를 추적할 수 있는 방법(CRUD 등)을 정의하고, 현행화하고 있다.
								<br/>품질개선 결과를 계량화하여 관리하고 있다.
								<br/>5레벨(최적화)  
								<br/>현업(문화정보 자원 오너십을 갖는 조직 또는 담당자)이 오류 문화정보 자원 개선 활동을 상시적으로 참여하고 있다.
								<br/>지속·반복적으로 발생하는 오류에 대해 근본원인을 분석하여 개선하는 활동을 수행하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltBtmntScr1" name="popOperRcsQltBtmntScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '1'}">checked</c:if> /><label for="popOperRcsQltBtmntScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltBtmntScr2" name="popOperRcsQltBtmntScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '2'}">checked</c:if> /><label for="popOperRcsQltBtmntScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltBtmntScr3" name="popOperRcsQltBtmntScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '3'}">checked</c:if> /><label for="popOperRcsQltBtmntScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltBtmntScr4" name="popOperRcsQltBtmntScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '4'}">checked</c:if> /><label for="popOperRcsQltBtmntScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popOperRcsQltBtmntScr5" name="popOperRcsQltBtmntScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.operRcsQltBtmntScr == '5'}">checked</c:if> /><label for="popOperRcsQltBtmntScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="3">활용</td>
						<td>개방문화정보 자원의 오픈 포맷</td>
						<td class="tl">● 개방문화정보 자원은 수정, 변환, 추출 등이 자유로운 오픈 포맷 형태로 제공한다
							<button class="btn-tooltip"
							data-tooltip="
								개방문화정보 자원은 수정, 변환, 추출이 자유로운 CSV, XML, JSON, 오픈API, RDF 등의 형태로 공공문화정보 자원포털 및 자체 개방포털을 통해 제공한다.
								<br/> ※ “수정, 변환, 추출이 자유로운 형태”란 특정 소프트웨어에 독립적으로 문화정보 자원의 개별내용 또는 내부구조를 확인하거나 수정, 변환, 추출 등 가공할 수 있는 상태를 의미한다.
								<br/> ※ 즉, 일반 상용 소프트웨어(아래한글, MS Excel 등)에서만 수정, 변환, 추출이 가능한 형태가 아니라, 특정 소프트웨어에 독립적인 CSV, XML, JSON, 오픈API, RDF 등의 문화정보 자원 형태(포맷)을 의미한다.
								<br/>2레벨(도입)
								<br/>개방하는 모든 파일문화정보 자원은 기계판독이 가능한 형태로 제공하고 있다.
								<br/>개방문화정보 자원은 수정, 변환, 추출이 자유로운 오픈 포맷 형식으로 전체 개방문화정보 자원의 70% 이상을 제공하고 있다.
								<br/>3레벨(관리화)
								<br/>개방문화정보 자원은 수정, 변환, 추출이 자유로운 오픈 포맷 형식으로 전체 개방문화정보 자원의 80% 이상을 제공하고 있다.
								<br/>4레벨(체계화)  
								<br/>개방문화정보 자원은 수정, 변환, 추출이 자유로운 오픈 포맷 형식으로 전체 개방문화정보 자원의 90% 이상을 제공하고 있다.
								<br/>5레벨(최적화)  
								<br/>개방문화정보 자원은 수정, 변환, 추출이 자유로운 오픈 포맷 형식으로 전체 개방문화정보 자원의 95% 이상을 제공하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsFrmtScr1" name="popCnjtRcsFrmtScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '1'}">checked</c:if> /><label for="popCnjtRcsFrmtScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsFrmtScr2" name="popCnjtRcsFrmtScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '2'}">checked</c:if> /><label for="popCnjtRcsFrmtScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsFrmtScr3" name="popCnjtRcsFrmtScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '3'}">checked</c:if> /><label for="popCnjtRcsFrmtScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsFrmtScr4" name="popCnjtRcsFrmtScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '4'}">checked</c:if> /><label for="popCnjtRcsFrmtScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsFrmtScr5" name="popCnjtRcsFrmtScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsFrmtScr == '5'}">checked</c:if> /><label for="popCnjtRcsFrmtScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>개방문화정보 자원의 최신화</td>
						<td class="tl">● 개방문화정보 자원은 최신화하여 제공한다 
							<button class="btn-tooltip"
							data-tooltip="
								개방문화정보 자원은 정해진 제공주기에 따라 최신 문화정보 자원을 제공하고 있으며, 정기적으로 제공주기의 적정성을 점검하여 제공주기를 개선한다.
								<br/>2레벨(도입)
								<br/>개방하는 모든 파일문화정보 자원은 제공주기를 정의하고 있다.
								<br/>개방문화정보 자원의 70% 이상이 제공주기를 준수하고 있다.
								<br/> - 파일문화정보 자원은 공공문화정보 자원포털(data.go.kr)에 등록된 제공주기를 준수하고 있다.
								<br/> - 오픈API는 제공 문화정보 자원의 특성(실시간 정보, 통계 정보, 기준 정보)을 고려한 제공주기로 적시에 제공하고 있다.
								<br/>3레벨(관리화)
								<br/>개방문화정보 자원의 80% 이상이 제공주기를 준수하고 있다.
								<br/>개방문화정보 자원(파일문화정보 자원, 오픈API)를 주기적으로 점검 및 조치하고 있다.
								<br/> ※ 예시) 오픈API 서비스 오류, 문화정보 자원 링크오류, 제공주기 적정성 검토 등
								<br/>4레벨(체계화)  
								<br/>개방문화정보 자원의 90% 이상이 제공주기를 준수하고 있다.
								<br/>5레벨(최적화)  
								<br/>개방문화정보 자원의 95% 이상이 제공주기를 준수하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsMntnScr1" name="popCnjtRcsMntnScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '1'}">checked</c:if> /><label for="popCnjtRcsMntnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsMntnScr2" name="popCnjtRcsMntnScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '2'}">checked</c:if> /><label for="popCnjtRcsMntnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsMntnScr3" name="popCnjtRcsMntnScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '3'}">checked</c:if> /><label for="popCnjtRcsMntnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsMntnScr4" name="popCnjtRcsMntnScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '4'}">checked</c:if> /><label for="popCnjtRcsMntnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsMntnScr5" name="popCnjtRcsMntnScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsMntnScr == '5'}">checked</c:if> /><label for="popCnjtRcsMntnScr5">5레벨</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>개방문화정보 자원의 활용 점검 및 조치</td>
						<td class="tl">● 개방문화정보 자원 활용 현황을 점검하여 적절한 시정조치를 수행한다 
							<button class="btn-tooltip"
							data-tooltip="
								개방문화정보 자원 운영 실태 및 활용현황을 주기적으로 점검하여 시정 조치하고, 점검 및 조치내역은 상위관리자에게 정기적으로 보고하며, 관련 이해관계자들과 지속적으로 점검 및 조치내역을 공유한다.
								<br/>2레벨(도입)
								<br/>개방문화정보 자원 목록을 정의하고 있다.
								<br/>미 개방 공공문화정보 자원의 개방 요청 접수 시 개방 가능여부를 검토하고, 그 결과를 요청자에게 통보하고 있다.
								<br/>3레벨(관리화)
								<br/>신규 개방문화정보 자원 발굴을 위한 활동을 수행하고 있다.(최근 1년간, 1회 이상)
								<br/> - 개방문화정보 자원 발굴은 조직의 여건에 따라 수요조사 또는 미 개방된 내부 보유 문화정보 자원 목록의 검토를 통해 이루어질 수 있으므로, 자체적인 조사기준과 방법에 따라 수행된 실적이 확인되어야 한다.
								<br/> - 개인정보, 저작권 포함여부 및 관련법령에 근거하여 문화정보 자원 개방 제약사항을 검토하여 추가적인 개방문화정보 자원을 발굴하고 있다.
								<br/>4레벨(체계화)  
								<br/>보유문화정보 자원 개방 시 수요자가 원하는 제공형태, 제공주기 등을 파악하여 반영하고 있다. (최근 2년간, 매년 1회 이상)
								<br/> ※ 설문조사, 핵심 수요자 인터뷰 등을 통해 수요자의 의견수렴
								<br/>문화정보 자원 개방관리(발굴, 제공형태, 개방표준, 최신화 등) 현황을 상위 관리자에게 보고하고, 관련 이해관계자와 공유하고 있다.(최근 2년간, 매년 1회 이상)
								<br/>5레벨(최적화)  
								<br/>개방문화정보 자원의 활용성 제고를 위한 활동을 수행하고 있다.
								<br/> - 민간기업, 유관기관 협의체 구성, 융·복합 개방문화정보 자원 발굴 추진, 개방문화정보 자원 활용을 위한 인프라 제공, 활용도가 낮은 개방문화정보 자원에 대해 원인 분석 및 개선 등의 활동을 수행하고 있다.
							">?</button>
						</td>
						<td>
							<div class="fm-radio">
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsChckActnScr1" name="popCnjtRcsChckActnScr" value="1" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '1'}">checked</c:if> /><label for="popCnjtRcsChckActnScr1">1레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsChckActnScr2" name="popCnjtRcsChckActnScr" value="2" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '2'}">checked</c:if> /><label for="popCnjtRcsChckActnScr2">2레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsChckActnScr3" name="popCnjtRcsChckActnScr" value="3" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '3'}">checked</c:if> /><label for="popCnjtRcsChckActnScr3">3레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsChckActnScr4" name="popCnjtRcsChckActnScr" value="4" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '4'}">checked</c:if> /><label for="popCnjtRcsChckActnScr4">4레벨</label>
								</span>
								<span class="fm-ele">
									<input type="radio" id="popCnjtRcsChckActnScr5" name="popCnjtRcsChckActnScr" value="5" <c:if test="${nowPopRcsExmnQltMngLvlInfo.cnjtRcsChckActnScr == '5'}">checked</c:if> /><label for="popCnjtRcsChckActnScr5">5레벨</label>
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
		<button type="button" class="btns" id="btnPopSaveRcsexmnQltMngLvlInfo" name="btnPopSaveRcsexmnQltMngLvlInfo" onclick="javascript:moveSaveRcsexmnQltMngLvlInfo(); return false;">저장</button>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${srchAuthInfo.paramAuthrtId eq 'AUTH000001'}">
	<button type="button" class="btns" id="btnPopSaveRcsexmnQltMngLvlInfo" name="btnPopSaveRcsexmnQltMngLvlInfo" onclick="javascript:moveSaveRcsexmnQltMngLvlInfo(); return false;">저장</button>
	</c:if>
		<!-- <button type="button" class="btns color-gray" id="btnPopCloseRcsexmnQltMngLvlInfo" name="btnPopCloseRcsexmnQltMngLvlInfo" onclick="javascript:moveClosePopupList(); return false;">닫기</button> -->
	</div>
</div>
<script type="text/javascript">
	//창닫기
	function moveClosePopupList() {
		admin.modalsClose('modals');
	}
	
	
</script>