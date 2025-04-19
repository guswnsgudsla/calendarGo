<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/config/egovframework/taglib/taglib.functions.tld" prefix="pf"  %> <%-- 커스텀 함수 --%>
<div class="contants">
		<!-- 콘텐츠 영역 -->
		<form name="frmClcSrch"  id="frmClcSrch" method="post" action="#">
		<div class="control-wrap">
			<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
			<input type="hidden" id="srchWrtMode" name="srchWrtMode" value="">
			<input type="hidden" id="srchExbiId" name="srchExbiId" value="<c:out value="${dgtlClcVO.srchExbiId}"/>"> 
			<!-- 페이징 변수 -->
			<input type="hidden" id="currentPage" name="currentPage" value="1" />
			<div class="search">
				<div class="filter">
					<div class="row">
						<div class="fm-focus fm-select" data-size="w150">
							<select id="srchTypeCd" name="srchTypeCd" style="padding-left: 10px;">
								<option value="exbiNm" <c:if test="${dgtlClcVO.srchTypeCd == 'exbiNm'}">selected</c:if>>컬렉션 명</option>
								<c:if test="${authority eq 'AUTH000001'}">
									<option value="instNm" <c:if test="${dgtlClcVO.srchTypeCd == 'instNm'}">selected</c:if>>기관명</option>
								</c:if>
							</select>
						</div>
						<div class="fm-ele" data-size="w500">
							<input type="text" id="srchText" name="srchText" value="<c:out value="${dgtlClcVO.srchText}"/>" placeholder="검색어를 입력하세요.">
						</div>
						<div class="fm-focus fm-select" data-size="w200" >
							<select id="srchExbiTypeCd" name="srchExbiTypeCd" style="padding-left: 10px;">
								<option value="all" <c:if test="${dgtlClcVO.exbiTypeCd == 'all'}">selected</c:if>>전시유형 전체</option>
								<c:if test="${!empty exbiTypeCmmnCdList}">
									<c:forEach var="exbiCdRow" items="${exbiTypeCmmnCdList}">
								<option value="<c:out value="${exbiCdRow.cdId}"/>" <c:if test="${dgtlClcVO.srchExbiTypeCd == exbiCdRow.cdId }">selected</c:if>><c:out value="${exbiCdRow.cdNm}"/></option>
									</c:forEach>
								</c:if>
							</select> 
						</div>
						<div class="fm-focus fm-select" data-size="w200">
							<select id="srchOpenYn" name="srchOpenYn" style="padding-left: 10px;">
								<option value="all" <c:if test="${dgtlClcVO.srchOpenYn == 'all'}">selected</c:if>>공개여부 전체</option>
								<option value="Y" <c:if test="${dgtlClcVO.srchOpenYn == 'Y'}">selected</c:if>>공개</option>
								<option value="N" <c:if test="${dgtlClcVO.srchOpenYn == 'N'}">selected</c:if>>미공개</option>
							</select>
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="btnSrch" onclick="javascript:goInstSrchParam(); return false;">조회</button>
					<button type="button" class="btns color-gray" id="btnReset" onclick="javascript:goClcSrchParamReset(); return false;">초기화</button>
				</div>
			</div>
		</div>
		</form>
		<div class="list-option top between">
			<strong>전체건수 : 
			<b><c:out value="${dgtlClcVO.totalRecord}"/></b>
			</strong>
			<button type="button" class="btns black" id="btnEntry" onclick="javascript:goEntryExbiInfo(); return false;">컬렉션 등록</button>
		</div>
		<div class="table-wrap">
			<table>
				<caption></caption>
				<colgroup>
					<col width="50px"></col>
					<col width="150px"></col>
					<col width="250px"></col>
					<col width="150px"></col>
					<col width="120px"></col>
					<col width="100px"></col>
					<col width="140px"></col>
					<col width="120px"></col>
					<col width="140px"></col>
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>컬렉션 ID</th>
						<th>컬렉션 명</th>
						<th>기관</th>
						<th>전시 유형</th>
						<th>공개</th>
						<th>관계 문화자원</th>
						<th>등록자</th>
						<th>등록일시</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${!empty dgtlClcMgtList}">
					<c:forEach var="dgtlClcMgtData" items="${dgtlClcMgtList}" varStatus="status">
					<tr>
						<td><c:out value="${dgtlClcMgtData.dgtlClcListNo}"/></td>
						<td><a href="#" onclick="javascript:goViewClcInfo('${dgtlClcMgtData.exbiId}'); return false;"><c:out value="${dgtlClcMgtData.exbiId}"/></a></td>
						<td class="align-left"><a href="#" onclick="javascript:goViewClcInfo('${dgtlClcMgtData.exbiId}'); return false;"><c:out value="${dgtlClcMgtData.exbiNm}"/></a></td>
						<td><a href="#" onclick="javascript:goViewClcInfo('${dgtlClcMgtData.exbiId}'); return false;"><c:out value="${dgtlClcMgtData.instNm}"/></a></td>
						<td>
						<c:out value="${dgtlClcMgtData.exbiTypeCdNm}"/>
						</td>
						<td>
							<c:if test="${dgtlClcMgtData.rlsYn == 'Y'}">
								공개
							</c:if>
							<c:if test="${dgtlClcMgtData.rlsYn == 'N'}">
								비공개
							</c:if>
						</td>
						<td>
							<c:if test="${dgtlClcMgtData.relCnt > 0}">
								<button class="btns size-xsmall" onclick="javascript:goRelClcInfo('${dgtlClcMgtData.exbiId}')">보기(<c:out value="${dgtlClcMgtData.relCnt}"/>)</button>
							</c:if>
							<c:if test="${dgtlClcMgtData.relCnt < 1}">
								<button class="btns size-xsmall color-gray">없음</button>
							</c:if>
						</td>
						<td>
							<c:out value="${pf:getMaskingID(dgtlClcMgtData.frstRgtrId)}"/>
						</td>
						<td><c:out value="${dgtlClcMgtData.frstRegDtV19}"/></td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty dgtlClcMgtList}">
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
				<div class="pagination">
					<c:import url="/WEB-INF/view/include/custom_paging.jsp">
						<c:param name="currentPage" value="${dgtlClcVO.currentPage}"/>
						<c:param name="totalPage" value="${dgtlClcVO.totalPage}"/>
						<c:param name="totalRecord" value="${dgtlClcVO.totalRecord}"/>
						<c:param name="recordCountPerPage" value="${dgtlClcVO.recordCountPerPage}"/>
						<c:param name="pagePerBlock" value="${dgtlClcVO.pagePerBlock}"/>
						<c:param name="calculPage" value="${dgtlClcVO.calculPage}"/>
						<c:param name="funNm" value="fnList" />
						<c:param name="url" value="dgtlClcList.do" />
					</c:import>
				</div>
			</div>
		</div>
		<!-- 콘텐츠 영역 끝  -->
	</div>
    <div class="modals" id="modals">
        <div class="pop-layer" id="relList" style="width:80%;">
        </div>
    </div>
