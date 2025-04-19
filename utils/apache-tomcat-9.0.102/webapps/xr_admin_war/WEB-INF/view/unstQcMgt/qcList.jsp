<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>

<div class="contants">
    <div class="control-wrap">
        <form name="frmDgtlClrcsSrch" id="frmDgtlClrcsSrch">
            <input type="hidden" class="serverValue" id="crtrClsfCdVal" name="crtrClsfCdVal" value="<c:out value="${searchInfo.crtrClsfCdVal}"/>">
            <input type="hidden" class="serverValue" id="prdctUsgCdVal" name="prdctUsgCdVal" value="<c:out value="${searchInfo.prdctUsgCdVal}"/>">
            <input type="hidden" class="serverValue" id="useYnVal" name="useYnVal" value="<c:out value="${searchInfo.useYn}"/>">
            <input type="hidden" class="serverValue" id="srchKeywordVal" name="srchKeywordVal" value="<c:out value="${searchInfo.srchKeywordVal}"/>">
            <input type="hidden" class="serverValue" id="paramCrtrId" name="paramCrtrId" value="">

            <!-- 페이징 변수 -->
            <input type="hidden" id="pagePerBlock" name="pagePerBlock" value="<c:out value="${searchInfo.pagePerBlock}"/>">
            <input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="<c:out value="${searchInfo.recordCountPerPage}"/>">
            <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${searchInfo.currentPage}"/>">
            <input type="hidden" id="calculPage" name="calculPage" value="<c:out value="${searchInfo.calculPage}"/>">
            <input type="hidden" id="totalRecord" name="totalRecord" value="<c:out value="${searchInfo.totalRecord}"/>">
            <input type="hidden" id="totalPage" name="totalPage" value="<c:out value="${searchInfo.totalPage}"/>">

            <div class="search">
                <div class="filter">
                    <form id="selectList" name="selectList">
                    <div class="row">
                        <div class="fm-focus fm-select server-bind">
                            <select id="crtrClsfCd" name="crtrClsfCd" data-type="1">
                                <option value="" <c:if test="${searchInfo.crtrClsfCd == ''}">selected</c:if>>데이터 유형</option>
                                <c:if test="${!empty dataCodeList}">
                                    <c:forEach var="fldCdRow" items="${dataCodeList}">
                                        <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${searchInfo.crtrClsfCd == fldCdRow.codeId }">selected</c:if>>
                                            <c:out value="${fldCdRow.codeNm}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="fm-focus fm-select server-bind" >
                            <select id="prdctUsgCd" name="prdctUsgCd" data-type="10">
                                <option value="" <c:if test="${searchInfo.prdctUsgCd == ''}">selected</c:if>>세부 유형</option>
                                <c:if test="${!empty dataDtlCodeList}">
                                    <c:forEach var="fldCdRow" items="${dataDtlCodeList}">
                                        <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${searchInfo.prdctUsgCd == fldCdRow.codeId }">selected</c:if>>
                                            <c:out value=" ${fldCdRow.codeNm}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="fm-focus fm-select server-bind" >
                            <select id="useYn" name="useYn" data-type="10">
                                <option value="" <c:if test="${searchInfo.useYn == ''}">selected</c:if>>사용 여부</option>
                                <option value="Y" <c:if test="${searchInfo.useYn == 'Y' }">selected</c:if>>Y</option>
                                <option value="N" <c:if test="${searchInfo.useYn == 'N' }">selected</c:if>>N</option>
                            </select>
                        </div>
                    </div>
                    </form>

                    <div class="row">
                        <div class="fm-ele" data-size="100p">
                            <input type="text" id="srchKeyword" name="srchKeyword" value="<c:out value="${searchInfo.srchKeyword}"/>" placeholder="검색어를 입력하세요.">
                        </div>
                    </div>

                </div>
                <div class="btn-wrap">
                    <button type="button" class="btns" id="btnSrch" onclick="javascript:refreshList(); return false;">조회</button>
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
        <strong>전체건수 : <b><fmt:formatNumber value="${searchInfo.totalRecord}" pattern="#,###" /></b></strong>
        <c:if test="${authority eq 'AUTH000001'}">
            <button type="button" class="btns" onclick="moveRegPage();">등록</button>
        </c:if>
    </div>

    <div class="table-wrap">
        <table>
            <colgroup>
                <col width="6.5%"/><col width="*"/><col width="10%"/><col width="10%"/><col width="5%"/>
                <col width="10%"/><col width="10%"/><col width="3%"/><col width="10%"/><col width="10%"/>
            </colgroup>
            <thead>
                <tr>
                    <th>순번</th>
                    <th>지표명</th>
                    <th>데이터 유형</th>
                    <th>세부 유형</th>
                    <th>지표수치</th>
                    <th>지표단위</th>
                    <th>지표연산</th>
                    <th>필수여부</th>
                    <th>등록일</th>
                    <th>등록자</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${!empty qcInfoList}">
                <c:forEach var="qcInfo" items="${qcInfoList}" varStatus="status">
                    <tr>
                        <td>${qcInfo.listQcNo}</td>
                        <!-- <td data-value ="<c:out value="${qcInfo.crtrId}"/>" onclick="moveDtlPage(this);" style="cursor: pointer; text-align: left;"><c:out value="${qcInfo.crtrNm}"/></td> -->
                        <td class="align-left">
                            <a href="#" data-value ="<c:out value="${qcInfo.crtrId}"/>" data-crtrCycl ="<c:out value="${qcInfo.crtrCycl}"/>" onclick="moveDtlPage(this);"><c:out value="${qcInfo.crtrNm}"/>
                        </td>
                        <td><c:out value="${qcInfo.crtrClsfNm}"/></td>
                        <td><c:out value="${qcInfo.prdctUsgNm}"/></td>
                        <td>
                            <c:out value="${qcInfo.stbltCrtrScr}"/>
                            <c:if test="${qcInfo.stbltMaxCrtrScr ne null and qcInfo.stbltMaxCrtrScr ne 0}">
                                <c:out value="~ ${qcInfo.stbltMaxCrtrScr}"/>
                            </c:if>
                        </td>
                        <td><c:out value="${qcInfo.crtrUnitNm}"/></td>
                        <td><c:out value="${qcInfo.scrClsfNm}"/></td>
                        <td><c:out value="${qcInfo.esntlInspYn}"/></td>
                        <td><c:out value="${qcInfo.frstRegDtV19}"/></td>
                        <td><c:out value="${pf:getMaskingID(qcInfo.frstRgtrId)}"/></td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
    <!-- pagination 활성화 active -->
    <div class="align_flex paging">
        <c:import url="/WEB-INF/view/include/custom_paging.jsp">
            <c:param name="currentPage" value="${searchInfo.currentPage}"/>
            <c:param name="totalPage" value="${searchInfo.totalPage}"/>
            <c:param name="totalRecord" value="${searchInfo.totalRecord}"/>
            <c:param name="recordCountPerPage" value="${searchInfo.recordCountPerPage}"/>
            <c:param name="pagePerBlock" value="${searchInfo.pagePerBlock}"/>
            <c:param name="calculPage" value="${searchInfo.calculPage}"/>
            <c:param name="funNm" value="fnList" />
            <c:param name="url" value="qcList.do" />
        </c:import>
    </div>
