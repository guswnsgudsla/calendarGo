<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/lib/chart.js' />"></script>
      <div class="container main" style="position:static;">
        <!-- contants(s) -->
        <div class="contants">
        	<form name="frmMainSrch"  id="frmMainSrch" method="post" action="#">
	            <div class="control">
	                <!-- <div class="fm-ele date">
	                    <input type="date" id="fromDate" placeholder="시작일" />~<input type="date" id="toDate" placeholder="종료일" />
	                </div> -->
	                <div class="switch-button">
	                    <span><input type="radio" id="switch1" name="searchType" value="year"  onChange="javascript:searchParam('year'); return false;" <c:if test="${searchInfo.searchType == 'year' or searchInfo.searchType == ''}">checked</c:if>><label for="switch1">연별</label></span>
	                    <span><input type="radio" id="switch2" name="searchType" value="month" onChange="javascript:searchParam('month'); return false;" <c:if test="${searchInfo.searchType == 'month'}">checked</c:if>><label for="switch2">월별</label></span>
	                    <span><input type="radio" id="switch3" name="searchType" value="week" onChange="javascript:searchParam('week'); return false;" <c:if test="${searchInfo.searchType == 'week'}">checked</c:if>><label for="switch3">주별</label></span>
	                    <span><input type="radio" id="switch4" name="searchType" value="day" onChange="javascript:searchParam('day'); return false;" <c:if test="${searchInfo.searchType == 'day'}">checked</c:if>><label for="switch4">일별</label></span>
	                </div>
	            </div>
            </form>
            <form name="frmClrcsDtl"  id="frmClrcsDtl" method="post" action="#">
            	<input type="hidden" id="clrcsId" name="clrcsId" value="">
            </form>
            <div class="main-board">
                <div class="user">
                    <div class="cont-wrap">
                        <em>사용자 현황</em>
                        <strong>${allUserCnt} 명</strong>
                        <!-- 변화 없을 때 : default, 상승 : up, 다운로드 : befUserCnt curUserCnt-->
                        <div class="status ${userInfo.incUserType}">
                            <span>${userInfo.incUserCnt}</span>
                            <p>
                                <c:if test="${searchInfo.searchType == 'year' or searchInfo.searchType == ''}">전년</c:if>
                                <c:if test="${searchInfo.searchType == 'month'}">전월</c:if>
                                <c:if test="${searchInfo.searchType == 'week'}">전주</c:if>
                                <c:if test="${searchInfo.searchType == 'day'}">전일</c:if>대비
                            </p>
                        </div>
                    </div>
                </div>
                <div class="participate">
                    <div class="cont-wrap">
                        <em>참여기관 현황</em>
                        <strong>${allInstCnt} 개</strong>
                        <div class="status ${instInfo.incInstType}">
                            <span>${instInfo.incInstCnt}</span>
                            <p>
                                <c:if test="${searchInfo.searchType == 'year' or searchInfo.searchType == ''}">전년</c:if>
                                <c:if test="${searchInfo.searchType == 'month'}">전월</c:if>
                                <c:if test="${searchInfo.searchType == 'week'}">전주</c:if>
                                <c:if test="${searchInfo.searchType == 'day'}">전일</c:if>대비
                            </p>
                        </div>
                    </div>
                </div>
                <div class="register">
                    <div class="cont-wrap">
                        <em>디지털 문화자원 등록 현황</em>
                        <%-- <strong>${allDgtlCnt}/${allDgtlPrdctCnt}건</strong> --%>
                        <strong>${allDgtlPrdctCnt}건</strong>
                        <div class="status ${regInfo.incDgtlClcType}">
                            <span>${regInfo.incDgtlClcCnt}</span>
                            <p>
                                <c:if test="${searchInfo.searchType == 'year' or searchInfo.searchType == ''}">전년</c:if>
                                <c:if test="${searchInfo.searchType == 'month'}">전월</c:if>
                                <c:if test="${searchInfo.searchType == 'week'}">전주</c:if>
                                <c:if test="${searchInfo.searchType == 'day'}">전일</c:if>대비
                            </p>
                        </div>
                    </div>
                </div>
                <div class="download">
                    <div class="cont-wrap">
                        <em>다운로드 현황</em>
                        <strong>${allDownCnt} 건</strong>
                        <div class="status ${downInfo.incDgtlDownType}">
                            <span>${downInfo.incDgtlDownCnt}</span>
                            <p>
                                <c:if test="${searchInfo.searchType == 'year' or searchInfo.searchType == ''}">전년</c:if>
                                <c:if test="${searchInfo.searchType == 'month'}">전월</c:if>
                                <c:if test="${searchInfo.searchType == 'week'}">전주</c:if>
                                <c:if test="${searchInfo.searchType == 'day'}">전일</c:if>대비
                            </p>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="tit-wrap">
                        <h3>기관별 디지털문화자원 현황</h3>
                    </div>
                    <div class="cont-wrap chart-wrap">
                        <div class="chart">
                            <!-- <img src="/image/temp/01.png" alt="" /> -->
                            <canvas id="stict" ></canvas>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="tit-wrap">
                        <h3>디지털문화자원 현황</h3>
                    </div>
                    <div class="cont-wrap chart-wrap">
                        <div class="chart">
                            <canvas id="circle"  width="250px;" height="250px;"></canvas>
                            <!-- <img src="/image/temp/02.png" alt="" /> -->
                        </div>
                        <div class="legend-list">
                            <dl style="--legend-color:rgba(95, 108, 117, 25);">
                                <dt>3D</dt><dd>${circleInfo.dgtlCirType01Cnt}</dd>
                            </dl>
                            <dl style="--legend-color:rgba(158, 178, 193, 53);">
                                <dt>동영상</dt><dd>${circleInfo.dgtlCirType02Cnt}</dd>
                            </dl>
                            <dl style="--legend-color:rgba(126, 196, 247,212);">
                                <dt>이미지</dt><dd>${circleInfo.dgtlCirType03Cnt}</dd>
                            </dl>
                            <dl style="--legend-color:rgba(60, 93, 117, 77);">
                                <dt>오디오</dt><dd>${circleInfo.dgtlCirType04Cnt}</dd>
                            </dl>
                            <dl style="--legend-color:rgba(181, 230, 29, 192);">
                                <dt>텍스트</dt><dd>${circleInfo.dgtlCirType05Cnt}</dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="tit-wrap">
                        <h3>최근 등록된 디지털 문화자원</h3>
                    </div>
                    <div class="cont-wrap">
                        <div class="list">
                            <ul>
                                <!-- loop -->
                                <c:if test="${!empty recentDgtlClcList}">
                                    <c:forEach var="recentDgtlClc" items="${recentDgtlClcList}" varStatus="status">
                                        <li> 
                                                <div class="img-wrap">
                                                    <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${recentDgtlClc.filePath}&fileNm=${recentDgtlClc.strgFileNm}&atchFileGroupId=${recentDgtlClc.rprsImgGroupId}' />"  alt="${recentDgtlClc.orgnlAtchFileNm}" style="width: 100%; height: 100%">
                                                </div>
                                                <div class="cont">
                                                    <strong class="tit"><a href="javascript:void(0)" data-value ="${recentDgtlClc.clrcsId}"  onclick="moveClrcsDtlPage(this);">${recentDgtlClc.clrcsNm}</a></strong>
                                                    <div class="info-wrap">
                                                        <p>${recentDgtlClc.instNm}</p>
                                                        <!-- <span>평점 : 4.5</span> -->
                                                    </div>
                                                    <p class="category">${recentDgtlClc.catePathNm}</p>
                                                </div>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contants(e) -->
    </div>
  <script type="text/javascript">