</body>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">
/*
window.onpageshow = function (event) {
	
	if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		//뒤로 가기 - 새로고침
		window.location.reload();
	}
};
*/
/*1.페이지 렌더링 후 작업이 있다면 여기에 기입*/
/*2.전역변수 정의 및 초기화는 여기에 기입*/
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/

//클릭시 컬렉션과 관련된 문화자원 팝업을 띄우는 함수
function goRelClcInfo(id){
	
	$( '#relList' ).load("<c:url value='/dgtlClcMgt/getRelClc.do'/>"+"?srchExbiId="+id);
	admin.modalsShow('modals'); 
}

//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
function goClcSrchParam() {
    let frm = document.frmClcSrch;
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcList.do";
    frm.submit();
}

//클릭시 검색폼 값을 초기화 하는 함수
function goClcSrchParamReset() {
    let frm = document.frmClcSrch;
    frm.srchText.value = "";
    frm.srchTypeCd.value = "exbiNm";
    frm.srchExbiTypeCd.value = "all";
    frm.srchOpenYn.value = "all";
}

//클릭시 전시회 아이디를 전달하여 해당하는 컬렉션의 상세 화면 이동
function goViewClcInfo(exbiId){
	let frm = document.frmClcSrch;
	frm.srchExbiId.value = exbiId;
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcDtl.do";
    frm.submit();
}
//클릭시 새로운 컬렉션을 등록하는 화면으로 이동
function goEntryExbiInfo(){
	let frm = document.frmClcSrch;
	frm.srchWrtMode.value = 'entry';
    frm.action = contextPath + "/dgtlClcMgt/dgtlClcSave.do";
    frm.submit();
}

/*4.동적메서드 선언부분*/
window.fnList = function(action, mapKVs) {

// currentPage 파라미터 추가
document.getElementById('currentPage').value = mapKVs.currentPage;

goInstSrchParam();
  }
const goInstSrchParam  = function (){
	document.getElementById('frmClcSrch').action = contextPath + '/dgtlClcMgt/dgtlClcList.do';
	document.getElementById('frmClcSrch').submit();
}
</script>