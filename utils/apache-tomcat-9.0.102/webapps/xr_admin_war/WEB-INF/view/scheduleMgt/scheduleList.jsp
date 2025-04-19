<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">
    <div class="control-wrap">
        <form name="frmScheduleSrch" id="frmScheduleSrch" method="post" action="#">

            <input type="hidden" class="serverValue" id="srchInstTypeCdVal" name="srchInstTypeCdVal" value="${srchScheduleInfo.srchInstTypeCdVal}">
            <input type="hidden" class="serverValue" id="srchUseYnVal" name="srchUseYnVal" value="${srchScheduleInfo.srchUseYnVal}">
            <input type="hidden" class="serverValue" id="srchScheduleNmVal" name="srchScheduleNmVal" value="${srchScheduleInfo.srchScheduleNmVal}">
            <input type="hidden" class="serverValue" id="srchExcnYnVal" name="srchExcnYnVal" value="${srchScheduleInfo.srchExcnYnVal}">
            <input type="hidden" class="serverValue" id="btjId" name="btjId" value="${srchScheduleInfo.btjId}">


            <!-- 페이징 변수 -->
            <input type="hidden" id="pagePerBlock" name="pagePerBlock" value="${srchScheduleInfo.pagePerBlock}">
            <input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${srchScheduleInfo.recordCountPerPage}">
            <input type="hidden" id="currentPage" name="currentPage" value="${srchScheduleInfo.currentPage}">
            <input type="hidden" id="calculPage" name="calculPage" value="${srchScheduleInfo.calculPage}">
            <input type="hidden" id="totalRecord" name="totalRecord" value="${srchScheduleInfo.totalRecord}">
            <input type="hidden" id="totalPage" name="totalPage" value="${srchScheduleInfo.totalPage}">

            <div class="search">
                <div class="filter">
                    <div class="row">
                        <div class="fm-focus fm-select server-bind">
                            <select id="srchInstTypeCd" name="srchInstTypeCd" data-type="1" style="padding-left: 10px;">
                                <option value="" <c:if test="${srchScheduleInfo.srchInstTypeCdVal == ''}">selected</c:if>>기관</option>
                                <c:if test="${!empty instInfoList}">
                                    <c:forEach var="typeCdRow" items="${instInfoList}">
                                        <option value="${typeCdRow.instId}">${typeCdRow.instNm}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="fm-focus fm-select">
                            <select id="srchUseYn" name="srchUseYn" data-type="5" style="padding-left: 10px;">
                                <option value="" <c:if test="${srchScheduleInfo.srchUseYnVal == ''}">selected</c:if>>사용여부</option>
                                <option value="Y" <c:if test="${srchScheduleInfo.srchUseYnVal == 'Y'}">selected</c:if>>사용</option>
                                <option value="N" <c:if test="${srchScheduleInfo.srchUseYnVal == 'N'}">selected</c:if>>미사용</option>
                            </select>
                        </div>
                        <div class="fm-focus fm-select">
                            <select id="srchExcnYn" name="srchExcnYn" data-type="5" style="padding-left: 10px;">
                                <option value="" <c:if test="${srchScheduleInfo.srchExcnYnVal == ''}">selected</c:if>>실행여부</option>
                                <option value="Y" <c:if test="${srchScheduleInfo.srchExcnYnVal == 'Y'}">selected</c:if>>실행</option>
                                <option value="N" <c:if test="${srchScheduleInfo.srchExcnYnVal == 'N'}">selected</c:if>>미실행</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="fm-ele" data-size="100p">
                            <input type="text" id="srchScheduleNm" name="srchScheduleNm" value="${srchScheduleInfo.srchScheduleNmVal}" placeholder="스케줄명을 입력하세요.">
                        </div>
                    </div>
                </div>
                <div class="btn-wrap">
                    <button type="button" class="btns small black" id="btnSrch" onclick="javascript:goInstSrchParam(); return false;">조회</button>
                </div>
            </div>


        </form>

    </div>
    <div class="list-option top between">
        <strong>전체건수 : <b>${srchScheduleInfo.totalRecord}</b></strong>
        <div>
            <button type="button" class="btns small blue" onclick="moveRegPage();">등록</button>
        </div>
    </div>
</div>

