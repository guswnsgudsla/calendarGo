<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/lib/chart.js"/>"></script>
<script>
var bgColor = ['#103E6D', '#006592','#008DAC','#00B5BA','#55DCBE','#00C7CF','#00AEDD','#0092DF','#2771CF', '#6F4AAB'];

//데이타유형 타이틀
var dataTypeTtlList = [];
<c:forEach var="value" items="${dataTypeRegStatTtlList}">
	dataTypeTtlList.push('<c:out value="${value}"/>');
</c:forEach>

//컨텐츠유형 타이틀
var contsTypeTtlList = [];
<c:forEach var="value" items="${contsTypeRegStatTtlList}">
	contsTypeTtlList.push('<c:out value="${value}"/>');
</c:forEach>

$(document).ready(function(){
  //데이타유형별등록현황 범례 색
  var dlList = document.querySelectorAll('.dataType-dl');
  for (var i = 0; i < dlList.length; i++) {
    dlList[i].style.setProperty('--legend-color', bgColor[i]);
  }
  //컨텐츠유형별등록현황 범례 색 	
  var dlList2 = document.querySelectorAll('.conts-dl');
  for (var i = 0; i < dlList2.length; i++) {
    dlList2[i].style.setProperty('--legend-color', bgColor[i]);
  }
  
  //1.데이타유형별등록현황
  funDataTypeRegStatChart();
  //2.컨텐츠유형별등록현황
  funContsTypeRegStatChart();   
  //3.테이터유형별다운로드현황
  funDataTypeDwnldStatChart();
  //4.테이터유형별스크랩현황
  //funDataTypeScrpStatChart();
  //5.테이터유형별조회현황
  funDataTypeSrchStatChart();
  funCounter();
});

function funCounter() {
    const counters = document.querySelectorAll('strong.counter');
    let observer;

    const animateCount = (counter) => {
        const target = +counter.dataset.target;
        let current = 0;
        const step = target / 100;

        const updateCount = () => {
            current += step;
            if (current < target) {
                counter.innerText = Math.ceil(current).toLocaleString();
                requestAnimationFrame(updateCount);
            } else {
                counter.innerText = target.toLocaleString();
            }
        };

        updateCount();
    };

    const onEntry = (entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateCount(entry.target);
                observer.unobserve(entry.target); // 요소가 한 번 애니메이션을 실행한 후 다시 감지하지 않도록 observer에서 제거
            }
        });
    };

    if ('IntersectionObserver' in window) {
        observer = new IntersectionObserver(onEntry, {
            threshold: 0.5 // 50% 이상 보일 때 애니메이션 시작
        });

        counters.forEach(counter => {
            observer.observe(counter); // 각 카운터를 observer에 등록
        });
    } else {
        // Fallback for browsers that don't support IntersectionObserver
        // 모든 카운터에 대해 바로 애니메이션을 실행
        counters.forEach(animateCount);
    }
}

//데이터유형별 등록현황
function funDataTypeRegStatChart(){

	var options_display = {
		plugins : {
			legend : {
				display : false
			}
		},
		maintainAspectRatio: false
	}
		
	//데이터유형별 등록현황
	var dataTypeRegStatValList = [];
	<c:forEach var="value" items="${dataTypeRegStatValList}">
	     dataTypeRegStatValList.push('<c:out value="${value}"/>');
	</c:forEach>
	
	//데이터
	var data = {
		labels: dataTypeTtlList,
		datasets: [{
			data: dataTypeRegStatValList,
			backgroundColor: bgColor,
			hoverBackgroundColor: bgColor
		}]
	};
	
	// 차트 생성
	var ctx = document.getElementById('dataTypeDouChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'doughnut', 
		data: data,
		options : options_display
	});
}

