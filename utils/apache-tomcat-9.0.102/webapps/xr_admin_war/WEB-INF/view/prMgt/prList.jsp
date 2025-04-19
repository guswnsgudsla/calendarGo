<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">
			<!-- 콘텐츠 영역 -->
			<form name="frmClcSrch"  id="frmClcSrch" method="post" action="#">
			<div class="control-wrap">
				<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
				<input type="hidden" id="srchPrId" name="srchPrId" value="<c:out value="${prVO.srchPrId}"/>"> 
				<!-- 페이징 변수 -->
				<input type="hidden" id="currentPage" name="currentPage" value="1" />
				<div class="search">
					<div class="filter">
						<div class="row">
							<label for="srchBgngYmd" class="tit">검색기간</label>
							<div class="fm-ele date">
								<input type="date" id="srchBgngYmd" name="srchBgngYmd" value="<c:out value="${prVO.srchBgngYmd}"/>" placeholder="시작 일자"/>
							</div>
							<span>~</span>
							<div class="fm-ele date">
								<input type="date" id="srchEndYmd" name="srchEndYmd" value="<c:out value="${prVO.srchEndYmd}"/>" placeholder="종료 일자"/>
							</div>
							<div class="fm-focus fm-select">
								<select id="srchTypeCd" name="srchTypeCd" >
									<option value="prTtl" <c:if test="${prVO.srchTypeCd == 'prTtl'}">selected</c:if>>제목</option>
									<option value="entNm" <c:if test="${prVO.srchTypeCd == 'entNm'}">selected</c:if>>기업명</option>
								</select>
							</div>
							<div class="fm-ele" data-size="w500">
								<input type="text" id="srchText" name="srchText" value="<c:out value="${prVO.srchText}"/>" placeholder="검색어를 입력하세요.">
							</div>
							<div class="fm-focus fm-select">
								<select id="srchAprvYn" name="srchAprvYn" >
									<option value="" <c:if test="${prVO.srchAprvYn == ''}">selected</c:if>>승인 상태</option>
									<option value="N" <c:if test="${prVO.srchAprvYn == 'N' }">selected</c:if>>대기</option>
									<option value="Y" <c:if test="${prVO.srchAprvYn == 'Y' }">selected</c:if>>승인</option>
									<%-- 미승인은 Deny의 약자인 D를 사용함 --%>
									<option value="D" <c:if test="${prVO.srchAprvYn == 'D' }">selected</c:if>>미 승인</option>
								</select> 
							</div>
						</div>
					</div>
					<div class="btn-wrap">
						<button type="button" class="btns" id="btnSrch" onclick="javascript:goSrchParam(); return false;">조회</button>
						<button type="button" class="btns color-gray" id="btnReset" onclick="javascript:goClcSrchParamReset(); return false;">초기화</button>
					</div>
				</div>
			</div>
			</form>
			<div class="list-option between top">
				<strong>전체건수 : 
				<b><c:out value="${prVO.totalRecord}"/></b>
				</strong>
			</div>
			<div class="table-wrap">
				<table>
					<caption></caption>
					<colgroup>
						<col width="50px"></col>
						<col width="150px"></col>
						<col width="450px"></col>
						<col width="150px"></col>
						<col width="80px"></col>
						<col width="80px"></col>
						<col width="80px"></col>
						<col width="80px"></col>
						<col width="80px"></col>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>신청 구분</th>
							<th>홍보 채널 제목</th>
							<th>신청자 email</th>
							<th>승인 상태</th>
							<th>등록일</th>
							<th>등록자</th>
							<th>승인자</th>
							<th>승인일</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty prMgtList}">
						<c:forEach var="prMgtData" items="${prMgtList}" varStatus="status">
						<tr>
							<td><c:out value="${prMgtData.listNo}"/></td>
							<td>
								<c:if test="${prMgtData.aprvYn == 'N'}">대기</c:if> 
								<c:if test="${prMgtData.aprvYn == 'Y'}">승인</c:if> 
								<c:if test="${prMgtData.aprvYn == 'D'}">미승인</c:if> 
							</td>
							<td class="align-left"><a href="#" onclick="javascript:goViewInfo('${prMgtData.prId}'); return false;"><c:out value="${prMgtData.prTtl}"/></a></td>
							<td><c:out value="${prMgtData.rgtrEmlAddr}"/></td>
							<td>
								<c:if test="${prMgtData.aprvYn == 'N'}">대기</c:if> 
								<c:if test="${prMgtData.aprvYn == 'Y'}">승인</c:if> 
								<c:if test="${prMgtData.aprvYn == 'D'}">미승인</c:if> 
							</td>
							<td><c:out value="${prMgtData.frstRegDtV10}"/></td>
							<td><c:out value="${pf:getMaskingID(prMgtData.frstRgtrId)}"/></td>
							<td>
								<c:if test="${prMgtData.autzrId != ''}">
									<c:out value="${pf:getMaskingID(prMgtData.autzrId)}"/>
								</c:if>
								<c:if test="${prMgtData.autzrId == null}">
									-
								</c:if>
								<c:if test="${prMgtData.autzrId == ''}">
									-
								</c:if>
							</td>
							<td>
								<c:if test="${prMgtData.aprvDtV10 != ''}">
									<c:out value="${prMgtData.aprvDtV10}"/>
								</c:if>
								<c:if test="${prMgtData.aprvDtV10 == null}">
									-
								</c:if>
								<c:if test="${prMgtData.aprvDtV10 == ''}">
									-
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty prMgtList}">
						<tr>
							<td colspan="9">No Data</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<!-- pagination 활성화 active -->
			<div class="align_flex center">
				<div class="align_flex paging">
					<c:import url="/WEB-INF/view/include/custom_paging.jsp">
						<c:param name="currentPage" value="${prVO.currentPage}"/>
						<c:param name="totalPage" value="${prVO.totalPage}"/>
						<c:param name="totalRecord" value="${prVO.totalRecord}"/>
						<c:param name="recordCountPerPage" value="${prVO.recordCountPerPage}"/>
						<c:param name="pagePerBlock" value="${prVO.pagePerBlock}"/>
						<c:param name="calculPage" value="${prVO.calculPage}"/>
						<c:param name="funNm" value="fnList" />
						<c:param name="url" value="prList.do" />
					</c:import>
				</div>
			</div>
		</div>