</div>

<script type="text/javascript">
    function refreshList(){
        const frm = document.frmDgtlClrcsSrch;
        frm.submit();
    }
    window.fnList = function(action, mapKVs) {
        document.getElementById('currentPage').value = mapKVs.currentPage;

        goInstSrchParam();
    }


    const moveDtlPage = function (target) {
        const clrcsId = target.dataset.value;
        const crtrCycl = target.dataset.crtrcycl;

        let frm = document.frmDgtlClrcsSrch;
        frm.paramCrtrId.value = clrcsId;

        const input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "paramCrtrCycl");
        input.setAttribute("value", crtrCycl);

        frm.appendChild(input);
        frm.action = contextPath + '/qcMgt/qcDtl.do';
        frm.submit();
    }

    const moveRegPage = function () {
        //서버변수 추기화
        const serverValueList = document.querySelectorAll('input.serverValue');
        serverValueList.forEach(function (serverValue) {
            serverValue.value = '';
        });

        let frm = document.frmDgtlClrcsSrch;
        frm.enctype = 'multipart/form-data';
        frm.action = contextPath + '/qcMgt/qcReg.do';
        frm.submit();
    }


    // DOM 생성 후 실행
    document.addEventListener('DOMContentLoaded', async function() {
        console.log("DOMContentLoaded");

        init();
    });

    const init = async function() {
        //검색 TAG 초기화
        console.log("init");

        //검색 TAG 초기화
        document.querySelectorAll('.tag-wrap').forEach(function(tagWrap) {
            while (tagWrap.firstChild) {
                tagWrap.removeChild(tagWrap.firstChild);
            }
        });
        // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
        setupAllChangeHandler();

        //서버에서 받아온 데이터를 hidden input에 설정
        setParamToObject();
    }
    $('.tag-wrap').empty();

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
            await cmmn_listToSelectBox(contextPath + '/cmmn/codeList.do', detailSelectId, 'contents', code, upperCodeId, detailTypeLabel);

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

    const goInstSrchParam  = function (){
        document.getElementById('frmDgtlClrcsSrch').action = contextPath + '/qcMgt/qcList.do';
        document.getElementById('frmDgtlClrcsSrch').submit();
    }

    /**
     * 서버에서 받아온 변수를 해당 input, select box에 값으로 설정
     */
    const setParamToObject = function() {

        const allInputAndSelectBoxes = document.querySelectorAll('input, select');
        allInputAndSelectBoxes.forEach(function (box) {


            const boxId = box.id;
            const hiddenInputValue = document.getElementById(box.id + 'Val')?.value;
            if (hiddenInputValue) {
                box.value = hiddenInputValue;
                if (box.tagName.toLowerCase() === 'input') {
                    setSrchParamToTag(box.value);
                } else if (box.tagName.toLowerCase() === 'select') {
                    setSrchParamToTag(box.options[box.selectedIndex].textContent, box.id);
                }
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
            value = text = target.value;
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
        if(tartId == 'crtrClsfCd') {
            listToSelectBox(contextPath + '/qcMgt/codeList.do', 'prdctUsgCd', 'CLSF000024', value, '콘텐츠세부유형');
            deleteTagById('srchCntDtlTypeCd', 'child');
        }

        if (value !== '') {
            // 선택된 값으로 태그 생성
            setSrchParamToTag(text, tartId);
        }
        event.stopPropagation();
    }

    const listToSelectBox = async  function (url, selectBoxId, codeId, upperCodId, nullOptionText) {
        console.log("cmmn_listToSelectBox");
        var selectBox = document.getElementById(selectBoxId);

        // select 박스 초기화
        selectBox.innerHTML = "";

        // 새로운 옵션 생성 및 추가
        const addOption = (value, text) => {
            let option = document.createElement("option");
            option.value = value;
            option.text = text;
            selectBox.appendChild(option);
            console.log("cmmn_listToSelectBox : Data addOption");
        };

        if (!upperCodId) {
            addOption("", nullOptionText);
        } else {
            const response = await axios.post(url, {
                codeId: codeId,
                upperCodeId: upperCodId
            }).then(function (response) {
                console.log("cmmn_listToSelectBox : Data Success");

                if (response.data.length > 0) {
                    addOption("", "전체");  // 기본 옵션 추가
                    response.data.forEach(item => addOption(item.codeId, item.codeNm));
                }
            }).catch(function (error) {
                console.error(error);
            });
        }
    };

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

        if(targetId == 'crtrClsfCd') {
            deleteTagById('prdctUsgCd', 'child');
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
                // document.getElementById(targetId + 'Val').value = '';
            }
            targetTag.parentElement.remove();
        }
    };

</script>