//컨텐츠유형별등록현황
function funContsTypeRegStatChart(){

	var options_display = {
		plugins : {
			legend : {
				display : false
			}
		},
		maintainAspectRatio: false
	}

	//컨텐츠유형별 등록현황
	var contsTypeRegStatValList = [];
	<c:forEach var="value" items="${contsTypeRegStatValList}">
		contsTypeRegStatValList.push('<c:out value="${value}"/>');
	</c:forEach>
		
	//데이터
	var data = {
		labels: contsTypeTtlList,
		datasets: [{
			data: contsTypeRegStatValList,
			backgroundColor: bgColor,
			hoverBackgroundColor: bgColor
		}]
	};
	
	// 차트 생성
	var ctx = document.getElementById('contsTypeDouChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'doughnut', // 'doughnut' 대신 'pie'를 사용하면 원형 차트가 됩니다.
		data: data,
		options : options_display
	});

}

//데이터유형별다운로드 현황
function funDataTypeDwnldStatChart(){
	
	//컨텐츠유형별 등록현황
	var dataTypeDwnldStatValList = [];
	<c:forEach var="value" items="${dataTypeDwnldStatValList}" varStatus="loopStatus">
	    <c:if test="${not loopStatus.last}">
	    	dataTypeDwnldStatValList.push('<c:out value="${value}"/>');
	    </c:if>
    </c:forEach>

    var data = {
		  labels: dataTypeTtlList,
		  datasets: [{
		    label: [],
		    data: dataTypeDwnldStatValList,
		    backgroundColor: bgColor,
		    borderColor: bgColor,
		    borderWidth: 1
		  }]
		};

	var chartOptions = {
	 maintainAspectRatio: false,	  
	  scales: {
	    y: {
	      beginAtZero: true,
	    	ticks : {
	    		precision: 0,
	    		font: {
	    			size: 18
	    		}
	    	}	
	    },
	    x: {
	    	ticks : {
	    		font: {
	    			size: 18
	    		}
	    	}	
	    }
	  },
	  plugins: {
	    legend: {
	      display: false // 범례를 표시하지 않음
	    }
	  }
	};

	var ctx = document.getElementById('dwnldBarChart').getContext('2d');
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: data,
	  options: chartOptions
	});
  
}  

//데이터유형별스크랩 현황
function funDataTypeScrpStatChart(){
	
	//컨텐츠유형별 등록현황
	var dataTypeScrpStatValList = [];
	<c:forEach var="value" items="${dataTypeScrpStatValList}" varStatus="loopStatus">
	    <c:if test="${not loopStatus.last}">
	    	dataTypeScrpStatValList.push('<c:out value="${value}"/>');
	    </c:if>
    </c:forEach>

    var data = {
		  labels: dataTypeTtlList,
		  datasets: [{
		    label: [],
		    data: dataTypeScrpStatValList,
		    backgroundColor: bgColor,
		    borderColor: bgColor,
		    borderWidth: 1
		  }]
		};

	var chartOptions = {
	 maintainAspectRatio: false,
	  scales: {
	    y: {
	      beginAtZero: true,
	    	ticks : {
	    		precision: 0,
	    		font: {
	    			size: 18
	    		}
	    	}
	    },
	    x: {
	    	ticks : {
	    		font: {
	    			size: 18
	    		}
	    	}	
	    }
	  },
	  plugins: {
	    legend: {
	      display: false // 범례를 표시하지 않음
	    }
	  }
	};

	var ctx = document.getElementById('scrpBarChart').getContext('2d');
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: data,
	  options: chartOptions
	});
}  

