<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">
	<div class="control-wrap">
		<form name="frmDgtlClrcsSrch" id="frmDgtlClrcsSrch" method="post" action="#">
			<input type="hidden" class="serverValue" id="srchDgtlClrcsNmVal" name="srchDgtlClrcsNmVal" value="${srchDgtlClrcsInfo.srchDgtlClrcsNmVal}">
			<input type="hidden" class="serverValue" id="srchInstTypeCdVal" name="srchInstTypeCdVal" value="${srchDgtlClrcsInfo.srchInstTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchCntTypeCdVal" name="srchCntTypeCdVal" value="${srchDgtlClrcsInfo.srchCntTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchCntDtlTypeCdVal" name="srchCntDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchCntDtlTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchDataTypeCdVal" name="srchDataTypeCdVal" value="${srchDgtlClrcsInfo.srchDataTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchDataDtlTypeCdVal" name="srchDataDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchDataDtlTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchNationTypeCdVal" name="srchNationTypeCdVal" value="${srchDgtlClrcsInfo.srchNationTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchNationDtlTypeCdVal" name="srchNationDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchNationDtlTypeCdVal}">
			<input type="hidden" class="serverValue" id="srchRlsYnVal" name="srchRlsYnVal" value="${srchDgtlClrcsInfo.srchRlsYnVal}">
			<input type="hidden" id="clrcsId" name="clrcsId" value="${srchInstInfo.clrcsId}">
			<input type="hidden" id="srchPageModeVal" name="srchPageModeVal" value="${srchDgtlClrcsInfo.srchPageModeVal}">
			<input type="hidden" id="srchSaveModeVal" name="srchSaveModeVal" value="${srchDgtlClrcsInfo.srchSaveModeVal}">


			<!-- 페이징 변수 -->
			<input type="hidden" id="pagePerBlock" name="pagePerBlock" value="${srchDgtlClrcsInfo.pagePerBlock}">
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${srchDgtlClrcsInfo.recordCountPerPage}">
			<input type="hidden" id="currentPage" name="currentPage" value="${srchDgtlClrcsInfo.currentPage}">
			<input type="hidden" id="calculPage" name="calculPage" value="${srchDgtlClrcsInfo.calculPage}">
			<input type="hidden" id="totalRecord" name="totalRecord" value="${srchDgtlClrcsInfo.totalRecord}">
			<input type="hidden" id="totalPage" name="totalPage" value="${srchDgtlClrcsInfo.totalPage}">




			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select server-bind">
							<select id="srchInstTypeCd" name="srchInstTypeCd" data-type="1" style="padding-left: 10px;">
								<option value="" <c:if test="${srchDgtlClrcsInfo.srchInstTypeCdVal == ''}">selected</c:if>>기관</option>
								<c:if test="${!empty instInfoList}">
									<c:forEach var="typeCdRow" items="${instInfoList}">
										<option value="${typeCdRow.instId}" <c:if test="${srchDgtlClrcsInfo.srchInstTypeCdVal == typeCdRow.instId }">selected</c:if>>${typeCdRow.instNm}</option>
