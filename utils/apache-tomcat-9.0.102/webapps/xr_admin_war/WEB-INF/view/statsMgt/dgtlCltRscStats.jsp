<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='https://cdn.jsdelivr.net/npm/chart.js'/>"></script>
<div class="contants">
	<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmdgtlClc"  id="frmdgtlClc" method="post" action="#">
			<div class="search">
				<div class="filter">
					<div class="row">
						<strong class="tit">조회 기간</strong>
						<div class="fm-ele date" >
							<input type="date" id="fromDate" name="fromDate" value="${searchInfo.fromDate}" placeholder="시작 일자"/>
						</div>
						<span>~</span>
						<div class="fm-ele date">
							<input type="date" id="toDate" name="toDate" value="${searchInfo.toDate}" placeholder="종료 일자"/>
						</div>
						<div class="fm-focus fm-select">
							<select id="paramConType" name="paramConType">
								<option value="ALL" <c:if test="${searchInfo.paramConType == 'ALL' or searchInfo.paramType == ''}">selected</c:if>>전체</option>
								<option value="3D" <c:if test="${searchInfo.paramConType == '3D'}">selected</c:if>>3D</option>
								<option value="VD" <c:if test="${searchInfo.paramConType == 'VD'}">selected</c:if>>동영상</option>
								<option value="IM"<c:if test="${searchInfo.paramConType == 'IM'}">selected</c:if>>이미지</option>
								<option value="AU" <c:if test="${searchInfo.paramConType == 'AU'}">selected</c:if>>오디오</option>
								<option value="TX" <c:if test="${searchInfo.paramConType == 'TX'}">selected</c:if>>텍스트</option>
								
							</select> 
						</div>
						<div class="fm-focus fm-select">
							<select id="paramType" name="paramType">
								<option value="day" <c:if test="${searchInfo.paramType == 'day' or searchInfo.paramType == ''}">selected</c:if>>일별</option>
								<option value="week" <c:if test="${searchInfo.paramType == 'week'}">selected</c:if>>주별</option>
								<option value="month"<c:if test="${searchInfo.paramType == 'month'}">selected</c:if>>월별</option>
								<option value="year" <c:if test="${searchInfo.paramType == 'year'}">selected</c:if>>연도별</option>
							</select> 
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="" onClick="javaScript:searchParam();return false;">조회</button>
					<button type="button" class="btns color-gray" id="" onClick="javaScript:srchInit();return false;">초기화</button>
				</div>
			</div>
		</form>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" id="searchUser" onclick="javascript:movePrevPage(); return false;">이전</button>
	</div>
	<div style="height:650px;"> <!-- 높이 수정 해야 함 -->
		<canvas id="dgtlClcChart"></canvas>
	</div>
</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

const dgtlClcLabels = new Array(); //일자
const dgtlClcType01Cnt = new Array();  //3D 
const dgtlClcType02Cnt = new Array();  //동영상
const dgtlClcType03Cnt = new Array();  //이미지
const dgtlClcType04Cnt = new Array();  //오디오
const dgtlClcType05Cnt = new Array();  //텍스트

<c:if test="${!empty dgtlClcList}">
<c:forEach var="dgtlClcStick" items="${dgtlClcList}" varStatus="status">
	dgtlClcLabels.push("${dgtlClcStick.dgtlClcSearchDate}");
	dgtlClcType01Cnt.push("${dgtlClcStick.dgtlClcType01Cnt}");
	dgtlClcType02Cnt.push("${dgtlClcStick.dgtlClcType02Cnt}");
	dgtlClcType03Cnt.push("${dgtlClcStick.dgtlClcType03Cnt}");
	dgtlClcType04Cnt.push("${dgtlClcStick.dgtlClcType04Cnt}");
	dgtlClcType05Cnt.push("${dgtlClcStick.dgtlClcType05Cnt}");
</c:forEach>
</c:if>

//데이터
const data = {
	      //labels: ['3D', '이미지', '오디오', '동영상'],
	      labels: dgtlClcLabels,
	      datasets: [
	        {
	        	label: '3D',
	            backgroundColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 색상
	            borderColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 테두리 색상
	            borderWidth: 1,
	            //data: [10, 20, 30, 40] // data
	            data:dgtlClcType01Cnt
	        },
	        {
	        	label: '동영상',
	            backgroundColor: 'rgba(158, 178, 193, 53)',
	            borderColor: 'rgba(158, 178, 193, 53)',
	            borderWidth: 1,
	            //data: [5, 15, 25, 35]
	        	data:dgtlClcType02Cnt
	        },
	        {
	        	label: '이미지',
	            backgroundColor: 'rgba(126, 196, 247,212)',
	            borderColor: 'rgba(126, 196, 247,212)',
	            borderWidth: 1,
	            //data: [5, 15, 25, 35] 
	            data: dgtlClcType03Cnt
	        },
	        {
	        	label: '오디오',
	            backgroundColor: 'rgba(60, 93, 117, 77)',
	            borderColor: 'rgba(60, 93, 117, 77)',
	            borderWidth: 1,
	            //data: [5, 15, 25, 35]
	            data:dgtlClcType04Cnt
	        },
	        {
	        	label: '텍스트',
	            backgroundColor: 'rgba(181, 230, 29, 192)',
	            borderColor: 'rgba(181, 230, 29, 192)',
	            borderWidth: 1,
	            //data: [5, 15, 25, 35,45]
	            data:dgtlClcType05Cnt
	        }
	        
	      ]
	    };

	    // 차트 옵션 설정
	    const options = {
	      scales: {
	        x: {
	          stacked: true,
	          beginAtZero: true,
	        },
	        y: {
	          stacked: true,
	        },
	      },
	      plugins:{ // 라벨 숨기기
	          legend: {
	              display: false
	          },
	      },
	      indexAxis: 'y' //수평차트 만들기
	    };

// 차트 생성
const ctx = document.getElementById('dgtlClcChart').getContext('2d');
const myStackedHorizontalBarChart = new Chart(ctx, {
  type: 'bar',
  data: data,
  options: options,
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
	 let frm = document.frmdgtlClc;
	 frm.action = contextPath+'/statsMgt/dgtlCltRscStats.do';
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
	
	let frm = document.frmdgtlClc;
	//조회일 초기화
	frm.fromDate.value = fday;
	frm.toDate.value = fday;
	//select box 초기화
	frm.paramType.value = 'day';
	frm.paramConType.value = 'ALL';
	
}

//메인페이지로
function movePrevPage() {
	let frm = document.frmdgtlClc;
	 frm.action = contextPath+'/statsMgt/statsMain.do';
	 frm.submit();
}
</script>