<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value="https://cdn.jsdelivr.net/npm/chart.js"/>"></script>
<div class="contants">
<!-- 콘텐츠 영역 -->
	<div class="control-wrap">
		<form name="frmStats" id="frmStats" method="post" action="#">
			<div class="search">
				<div class="filter">
					<div class="row">
						<span class="tit">검색기간</span>
						<div class="fm-ele date">
							<input type="date" id="fromDate" name="fromDate" value="${searchInfo.fromDate}" placeholder="시작 일자"/>
						</div >
						<span>~</span>
						<div class="fm-ele date">
							<input type="date" id="toDate" name="toDate" value="${searchInfo.toDate}" placeholder="종료 일자"/>
						</div>
					
						<div class="fm-focus fm-select" data-size="w200" >
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

	<div class="dashboard">
		
	<div class="row">
		<div class="card">
			<div class="tit-wrap">
				<h3>사용자 현황</h3>
				<div class="btn-wrap">
					<button type="button" class="btns size-xsmall btn-more" id="SearchUser" onClick="javascript:goUserStats();return false;">MORE</button>
				</div>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="userChart"></canvas>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="tit-wrap">
				<h3>다운로드 현황</h3>
				<div class="btn-wrap">
					<button type="button" class="btns size-xsmall btn-more" id="SearchDown" onClick="javascript:goDownStats();return false;">MORE</button>
				</div>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="downChart"></canvas>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card">
			<div class="tit-wrap">
				<h3>기관별 디지털 문화자원 현황</h3>
				<div class="btn-wrap">
					<button type="button" class="btns size-xsmall btn-more" id="" onClick="javascript:goInstStats();return false;">MORE</button>
				</div>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="instDgtlChart"></canvas>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="tit-wrap">
				<h3>디지털 문화자원 현황</h3>
				<div class="btn-wrap">
					<button type="button" class="btns size-xsmall btn-more" id="" onClick="javascript:goDgtlClcStats();return false;">MORE</button>
				</div>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="dgtlChart" style="height:40vh; width:37vw"></canvas>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
const ctx = document.getElementById('userChart');
const ctx2 = document.getElementById('downChart').getContext('2d');
//const ctx2 = document.getElementById('downChart');
//document.getElementById('instDgtlChart');
const ctx3 = document.getElementById('instDgtlChart').getContext('2d');
const ctx4 = document.getElementById('dgtlChart');

const userLabels = new Array(); //일자
const userCntData = new Array();  // 가입수

const downLoadLabels = new Array(); //일자
const dgtlDownType01Cnt = new Array();  //3D 
const dgtlDownType02Cnt = new Array();  //동영상
const dgtlDownType03Cnt = new Array();  //이미지
const dgtlDownType04Cnt = new Array();  //오디오
const dgtlDownType05Cnt = new Array();  //텍스트

const dgtlInstLabels = new Array(); //일자
const dgtlInstType01Cnt = new Array();  //3D 
const dgtlInstType02Cnt = new Array();  //동영상
const dgtlInstType03Cnt = new Array();  //이미지
const dgtlInstType04Cnt = new Array();  //오디오
const dgtlInstType05Cnt = new Array();  //텍스트
//downLoadList

<c:if test="${!empty userList}">
<c:forEach var="userStick" items="${userList}" varStatus="status">
userLabels.push("${userStick.userSearchDate}");
userCntData.push("${userStick.userCnt}");
</c:forEach>
</c:if>

<c:if test="${!empty downLoadList}">
<c:forEach var="downStick" items="${downLoadList}" varStatus="status">
	downLoadLabels.push("${downStick.downSearchDate}");
	dgtlDownType01Cnt.push("${downStick.dgtlDownType01Cnt}");
	dgtlDownType02Cnt.push("${downStick.dgtlDownType02Cnt}");
	dgtlDownType03Cnt.push("${downStick.dgtlDownType03Cnt}");
	dgtlDownType04Cnt.push("${downStick.dgtlDownType04Cnt}");
	dgtlDownType05Cnt.push("${downStick.dgtlDownType05Cnt}");
</c:forEach>
</c:if>

<c:if test="${!empty instList}">
<c:forEach var="instStick" items="${instList}" varStatus="status">
	dgtlInstLabels.push("${instStick.instNm}");
	dgtlInstType01Cnt.push("${instStick.dgtlInstType01Cnt}");
	dgtlInstType02Cnt.push("${instStick.dgtlInstType02Cnt}");
	dgtlInstType03Cnt.push("${instStick.dgtlInstType03Cnt}");
	dgtlInstType04Cnt.push("${instStick.dgtlInstType04Cnt}");
	dgtlInstType05Cnt.push("${instStick.dgtlInstType05Cnt}");
</c:forEach>
</c:if>