<%--										<option value="${typeCdRow.instId}">${typeCdRow.instNm}</option>--%>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select server-bind" >
							<select id="srchCntTypeCd" name="srchCntTypeCd" data-type="10" style="padding-left: 10px;">
								<option value="" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == ''}">selected</c:if>>공통분류</option>
								<c:if test="${!empty cntCodeList}">
									<c:forEach var="fldCdRow" items="${cntCodeList}">
	<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
										<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchCntDtlTypeCd" name="srchCntDtlTypeCd" data-type="3" style="padding-left: 10px;">
								<option value="" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == ''}">selected</c:if>>공통분류세부</option>
								<c:if test="${!empty cntDtlCodeList}">
									<c:forEach var="fldCdRow" items="${cntDtlCodeList}">
										<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchDgtlClrcsInfo.srchCntTypeCdVal == fldCdRow.codeId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
										<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select server-bind" >
							<select id="srchDataTypeCd" name="srchDataTypeCd" data-type="4" style="padding-left: 10px;">
								<option value="" <c:if test="${srchDgtlClrcsInfo.srchDataTypeCdVal == ''}">selected</c:if>>데이터유형</option>
								<c:if test="${!empty dataCodeList}">
									<c:forEach var="fldCdRow" items="${dataCodeList}">
	<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
										<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchDataDtlTypeCd" name="srchDataDtlTypeCd" data-type="11" style="padding-left: 10px;">
								<option value="" <c:if test="${srchInstInfo.paramFldTypeCd == ''}">selected</c:if>>데이터세부유형</option>
								<c:if test="${!empty dataDtlCodeList}">
									<c:forEach var="fldCdRow" items="${dataDtlCodeList}">
										<%--									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>--%>
										<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchRlsYn" name="srchRlsYn" data-type="5" style="padding-left: 10px;">
								<option value="" <c:if test="${srchDgtlClrcsInfo.srchRlsYnVal == ''}">selected</c:if>>공개여부</option>
								<option value="Y" <c:if test="${srchDgtlClrcsInfo.srchRlsYnVal == 'Y'}">selected</c:if>>공개</option>
								<option value="N" <c:if test="${srchDgtlClrcsInfo.srchRlsYnVal == 'N'}">selected</c:if>>비공개</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fm-ele" data-size="100p">
							<input type="text" id="srchDgtlClrcsNm" name="srchDgtlClrcsNm" value="${srchDgtlClrcsInfo.srchDgtlClrcsNmVal}" placeholder="디지털문화자원명을 입력하세요.">
						</div>
					</div>