//데이터유형별조회 현황
function funDataTypeSrchStatChart(){
	
	//컨텐츠유형별 등록현황
	var dataTypeSrchStatValList = [];
	<c:forEach var="value" items="${dataTypeSrchStatValList}" varStatus="loopStatus">
	    <c:if test="${not loopStatus.last}">
	    	dataTypeSrchStatValList.push('<c:out value="${value}"/>');
	    </c:if>
    </c:forEach>

    var data = {
		  labels: dataTypeTtlList,
		  datasets: [{
		    label: [],
		    data: dataTypeSrchStatValList,
		    backgroundColor: bgColor,
		    borderColor: bgColor,
		    borderWidth: 1
		  }]
		};

	var chartOptions = {
	 maintainAspectRatio: false,
	  scales: {
	    y: {
	      beginAtZero: true,
	    	ticks : {
	    		precision: 0,
	    		font: {
	    			size: 18
	    		}
	    	}
	    },
	    x: {
	    	ticks : {
	    		font: {
	    			size: 18
	    		}
	    	}	
	    }
	  },
	  plugins: {
	    legend: {
	      display: false // 범례를 표시하지 않음
	    }
	  }
	};

	var ctx = document.getElementById('srchBarChart').getContext('2d');
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: data,
	  options: chartOptions
	});
}



</script>

<!-- container(S) -->
<section class="container">
	<header>
		<div class="inner">
			<h2>디지털문화자원 현황</h2>
			<div class="breadcrumbs">
				<a href="<c:url value="/index.do"/>">메인</a> 
				<span>디지털문화자원 현황과 활용 사례</span> 
				<span>디지털문화자원	현황</span>
			</div>
		</div>
	</header>
	<section id="contents" class="contents dashboard">
		<div class="inner">
			<!-- total 아이콘 있는 버전 -->
			
			<div class="total">
				<div class="card">
					<i class="icon-company"></i>
					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.invlInstCnt}" pattern="#,###" />" ><fmt:formatNumber value="${cltRscBrifStat.invlInstCnt}" pattern="#,###" /></strong>
					<em>참여기관수</em>
				</div>
				<div class="card">
					<i class="icon-resource"></i>
					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" />"><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" /></strong>
					<em>총 콘텐츠 수</em>
				</div>
				<div class="card">
					<i class="icon-download"></i>
					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.dwnldCnt}" pattern="#,###" />"><fmt:formatNumber value="${cltRscBrifStat.dwnldCnt}" pattern="#,###" /></strong>
					<em>총 다운로드 수</em>
				</div>
				<div class="card">
					<i class="icon-search"></i>
					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.srchCnt}"  pattern="####"/>"><fmt:formatNumber value="${cltRscBrifStat.srchCnt}" /></strong>