</body>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
/*2.전역변수 정의 및 초기화는 여기에 기입*/
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/

//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
function goSrchParam() {
	
	let frm = document.frmClcSrch;

	var srchBgngYmd = frm.srchBgngYmd.value;
	var srchEndYmd = frm.srchEndYmd.value;
	
	if(srchBgngYmd != null || srchBgngYmd != ''){
		if(srchEndYmd != null || srchEndYmd != ''){
			var date1 = new Date(srchBgngYmd);
			var date2 = new Date(srchEndYmd);
			
			if(date1 > date2){
				alert("시작일이 종료일보다 미래일 수 없습니다.");
	   			return false;
			}
		}
	}
	
    frm.action = contextPath + "/prMgt/prList.do";
    frm.submit();
}

//클릭시 해당 id에 맞는 게시물 상세정보 화면으로 이동
function goViewInfo(id){
	let frm = document.frmClcSrch;
	if(id == null || id == ''){
		alert("이동할 글이 존재하지 않습니다.");
		return false;
	}
	else{
		frm.srchPrId.value = id;
		frm.action = contextPath + "/prMgt/prDtl.do";
		frm.submit();
	}
}

//클릭시 검색폼 값을 초기화 하는 함수
function goClcSrchParamReset() {
    let frm = document.frmClcSrch;
    frm.srchText.value = "";
    frm.srchTypeCd.value = "prTtl";
    frm.srchAprvYn.value = "";
    frm.srchBgngYmd.value = "";
    frm.srchEndYmd.value = "";
}

/*4.동적메서드 선언부분*/
 
window.fnList = function(action, mapKVs) {

		// currentPage 파라미터 추가
		document.getElementById('currentPage').value = mapKVs.currentPage;

        goInstSrchParam();
    }
const goInstSrchParam  = function (){
	document.getElementById('frmClcSrch').action = contextPath + '/prMgt/prList.do';
	document.getElementById('frmClcSrch').submit();
}
</script>
