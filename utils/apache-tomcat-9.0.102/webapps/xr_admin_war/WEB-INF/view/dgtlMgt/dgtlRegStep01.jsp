<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="write-wrap column">
	<div>
		<strong class="require">디지털문화자원 명칭</strong>
		<div class="fm-ele" data-size="100p">
			<input type="text" id="srchDgtlClrcsNm" class="require" title="디지털문화명칭" placeholder="명칭을 입력하세요." />
		</div>
	</div>
	<div>
		<strong class="require">디지털문화자원 설명</strong>
		<div class="fm-textarea">
			<textarea id="srchClrcsExpln" row="5" col="10" class="require" title="디지털문화자원 설명" placeholder="설명을 입력하세요."></textarea>
		</div>
	</div>
	<div>
		<div class="uploadbox" id="thumnailImageBox">
			<c:if test="${!empty srchDgtlClrcsInfo.srchRprsImgFileStrgPathNm}">
				<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${srchDgtlClrcsInfo.srchRprsImgFileStrgPathNm}&fileNm=${srchDgtlClrcsInfo.srchRprsImgStrgFileNm}&atchFileGroupId=${srchDgtlClrcsInfo.srchRprsImgGroupIdVal}'/>" style="width: 100%; height: 100%" alt="">
			</c:if>
			<c:if test="${empty srchDgtlClrcsInfo.srchRprsImgFileStrgPathNm}">
				<strong>디지털문화자원<br />썸네일이 등록되지 않았습니다.</strong>
				<p>썸네일 및 대표 파일을 선택하여 주세요.</p>
			</c:if>


		</div>
		<div class="btn-wrap align-right">
			<label for="thumnailFile">
				<div class="btns">파일선택</div>
			</label>
			<input type="file" id="thumnailFile" name="thumnailFile" style="display: none">
			<%--            <button type="button" class="btns size-small">업로드</button>--%>
			<%--            <button type="button" class="btns size-small">초기화</button>--%>
		</div>
	</div>