<div class="table-wrap">
    <table>
        <colgroup>
            <col width="6.5%"/>
            <col width="*"/>
            <col width="22%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
<%--            <col width="10%"/>--%>
<%--            <col width="10%"/>--%>
        </colgroup>
        <thead>
        <tr>
            <th>순번</th>
            <th>JOB ID</th>
            <th>JOB명</th>
            <th>기관</th>
            <th>스케줄 유형</th>
            <th>실행여부</th>

        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty scheduleList}">
            <c:forEach var="scheduleInfo" items="${scheduleList}" varStatus="status">
                <tr>
                    <td>${scheduleInfo.rowNumber}</td>
                    <td class="align-left"><a href="#" data-value ="${scheduleInfo.btjId}" onclick="moveDtlPage(this);">${scheduleInfo.btjId}</a></td>
                    <td>${scheduleInfo.btjNm}</td>
                    <td>${scheduleInfo.instNm}</td>
                    <td>${scheduleInfo.btjTypeCd}</td>

                    <td>
                        <c:if test="${scheduleInfo.excnYn == 'Y'}">
                            실행
                        </c:if>
                        <c:if test="${scheduleInfo.excnYn == 'N'}">
                            미실행
                        </c:if>
                    </td>

                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty scheduleList}">
            <tr>
                <td colspan="6">검색조건에 맞는 데이터가 존재하지 않습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
<!-- pagination 활성화 active -->
<div class="align_flex paging">
    <div class="pagination">
        <c:import url="/WEB-INF/view/include/custom_paging.jsp">
            <c:param name="currentPage" value="${srchScheduleInfo.currentPage}"/>
            <c:param name="totalPage" value="${srchScheduleInfo.totalPage}"/>
            <c:param name="totalRecord" value="${srchScheduleInfo.totalRecord}"/>
            <c:param name="recordCountPerPage" value="${srchScheduleInfo.recordCountPerPage}"/>
            <c:param name="pagePerBlock" value="${srchScheduleInfo.pagePerBlock}"/>
            <c:param name="calculPage" value="${srchScheduleInfo.calculPage}"/>
            <c:param name="funNm" value="fnList" />
            <c:param name="url" value="scheduleMgtList.do" />
        </c:import>
    </div>
</div>
<script>
    window.fnList = function(action, mapKVs) {
        // currentPage 파라미터 추가
        document.getElementById('currentPage').value = mapKVs.currentPage;
        goInstSrchParam();
    }

    // DOM 생성 후 실행
    document.addEventListener('DOMContentLoaded', async function() {
        //console.log("DOMContentLoaded");

        init();
    });

    const init = async function() {
        // // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
        setupAllChangeHandler();

        //서버에서 받아온 데이터를 hidden input에 설정
        setParamToObject();
    }


    const setupAllChangeHandler = function() {
        // 전체 SELECT BOX 및 INPUT BOX 이벤트 등록
        const allInputAndSelectBoxes = document.querySelectorAll('input, select');
        allInputAndSelectBoxes.forEach(function (box) {
            box.addEventListener('change', handleChangeEvent);
        });
    }

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
        event.stopPropagation();
    }

    const setParamToObject = function() {
        const allInputAndSelectBoxes = document.querySelectorAll('input, select');
        allInputAndSelectBoxes.forEach(function (box) {
            const hiddenInputValue = document.getElementById(box.id + 'Val')?.value;
            if (hiddenInputValue) {
                box.value = hiddenInputValue;
            }
        });
    };



    const moveDtlPage = function (target) {
        const jobId = target.dataset.value;
        document.getElementById('btjId').value = jobId;
        document.getElementById('frmScheduleSrch').action = contextPath +'/scheduleMgt/scheduleMgtDetail.do';
        document.getElementById('frmScheduleSrch').submit();
    }

    const moveRegPage = function () {
        document.getElementById('frmScheduleSrch').action = contextPath +'/scheduleMgt/scheduleMgtReg.do';
        document.getElementById('frmScheduleSrch').submit();
    }

    const goInstSrchParam  = function (){
        document.getElementById('frmScheduleSrch').action = contextPath +'/scheduleMgt/scheduleMgtList.do';
        document.getElementById('frmScheduleSrch').submit();
    }
</script>
