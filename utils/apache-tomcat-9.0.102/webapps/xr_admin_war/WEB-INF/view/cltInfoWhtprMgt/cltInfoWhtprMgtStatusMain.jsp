<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<span class="tit">발행연도</span>
							<input type = 'hidden' id = "selectSearchYrIdValue" name ='selectSearchYrIdValue' >
						<div class="fm-focus fm-select" data-size="w200" >
							<select id="selectSearchYrId" name="selectSearchYrId">
									<option value="" selected="selected" >발행연도</option>
							    <c:forEach var="item" items="${selectSearchYr}">
							        <option value="${item.whtprId}" <c:if test="${item.whtprId == whtprId}">selected</c:if>><c:out value="${item.pblcnYr}" />년</option>
							    </c:forEach>
							</select>  
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btns" id="" onClick="javaScript:searchParam();return false;">조회</button>
				</div>
			</div>
		</form>
	</div>
	<div class="dashboard">
	<div class="row">
		<div class="card">
			<div class="tit-wrap">
				<h3>연도별 현황</h3>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="yrInfrmChart"></canvas>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="tit-wrap">
				<h3>정보화 및 정보보호 인력 현황</h3>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="infrmChart" style="height:40vh; width:37vw"></canvas>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card">
			<div class="tit-wrap">
				<h3>재원별 정보화 예산</h3>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="fircsInfrmBgtPrss"></canvas>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="tit-wrap">
				<h3>유형별 정보화 예산</h3>
			</div>
			<div class="cont-wrap chart-wrap">
				<div class="chart">
					<canvas id="typeInfrmBgtPrss"></canvas>

				</div>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- 과거 브라우저는 타입명시 안하면 오류 발생 시킬 수 있어 타입을 꼭 기입해야한다.-->
<script type="text/javascript">

/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
const ctx = document.getElementById('yrInfrmChart').getContext('2d');
const ctx2 = document.getElementById('infrmChart');
const ctx3 = document.getElementById('fircsInfrmBgtPrss').getContext('2d');
const ctx4 = document.getElementById('typeInfrmBgtPrss').getContext('2d');

const yrInfrmLabels = new Array(); //구분연도
const yrInfrmCntData1 = new Array();  // 본부인원수
const yrInfrmCntData2 = new Array();  // 소속기관인원수
const yrInfrmCntData3 = new Array();  // 공공기관인원수
const yrInfrmCntData4 = new Array();  // 전체인원수

const infrmLabels = new Array(); //전체인원수
const infrmType01Cnt = new Array();  //본부
const infrmType02Cnt = new Array();  //소속기관
const infrmType03Cnt = new Array();  //공공기관 */ 

const fircsInfrmBgtPrssLabels = new Array(); //일자
const fircsInfrmBgtPrss01 = new Array();  // 기획예산금액
const fircsInfrmBgtPrss02 = new Array();  // 개발구축예산금액
const fircsInfrmBgtPrss03 = new Array();  // 운영관리보수예산금액
const fircsInfrmBgtPrss04 = new Array();  // 전체합계

const typeInfrmBgtPrssLabels = new Array(); //일자
const typeInfrmBgtPrss01 = new Array();  // 기획예산금액
const typeInfrmBgtPrss02 = new Array();  // 개발구축예산금액
const typeInfrmBgtPrss03 = new Array();  // 운영관리보수예산금액
const typeInfrmBgtPrss04 = new Array();  // 자산취득예산금액
const typeInfrmBgtPrss05 = new Array();  // 기타예산금액
const typeInfrmBgtPrss06 = new Array();  // 합계


<c:if test="${!empty yrInfrmNmprList}">
	<c:forEach var="yrInfrmStick" items="${yrInfrmNmprList}" varStatus="status">
		yrInfrmLabels.push("${yrInfrmStick.seYr}");
		yrInfrmCntData1.push("${yrInfrmStick.hqNope}");
		yrInfrmCntData2.push("${yrInfrmStick.ogdpInstNope}");
		yrInfrmCntData3.push("${yrInfrmStick.pblcInstNope}");
		yrInfrmCntData4.push("" + (Number("${yrInfrmStick.hqNope}") + Number("${yrInfrmStick.ogdpInstNope}") + Number("${yrInfrmStick.pblcInstNope}")));
	</c:forEach>
</c:if>

let totalWholNope = 0;
let totalInfrmNope = 0;
let totalInfscrNope = 0;