</div>
<div class="write-wrap">
	<div class="between">
		<div>
			<strong class="require">기관</strong>
			<div class="fm-focus fm-select">
				<select id="srchInstTypeCd" name="srchInstTypeCd" data-type="1" class="require" title="기관">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchInstTypeCdVal == ''}">selected</c:if>>기관</option>
					<c:if test="${!empty instInfoList}">
						<c:forEach var="typeCdRow" items="${instInfoList}">
							<%--									<option value="${typeCdRow.instId}" <c:if test="${srchDgtlClrcsInfo.srchInstTypeCdVal == typeCdRow.instId }">selected</c:if>>${typeCdRow.instNm}</option>--%>
							<option value="${typeCdRow.instId}">${typeCdRow.instNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong>기관별 분류(유형)</strong>
			<div class="fm-ele" data-size="100p">
				<input type="text" id="srchInstCtgryNm" name="srchInstCtgryNm" title="분류명" placeholder="분류명을 입력하세요." value="${srchDgtlClrcsInfo.srchInstCtgryNmVal}"/>
			</div>
		</div>
	</div>
	<div class="between">
		<div>
			<strong>서비스 유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchSvcTypeCd" name="srchSvcTypeCd" data-type="6">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchSvcTypeCdVal == ''}">selected</c:if>>유형을 선택하세요</option>
					<c:if test="${!empty serviceCodeList}">
						<c:forEach var="fldCdRow" items="${serviceCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong>산업 유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchIndrTypeCd" name="srchIndrTypeCd" data-type="6">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchIndrTypeCdVal == ''}">selected</c:if>>유형을 선택하세요</option>
					<c:if test="${!empty indrCodeList}">
						<c:forEach var="fldCdRow" items="${indrCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between">
		<div>
			<strong class="require">데이터 유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchDataTypeCd" name="srchDataTypeCd" class="require"  title="데이터 유형" data-type="4">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchDataTypeCdVal == ''}">selected</c:if>>유형을 선택하세요</option>
					<c:if test="${!empty dataCodeList}">
						<c:forEach var="fldCdRow" items="${dataCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong class="require">데이터 세부유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchDataDtlTypeCd" name="srchDataDtlTypeCd" class="require" title="데이터 세부유형" data-type="11">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchDataDtlTypeCdVal == ''}">selected</c:if>>세부유형을 선택하세요.</option>
					<c:if test="${!empty dataDtlCodeList}">
						<c:forEach var="fldCdRow" items="${dataDtlCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between">
		<div>
			<strong class="require">국가/시대</strong>
			<div class="fm-focus fm-select">
				<select id="srchNationTypeCd" name="srchNationTypeCd" title="국가 유형" data-type="10" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchNationTypeCdVal == ''}">selected</c:if>>국가를 선택하세요</option>
					<c:if test="${!empty nationCodeList}">
						<c:forEach var="fldCdRow" items="${nationCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong class="require">국가/시대 세부유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchNationDtlTypeCd" name="srchNationDtlTypeCd" data-type="3" title="시대 유형" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchNationDtlTypeCdVal == ''}">selected</c:if>>세부 유형을 선택하세요</option>
					<c:if test="${!empty nationDtlCodeList}">
						<c:forEach var="fldCdRow" items="${nationDtlCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between">
		<div>
			<strong class="require">공통분류</strong>
			<div class="fm-focus fm-select">
				<select id="srchCntTypeCd" name="srchCntTypeCd" title="콘텐츠 유형" data-type="10" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == ''}">selected</c:if>>유형을 선택하세요</option>
					<c:if test="${!empty cntCodeList}">
						<c:forEach var="fldCdRow" items="${cntCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong class="require">공통분류 세부유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchCntDtlTypeCd" name="srchCntDtlTypeCd" data-type="3" title="콘텐츠 세부유형" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchCntDtlTypeCdVal == ''}">selected</c:if>>세부 유형을 선택하세요</option>
					<c:if test="${!empty cntDtlCodeList}">
						<c:forEach var="fldCdRow" items="${cntDtlCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between">
		<div>
			<strong class="require">재질</strong>
			<div class="fm-focus fm-select">
				<select id="srchMtrTypeCd" name="srchMtrTypeCd" title="재질" data-type="6" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchMtrTypeCdVal == ''}">selected</c:if>>재질을 선택하세요</option>
					<c:if test="${!empty mtrCodeList}">
						<c:forEach var="fldCdRow" items="${mtrCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div>
			<strong class="require">재질 세부유형</strong>
			<div class="fm-focus fm-select">
				<select id="srchMtrDtlTypeCd" name="srchMtrDtlTypeCd" data-type="3" title="재질 세부유형" class="require">
					<option value="" <c:if test="${srchDgtlClrcsInfo.srchMtrDtlTypeCdVal == ''}">selected</c:if>>세부 유형을 선택하세요</option>
					<c:if test="${!empty mtrDtlCodeList}">
						<c:forEach var="fldCdRow" items="${mtrDtlCodeList}">
							<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
							<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between three-box">
		<div class="col-two-box">
			<strong>해쉬태그</strong>
			<div class="fm-ele width-auto">
				<input type="text" id="srchHashTag" placeholder="해쉬태그를 입력하세요." />
			</div>
			<button type="button" class="btns size-small" onclick="addHashTag()">추가</button>
			<button type="button" class="btns color-gray size-small" onclick="resetHashTag()">초기화</button>
			<div class="tag-wrap" id="tagWrap">
				<%--            <span class="tag">--%>
				<%--                #도자기--%>
				<%--                <button type="button" class="tag-delete"><span class="blind">삭제</span></button>--%>
				<%--            </span>--%>
				<%--            <span class="tag">--%>
				<%--                #도자기--%>
				<%--                <button type="button"><span class="blind">삭제</span></button>--%>
				<%--            </span>--%>

			</div>
		</div>
		<div>
			<strong class="require">저작권 유형</strong>
			<div class="fm-focus fm-select">
				<select id="cpyrTypeCd" name="cpyrTypeCd" class="require" title="저작권 유형">
					<option value="" >저작권 유형을 선택하세요.</option>
					<c:if test="${!empty cpyrTypeCmmnCdList}">
						<c:forEach var="cpyrCdRow" items="${cpyrTypeCmmnCdList}">
							<option value="<c:out value="${cpyrCdRow.cdId}"/>" <c:if test="${srchDgtlClrcsInfo.cpyrTypeCd == cpyrCdRow.cdId }">selected</c:if>><c:out value="${cpyrCdRow.cdNm}"/></option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="between three-box">
		<div>
			<strong class="require">기관자체 관리번호</strong>
			<div class="fm-ele" data-size="100p">
				<input type="text" id="srchDgtlInstItslMngNo" class="require" title="기관자체 관리번호" placeholder="기관자체 관리번호를 입력하세요." />
			</div>
		</div>
		<div>
			<strong class="require">공개여부</strong>
			<!-- 사용자 권한 유형이 USERTY0001 아닌 경우, 비공개 옵션만 렌더링 -->
			<c:if test="${UserAuthrtInfo.authrtTypeCd ne 'USERTY0001'}">
				<div class="fm-focus fm-select">
					<select id="srchRlsYn" name="srchRlsYn" class="require" title="공개여부">
						<c:if test="${srchDgtlClrcsInfo.srchPageModeVal ne 'modify'}">
							<option value="" disabled="disabled" selected="selected">기관담당자는 비공개만 선택 가능합니다.</option>
							<option value="N">비공개</option>
						</c:if>
						<c:if test="${srchDgtlClrcsInfo.srchPageModeVal eq 'modify'}">
							<c:if test="${srchDgtlClrcsInfo.srchRlsYnVal eq 'Y'}">
								<option value="Y">공개</option>
							</c:if>
							<c:if test="${srchDgtlClrcsInfo.srchRlsYnVal eq 'N'}">
								<option value="N">비공개</option>
							</c:if>
						</c:if>
					</select>
				</div>
			</c:if>
			<!-- 사용자 권한 유형이 USERTY0001 인 경우, 공개,비공개 옵션 렌더링 -->
			<c:if test="${UserAuthrtInfo.authrtTypeCd eq 'USERTY0001'}">
				<div class="fm-focus fm-select">
					<select id="srchRlsYn" name="srchRlsYn" class="require" title="공개여부">
						<option value="" disabled="disabled" selected="selected">공개여부를 선택하세요.</option>
						<option value="Y">공개</option>
						<option value="N">비공개</option>
					</select>
				</div>
			</c:if>
		</div>
		<div>
			<strong class="require">다운로드 가능여부</strong>
			<div class="fm-focus fm-select">
				<select id="dwnldAplcnYn" name="dwnldAplcnYn" class="require" title="다운로드 가능여부">
					<option value="" >다운로드 가능여부를 선택하세요.</option>
					<option value="Y" <c:if test="${srchDgtlClrcsInfo.dwnldAplcnYn == 'Y'}">selected</c:if>>가능</option>
					<option value="N" <c:if test="${srchDgtlClrcsInfo.dwnldAplcnYn == 'N'}">selected</c:if>>불가능</option>
				</select>
			</div>
		</div>
	</div>
</div>
<div class="btn-wrap">
	<button type="button" class="btns color-gray" onclick="goBack()">취소</button>
	<button type="button" class="btns" onclick="saveData();">저장</button>
</div>