<%--
					<!-- 기존 상세조건 -->
					<div class="row">
						<span class="tit">국적 / 시대</span>
						<div class="fm-focus fm-select">
							<select id="srchNationTypeCd" name="srchNationTypeCd" data-type="6">
								<option value="" <c:if test="${srchInstInfo.paramFldTypeCd == ''}">selected</c:if>>국가</option>
								<c:if test="${!empty nationCodeList}">
								<c:forEach var="fldCdRow" items="${nationCodeList}">
									&lt;%&ndash;									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>&ndash;%&gt;
								<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
								</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchNationDtlTypeCd" name="srchNationDtlTypeCd" data-type="12">
								<option value="" <c:if test="${srchInstInfo.paramFldTypeCd == ''}">selected</c:if>>시대</option>
								<c:if test="${!empty nationDtlCodeList}">
									<c:forEach var="fldCdRow" items="${nationDtlCodeList}">
										&lt;%&ndash;									<option value="${fldCdRow.codeId}" <c:if test="${srchInstInfo.paramFldTypeCd == fldCdRow.cdId }">selected</c:if>>${fldCdRow.codeNm}</option>&ndash;%&gt;
										<option value="${fldCdRow.codeId}">${fldCdRow.codeNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="tit">소장품명</span>
						<div class="fm-ele">
							<input type="text"  id="srchInstNm" name="srchInstNm"  data-size="w419" placeholder="소장품명을 입력하세요." />
						</div>
					</div>
					<div class="row">
						<span class="tit">재질</span>
						<div class="fm-focus fm-select">
							<select id="" name="" class="" title="금속">
								<option value="" disabled="disabled" selected="selected">금속</option>
							</select>
						</div>
						<span class="tit">작가</span>
						<div class="fm-ele">
							<input type="text" id="" data-size="w419" placeholder="작가명을 입력하세요." />
						</div>
					</div>
					<div class="row">
						<span class="tit">게시</span>
						<div class="fm-focus fm-select">
							<select id="" name="" class="" title="게시">
								<option value="" disabled="disabled" selected="selected">게시</option>
							</select>
						</div>
						<span class="tit">일자</span>
						<div class="fm-ele" data-size="w200">
							<input type="date" id="" placeholder="시작일" />
						</div>
						<span>~</span>
						<div class="fm-ele" data-size="w200">
							<input type="date" id="" placeholder="종료일" />
						</div>
					</div>
					<!-- // 기존 상세조건 -->
--%>

				</div>
				<div class="btn-wrap">
					<button type="button" class="btns small black" id="btnSrch" onclick="javascript:goInstSrchParam(1); return false;">조회</button>
				</div>
			</div>
		</form>
	</div>
	<div class="tag-wrap">
            <span class="tag">
                #도자기
                <button type="button" class="tag-delete"><span class="blind">삭제</span></button>
            </span>
		<span class="tag">
                #도자기
                <button type="button"><span class="blind">삭제</span></button>
            </span>
		<button type="button" class="reset">초기화</button>
	</div>
	<div class="list-option top between">
		<strong>전체건수 : <b>${srchDgtlClrcsInfo.totalRecord}</b></strong>
		<div>
		<button type="button" class="btns small blue" onclick="moveRegPage();">등록</button>
		<button type="button" class="btns small blue" onclick="moveMultiRegPage();">일괄등록</button>
		</div>
	</div>
	<div class="table-wrap">
		<table>
			<caption>디지털문화자원 목록</caption>
			<colgroup>
				<col width="6.5%"/><col width="*"/><col width="22%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>데이터 명</th>
					<th>기관</th>
					<th>데이터 유형</th>
					<th>공통분류</th>
					<th>공개여부</th>
					<th>크기</th>
					<th>조회수</th>
				</tr>
			</thead>
		<tbody>
			<c:if test="${!empty dgtlClrcsInfoList}">
				<c:forEach var="dgtlClrcsInfo" items="${dgtlClrcsInfoList}" varStatus="status">
				<tr>
					<td>${dgtlClrcsInfo.rowNumber}</td>
					<td class="align-left"><a href="javascript:void(0)" data-value ="${dgtlClrcsInfo.clrcsId}" onclick="moveDtlPage(this);">${dgtlClrcsInfo.clrcsNm}</a></td>
					<td>${dgtlClrcsInfo.instNm}</td>
					<td>${dgtlClrcsInfo.dataTypeCtgryNm}</td>
					<td>${dgtlClrcsInfo.contsTypeCtgryNm}</td>
					<td>
						<c:if test="${dgtlClrcsInfo.rlsYn == 'Y'}">
							공개
						</c:if>
						<c:if test="${dgtlClrcsInfo.rlsYn == 'N'}">
							비공개
						</c:if>
					</td>
					<td><p class="ellipsis">${dgtlClrcsInfo.clrcsSzCn}</p></td>
					<td>${dgtlClrcsInfo.inqCnt}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty dgtlClrcsInfoList}">
				<tr>
					<td colspan="8">검색조건에 맞는 데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</div>
	<!-- pagination 활성화 active -->
	<c:import url="/WEB-INF/view/include/custom_paging.jsp">
		<c:param name="currentPage" value="${srchDgtlClrcsInfo.currentPage}"/>
		<c:param name="totalPage" value="${srchDgtlClrcsInfo.totalPage}"/>
		<c:param name="totalRecord" value="${srchDgtlClrcsInfo.totalRecord}"/>
		<c:param name="recordCountPerPage" value="${srchDgtlClrcsInfo.recordCountPerPage}"/>
		<c:param name="pagePerBlock" value="${srchDgtlClrcsInfo.pagePerBlock}"/>
		<c:param name="calculPage" value="${srchDgtlClrcsInfo.calculPage}"/>
		<c:param name="funNm" value="fnList" />
		<c:param name="url" value="dgtlMgtList.do" />
	</c:import>
</div>

