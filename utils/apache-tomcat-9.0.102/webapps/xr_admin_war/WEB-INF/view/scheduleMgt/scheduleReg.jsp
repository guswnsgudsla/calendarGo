<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
    <form id="frmScheduleData" name="frmScheduleData" method="post">
        <input type="hidden" class="serverValue" id="btjId" name="btjId" value="${srchDgtlClrcsInfo.btjId}">
        <input type="hidden" class="serverValue" id="instId" name="btjId" value="${srchDgtlClrcsInfo.instId}">
        <input type="hidden" class="serverValue" id="btjTypeCd" name="btjId" value="${srchDgtlClrcsInfo.btjTypeCd}">
        <input type="hidden" class="serverValue" id="btjNm" name="btjId" value="${srchDgtlClrcsInfo.btjNm}">
        <input type="hidden" class="serverValue" id="btjExpln" name="btjId" value="${srchDgtlClrcsInfo.btjExpln}">
        <input type="hidden" class="serverValue" id="btjUrlAddr" name="btjId" value="${srchDgtlClrcsInfo.btjUrlAddr}">
        <input type="hidden" class="serverValue" id="cycCd" name="btjId" value="${srchDgtlClrcsInfo.cycCd}">
        <input type="hidden" class="serverValue" id="excnMmCdCn" name="btjId" value="${srchDgtlClrcsInfo.excnMmCdCn}">
        <input type="hidden" class="serverValue" id="wkbyExcnCycCn" name="btjId" value="${srchDgtlClrcsInfo.wkbyExcnCycCn}">
        <input type="hidden" class="serverValue" id="excnDywkCdCn" name="btjId" value="${srchDgtlClrcsInfo.excnDywkCdCn}">
        <input type="hidden" class="serverValue" id="excnYn" name="btjId" value="${srchDgtlClrcsInfo.excnYn}">
        <input type="hidden" class="serverValue" id="useYn" name="btjId" value="${srchDgtlClrcsInfo.useYn}">
        <input type="hidden" class="serverValue" id="excnAplId" name="btjId" value="${srchDgtlClrcsInfo.excnAplId}">
        <input type="hidden" class="serverValue" id="btjSchdlCn" name="btjId" value="${srchDgtlClrcsInfo.btjSchdlCn}">

    </form>
    <div class="content-div">
        <div class="write-wrap bg-Gray">

                <div>
                    <strong class="require">스케줄 명칭</strong>
                    <div class="fm-ele" data-size="100p">
                        <input type="text" id="btjNmVal" class="require" title="스케줄 명칭" placeholder="명칭을 입력하세요." />
                    </div>
                </div>
                <div>
                    <strong class="require">기관</strong>
                    <div class="fm-ele" data-size="100p">
                        <input type="text" id="instIdVal" class="require" title="기관시설" placeholder="명칭을 입력하세요." />
                    </div>
                </div>

        </div>

    </div>
</div>