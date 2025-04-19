<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value="https://cdn.jsdelivr.net/npm/chart.js"/>"></script>
<div class="contants">
	<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmUserStats"  id="frmUserStats" method="post" action="#">
			<div class="search">
				<div class="filter">
					<div class="row">
						<strong class="tit">조회 기간</strong>
						<div class="fm-ele date" >
							<input type="date" id="fromDate" name="fromDate" value="${searchInfo.fromDate}" placeholder="시작 일자"/>
						</div >
						<span>~</span>
						<div class="fm-ele date">
							<input type="date" id="toDate" name="toDate" value="${searchInfo.toDate}" placeholder="종료 일자"/>
						</div>
						<div class="fm-focus fm-select">
							<select id="paramType" name="paramType">
								<option value="day" <c:if test="${searchInfo.paramType == 'day' or searchInfo.paramType == ''}">selected</c:if>>일별</option>
								<option value="week" <c:if test="${searchInfo.paramType == 'week'}">selected</c:if>>주별</option>
								<option value="month"<c:if test="${searchInfo.paramType == 'month'}">selected</c:if>>월별</option>
								<option value="year" <c:if test="${searchInfo.paramType == 'year'}">selected</c:if>>연도별</option>
							</select> 
						</div>
						<div class="fm-focus fm-select">
							<select id="" name="userSearchType">
								<option value="R" <c:if test="${searchInfo.userSearchType == 'R'}">selected</c:if>>가입</option>
								<option value="C" <c:if test="${searchInfo.userSearchType == 'C'}">selected</c:if>>접속</option>
							</select> 
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="searchUser" onClick="javaScript:searchParam();return false;">조회</button>
					<button type="button" class="btns color-gray" id="" onClick="javaScript:srchInit();return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="searchUser" onclick="javascript:movePrevPage(); return false;">이전</button>
		
	</div>
	<div style="height:650px;"> <!-- 높이 수정 해야 함 -->
		<canvas id="userChart"></canvas>
	</div>
</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">
const userLabels = new Array(); //일자
const userCntData = new Array();  // 가입수
<c:if test="${!empty userList}">
<c:forEach var="userStick" items="${userList}" varStatus="status">
userLabels.push("${userStick.userSearchDate}");
userCntData.push("${userStick.userCnt}");
</c:forEach>
</c:if>
/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
const ctx = document.getElementById('userChart');
new Chart(ctx, {
  type: 'bar',
  data: {
    //labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    labels: userLabels,
    datasets: [{
      label: '# 사용자 통계',
      //data: [12, 19, 3, 5, 2, 3],
      data: userCntData,
      borderWidth: 1
    }]
  },
  options:{
      maintainAspectRatio :false,//그래프의 비율 유지 
      plugins:{ // 라벨 숨기기
          legend: {
              display: false
          },
      },
      indexAxis: 'y' //수평차트 만들기
  }
});

/*2.전역변수 정의 및 초기화는 여기에 기입*/
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/
//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
//클릭시 검색폼 값을 초기화 하는 함수
function goClcSrchParamReset() {
    let frm = document.frmClcSrch;
    frm.srchText.value = "";
    frm.srchTypeCd.value = "prTtl";
    frm.srchDataTypeCd.value = "";
    frm.srchAprvYn.value = "";
    frm.srchBgngYmd.value = "";
    frm.srchEndYmd.value = "";
}
/*4.동적메서드 선언부분*/
 function searchParam(){
	 let frm = document.frmUserStats;
	 frm.action = contextPath+'/statsMgt/userStats.do';
	 frm.submit();
	 
}

function formatDateNumber(number) {
	  return number < 10 ? '0' + number : number;
}
	
function srchInit(){
	
	let currentDate = new Date();
	let year = currentDate.getFullYear();
	let month = formatDateNumber(currentDate.getMonth() + 1); // 월은 0부터 시작하므로 1을 더해줍니다.
	let day = formatDateNumber(currentDate.getDate());
	let fday = year + '-' + month + '-' + day;
	
	let frm = document.frmUserStats;
	//조회일 초기화
	frm.fromDate.value = fday;
	frm.toDate.value = fday;
	//select box 초기화
	frm.paramType.value = 'day';
	frm.userSearchType.value = 'R';
}

//메인페이지로
function movePrevPage() {
	let frm = document.frmUserStats;
	 frm.action =  contextPath+'/statsMgt/statsMain.do';
	 frm.submit();
}
</script>