<c:if test="${!empty infrmInfscrNmprList}"> 
	<c:forEach var="infrmStick" items="${infrmInfscrNmprList}">
		totalWholNope += Number("${infrmStick.wholNope}"); //본부 인력
		totalInfrmNope += Number("${infrmStick.infrmNope}"); //소속기관 인력
		totalInfscrNope += Number("${infrmStick.infscrNope}"); //공공기관 인력
	</c:forEach>
</c:if> 

	infrmType01Cnt.push(totalWholNope);
	infrmType02Cnt.push(totalInfrmNope);
	infrmType03Cnt.push(totalInfscrNope);


	<c:if test="${!empty fircsInfrmBgtPrssInfoVO}">
	<c:forEach var="item3" items="${fircsInfrmBgtPrssInfoVO}" varStatus="status">
		fircsInfrmBgtPrssLabels.push("${item3.seYr}");
		fircsInfrmBgtPrss01.push("${item3.stcfBgtAmt}");
		fircsInfrmBgtPrss02.push("${item3.fundBgtAmt}");
		fircsInfrmBgtPrss03.push("${item3.etcBgtAmt}");
		fircsInfrmBgtPrss04.push("${item3.bgtSumAmt}");
	</c:forEach>
	</c:if>
	
	<c:if test="${!empty typeInfrmBgtPrssInfoVO}">
	<c:forEach var="item4" items="${typeInfrmBgtPrssInfoVO}" varStatus="status">
		typeInfrmBgtPrssLabels.push("${item4.seYr}");
		typeInfrmBgtPrss01.push("${item4.plngBgtAmt}");
		typeInfrmBgtPrss02.push("${item4.devCnstBgtAmt}");
		typeInfrmBgtPrss03.push("${item4.operMngRprmBgtAmt}");
		typeInfrmBgtPrss04.push("${item4.astAcqsBgtAmt}");
		typeInfrmBgtPrss05.push("${item4.etcBgtAmt}");
		typeInfrmBgtPrss06.push("${item4.bgtSumAmt}");
	</c:forEach>
	</c:if>
new Chart(ctx, {
  type: 'bar',
  data: {
    labels: yrInfrmLabels,
    datasets: [
        {
            label: '전체 인원수',
            type : 'line',
            backgroundColor: 'rgba(255, 99, 132, 1)', // 막대 그래프 색상
            borderColor: 'rgba(255, 99, 132, 1)', // 막대 그래프 테두리 색상
            data: yrInfrmCntData4, // 전체 인원 수
            fill : false,
          },
        {
          label: '본부 인원수',
          backgroundColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 색상
          borderColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 테두리 색상
          data: yrInfrmCntData1, // 본부 인원 수
          borderWidth: 1
        },
        {
          label: '소속 기관 인원수',
          backgroundColor: 'rgba(158, 178, 193, 53)',
          borderColor: 'rgba(158, 178, 193, 53)',
          data: yrInfrmCntData2, // 소속기관 인원수 
          borderWidth: 1
        },
        {
          label: '공공 기관 인원수',
          backgroundColor: 'rgba(126, 196, 247,212)',
          borderColor: 'rgba(126, 196, 247,212)',
          data: yrInfrmCntData3, // 공공기관 인원 수
          borderWidth: 1
        }
      ]
    },
  options: {
    scales: {
        x: {
            stacked: true 
          },
          y: {
            stacked: true 
          }
    },
  }
});

//infrmChart
new Chart(ctx2, {
	  type: 'pie',
	  data: {
	    labels: ['전체인력', '정보화인력', '정보보호인력'],
	    datasets: [{

	        data: [infrmType01Cnt,infrmType02Cnt,infrmType03Cnt],
	          backgroundColor: ['rgba(95, 108, 117, 25)','rgba(158, 178, 193, 53)', 'rgba(126, 196, 247,212)'],
	          borderWidth: 1
	        }]
	      },
	      options: {
	    	  responsive: false,
	    	  plugins: {
	    	    legend: {
	    	      position: 'right',
	    	      labels: {
	    	        font: {
	    	          size: 16 
	    	        },
	    	        generateLabels: function(chart) {
	    	          var data = chart.data;
	    	          return data.labels.map(function(label, index) {
	    	            return {
	    	              text: label + '  ' + data.datasets[0].data[index] + '명',
	    	              fillStyle: data.datasets[0].backgroundColor[index],
	    	            };
	    	          });
	    	        }
	    	      }
	    	    },
	    	    tooltip: {
	    	      enabled: true
	    	    }
	    	  }
	    	}
	    	});


