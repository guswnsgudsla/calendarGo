<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="contants">
	<div class="control-wrap">
		<form name="frmDgtlClrcsSrch" id="frmDgtlClrcsSrch" method="post" action="#">
			<input type="hidden" class="serverValue" id="dagId" name="dagId" value="${srchCollectMgtInfo.dagId}">
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-ele" data-size="100p">
							<label for="dagIdVal"></label><input type="text" id="dagIdVal" name="dagIdVal" value="${srchCollectMgtInfo.dagId}" placeholder="DAG ID를 입력하세요">
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="btnSrch" onclick="javascript:goCollectSrchParam(); return false;">조회</button>
				</div>
			</div>
		</form>


	</div>
	<div class="list-option top between">
		<strong>전체건수 : <b>${fn:length(dagList)}</b></strong>
	</div>

	<div class="table-wrap">
		<table>
			<colgroup>
				<col width="">
<%--				<col width="6.5%"/>--%>
<%--				<col width="*"/>--%>
<%--				<col width="22%"/>--%>
<%--				<col width="10%"/>--%>
			</colgroup>
			<thead>
			<tr>
				<th>ID</th>
				<th>DAG명</th>
				<th>설명</th>
				<th>시간</th>
				<th>동작</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty dagList}">
				<c:forEach var="dagInfo" items="${dagList}" varStatus="status">
					<tr>
						<td>${dagInfo.dagId}</td>
						<td><a href="#" onclick="moveDtlPage('${dagInfo.dagId}', '${dagInfo.title}', '${dagInfo.description}');">${dagInfo.title}</a></td>
						<td>${dagInfo.description}</td>
						<td>${dagInfo.lastParsedTime}</td>
						<td><button class="btns size-xsmall" onclick="executeDag('${dagInfo.dagId}');">실행</button></td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
<script>

    // DOM 생성 후 실행
    document.addEventListener('DOMContentLoaded', async function() {



    });

    //axios를 이용한 데이터 호출
	const executeDag = function (dagId){
        const response = axios.post(contextPath +'/collectMgt/executeDag/'+dagId).then(function (response) {
            alert(dagId + ' : 실행 요청 하였습니다.');
        }).catch(function (error) {
            console.error(error);
        });
	}

    const moveDtlPage = function (dagId, dagTitle, dagDesc){
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", contextPath + '/collectMgt/dagDtl.do');

        addHiddenField(form, "dagId", dagId);
        addHiddenField(form, "dagTitle", dagTitle);
        addHiddenField(form, "dagDesc", dagDesc);

        document.body.appendChild(form);
        form.submit();
        document.body.removeChild(form);
	}

    const addHiddenField = function (form, key, value) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", value);
        form.appendChild(hiddenField);
    }

    const goCollectSrchParam = function (){
        document.getElementById('dagId').value = document.getElementById('dagIdVal').value;
        document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/collectMgt/collectMgtList.do';
        document.getElementById('frmDgtlClrcsSrch').submit();

	}


    // /collectMgt/executeDag.do

</script>