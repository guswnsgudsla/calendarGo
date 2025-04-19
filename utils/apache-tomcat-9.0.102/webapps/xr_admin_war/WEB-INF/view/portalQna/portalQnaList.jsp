<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
			<!-- 콘텐츠 영역 -->
 			<form id="frmClcSrch" method="post" >
			<div class="control-wrap">
				<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
				<input type="hidden" id="srchWrtMode" name="srchWrtMode" value=""> 
				<!-- 페이징 변수 -->
				<input type="hidden" id="currentPage" name="currentPage" value="1" />
				<div class="search">
					<div class="filter">
							<input type="hidden" id="aCodeVar" name="aCodeVar" value="" placeholder="">
							<input type="hidden" id="bCodeVar" name="bCodeVar" value="" placeholder="">
						<div class="row">
							<div class="fm-focus fm-select">
								<select id="aCode" name="aCode" onchange="changeACodeVar()">
									<option>분류</option>
									<option value="SVC" >서비스 이용</option>
									<option value="ETC" >기타</option>
								</select>
							</div>
								
							<div class="fm-focus fm-select">
								<select id="bCode" name="bCode" onchange="changeBCodeVar()"> 
									<option value="TTL" >제목</option>
									<option value="CN" >내용</option>
								</select>
							</div>
							<div class="fm-ele" data-size="w500">
								<input type="text" id="srchText" name="srchText" value="" placeholder="검색어를 입력하세요.">
							</div>
						</div>
					</div>
					<div class="btn-wrap">
						 <button type="button" class="btns" id="searchSubmit" name = 'searchSubmit'>조회</button>
					</div>
				</div>
			</div>
			</form>
			<div class="list-option between" style="margin-top: 30px;">
				<strong>전체건수 :  <b><c:out value="${srchVo.totalRecord}"/></b> 개</strong>
			</div>
			<div class="table-wrap" style="margin-top: 20px;">
					<table class="list">
			<colgroup>
				<col width="80px"></col>
				<col width="1600px"></col>
				<col width="100px"></col>
				<col width="150px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>답변 유무</th>
					<th>작성자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty lists}">
				<tr>
					<td colspan="5">No Data</td>
				</tr>
			</c:if>
				<c:forEach var="item" items="${lists}" >
				<tr>
				<td><c:out value="${item.pstOrdNo}"/></td>
				<td style="text-align: left;">
				 	<a href="#" onclick="javascript:goViewInfo('${item.pstId}');">
				       <c:out value="${item.pstTtlNm}"/>
				    </a>
				</td>
				<td>
					<c:choose>
	                	 <c:when test="${empty item.ansCn or item.ansCn == ''}">X</c:when>
	                	<c:otherwise>O</c:otherwise>
	            	</c:choose>
            	</td>
				<td><c:out value="${item.wrtrNm}"/></td>
				<td><c:out value="${item.frstRegDt}"/></td>
				</tr>
				<c:if test="${empty item}">
						<tr>
							<td colspan="7">No Data</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
			</div>
			<!-- pagination 활성화 active -->
			<div class="align_flex center">
				<div class="align_flex paging">
					<c:import url="/WEB-INF/view/include/custom_paging.jsp">
						<c:param name="currentPage" value="${srchVo.currentPage}"/>
						<c:param name="totalPage" value="${srchVo.totalPage}"/>
						<c:param name="totalRecord" value="${srchVo.totalRecord}"/>
						<c:param name="recordCountPerPage" value="${srchVo.recordCountPerPage}"/>
						<c:param name="pagePerBlock" value="${srchVo.pagePerBlock}"/>
						<c:param name="calculPage" value="${srchVo.calculPage}"/>
						<c:param name="funNm" value="fnList" />
						<c:param name="url" value="/portalQnaList.do" />
					</c:import>
				</div>
			</div>
		</div>
</body>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">
// 페이지 로드 시 초기값 설정
/* window.onload = function () {
    changeBCodeVar();
};
 */
document.addEventListener("DOMContentLoaded", function () {
    changeBCodeVar();
});

function changeACodeVar() {
    var selectBox = document.getElementById("aCode");
    var selecteaValue = selectBox.options[selectBox.selectedIndex].value;
    document.getElementById("aCodeVar").value = selecteaValue;
}

function changeBCodeVar() {
    var selectBox = document.getElementById("bCode");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    document.getElementById("bCodeVar").value = selectedValue;
}


document.getElementById("searchSubmit").addEventListener('click', function() {
	searchSubmit();
});

function searchSubmit() {
	
		var srchText = $('input[name="srchText"]').val();
		var srchText = $('input[name="aCodeVar"]').val();
		var srchText = $('input[name="bCodeVar"]').val();
		
        $("#frmClcSrch").attr("action", contextPath + "/portalQna/portalQnaList.do");
        $("#frmClcSrch").submit();
} 

//페이징 처리 함수
window.fnList = function(action, mapKVs) {

// currentPage 파라미터 추가
document.getElementById('currentPage').value = mapKVs.currentPage;

      goInstSrchParam();
  }
//폼 액션 경로와 서브밋하는 함수
const goInstSrchParam  = function (){
	document.getElementById('frmClcSrch').action = contextPath + '/portalQna/portalQnaList.do';
	document.getElementById('frmClcSrch').submit();
}


function goViewInfo(id){
    if(id == null || id == ''){
        alert("이동할 글이 존재하지 않습니다.");
        return false;
    }
    else{
        // 이동할 URL 생성
        let url = contextPath + "/portalQna/portalQnaView.do?pstId=" + id;
        // 생성된 URL로 이동
        window.location.href = url;
    }
}

</script>