<script type="text/javascript">
window.onpageshow = function (event) {
	
	if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		//뒤로 가기 - 새로고침
		window.location.reload();
	}
};

    window.fnList = function(action, mapKVs) {
		// currentPage 파라미터 추가
		document.getElementById('currentPage').value = mapKVs.currentPage;

        goInstSrchParam(mapKVs.currentPage);
    }


    const moveDtlPage = function (target) {
		const clrcsId = target.dataset.value;
		document.getElementById('clrcsId').value = clrcsId;
		document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtDtl.do';
		document.getElementById('frmDgtlClrcsSrch').submit();
	}

	const moveRegPage = function () {
		//서버변수 추기화
		const serverValueList = document.querySelectorAll('input.serverValue');
		serverValueList.forEach(function (serverValue) {
			serverValue.value = '';
		});

		document.getElementById('frmDgtlClrcsSrch').enctype = 'multipart/form-data';



		document.getElementById('srchPageModeVal').value = 'reg';
		//document.getElementById('srchSaveModeVal').value = 'i';

		document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtReg.do';
		document.getElementById('frmDgtlClrcsSrch').submit();
	}


    const moveMultiRegPage = function (){
        document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtMultiReg.do';
        document.getElementById('frmDgtlClrcsSrch').submit();
	}


	// DOM 생성 후 실행
	document.addEventListener('DOMContentLoaded', async function() {
		//console.log("DOMContentLoaded");

        init();
	});

    window.onload = function() {
        //console.log("window.onload");
    }

	const init = async function() {
		//검색 TAG 초기화
		//console.log("init");

		//검색 TAG 초기화
		document.querySelectorAll('.tag-wrap').forEach(function(tagWrap) {
			while (tagWrap.firstChild) {
				tagWrap.removeChild(tagWrap.firstChild);
			}
		});
		// // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
		setupAllChangeHandler();

		//서버에서 받아온 데이터를 hidden input에 설정
		setParamToObject();
	}
		//$('.tag-wrap').empty();

	/**
	 * 특정 셀렉트 BOX 이벤트 핸들러 등록
	 * @param selectId
	 * @param detailSelectId
	 * @param code
	 * @param detailTypeLabel
	 */
	const setupSelectChangeHandler = async function (selectId, detailSelectId, code, detailTypeLabel) {

		const selectElement = document.getElementById(selectId);

		selectElement.addEventListener('change', async function() {
			const upperCodeId = this.value;

			//상세 콤보박스 조회
			await cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', detailSelectId, 'contents', code, upperCodeId, detailTypeLabel);

            document.getElementById(selectId + 'Val').value = value;



            if (upperCodeId === '') {
				deleteTagById(selectId);
				deleteTagById(detailSelectId);
			} else {
				deleteTagById(detailSelectId);
			}
		});
	}

	const setupAllChangeHandler = function() {
		// 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
		const allInputAndSelectBoxes = document.querySelectorAll('input, select');
		allInputAndSelectBoxes.forEach(function (box) {
			box.addEventListener('change', handleChangeEvent);
		});
	}

	const goInstSrchParam  = function (page){
        document.getElementById('currentPage').value = page;
		document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtList.do';
		document.getElementById('frmDgtlClrcsSrch').submit();
	}

	/**
	 * 서버에서 받아온 변수를 해당 input, select box에 값으로 설정
	 */
	const setParamToObject = function() {

		const allInputAndSelectBoxes = document.querySelectorAll('input, select');
		allInputAndSelectBoxes.forEach(function (box) {


			const hiddenInputValue = document.getElementById(box.id + 'Val')?.value;
			if (hiddenInputValue) {
				box.value = hiddenInputValue;
                if (box.tagName.toLowerCase() === 'input') {
                    setSrchParamToTag(box.value);
                } else if (box.tagName.toLowerCase() === 'select') {
                    setSrchParamToTag(box.options[box.selectedIndex].textContent, box.id);
                }


						//= function (param, tartId) {
				// 수동으로 이벤트 트리거 발생
				//var event = new Event('change', { bubbles: true });
				//box.dispatchEvent(event);
			}
		});
	};


	/**
	 * input 및 select 박스 이벤트 핸들러 등록
	 * @param event
	 */
	const handleChangeEvent =  function(event) {
		const target = event.target;
		const tartId = target.id;
		let value, text;

		// input 박스와 select 박스 구분
		if (target.tagName.toLowerCase() === 'input') {
			value = target.value;
            text = target.value;
		} else if (target.tagName.toLowerCase() === 'select') {
			const selectedOption = target.options[target.selectedIndex];
			value = selectedOption.value;
			text = selectedOption.textContent;
		} else {
			return; // input 또는 select가 아닌 경우 함수 종료
		}

		// 선택된값을 hidden input에 저장
		document.getElementById(tartId + 'Val').value = value;


		// 해당 태그 삭제
		deleteTagById(tartId, 'parent');
        if(tartId == 'srchCntTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchCntDtlTypeCd', 'contents', 'CLRCSCT003', value, '콘텐츠세부유형');
            deleteTagById('srchCntDtlTypeCd', 'child');
		}else if (tartId =='srchDataTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchDataDtlTypeCd', 'data', 'CLRCSCT002', value, '데이터세부유형');
            deleteTagById('srchDataDtlTypeCd', 'child');
        }else if (tartId =='srchNationTypeCd') {
            cmmn_listToSelectBox(contextPath +'/cmmn/codeList.do', 'srchNationDtlTypeCd', 'nation', 'CLRCSCT006', value, '시대');
			deleteTagById('srchNationDtlTypeCd', 'child');
		}

		if (value !== '') {
			// 선택된 값으로 태그 생성
			setSrchParamToTag(text, tartId);
		}
		event.stopPropagation();
	}







    /**
	 * 선택한 값으로 태그 생성
     * @param param : 태그에 표시할 값
     * @param tartId : 선택한 값의 selectbox id
     */
	const setSrchParamToTag = function (param, tartId) {
		// 새로운 태그 요소 생성
		const tagSpan = document.createElement('span');
		tagSpan.className = 'tag';
		tagSpan.textContent = param;

		// 삭제 버튼 생성
		const deleteButton = document.createElement('button');
		deleteButton.type = 'button';
		deleteButton.className = 'tag-delete';
		deleteButton.dataset.value = tartId;
		deleteButton.innerHTML = '<span class="blind">삭제</span>';
		deleteButton.onclick = function() {
			deleteTag(this);
			return false;
		};

		// 태그 요소에 삭제 버튼 추가
		tagSpan.appendChild(deleteButton);

		// 생성된 태그를 DOM에 추가
		document.querySelector('.tag-wrap').appendChild(tagSpan);
	}


    /**
	 * 태그 삭제
     * @param target : 삭제할 태그의 버튼
     */
	const deleteTag = function (target) {

		const targetId = target.dataset.value;
        const targetType = document.getElementById(targetId).type;

        if(targetType == 'select-one') {
            document.getElementById(targetId).selectedIndex = 0;
        }else {
            document.getElementById(targetId).value = '';
        }
        document.getElementById(targetId + 'Val').value = '';

        target.parentElement.remove();

        if(targetId == 'srchCntTypeCd') {
            deleteTagById('srchCntDtlTypeCd', 'child');
        }else if(targetId == 'srchDataTypeCd') {
            deleteTagById('srchDataDtlTypeCd', 'child');
        } else if(targetId == 'srchNationTypeCd') {
			deleteTagById('srchNationDtlTypeCd', 'child');
		}
    }

    /**
	 * 태그 삭제
     * @param targetId : 삭제할 태그의 id
     */
	const deleteTagById = function (targetId, type) {

		const targetTag = document.querySelector('button[data-value="'+ targetId +'"]');
		if (targetTag) {
            if(type == 'child') {
                document.getElementById(targetId).selectedIndex = 0;
                document.getElementById(targetId + 'Val').value = '';
            }
			targetTag.parentElement.remove();
		}
	};




    // Dom 생성후 실행
	window.addEventListener('load', function() {


	});







    // 페이지에서 벗어날때 경고창 띄우기
	// window.addEventListener('beforeunload', function (e) {
	// 	var confirmationMessage = '정말로 페이지를 떠나시겠습니까?';
	// 	e.returnValue = confirmationMessage;
	// 	return confirmationMessage;
	// });

</script>