/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
  var inLabel = new Array();
  var inData01 = new Array(); //3D
  var inData02 = new Array(); //동영상
  var inData03 = new Array(); //이미지
  var inData04 = new Array(); //오디오
  var inData05 = new Array(); //텍스트
  
  // 막대 누적
  <c:if test="${!empty stickStatsList}">
	<c:forEach var="stick" items="${stickStatsList}" varStatus="status">
	inLabel.push("${stick.instNm}");
	inData01.push("${stick.dgtlInstType01Cnt}");
	inData02.push("${stick.dgtlInstType02Cnt}");
	inData03.push("${stick.dgtlInstType03Cnt}");
	inData04.push("${stick.dgtlInstType04Cnt}");
	inData05.push("${stick.dgtlInstType05Cnt}");
	</c:forEach>
 </c:if>	
	
        var data = {
            //labels: ['항목 1', '항목 2'],
            labels : inLabel,
            datasets: [
                {
                    label: '3D',
                    backgroundColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 색상
                    borderColor: 'rgba(95, 108, 117, 25)', // 막대 그래프 테두리 색상
                    borderWidth: 1,
                    //data: [10, 20, 30, 40] // data
                    data:inData01
                },
                {
                	label: '동영상',
                    backgroundColor: 'rgba(158, 178, 193, 53)',
                    borderColor: 'rgba(158, 178, 193, 53)',
                    borderWidth: 1,
                    //data: [5, 15, 25, 35]inData02
                    data:inData02
                },
                {
                	label: '이미지',
                    backgroundColor: 'rgba(126, 196, 247,212)',
                    borderColor: 'rgba(126, 196, 247,212)',
                    borderWidth: 1,
                    //data: [5, 15, 25, 35]
                	data:inData03
                },
                {   
                	label: '오디오',
                    backgroundColor: 'rgba(60, 93, 117, 77)',
                    borderColor: 'rgba(60, 93, 117, 77)',
                    borderWidth: 1,
                    // data: [5, 15, 25, 35] inData03
                    data: inData04
                },
                {   
                	label: '텍스트',
                    backgroundColor: 'rgba(181, 230, 29, 192)',
                    borderColor: 'rgba(181, 230, 29, 192)',
                    borderWidth: 1,
                    // data: [5, 15, 25, 35] inData03
                    data: inData05
                }
            ]
        };

        // 옵션
        var options = {
            scales: {
                x: {
                    stacked: true
                },
                y: {
                    stacked: true
                }
            },
            maintainAspectRatio: false
        };

		var options_display = {
			plugins : {
				legend : {
					display : false
				}
			},
            maintainAspectRatio: false
		}

        // 누적 막대 차트 생성
        var ctx = document.getElementById('stict').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options

        });


	
	//데이터
	var data = {
	    labels: ['3D', '동영상','이미지','오디오','텍스트'],
	    datasets: [{
	        data: ["${circleInfo.dgtlCirType01Cnt}", "${circleInfo.dgtlCirType02Cnt}", "${circleInfo.dgtlCirType03Cnt}","${circleInfo.dgtlCirType04Cnt}","${circleInfo.dgtlCirType05Cnt}"],
	        backgroundColor: ['rgba(95, 108, 117, 25)', 'rgba(158, 178, 193, 53)', 'rgba(126, 196, 247,212)','rgba(60, 93, 117, 77)','rgba(181, 230, 29, 192)'],
	        hoverBackgroundColor: ['rgba(95, 108, 117, 25)', 'rgba(158, 178, 193, 53)', 'rgba(126, 196, 247,212)','rgba(60, 93, 117, 77)','rgba(181, 230, 29, 192)']
	    }]
	};
	
	// 차트 생성
	var ctx = document.getElementById('circle').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'doughnut', // 'doughnut' 대신 'pie'를 사용하면 원형 차트가 됩니다.
	    data: data,
		options : options_display
	});
	/*2.전역변수 정의 및 초기화는 여기에 기입*/
	
	/*3.이벤트 핸들링 하는 부분은 여기에 기입*/
	//현재일 기준 Dash board 조회
	function searchParam(check){
		let frm = document.frmMainSrch;
	    frm.action = contextPath + "/mainMgt/main.do";
	    frm.submit();
	}
	
	//문화자원 상세 페이지로 이동
	function moveClrcsDtlPage(target){
		let frm = document.frmClrcsDtl
		let clrcsId = target.dataset.value;
		document.getElementById('clrcsId').value = clrcsId;
		frm.action = contextPath +'/dgtlMgt/dgtlMgtDtl.do';
		frm.submit();
	}	
</script>
</html>