<%--					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.srchCnt}" pattern="#,###" />"><fmt:formatNumber value="${cltRscBrifStat.srchCnt}" pattern="#,###" /></strong>--%>
					<em>총 조회 수</em>
				</div>
				<%-- 사용자 수가 적어 주석처리 합니다. 향후에 주석 풀것.
				<div class="card">
					<i class="icon-user"></i>
					<strong class="counter" data-target="<fmt:formatNumber value="${cltRscBrifStat.mbrCnt}" pattern="#,###" />"><fmt:formatNumber value="${cltRscBrifStat.mbrCnt}" pattern="#,###" /></strong>
					<em>총 사용자 수</em>
				</div>
				--%>
			</div>
			
			<!-- total 아이콘 없는 버전 -->
			<!-- 
			<div class="total">
				<div class="card">
					<em>등록기관수</em> <strong><fmt:formatNumber value="${cltRscBrifStat.invlInstCnt}" pattern="#,###" /></strong>
				</div>
				<div class="card">
					<em>총 콘텐츠 수</em> <strong><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" /></strong>
				</div>
				<div class="card">
					<em>총 다운로드 수</em> <strong><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" /></strong>
				</div>
				<div class="card">
					<em>총 조회 수</em> <strong><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" /></strong>
				</div>
				<div class="card">
					<em>총 사용자 수</em> <strong><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt}" pattern="#,###" /></strong>
				</div>
			</div>
			-->
			<div class="board">
				<div class="card">
					<div class="tit-wrap">
						<h3>데이터 유형별 등록 현황</h3>
					</div>
					<div class="cont-wrap">
						<div class="chart-wrap">
							<div class="chart">
								<canvas id="dataTypeDouChart" width="406" height="250" style="display: block; box-sizing: border-box; height: 250px; width: 406px;"></canvas>
							</div>
							<div class="legend-list">
								<c:forEach items="${dataTypeRegStatTtlList}" var="title" varStatus="status">
								<dl class="dataType-dl" style="--legend-color:#103E6D;">
									<dt><c:out value="${title}"/></dt>
								</dl>
							</c:forEach>
							</div>
						</div>
						<dl class="data-table">
							<c:forEach items="${dataTypeRegStatTtlList}" var="title" varStatus="status">
								<dt><c:out value="${title}"/></dt>
								<dd><fmt:formatNumber value='${dataTypeRegStatValList[status.index]}' pattern="#,###" /></dd>
							</c:forEach>
						</dl>
					</div>
				</div>
				<div class="card">
					<div class="tit-wrap">
						<h3>공통분류별 등록 현황</h3>
					</div>
					<div class="cont-wrap">
						<div class="chart-wrap">
							<!-- sample chart -->
							<div class="chart">
								<canvas id="contsTypeDouChart" width="406" height="250" style="display: block; box-sizing: border-box; height: 250px; width: 406px;"></canvas>
							</div>
							<div class="legend-list">
							<c:forEach items="${contsTypeRegStatTtlList}" var="title" varStatus="status">
								<dl class="conts-dl" style="--legend-color:#103E6D;">
									<dt><c:out value="${title}"/></dt>
								</dl>
							</c:forEach>
							</div>
						</div>
						<dl class="data-table">
							<c:forEach items="${contsTypeRegStatTtlList}" var="title" varStatus="status">
								<dt><c:out value="${title}"/></dt>
								<dd><fmt:formatNumber value='${contsTypeRegStatValList[status.index]}' pattern="#,###" /></dd>
							</c:forEach>
						</dl>
					</div>
				</div>
				<div class="card">
					<div class="tit-wrap">
						<h3>데이터 유형별 다운로드 현황</h3>
						<!-- <span>(2023. 10. 14 PM 11:00 기준)</span> -->
					</div>
					<div class="cont-wrap">
						<div class="chart-wrap">
							<!-- sample chart -->
							<div class="chart">
								<canvas id="dwnldBarChart" width="406" height="250" style="display: block; box-sizing: border-box; height: 250px; width: 406px;"></canvas>
							</div>
						</div>
						<dl class="data-table">
							<c:forEach items="${dataTypeStatTtlList}" var="title" varStatus="status">
								<c:choose>
									<c:when test="${status.last}">
										<dt class="sum"><c:out value="${title}"/></dt>
										<dd class="sum"><fmt:formatNumber value="${dataTypeDwnldStatValList[status.index]}" pattern="#,###"/></dd>
									</c:when>
									<c:otherwise>
										<dt><c:out value="${title}"/></dt>
										<dd><fmt:formatNumber value="${dataTypeDwnldStatValList[status.index]}" pattern="#,###"/></dd>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</dl>
					</div>
				</div>
				<div class="card">
					<div class="tit-wrap">
						<h3>데이터 유형별 조회 현황</h3>
					</div>
					<div class="cont-wrap">
						<div class="chart-wrap">
							<!-- sample chart -->
							<div class="chart">
								<canvas id="srchBarChart" width="406" height="250" style="display: block; box-sizing: border-box; height: 250px; width: 406px;"></canvas>
							</div>
						</div>
						<dl class="data-table">
							<c:forEach items="${dataTypeStatTtlList}" var="title" varStatus="status">
								<c:choose>
									<c:when test="${status.last}">
										<dt class="sum"><c:out value="${title}"/></dt>
										<dd class="sum"><fmt:formatNumber value="${dataTypeSrchStatValList[status.index]}" pattern="#,###"/></dd>
									</c:when>
									<c:otherwise>
										<dt><c:out value="${title}"/></dt>
										<dd><fmt:formatNumber value='${dataTypeSrchStatValList[status.index]}' pattern="#,###"/></dd>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<!-- //container(E) -->