const fircsInfrmBgtPrssData = {
   labels: fircsInfrmBgtPrssLabels,
   datasets: [
   	  {
             label: '전체합계',
             type: 'line',
             fill: false,
             backgroundColor: 'rgba(255, 99, 132, 1)',
             borderColor: 'rgba(255, 99, 132, 1)',
             borderWidth: 2,
             pointRadius: 3,
             data: fircsInfrmBgtPrss04
         },
   	{
           label: '국고예산금액',
           backgroundColor: 'rgba(95, 108, 117, 25)',
           borderColor: 'rgba(95, 108, 117, 25)',
           borderWidth: 1,
           data: fircsInfrmBgtPrss01
       },
       {
           label: '기금예산금액',
           backgroundColor: 'rgba(158, 178, 193, 53)',
           borderColor: 'rgba(158, 178, 193, 53)',
           borderWidth: 1,
           data: fircsInfrmBgtPrss02
       },
       {
           label: '기타예산금액',
           backgroundColor: 'rgba(126, 196, 247,212)',
           borderColor: 'rgba(126, 196, 247,212)',
           borderWidth: 1,
           data: fircsInfrmBgtPrss03
      }
     
   ]
};

	   const fircsInfrmBgtPrssOptions = {
	       scales: {
	           x: {
	               stacked: true
	           },
	           y: {
	               stacked: true
	           }
	       }
	   };
	   
	   const fircsInfrmBgtPrssChart = new Chart(ctx3, {
	       type: 'bar',
	       data: fircsInfrmBgtPrssData,
	       options: fircsInfrmBgtPrssOptions
	   });

	   
	   const typeInfrmBgtPrssData = {
		       labels : typeInfrmBgtPrssLabels,
		       datasets: [
		    	    {
		               label: '전체합계',
		               type: 'line',
		               fill: false,
		               backgroundColor: 'rgba(255, 99, 132, 1)',
		               borderColor: 'rgba(255, 99, 132, 1)',
		               borderWidth: 2,
		               pointRadius: 3,
		               data:typeInfrmBgtPrss06
			           },
		           {
		               label: '기획예산금액',
		               backgroundColor: 'rgba(95, 108, 117, 25)', 
		               borderColor: 'rgba(95, 108, 117, 25)', 
		               borderWidth: 1,
		               data:typeInfrmBgtPrss01
		           },
		           {
		               label: '개발구축예산금액',
		               backgroundColor: 'rgba(158, 178, 193, 53)',
		               borderColor: 'rgba(158, 178, 193, 53)',
		               borderWidth: 1,
		           	data:typeInfrmBgtPrss02
		           },
		           {
		               label: '운영관리보수예산금액',
		               backgroundColor: 'rgba(126, 196, 247,212)',
		               borderColor: 'rgba(126, 196, 247,212)',
		               borderWidth: 1,
		               data:typeInfrmBgtPrss03
		           },
		           {
		               label: '자산취득예산금액',
		               backgroundColor: 'rgba(60, 93, 117, 77)',
		               borderColor: 'rgba(60, 93, 117, 77)',
		               borderWidth: 1,
		               data:typeInfrmBgtPrss04
		           },
		           {
		               label: '기타예산금액',
		               backgroundColor: 'rgba(96, 125, 139, 0.7529)',
		               borderColor: 'rgba(96, 125, 139, 0.7529)',
		               borderWidth: 1,
		               data:typeInfrmBgtPrss05
		           }       
		           
		       ]
		   };
	   const typeInfrmBgtPrssOptions = {
	       scales: {
	           x: {
	               stacked: true
	           },
	           y: {
	               stacked: true
	           }
	       }
	   };
	 
	   const typeInfrmBgtPrssChart = new Chart(ctx4, {
	       type: 'bar',
	       data: typeInfrmBgtPrssData ,
	       options: typeInfrmBgtPrssOptions
	   });
	   

		
	   $(document).ready(function() {
		    $('#selectSearchYrId').change(function() {
		        var selectedValue = $(this).val();
		        $('#selectSearchYrIdValue').val(selectedValue);
		    });
		});
		


function searchParam() {
	
    var searchYrIdValue = $('#selectSearchYrIdValue').val();
    if (searchYrIdValue == null || searchYrIdValue.trim() === '') {
        alert('연도를 선택해주세요.');
        return;
    }
	
    let frm = document.frmStats;
    let whtprId = document.getElementById("selectSearchYrId").value;
    frm.action = contextPath + '/cltInfoWhtprMgt/cltInfoWhtprMgtStatusMain.do?whtprId=' + encodeURIComponent(whtprId);
    frm.method = 'POST';
    frm.submit();
}

function goClcSrchParamReset() {
    let frm = document.frmStats;
    frm.fromDate.value = "";
    frm.toDate.value = "";
    frm.paramType.value = "";
}

 
</script>