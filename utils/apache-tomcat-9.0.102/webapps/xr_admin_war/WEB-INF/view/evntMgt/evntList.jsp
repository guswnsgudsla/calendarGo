<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
			<!-- 콘텐츠 영역 -->
			<form name="frmClcSrch"  id="frmClcSrch" method="post" action="#">
			<div class="control-wrap">
				<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
				<input type="hidden" id="srchWrtMode" name="srchWrtMode" value=""> 
				<input type="hidden" id="srchEvntId" name="srchEvntId" value=""> 
				<!-- 페이징 변수 -->
				<input type="hidden" id="currentPage" name="currentPage" value="1" />
				<div class="search">
					<div class="filter">
						<div class="row">
							<div class="fm-focus fm-select">
								<select id="srchTypeCd" name="srchTypeCd">
									<option value="evntTtl" <c:if test="${evntVO.srchTypeCd == 'evntTtl'}">selected</c:if>>제목</option>
									<option value="evntCn" <c:if test="${evntVO.srchTypeCd == 'evntCn'}">selected</c:if>>내용</option>
								</select>
							</div>
							<div class="fm-ele" data-size="w500">
								<input type="text" id="srchText" name="srchText" value="<c:out value="${evntVO.srchText}"/>" placeholder="검색어를 입력하세요.">
							</div>
							<div class="fm-focus fm-select">
								<select id="srchEvntSttsCd" name="srchEvntSttsCd">
									<option value="" <c:if test="${evntVO.srchEvntSttsCd == ''}">selected</c:if>>행사 상태</option>
									<option value="E01" <c:if test="${evntVO.srchEvntSttsCd == 'E01' }">selected</c:if>>예정</option>
									<option value="E02" <c:if test="${evntVO.srchEvntSttsCd == 'E02' }">selected</c:if>>진행중</option>
									<option value="E03" <c:if test="${evntVO.srchEvntSttsCd == 'E03' }">selected</c:if>>종료</option>
								</select> 
							</div>
						</div>
					</div>
					<div class="btn-wrap">
						<button type="button" class="btns" id="btnSrch" onclick="javascript:goInstSrchParam(); return false;">조회</button>
						<button type="button" class="btns color-gray" id="btnReset" onclick="javascript:goSrchParamReset(); return false;">초기화</button>
					</div>
				</div>
			</div>
			</form>
			<div class="list-option between" style="margin-top: 30px;">
				<strong>전체건수 : 
				<b><c:out value="${evntVO.totalRecord}"/></b>
				</strong>
				<button type="button" class="btns black" id="btnEntry" onclick="javascript:goEntryEvntInfo(); return false;">이벤트 등록</button>
			</div>
			<div class="table-wrap" style="margin-top: 20px;">
				<table>
					<caption></caption>
					<colgroup>
						<col width="50px"></col>
						<col width="350px"></col>
						<col width="100px"></col>
						<col width="100px"></col>
						<col width="100px"></col>
						<col width="100px"></col>
						<col width="80px"></col>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>이벤트 제목</th>
							<th>진행 상태</th>
							<th>주관 기관</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>담당자</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty evntMgtList}">
						<c:forEach var="evntMgtData" items="${evntMgtList}" varStatus="status">
						<tr>
							<td><c:out value="${evntMgtData.listNo}"/></td>
							<td style="text-align: left;"><a href="#" onclick="javascript:goViewInfo('${evntMgtData.evntId}'); return false;"><c:out value="${evntMgtData.evntTtl}"/></a></td>
							<td><c:out value="${evntMgtData.evntSttsCd}"/></td>
							<td><c:out value="${evntMgtData.regInstNm}"/></td>
							<td><c:out value="${evntMgtData.bgngYmd}"/></td>
							<td><c:out value="${evntMgtData.endYmd}"/></td>
							<td><c:out value="${evntMgtData.picNm}"/></td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty evntMgtList}">
						<tr>
							<td colspan="7">No Data</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<!-- pagination 활성화 active -->
			<div class="align_flex center">
				<div class="align_flex paging">
					<c:import url="/WEB-INF/view/include/custom_paging.jsp">
						<c:param name="currentPage" value="${evntVO.currentPage}"/>
						<c:param name="totalPage" value="${evntVO.totalPage}"/>
						<c:param name="totalRecord" value="${evntVO.totalRecord}"/>
						<c:param name="recordCountPerPage" value="${evntVO.recordCountPerPage}"/>
						<c:param name="pagePerBlock" value="${evntVO.pagePerBlock}"/>
						<c:param name="calculPage" value="${evntVO.calculPage}"/>
						<c:param name="funNm" value="fnList" />
						<c:param name="url" value="evntList.do" />
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
	
    frm.action = contextPath + "/evntMgt/evntList.do";
    frm.submit();
}

//등록화면 플래그를 가지고 화면을 요청하는 함수
function goEntryEvntInfo(){
	let frm = document.frmClcSrch;
	frm.srchWrtMode.value = 'entry';
    frm.action = contextPath + "/evntMgt/evntSave.do";
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
		frm.srchEvntId.value = id;
		frm.action = contextPath + "/evntMgt/evntDtl.do";
		frm.submit();
	}
}

//클릭시 검색폼 값을 초기화 하는 함수
function goSrchParamReset(){
	let frm = document.frmClcSrch;
    frm.srchText.value = "";
    frm.srchTypeCd.value = "evntTtl";
    frm.srchEvntSttsCd.value = "";
    frm.srchAprvYn.value = "";
    frm.srchBgngYmd.value = "";
    frm.srchEndYmd.value = "";
}

/*4.동적메서드 선언부분*/

//페이징 처리 함수
window.fnList = function(action, mapKVs) {

		// currentPage 파라미터 추가
		document.getElementById('currentPage').value = mapKVs.currentPage;

        goInstSrchParam();
    }
//폼 액션 경로와 서브밋하는 함수
const goInstSrchParam  = function (){
	document.getElementById('frmClcSrch').action = contextPath + '/evntMgt/evntList.do';
	document.getElementById('frmClcSrch').submit();
}
</script>
