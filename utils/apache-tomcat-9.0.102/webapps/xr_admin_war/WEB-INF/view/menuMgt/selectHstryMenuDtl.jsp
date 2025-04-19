<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	<!-- 팝업 헤더 영역 -->
	<div class="btn-wrap between" style="background-color: #376092; color: white; padding: 5px; margin-top: 0px;">
		<span style="margin-left:15px;">
			메뉴 이력 팝업
		</span>
		<button type="button" class="closeBtn" style="color:white; border-color: white; margin-right: 15px;" onclick="closeModal()">&nbsp;X&nbsp;</button>
	</div>
	<!-- 콘텐츠 영역 -->
	<h1>메뉴 이력 상세 조회</h1>
		<form id="frmClrcsSrch" name="frmClrcsSrch" method="post" action="#">
		<!-- 검색값과 현재 페이지 유지를 위한 파라미터 세팅 -->
		<input type="hidden" id="paramMenuId2" name="paramMenuId2" value="${paramMenuVo.paramMenuId}"> 
		<input type="hidden" id="paramMenuNm2" name="paramMenuNm2" value="${paramMenuVo.paramMenuId}"> 
		<input type="hidden" id="paramMenuTypeCd2" name="paramMenuTypeCd2" value="${paramMenuVo.paramMenuId}"> 
		<input type="hidden" id="paramUseYn2" name="paramUseYn2" value="${paramMenuVo.paramMenuId}"> 
		<!-- 페이징 변수 -->
		<input type="hidden" id="currentPage" name="currentPage" value="1" />
			<!-- table write형 -->
			<div class="table-wrap write">
			    <table>
			        <colgroup>
			           <col width="200px"><col width="*">
			        </colgroup>
			        <tbody>
				        <tr>
				            <th>메뉴 명 : </th>
				            <td>${resultMenuVo.menuNm}</td>
				        </tr>
				        <tr>
				            <th>메뉴 설명 : </th>
				            <td>${resultMenuVo.menuExpln}</td>
				        </tr>
				        <tr>
				            <th>메뉴 사용 여부 : </th>
				            <td>${resultMenuVo.useYn}</td>
				        </tr>
				        <tr>
				            <th>상위 메뉴 명 : </th>
				            <td>${resultMenuVo.upMenuNm}</td>
				        </tr>
				        <tr>
				            <th>연결 화면 명 : </th>
				            <td>${resultMenuVo.lnkgContsId}</td>
				        </tr>
				        <tr>
				            <th>연결 화면 URI : </th>
				            <td>${resultMenuVo.scrnUriAddr}</td>
				        </tr>
				        <tr>
				            <th>등록일 : </th>
				            <td>${resultMenuVo.frstRegDtV19}</td>
				        </tr>
				        <tr>
				            <th>등록자 : </th>
				            <td>${resultMenuVo.frstRgtrId}(${resultMenuVo.frstRgtrNm})</td>
				        </tr>
				    </tbody>
			    </table>
			</div>
		</form>
	<div class="btn-wrap" style="margin-bottom: 20px; margin-right: 20px; margin-top: 0px;">
		<button type="button" class="btns blue closeBtn" onclick="javascript:goClrcsSrchParam()">목록</button>
		<button type="button" class="btns blue closeBtn" onclick="javascript:closeModal()">CLOSE</button>
	</div>
	<!-- 콘텐츠 영역 끝  -->
</div>
</div>

<script type="text/javascript">

	//조회조건에 맞는 메뉴 이력불러오기
	function goClrcsSrchParam(){
		
		var paramMenuId = document.getElementById('paramMenuId2').value;
		
		var paramMenuNm = document.getElementById('paramMenuNm2').value;
		paramMenuNm = paramMenuNm.split(' ').join('');
		
		var paramMenuTypeCd = document.getElementById('paramMenuTypeCd2').value;
		var paramUseYn = document.getElementById('paramUseYn2').value;
		
		
		$( '#historyPop' ).load(contextPath+'/menuMgt/menuHstryList.do'+"?paramMenuId="+paramMenuId+"&&paramMenuNm="+paramMenuNm+"&&paramMenuTypeCd="+paramMenuTypeCd+"&&paramUseYn="+paramUseYn);
	}	
	
	
	//모달창 닫는 함수
	function closeModal(){
		admin.modalsClose('modals');
		location.reload();
	}
	
	//검색 조회 후 엔터키 누를시 비정상 페이지 이동이 발생하여 입력 막음
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	
		
</script>