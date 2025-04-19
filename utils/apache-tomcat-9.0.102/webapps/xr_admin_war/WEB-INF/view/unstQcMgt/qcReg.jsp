<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form name="frmQcSrch" id="frmQcSrch" method="POST">
    <input type="hidden" class="serverValue" id="paramCrtrId" name="paramCrtrId" value="<c:out value="${qcInfo.crtrId}"/>">
    <input type="hidden" class="serverValue" id="paramWrtMode" name="paramWrtMode" value="<c:out value="${searchInfo.paramWrtMode}"/>">
    <input type="hidden" class="serverValue" id="crtrCycl" name="crtrCycl" value="<c:out value="${searchInfo.crtrCycl}"/>">
    <div class="contants">
        
        <div class="write-wrap bg-Gray">
            <div>
                <strong class="require">데이터 유형</strong>
                <div class="between">
                    <div class="fm-focus fm-select">
                        <select id="crtrClsfCd" name="crtrClsfCd" class="require"  title="데이터 유형" data-type="4" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.crtrClsfCd == ''}">selected</c:if>>유형을 선택하세요</option>
                            <c:if test="${!empty dataCodeList}">
                                <c:forEach var="fldCdRow" items="${dataCodeList}">
                                    <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${qcInfo.crtrClsfCd == fldCdRow.codeId }">selected</c:if>>
                                            <c:out value="${fldCdRow.codeNm}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="fm-focus fm-select">
                        <select id="prdctUsgCd" name="prdctUsgCd" class="require" title="데이터 세부유형" data-type="11" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.prdctUsgCd == ''}">selected</c:if>>세부유형을 선택하세요.</option>
                            <c:forEach var="fldCdRow" items="${dataDtlCodeList}">
                                <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${qcInfo.prdctUsgCd == fldCdRow.codeId }">selected</c:if>>
                                        <c:out value="${fldCdRow.codeNm}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div>
                <strong class="require">지표명칭</strong>
                <div class="fm-ele" data-size="w600">
                    <input type="text" id="crtrNm" name="crtrNm" class="require" title="지표명칭" value="<c:out value="${qcInfo.crtrNm}"/>"  />
                </div>
            </div>
            <div class="between">
                <div>
                    <strong class="require">지표 단위</strong>
                    <div class="fm-focus fm-select">
                        <select id="crtrUnitCd" name="crtrUnitCd" class="require"  title="지표 단위" data-type="4" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.crtrUnitCd == ''}">selected</c:if>>유형을 선택하세요</option>
                            <c:if test="${!empty unitCodeList}">
                                <c:forEach var="fldCdRow" items="${unitCodeList}">
                                    <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${qcInfo.crtrUnitCd == fldCdRow.codeId }">selected</c:if>>
                                            <c:out value="${fldCdRow.codeNm}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div>
                    <strong class="require">지표 연산방법</strong>
                    <div class="fm-focus fm-select">
                        <select id="scrClsfCd" name="scrClsfCd" class="require"  title="지표 연산방법" data-type="4" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.crtrClsfCd == ''}">selected</c:if>>유형을 선택하세요</option>
                            <c:if test="${!empty clsfCodeList}">
                                <c:forEach var="fldCdRow" items="${clsfCodeList}">
                                    <option value="<c:out value="${fldCdRow.codeId}"/>" <c:if test="${qcInfo.scrClsfCd == fldCdRow.codeId }">selected</c:if>>
                                            <c:out value="${fldCdRow.codeNm}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
            </div>
            <div id="stbltCrtrScrContainer">
                <strong class="require">지표수치</strong>
                <div class="fm-ele" data-size="w600">
                    <input type="text" id="stbltCrtrScr" name="stbltCrtrScr" class="require" title="지표수치"
                            onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)" value="<c:out value="${qcInfo.stbltCrtrScr}"/>" />
                </div>
            </div>
            <div class="between">
                <div>
                    <strong class="require">필수여부</strong>
                    <div class="fm-focus fm-select">
                        <select id="esntlInspYn" name="esntlInspYn" class="require"  title="필수여부" data-type="4" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.esntlInspYn == ''}">selected</c:if>>유형을 선택하세요</option>
                            <option value="Y" <c:if test="${qcInfo.esntlInspYn == 'Y' }">selected</c:if>>Y</option>
                            <option value="N" <c:if test="${qcInfo.esntlInspYn == 'N' }">selected</c:if>>N</option>
                        </select>
                    </div>
                </div>
                <div>
                    <strong class="require">사용여부</strong>
                    <div class="fm-focus fm-select">
                        <select id="useYn" name="useYn" class="require"  title="사용여부" data-type="4" style="padding-left: 10px;">
                            <option value="" <c:if test="${qcInfo.useYn == ''}">selected</c:if>>유형을 선택하세요</option>
                            <option value="Y" <c:if test="${qcInfo.useYn == 'Y' }">selected</c:if>>Y</option>
                            <option value="N" <c:if test="${qcInfo.useYn == 'N' }">selected</c:if>>N</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="between">
                <div>
                    <strong class="require">PBR 적용 여부</strong>
                    <div class="fm-focus fm-select" data-size="100p">
                        <select id="pbrAplcnYn" name="pbrAplcnYn" class="require"  title="PBR 적용 여부" data-type="4" style="padding-left: 10px;">
                            <option value="">유형을 선택하세요.</option>
                            <option value="Y" <c:if test="${qcInfo.pbrAplcnYn == 'Y' }">selected</c:if>>Y</option>
                            <option value="N" <c:if test="${qcInfo.pbrAplcnYn == 'N' }">selected</c:if>>N</option>
                        </select>
                    </div>
                </div>
                <div>
                    <strong class="require">등록자</strong>
                    <div class="fm-ele" data-size="w300">
                        <%--<input type="text" id="frstRgtrId" title="등록자" value="<c:out value="${unstQcInfoVo.frstRgtrId}"/>" readonly/>--%>
                        <c:choose>
                            <c:when test="${searchInfo.paramWrtMode eq 'edit'}">
                                <input type="text" id="lastMdfrId" name="lastMdfrId" title="등록자" value="<c:out value='${username}'/>" readonly/>
                            </c:when>
                            <c:otherwise>
                                <input type="text" id="frstRgtrId" name="frstRgtrId" title="등록자" value="<c:out value='${username}'/>" readonly/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

        </div>
        
        <div class="btn-wrap align-right">
            <c:if test="${searchInfo.paramWrtMode eq 'edit'}">
                <button type="button" class="btns color-gray" onclick="javascript:goDtl(); return false;">취소</button>
            </c:if>
            <button type="button" class="btns color-gray" onclick="javascript:goList(); return false;">목록</button>
            <button type="button" class="btns" onclick="javascript:saveData(); return false;">저장</button>
        </div>
    </div>
