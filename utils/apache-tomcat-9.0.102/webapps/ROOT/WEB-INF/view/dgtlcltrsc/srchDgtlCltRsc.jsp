<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>디지털문화자원 검색</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <a href="#">디지털문화자원</a>
              <span>디지털문화자원 검색</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents resource">
          <div class="inner">

            <!-- 검색영역 -->
            <div class="search-wrap">
              <div class="fm-focus search">
                <input type="text" id="srchVal" name="srchVal" value="<c:out value='${srchDgtlClrcsRscVo.srchVal}'/>" placeholder="검색어를 입력해 주세요."/>
                <label for="srchVal" class="blind">검색어를 입력해 주세요.</label>
              </div>
              <button type="button" class="btn-search" onClick="funSrch()">조회</button>
              <button type="button" class="btn-toggle" title="닫기">상세 조건</button>
            </div>

            <div class="tab-wrap as-tab-wrap">

              <ul class="tab-menu flexible" id="srchTypeCdTab">
                <li data-value="A" class="active">
                <a href="#">자원별 보기</a></li>
                <!-- <li data-value="B"><a href="#">컬렉션 보기</a></li> -->
              </ul>

              <div class="inner-depth">

                <!-- 자원별 보기 -->
                <div class="tab-inner">

                  <form id="srchForm" name="srchForm">
                  <input type="hidden" id="hdnOrderByKey" value="A">
                  <input type="hidden" id="hdnCurrentPageA" value="1">
                  <input type="hidden" id="hdnCurrentPageB" value="1">
                  <input type="hidden" id="hdnCurrentPageC" value="1">
                  <input type="hidden" id="hdnSrchTypeCd" value="A">
                  <input type="hidden" id="hdnClctOrderByKey" value="A">
                  <input type="hidden" id="hdnClctCurrentPageA" value="1">
                  <input type="hidden" id="hdnClctCurrentPageB" value="1">
                  <input type="hidden" id="hdnClctCurrentPageC" value="1">
                  <div class="controlbox-wrap cont-bg">
                    <div class="controlbox">
                      <ul>
                        <li class="half">
                          <strong>해당 기관 선택</strong>
                          <div class="fm-focus fm-select" data-size="l">
                            <select id="srchInstId" name="srchInstId" title="기관 선택">
                              <option value="" selected="selected">기관을 선택해 주세요</option>
                              <c:forEach var="item" items="${instList}">
                              <option value="<c:out value='${item.instId}'/>"><c:out value='${item.instNm}'/></option>
                              </c:forEach>
                            </select>
                          </div>
                        </li>
                        <li class="half">
                          <strong>소장 지역 선택</strong>
                          <div class="fm-focus fm-select" data-size="l">
                            <select id="srchRgnCd" name="srchRgnCd" title="지역 선택">
                              <option value="" selected="selected">지역을 선택해 주세요</option>
                              <c:forEach var="item" items="${rgnCdList}">
                              <option value="<c:out value='${item.cdId}'/>"><c:out value='${item.cdNm}'/></option>
                              </c:forEach>
                            </select>
                          </div>
                        </li>
                        <li>
                          <strong>공통분류 선택</strong>
                          <div class="fm-check">
                            <c:forEach var="item" items="${contsTypeCtgryList}" varStatus="chkStatus">
                            <span class="fm-ele">
                              <input type="checkbox" id="srchContsTypeCtgryId<c:out value='${chkStatus.index}'/>" 
                              name="srchContsTypeCtgryIdArr" value="<c:out value='${item.ctgryId}'/>"/>
                              <label for="srchContsTypeCtgryId<c:out value='${chkStatus.index}'/>"><c:out value='${item.ctgryNm}'/><span class="num" id="srchContsTypeCtgryCnt<c:out value='${item.ctgryId}'/>">0</span></label>
                            </span>
                           </c:forEach>  
                          </div>
                        </li>
                        <li class="half">
                          <strong>국가/시대 선택</strong>
                          <div class="fm-focus fm-select" data-size="m">
                            <select id="ntnList" name="ntnList" onChange="changeNtnList(this)" title="국가 선택">
                              <option value="" selected="selected">국가를 선택해 주세요</option>
                              <c:forEach var="item" items="${ntnTypeCtgryList}">
                              <option value="<c:out value='${item.ctgryId}'/>"><c:out value='${item.ctgryNm}'/></option>
                              </c:forEach>
                            </select>
                          </div>
                          <div class="fm-focus fm-select" data-size="m">
                            <select id="tageTypeCtgryId" name="tageTypeCtgryId" title="시대 선택">
                              <option value="" selected="selected">시대를 선택해 주세요</option>
                            </select>
                          </div>
                        </li>
                        <li class="half">
                          <strong>게시일 선택</strong>
                          <div class="fm-check">
                            <span class="fm-ele">
                              <input type="radio" id="srchRlsDt1" name="srchRlsDt" value="" checked/>
                              <label for="srchRlsDt1">전체</label>
                            </span>
                            <span class="fm-ele">
                              <input type="radio" id="srchRlsDt2" name="srchRlsDt" value="D1"  />
                              <label for="srchRlsDt2">1일 전</label>
                            </span>
                            <span class="fm-ele">
                              <input type="radio" id="srchRlsDt3" name="srchRlsDt" value="D7"  />
                              <label for="srchRlsDt3">1주 전</label>
                            </span>
                            <span class="fm-ele">
                              <input type="radio" id="srchRlsDt4" name="srchRlsDt" value="M1"  />
                              <label for="srchRlsDt4">1개월 전</label>
                            </span>
                            <span class="fm-ele">
                              <input type="radio" id="srchRlsDt5" name="srchRlsDt" value="M6"  />
                              <label for="srchRlsDt5">6개월 전</label>
                            </span>
                          </div>
                        </li>
                      </ul>
                      <!-- <button type="button" class="btns btn-my" onClick="funSearch()">
                        조회
                      </button> -->
                      <button type="button" class="btns btn-reset" onClick="funInitItems()">
                        초기화
                      </button>
                      <button type="button" class="btns btn-toggle">상세 조건 닫기</button>
                    </div>
                    <!--  
                    <button type="button" class="btn-toggle">
                      상세 조건 닫기
                    </button>
                    -->
                  </div>
                  </form>

                  <div class="list cont-bg" id="rscListTop">
                    <div class="tab-wrap type02">
                      <div class="list-option">
                        <p  class="posts-number">
                          <em id="srchValTx" class="srchValTx"></em> 검색 결과 총 <b id="srchCntA">0</b>
                          <!-- <b id="srchCntB" style="display:none">0</b> -->
                          개 검색되었습니다.
                        </p>

                        <!-- <div class="posts-number">
                          총 <strong id="dgtlClrcsRscCnt"></strong> 개
                        </div> -->

                        <!-- <ul class="tab-menu flexible" id="dgtlClrcsRscListTab">
                          <li data-value="A" class="active"><a href="javascript:void(0)">다운로드순</a></li>
                          <li data-value="B" ><a href="javascript:void(0)">최신순</a></li>
                          <li data-value="C" ><a href="javascript:void(0)">인기순</a></li>
                        </ul> -->
                        
                        <!-- 변경된 스타일 -->
                        <div class="switch-radio" id="dgtlClrcsRscListTab">
						    <span>
						        <input type="radio" id="orderByKeyA" name="orderByKey" value="A" 
						               <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">checked</c:if>>
						        <label for="orderByKeyA">다운로드순</label>
						    </span>
						    <span>
						        <input type="radio" id="orderByKeyB" name="orderByKey" value="B" 
						               <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">checked</c:if>>
						        <label for="orderByKeyB">최신순</label>
						    </span>
						    <span>
						        <input type="radio" id="orderByKeyC" name="orderByKey" value="C" 
						               <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">checked</c:if>>
						        <label for="orderByKeyC">인기순</label>
						    </span>
						</div>

                        <!-- 정렬순 모바일용 -->
                        <div class="selectmenu">
                          <select name="rscSort" id="rscSort" title="정렬순서 선택">
                            <option value="A">다운로드순</option>
                            <option value="B">최신순</option>
                            <option value="C">인기순</option>
                          </select>
                        </div>
                      </div>

                      <div class="inner-depth" id="rscListArea">
                      </div>

                    </div>
                  </div>
                </div>
                <!-- //자원별 보기 -->
                
                <!-- 컬렉션 보기 -->
                <div class="tab-inner">
                  
                  <div class="list cont-bg" id="clctListTop">
                    <div class="tab-wrap type02">

                      <div class="list-option">
                        <p  class="posts-number">
                          <em id="srchValTx" class="srchValTx"></em> 검색 결과 총 
                          <!-- <b id="srchCntA" style="display:none">0</b> -->
                          <b id="srchCntB">0</b>개 검색되었습니다.
                        </p>

                        <!-- <div class="posts-number">
                          총 <strong id="dgtlClrcsClctCnt"></strong> 개
                        </div> -->

                        <!-- TODO 메뉴 활성화 active -->
                        <!-- <ul class="tab-menu flexible" id="dgtlClrcsClctListTab">
                          <li data-value="A" class="active">
                            <a href="javascript:void(0)">다운로드순</a>
                          </li>
                          <li data-value="B"><a href="javascript:void(0)">최신순</a></li>
                          <li data-value="C"><a href="javascript:void(0)">인기순</a></li>
                        </ul> -->
                        <!-- 변경된 스타일 -->
                        <div class="switch-radio" id="dgtlClrcsClctListTab">
                          <span>
                            <input type="radio" id="" name="orderByKey" value="A" <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">checked</c:if> onClick=""/>
                            <label for="">다운로드순</label>
                          </span>
                          <span>
                            <input type="radio" id="" name="orderByKey" value="B" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">checked</c:if> onClick=""/>
                            <label for="">최신순</label>
                          </span>
                          <span>
                            <input type="radio" id="" name="orderByKey" value="C" <c:if test="{not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">checked</c:if> onClick=""/>
                            <label for="">인기순</label>
                          </span>
                        </div>

                        <!-- 정렬순 모바일용 -->
                        <div class="selectmenu">
                          <select name="clctSort" id="clctSort" title="정렬순서 선택">
                            <option value="A">다운로드순</option>
                            <option value="B">최신순</option>
                            <option value="C">인기순</option>
                          </select>
                        </div>
                        
                      </div>
                      
                      <div class="inner-depth"  id="clctListArea">>
                      </div>
                      
                    </div>
                  </div>
                </div>
                <!-- //컬렉션 보기 -->
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
      
      <!-- 메인에서 검색조건 가지고 넘어올때 -->
      <form id="prmrForm" name="prmrForm">
      <input type="hidden" id="prmrSrchInstId" value="<c:out value='${srchDgtlClrcsRscVo.srchInstId}'/>"> 
      <input type="hidden" id="prmrSrchRgnCd" value="<c:out value='${srchDgtlClrcsRscVo.srchRgnCd}'/>"> 
      <input type="hidden" id="prmrSrchContsTypeCtgryIdArr" value="<c:out value='${srchDgtlClrcsRscVo.srchContsTypeCtgryIdArr}'/>"> 
      </form>
    
    <script>
      $(document).ready(function(){
         
         //메인에서온 파라미터들 체크 시작
         //소장기관
         var prmrSrchInstId = $('#prmrSrchInstId').val();
         if(!fncIsNull(prmrSrchInstId)){
            $('#srchInstId').val(prmrSrchInstId);
             $('.btn-toggle').click();//상세조건 펼침
         }
         //지역
         var prmrSrchRgnCd = $('#prmrSrchRgnCd').val();
         if(!fncIsNull(prmrSrchRgnCd)){
            $('#srchRgnCd').val(prmrSrchRgnCd);
            $('.btn-toggle').click();//상세조건 펼침
         }
         
         //문화자원
         var selectedValues = $('#prmrSrchContsTypeCtgryIdArr').val();
         if (selectedValues && selectedValues.length > 0) {
            $('input[name="srchContsTypeCtgryIdArr"]').each(function () {
               var checkboxValue = $(this).val();
            if (selectedValues.includes(checkboxValue)) {
               $(this).prop('checked', true);
            }
            });
            $('.btn-toggle').click();//상세조건 펼침
         }
         //메인에서온 파라미터들 체크 끝
         
         funSelectDgtlClrcsRscList();   //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
         funSelectDgtlClrcsClctList();  //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
         
         //자원별, 컬렉션 탭
         $('#srchTypeCdTab li').click(function() {
             $(this).addClass('active').siblings().removeClass('active');     
             $('#hdnSrchTypeCd').val($(this).data('value')); 
             
            //  $('#srchValTx').html($('#srchVal').val());
             $('.srchValTx').html($('#srchVal').val());
             
             if($('#hdnSrchTypeCd').val() == "B"){
                $('#srchCntB').html($('#dgtlClrcsClctCnt').html());
                  $('#srchCntB').show();
                  $('#srchCntA').hide();
                  $('.search-wrap .btn-toggle').hide();
             }else{
                $('#srchCntA').html($('#dgtlClrcsRscCnt').html());
                  $('#srchCntA').show();
                  $('#srchCntB').hide();
                  $('.search-wrap .btn-toggle').show();
             }
             
          });
         
         //자원 정렬 탭
/*          $('#dgtlClrcsRscListTab li').click(function() {
          $(this).addClass('active').siblings().removeClass('active');     
          $("#rscListArea").empty();
          $('#hdnOrderByKey').val($(this).data('value')); 
          funSelectDgtlClrcsRscList(); //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
         }); */
         
   	  $('#dgtlClrcsRscListTab input[type="radio"]').change(function() {
	      var selectedValue = $(this).val();
	      $('#hdnOrderByKey').val(selectedValue);
	      $(this).closest('span').addClass('active').siblings().removeClass('active');
	      funSelectDgtlClrcsRscList();
	  });
         
         $('#orderByKeyA').prop('checked', true);
         $('#dgtlClrcsClctListTab li').click(function() {
             $(this).addClass('active').siblings().removeClass('active');
             $('#hdnClctOrderByKey').val($(this).data('value'));
         });
         
         //콜렉트 정렬 탭
         $('#dgtlClrcsClctListTab li').click(function() {
          $(this).addClass('active').siblings().removeClass('active');     
          $("#clctListArea").empty();
          $('#hdnClctOrderByKey').val($(this).data('value')); 
          funSelectDgtlClrcsClctList(); //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
         });
         
         $('#srchVal').on('keydown', function(event) {
               if (event.key === 'Enter') {
                  funSrch();
               }
         });
         
         //모바일 소트
         $("#rscSort").selectmenu();  //자원
          $("#clctSort").selectmenu(); //컬렉션
          
          //모바일 자원소트 세렉트박스
        $('#rscSort').on('selectmenuchange', function(event, ui) {
             $("#rscListArea").empty();
            $('#hdnOrderByKey').val($(this).val()); 
            funSelectDgtlClrcsRscList(); //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
        });   
          
        //모바일 컬렉션소트 세렉트박스
        $('#clctSort').on('selectmenuchange', function(event, ui) {
           $("#clctListArea").empty();
            $('#hdnClctOrderByKey').val($(this).val()); 
            funSelectDgtlClrcsClctList(); //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
        });    
     });
      
     //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
     function funSelectDgtlClrcsRscList(){
    
       var srchInstId = fncNullToEmpty($('#srchInstId').val()); //해당기관
       var srchContsTypeCtgryIdArr = []; //컨텐츠유형 
       $('input[name="srchContsTypeCtgryIdArr"]:checked').each(function() {
          srchContsTypeCtgryIdArr.push($(this).val());
       });
       var srchNtnTageTypeCtgryId = fncNullToEmpty($('#tageTypeCtgryId').val());//시대
       var srchRgnCd =  fncNullToEmpty($('#srchRgnCd').val()); //소장지역
       var srchRlsDt =  $('input[name="srchRlsDt"]:checked').val();//게시일
       var orderByKey = $('#hdnOrderByKey').val(); //소트기준
       var currentPage = $('#hdnCurrentPage' + orderByKey).val();//페이징 - 현재페이지
       var srchVal = $('#srchVal').val();
       var encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
       if (fncIsNull(srchNtnTageTypeCtgryId)) {
          srchNtnTageTypeCtgryId = fncNullToEmpty($('#ntnList').val());
       }
       
       $.ajax({
           url: "<c:url value='/dgtlcltrsc/selectTypeSrchStat.do'/>",
           type: 'POST',
           data: { 
        	   		 srchInstId: srchInstId
        	   		,srchContsTypeCtgryIdArr: srchContsTypeCtgryIdArr
        	   		,srchNtnTageTypeCtgryId: srchNtnTageTypeCtgryId
        	   		,srchRgnCd: srchRgnCd
        	   		,srchRlsDt: srchRlsDt
        	   		,orderByKey: orderByKey
        	   		,srchVal: srchVal
        	     },
           success: function(data) {
        	   if (data.resultCode == 200) {
              	  $.each(data.result.cntsTypeSrchStat, function(index, option) {
  					$("#srchContsTypeCtgryCnt"+option.ctgryId).text(option.rscCnt.toLocaleString('ko-KR'));              		  
               	  	//console.log(index+" 번째 ctgryId : "+option.ctgryId+" ctgryNm : "+option.ctgryNm+" rscCnt : "+option.rscCnt);
             	  });
        	   } else {
        		   alert(data.resultMessage);
        	   }
           },
           error: function() {
           }
       });
       
      var queryString = "srchInstId=" + srchInstId +
      "&srchContsTypeCtgryIdArr=" + srchContsTypeCtgryIdArr+
      "&srchNtnTageTypeCtgryId=" + srchNtnTageTypeCtgryId+
      "&srchRgnCd=" + srchRgnCd+
      "&srchRlsDt=" + srchRlsDt+
      "&orderByKey=" + orderByKey+
      "&srchVal=" + encodedSrchVal+
      "&currentPage=" + currentPage;
    
       $("#rscListArea").load("<c:url value='/dgtlcltrsc/srchDgtlCltRscList.do'/>" + "?"+queryString);
     
     } 
     
     //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
     function funSelectDgtlClrcsClctList(){
           
         var orderByKey = $('#hdnClctOrderByKey').val(); //소트기준
         var currentPage = $('#hdnClctCurrentPage' + orderByKey).val();
         var srchVal = $('#srchVal').val();
         var encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
         var queryString = "orderByKey=" + orderByKey+
         "&srchVal=" + encodedSrchVal+
         "&currentPage=" + currentPage;
         $("#clctListArea").load("<c:url value='/dgtlcltrsc/srchDgtlCltClctGroupList.do'/>" + "?"+queryString);
     } 
      
     //국가 세렉트 박스 선택 시
     function changeNtnList() {
           var selectedValue = $('#ntnList').val();
           $('#tageTypeCtgryId').empty();
           $('#tageTypeCtgryId').append("<option value='' selected>시대를 선택해 주세요.</option>");
          
           $.ajax({
               url: "<c:url value='/dgtlcltrsc/selectTageTypeCtgryList.do'/>",
               type: 'GET',
               data: { srchNtnTypeCtgryId: selectedValue },
               success: function(data) {
                  $.each(data, function(index, option) {
                     var html = "<option value='"+option.ctgryId+"'>"+option.ctgryNm+"</option>";
                     $('#tageTypeCtgryId').append(html);
                  });
               },
               error: function() {
               }
           });
      } 
     
    //페이징 선택시 호출
    function fnList(url, currentPage){
       
       if($('#hdnSrchTypeCd').val()=="A"){ //자원별
          var orderByKey = $('#hdnOrderByKey').val();
           $('#hdnCurrentPage' + orderByKey).val(currentPage.currentPage);
           fncTopMvmnScrl('rscListTop'); //스크롤 이동
           funSelectDgtlClrcsRscList();
        }else{ //컬렉션
          var orderByKey = $('#hdnClctOrderByKey').val();
           $('#hdnClctCurrentPage' + orderByKey).val(currentPage.currentPage);
           fncTopMvmnScrl('clctListTop'); //스크롤 이동
           funSelectDgtlClrcsClctList();
           
       }
    }
    
    //조회 버튼 선택 시
    function funSearch(){
       //선택되어진 소트 탭 유지, 페이지만 초기화
       var orderByKey = $('#hdnOrderByKey').val();
        $('#hdnCurrentPage' + orderByKey).val("1");
        //자원별 조회
        funSelectDgtlClrcsRscList();   
    }
    
    //초기화버튼 선택 시
    function funInitItems(){
       $('#srchForm')[0].reset();
    }
   
    //검색버튼 선택 시
    function funSrch(){
       
       /**
       var srchVal = $('#srchVal').val();
       if(!srchVal){
          alert("검색어를 입력하세요.");
          $('#srchVal').focus();
          return;
       }**/
       
       //선택되어진 소트 탭 유지, 페이지만 초기화
       $('#hdnCurrentPageA').val("1");
       $('#hdnCurrentPageB').val("1");
       $('#hdnCurrentPageC').val("1");
       $('#hdnClctCurrentPageA').val("1");
       $('#hdnClctCurrentPageB').val("1");
       $('#hdnClctCurrentPageC').val("1");
        //자원별 조회
        funSelectDgtlClrcsRscList();   
       //컬렉션 조회
        funSelectDgtlClrcsClctList();
    }
     
    </script>