//userCahrt
new Chart(ctx, {
  type: 'bar',
  data: {
    //labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    labels: userLabels,
    datasets: [{
      label: '# 사용자 가입 수',
      //data: [12, 19, 3, 5, 2, 3],
      backgroundColor: 'rgba(154, 208, 245, 197)', // 막대 그래프 색상
      data:userCntData,
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});

//Download chart
const downData = {
       //labels: ['항목 1', '항목 2'],
       labels : downLoadLabels,
       datasets: [
           {
               label: '3D',
               backgroundColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 색상
               borderColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 테두리 색상
               borderWidth: 1,
               //data: [10, 20, 30, 40] // data
               data:dgtlDownType01Cnt
           },
           {
               label: '동영상',
               backgroundColor: 'rgba(158, 178, 193, 53)',
               borderColor: 'rgba(158, 178, 193, 53)',
               borderWidth: 1,
               //data: [5, 15, 25, 35]
           	   data:dgtlDownType02Cnt
           },
           {
               label: '이미지',
               backgroundColor: 'rgba(126, 196, 247,212)',
               borderColor: 'rgba(126, 196, 247,212)',
               borderWidth: 1,
               // data: [5, 15, 25, 35] inData03
               data: dgtlDownType03Cnt
           },
           {
               label: '오디오',
               backgroundColor: 'rgba(60, 93, 117, 77)',
               borderColor: 'rgba(60, 93, 117, 77)',
               borderWidth: 1,
               //data: [5, 15, 25, 35]inData02
               data:dgtlDownType04Cnt
           },
           {
               label: '텍스트',
               backgroundColor: 'rgba(181, 230, 29, 192)',
               borderColor: 'rgba(181, 230, 29, 192)',
               borderWidth: 1,
               //data: [5, 15, 25, 35]inData02
               data:dgtlDownType05Cnt
           }
       ]
   };

   // 옵션
   const downOptions = {
       scales: {
           x: {
               stacked: true
           },
           y: {
               stacked: true
           }
       }
   };

   // 누적 막대 차트 생성
   const downChart = new Chart(ctx2, {
       type: 'bar',
       data: downData,
       options: downOptions
   });
   
   //기관
   const instData = {
	       //labels: ['항목 1', '항목 2'],
	       labels : dgtlInstLabels,
	       datasets: [
	           {
	               label: '3D',
	               backgroundColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 색상
	               borderColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 테두리 색상
	               borderWidth: 1,
	               //data: [10, 20, 30, 40] // data
	               data:dgtlInstType01Cnt
	           },
	           {
	               label: '동영상',
	               backgroundColor: 'rgba(158, 178, 193, 53)',
	               borderColor: 'rgba(158, 178, 193, 53)',
	               borderWidth: 1,
	               //data: [5, 15, 25, 35]
	           	data:dgtlInstType02Cnt
	           },
	           {
	               label: '이미지',
	               backgroundColor: 'rgba(126, 196, 247,212)',
	               borderColor: 'rgba(126, 196, 247,212)',
	               borderWidth: 1,
	               // data: [5, 15, 25, 35] inData03
	               data:dgtlInstType03Cnt
	           },
	           {
	               label: '오디오',
	               backgroundColor: 'rgba(60, 93, 117, 77)',
	               borderColor: 'rgba(60, 93, 117, 77)',
	               borderWidth: 1,
	               //data: [5, 15, 25, 35]inData02
	               data:dgtlInstType04Cnt
	           },
	           {
	               label: '텍스트',
	               backgroundColor: 'rgba(181, 230, 29, 192)',
                   borderColor: 'rgba(181, 230, 29, 192)',
	               borderWidth: 1,
	               //data: [5, 15, 25, 35]inData02
	               data:dgtlInstType05Cnt
	           }
	       ]
	   };

	   // 옵션
	   const instOptions = {
	       scales: {
	           x: {
	               stacked: true
	           },
	           y: {
	               stacked: true
	           }
	       }
	   };

	   // 누적 막대 차트 생성
	   const instChart = new Chart(ctx3, {
	       type: 'bar',
	       data: instData,
	       options: instOptions
	   });
   
	   

new Chart(ctx4, {
  type: 'pie',
  data: {
    labels: ['3D', '동영상', '이미지','오디오','텍스트'],
    datasets: [{
      //label: '# of Votes',
      // data: [12, 19, 3, 5, 2, 3],
      data: ["${circleInfo.dgtlCirType01Cnt}", "${circleInfo.dgtlCirType02Cnt}", "${circleInfo.dgtlCirType03Cnt}","${circleInfo.dgtlCirType04Cnt}","${circleInfo.dgtlCirType05Cnt}"],
      backgroundColor: ['rgba(95, 108, 117, 25)','rgba(158, 178, 193, 53)', 'rgba(126, 196, 247,212)','rgba(60, 93, 117, 77)','rgba(181, 230, 29, 192)'],
      borderWidth: 1
    }]
  },
  options: {
	  responsive: false, //사이즈 조절시 false 없으면 true
	  scales: {
      y: {
        beginAtZero: true
      },
    },
    plugins : {
    	// 범례 설정
        legend: {
            // 범례 위치
            position: 'right',
        },
    },
    
  }
});


/*2.전역변수 정의 및 초기화는 여기에 기입*/
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/
//클릭시 검색폼에 담긴 값을 가지고 조건에 맞는 리스트를 요청하는 함수
function searchParam(){
	let frm = document.frmStats;
    frm.action = contextPath+'/statsMgt/statsMain.do';
    frm.submit();
}
//클릭시 검색폼 값을 초기화 하는 함수
function goClcSrchParamReset() {
    let frm = document.frmStats;
    frm.fromDate.value = "";
    frm.toDate.value = "";
    frm.paramType.value = "";
}

function goUserStats(){
	let frm = document.frmStats;
	frm.action = contextPath+'/statsMgt/userStats.do';
    frm.submit();
}

function goDownStats(){
	let frm = document.frmStats;
	frm.action = contextPath+'/statsMgt/dgtlCltDwnldStats.do';
    frm.submit();
}

function goInstStats(){
	let frm = document.frmStats;
	frm.action = contextPath+'/statsMgt/instDgtlCltRscStats.do';
    frm.submit();
}

function goDgtlClcStats(){
	let frm = document.frmStats;
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
	
	let frm = document.frmStats;
	//조회일 초기화
	frm.fromDate.value = fday;
	frm.toDate.value = fday;
	//select box 초기화
	frm.paramType.value = 'day';
}



/*4.동적메서드 선언부분*/
 
</script>