</form>
<script src="<c:url value="/js/cmmnLibrary.js"/>"></script>
<script type="text/javascript">

    // import {func} from "../../../js/lib/jsm/nodes/code/FunctionNode";

    const clsSelect = document.getElementById("crtrClsfCd");

    const handleChangeEvent =  function(event) {
        const target = event.target;
        const tartId = target.id;
        let value, text;

        const selectedOption = target.options[target.selectedIndex];
        value = selectedOption.value;
        text = selectedOption.textContent;

        // 선택된값을 hidden input에 저장
        // document.getElementById(tartId + 'Val').value = value;

        listToSelectBox(contextPath + '/qcMgt/codeList.do', 'prdctUsgCd', 'CLSF000024', value, '콘텐츠세부유형');

        event.stopPropagation();
    }

    clsSelect.addEventListener('change', handleChangeEvent)

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
    document.addEventListener('DOMContentLoaded', function () {
        const scrClsfCdElement = document.getElementById('scrClsfCd');
        const inputContainer = document.getElementById('stbltCrtrScrContainer');
        const targetInput = document.getElementById('stbltCrtrScr')

        handleScrClsfCdChange(scrClsfCdElement.value,inputContainer,targetInput);

        document.getElementById('scrClsfCd').addEventListener('change', function() {
            handleScrClsfCdChange(scrClsfCdElement.value,inputContainer,targetInput);
        });

        function handleScrClsfCdChange(selectedValue, inputContainer, targetInput){
            if(selectedValue === 'SCR08'){
                targetInput.parentElement.removeAttribute('data-size');

                const newDiv = document.createElement('div');
                newDiv.className = 'fm-ele';

                // 물결표시(~)를 포함한 strong 엘리먼트 생성
                const waveElement = document.createElement('span');
                waveElement.innerHTML = '~  ';  // 물결표시

                const newInput = targetInput.cloneNode(true);
                newInput.id = "stbltMaxCrtrScr"
                newInput.name = "stbltMaxCrtrScr"

                <c:if test="${qcInfo.stbltMaxCrtrScr ne null and qcInfo.stbltMaxCrtrScr ne 0}">
                    newInput.value = <c:out value="${qcInfo.stbltMaxCrtrScr}"/>
                </c:if>

                newDiv.appendChild(newInput);

                inputContainer.appendChild(waveElement);
                inputContainer.appendChild(newDiv);
            } else {
                while (inputContainer.children.length > 2) {
                    inputContainer.removeChild(inputContainer.lastChild);
                }
                targetInput.parentElement.setAttribute('data-size','w600');
            }
        }
    });



    function goList(){
        if (document.getElementById("paramWrtMode").value !== "edit") {
            window.history.back();
        } else {
            const frm = document.frmQcSrch;
            frm.crtrClsfCd.value = "";
            frm.prdctUsgCd.value = "";
            frm.paramCrtrId.value = "";
            frm.stbltCrtrScr.value= 0;
            frm.useYn.value = "";
            frm.action = contextPath + "/qcMgt/qcList.do";
            frm.method = "GET";
            frm.submit();
        }
    }

    function goDtl(){
        window.history.back();
    }
    const checkValidate = function (){
        const allInputAndSelectBoxes = document.querySelectorAll('input.require, select.require, textarea.require');
        try{
            allInputAndSelectBoxes.forEach(function(tab) {
                if(tab.value == ''){
                    alert(tab.title + '은(는) 필수 입력 항목입니다.');
                    tab.focus();
                    throw new Error(tab.title + '은(는) 필수 입력 항목입니다.');
                }
            });

            const stbltCrtrScr = document.getElementById('stbltCrtrScr');
            const stbltMaxCrtrScr = document.getElementById('stbltMaxCrtrScr');

            if(document.getElementById('scrClsfCd').value == 'SCR08'){
                if(parseFloat(stbltCrtrScr.value) > parseFloat(stbltMaxCrtrScr.value)) {
                    alert(stbltCrtrScr.title + '값을 확인해주세요');
                    stbltCrtrScr.focus();
                    throw new Error(stbltCrtrScr.title + '값을 확인해주세요.')
                }
            }

        }catch (e) {
            console.log(e);
            return false;
        }
        return true;
    }

    function saveData(){
        if(checkValidate()){
            const frm = document.frmQcSrch;
            frm.action = contextPath + "/qcMgt/qcSave.do";
            frm.submit();
        }
    }


</script>