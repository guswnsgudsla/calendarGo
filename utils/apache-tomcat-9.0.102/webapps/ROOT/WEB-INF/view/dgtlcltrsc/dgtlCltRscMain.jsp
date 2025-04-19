<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
             <c:choose>
	          <c:when test="${srchDgtlClrcsRscVo.srchTypeCd eq 'A'}">
	               <h2 id="mainTtl">디지털문화자원 유형별보기</h2>
		      </c:when>
		      <c:otherwise>
		           <h2 id="mainTtl">디지털문화자원 컬렉션보기</h2>
		      </c:otherwise>
	      </c:choose>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <c:choose>
		          <c:when test="${srchDgtlClrcsRscVo.srchTypeCd eq 'A'}">
		               <span id="subPath">디지털문화자원 유형별보기</span>
			      </c:when>
			      <c:otherwise>
			           <span id="subPath">디지털문화자원 컬렉션보기</span>
			      </c:otherwise>
		      </c:choose>
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
              <button type="button" onClick="funSrch()" class="btn-search">조회</button>
              <c:if test="${srchDgtlClrcsRscVo.srchTypeCd eq 'A'}">
                <!-- <button type="button" class="btn-toggle" title="닫기">상세 조건</button> -->
              </c:if>
              
            </div>

            <div class="tab-wrap as-tab-wrap">
              <!-- <ul class="tab-menu flexible" id="srchTypeCdTab">
                <c:choose>
                <c:when test="${srchDgtlClrcsRscVo.srchTypeCd eq 'A'}">
                  <li data-value="A" class="active"><a href="#">자원별 보기</a></li>
                </c:when>
                <c:otherwise>
                  <li data-value="A"><a href="#">자원별 보기</a></li>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${srchDgtlClrcsRscVo.srchTypeCd eq 'B'}">
                  <li data-value="B" class="active"><a href="#">컬렉션 보기</a></li>
                </c:when>
                <c:otherwise>
                  <li data-value="B"><a href="#">컬렉션 보기</a></li>
                </c:otherwise>
                </c:choose>
              </ul> -->

              <div class="inner-depth pt0">
                <!-- 자원별 보기 -->
                <div class="tab-inner <c:if test="${srchDgtlClrcsRscVo.srchTypeCd eq 'A'}">active</c:if>">
                   
                  <!-- 상세조건 닫기 상태 active 추가 -->
                  <form id="srchForm" name="srchForm">
                  <input type="hidden" id="hdnOrderByKey" value="<c:out value='${srchDgtlClrcsRscVo.orderByKey}'/>">
                  <input type="hidden" id="hdnCurrentPageA" value="1">
                  <input type="hidden" id="hdnCurrentPageB" value="1">
                  <input type="hidden" id="hdnCurrentPageC" value="1">
                  <input type="hidden" id="hdnSrchTypeCd" value="<c:out value='${srchDgtlClrcsRscVo.srchTypeCd}'/>">
                  <input type="hidden" id="hdnClctOrderByKey" value="A">
                  <input type="hidden" id="hdnClctCurrentPageA" value="1">
                  <input type="hidden" id="hdnClctCurrentPageB" value="1">
                  <input type="hidden" id="hdnClctCurrentPageC" value="1">
                  <div class="controlbox-wrap cont-bg ">
                    <div class="controlbox">
                      <ul>
                        <li class="half">
                          <strong>해당 기관 선택</strong>
                          <div class="fm-focus fm-select">
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
                          <div class="fm-focus fm-select">
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
                              name="srchContsTypeCtgryIdArr"
                              value="<c:out value='${item.ctgryId}'/>"
                            />
                            <label for="srchContsTypeCtgryId<c:out value='${chkStatus.index}'/>"><c:out value='${item.ctgryNm}'/><span class="num" id="srchContsTypeCtgryCnt<c:out value='${item.ctgryId}'/>">0</span></label>
                          </span>
                          </c:forEach>  
                   
                          </div>
                        </li>
                        <li class="half">
                          <strong>국가/시대 선택</strong>
                          <div class="fm-focus fm-select">
                            <select id="ntnList" name="ntnList" onChange="changeNtnList(this)" title="국가 선택">
                              <option value="" selected="selected">국가를 선택해 주세요</option>
                              <c:forEach var="item" items="${ntnTypeCtgryList}">
                              <option value="<c:out value='${item.ctgryId}'/>"><c:out value='${item.ctgryNm}'/></option>
                              </c:forEach>
                            </select>
                          </div>
                          <div class="fm-focus fm-select">
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
                      <button type="button" class="btns btn-reset" onClick="funInitItems()">
                        초기화
                      </button>
                      <button type="button" class="btns btn-my" onClick="funSrch()">조회</button> 
                      <!-- <button type="button" class="btns btn-toggle">상세 조건 닫기</button> -->
                      
                    </div>
                  </div>
                  </form>
                  
                  <div class="list cont-bg" id="rscListTop">
                    <div class="tab-wrap type02">
                      <div class="list-option">
                        <div class="posts-number">
                          <span id="dgtlClrcsRscSrchSpan">
                		<c:if test="${ not empty srchDgtlClrcsRscVo.srchVal}">
                          "<c:out value='${srchDgtlClrcsRscVo.srchVal}'/>"로 검색한 결과
                        </c:if>
                          </span>
                          총 <strong id="dgtlClrcsRscCnt"></strong> 개 검색되었습니다. 
                        </div>
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
                          <select name="rscSort" id="rscSort">
                            <option value="A" <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">selected</c:if>>다운로드순</option>
                            <option value="B" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">selected</c:if>>최신순</option>
                            <option value="C" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">selected</c:if>>인기순</option>
                          </select>
                        </div>
                      </div>

                      <div class="list-option">

                        <!-- 
                        <div class="switch-radio">
                          <span>
                            <input type="radio" id="dataType9" name="srchDataTypeCtgryId" value="" <c:if test="${empty srchDgtlClrcsRscVo.srchDataTypeCtgryCd}">checked</c:if> onClick="funDataTypeSearch()"/>
                            <label for="dataType9">전체보기<span class="num" id="dataTypeTabCnt00">0</span></span></label>
                          </span>
                          
                          <c:forEach var="item" items="${dataTypeCtgryList}" varStatus="rdoStatus">
                          <span>
                            <input type="radio" id="dataType<c:out value='${rdoStatus.index}'/>" name="srchDataTypeCtgryId" value="<c:out value='${item.ctgryId}'/>" onClick="funDataTypeSearch()"
                            <c:choose>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'A' and item.ctgryId eq 'D01'}">checked</c:when>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'B' and item.ctgryId eq 'D02'}">checked</c:when>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'C' and item.ctgryId eq 'D03'}">checked</c:when>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'D' and item.ctgryId eq 'D04'}">checked</c:when>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'E' and item.ctgryId eq 'D05'}">checked</c:when>
                          <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'F' and item.ctgryId eq 'D07'}">checked</c:when>
                              <c:otherwise></c:otherwise>
                            </c:choose>
                            />
                            <label for="dataType<c:out value='${rdoStatus.index}'/>"><c:out value='${item.ctgryNm}'/><span class="num" id="dataTypeTabCnt<c:out value='${item.ctgryId}'/>">0</span></label>
                          </span>
                          </c:forEach>
                        </div> -->
                        <input type="hidden" id="srchDataTypeCtgryId" name="srchDataTypeCtgryId" value="">
                        
                        <!-- 변경된 스타일 -->
                        <ul class="tab-menu flexible" id="">
					    <li data-value="" <c:if test="${empty srchDgtlClrcsRscVo.srchDataTypeCtgryCd}">class="active"</c:if>>
					    <a href="javascript:funDataTypeSearchChange('')">전체보기(<span class="num" id="dataTypeTabCnt00">0</span>)</a></li>
					    <c:forEach var="item" items="${dataTypeCtgryList}" varStatus="rdoStatus">
					        <li 
					            data-value="<c:out value='${item.ctgryId}'/>"
					            id="dataType<c:out value='${rdoStatus.index}'/>"
					            <c:choose>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'A' and item.ctgryId eq 'D01'}">class="active"</c:when>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'B' and item.ctgryId eq 'D02'}">class="active"</c:when>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'C' and item.ctgryId eq 'D03'}">class="active"</c:when>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'D' and item.ctgryId eq 'D04'}">class="active"</c:when>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'E' and item.ctgryId eq 'D05'}">class="active"</c:when>
					                <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'F' and item.ctgryId eq 'D07'}">class="active"</c:when>
					                <c:otherwise></c:otherwise>
					            </c:choose>
					        >
					            <!-- <a onclick="funDataTypeSearchChange('${item.ctgryId}')"><c:out value='${item.ctgryNm}'/> -->
					            <a href="javascript:funDataTypeSearchChange('${item.ctgryId}')"><c:out value='${item.ctgryNm}'/>
					            (<span class="num" id="dataTypeTabCnt<c:out value='${item.ctgryId}'/>">0</span>)</a>
					        </li>
					    </c:forEach>
					</ul>
                        <!-- 자원별 보기 모바일용 -->
                        <div class="controlbox-mobile">
                          <div class="selectmenu">
                            <select name="srchMbDataTypeCtgryId" id="srchMbDataTypeCtgryId" title="디지털문화자원별 검색" >
                              <option value="" <c:if test="${empty srchDgtlClrcsRscVo.srchDataTypeCtgryCd}">selected</c:if>>전체보기 <span id="dataTypeCmbCnt00">&#40;0&#41;</span></option>
                              <c:forEach var="item" items="${dataTypeCtgryList}" varStatus="rdoStatus">
                              <option value="<c:out value='${item.ctgryId}'/>"  
                              <c:choose>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'A' and item.ctgryId eq 'D01'}">selected</c:when>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'B' and item.ctgryId eq 'D02'}">selected</c:when>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'C' and item.ctgryId eq 'D03'}">selected</c:when>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'D' and item.ctgryId eq 'D04'}">selected</c:when>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'E' and item.ctgryId eq 'D05'}">selected</c:when>
                              <c:when test="${srchDgtlClrcsRscVo.srchDataTypeCtgryCd eq 'F' and item.ctgryId eq 'D07'}">selected</c:when>
                              <c:otherwise></c:otherwise>
                              </c:choose>
                              ><c:out value='${item.ctgryNm}'/> <span id="dataTypeCmbCnt<c:out value='${item.ctgryId}'/>">&#40;0&#41;</span></option>
                              </c:forEach>
                            </select>
                          </div>
                      </div> 
                      </div>
                      
                      <div class="inner-depth" id="rscListArea">
                      </div>
                      
                    </div>
                  </div>
                </div>
                <!-- //자원별 보기 -->
                <!-- 컬렉션 보기 -->
                <div class="tab-inner <c:if test="${srchDgtlClrcsRscVo.srchTypeCd eq 'B'}">active</c:if>">

                  <div class="list cont-bg" id="clctListTop">
                    <div class="tab-wrap type02">

                      <div class="list-option">
                        <div class="posts-number">
                          <span id="dgtlClrcsClctSrchSpan">
                		<c:if test="${ not empty srchDgtlClrcsRscVo.srchVal}">
                          "<c:out value='${srchDgtlClrcsRscVo.srchVal}'/>"로 검색한 결과
                        </c:if>
                          </span>
                          총 <strong id="dgtlClrcsClctCnt"></strong> 개 검색되었습니다.
                        </div>
                        <!-- <ul class="tab-menu flexible" id="dgtlClrcsClctListTab">
                          <li data-value="A" <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">class="active"</c:if>><a href="javascript:void(0)">다운로드순</a></li>
                          <li data-value="B" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">class="active"</c:if>><a href="javascript:void(0)">최신순</a></li>
                          <li data-value="C" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">class="active"</c:if>><a href="javascript:void(0)">인기순</a></li>
                        </ul> -->
                        <!-- 변경된 스타일 -->
						<div class="switch-radio" id="dgtlClrcsClctListTab">
						  <span>
						    <input type="radio" id="orderByA" name="orderByKey" value="A" <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">checked</c:if>/>
						    <label for="orderByA">다운로드순</label>
						  </span>
						  <span>
						    <input type="radio" id="orderByB" name="orderByKey" value="B" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">checked</c:if>/>
						    <label for="orderByB">최신순</label>
						  </span>
						  <span>
						    <input type="radio" id="orderByC" name="orderByKey" value="C" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">checked</c:if>/>
						    <label for="orderByC">인기순</label>
						  </span>
						</div>

                        <!-- 정렬순 모바일용 -->
                        <div class="selectmenu">
                          <select name="clctSort" id="clctSort">
                            <option value="A" <c:if test="${empty srchDgtlClrcsRscVo.orderByKey or srchDgtlClrcsRscVo.orderByKey eq 'A'}">selected</c:if>>다운로드순</option>
                            <option value="B" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'B'}">selected</c:if>>최신순</option>
                            <option value="C" <c:if test="${not empty srchDgtlClrcsRscVo.orderByKey and srchDgtlClrcsRscVo.orderByKey eq 'C'}">selected</c:if>>인기순</option>
                          </select>
                        </div>
                      </div>
                      <div class="inner-depth" id="clctListArea"></div>
                    
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
    <script>
      $(document).ready(function(){
    	  
    	  funSelectDgtlClrcsRscList();   //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
    	  funSelectDgtlClrcsClctList();  //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
    	  
    	  //자원별, 컬렉션 탭
    	  $('#srchTypeCdTab li').click(function() {
       		$(this).addClass('active').siblings().removeClass('active');	  
       		$('#hdnSrchTypeCd').val($(this).data('value'));
       		
       		if($('#hdnSrchTypeCd').val()=='A'){
       			$('#mainTtl').html("디지털문화자원 유형별보기");
       			$('#subPath').html("디지털문화자원 유형별보기");
       		}else{
       			$('#mainTtl').html("디지털문화자원 컬렉션보기");
       			$('#subPath').html("디지털문화자원 컬렉션보기");
       		}
          });
    	  
    	  //자원 정렬 탭
    	  $('#dgtlClrcsRscListTab input[type="radio"]').change(function() {
    	      var selectedValue = $(this).val();
    	      $('#hdnOrderByKey').val(selectedValue);
    	      $(this).closest('span').addClass('active').siblings().removeClass('active');
    	      funSelectDgtlClrcsRscList();
    	  });

    	  //콜렉트 정렬 탭
    	  $('#dgtlClrcsClctListTab input[type="radio').click(function() {
	    	  $('#hdnClctOrderByKey').val($(this).val()); 
    	      $(this).closest('span').addClass('active').siblings().removeClass('active');
    		  $("#clctListArea").empty();
    		  funSelectDgtlClrcsClctList(); //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
    	  });
    	  
    	  //자원별검색 모바일 세렉트박스
    	  $("#srchMbDataTypeCtgryId").selectmenu();
    	  
    	  //모바일 소트
    	  $("#rscSort").selectmenu();  //자원
          $("#clctSort").selectmenu(); //컬렉션
          
          //모바일 자원별검색 세렉트박스
		  $('#srchMbDataTypeCtgryId').on('selectmenuchange', function(event, ui) {
    		  $('input[name="srchDataTypeCtgryId"][value="'+$(this).val()+'"]').prop('checked', true);
    		  var selectBox = document.getElementById("srchMbDataTypeCtgryId");
    		  
    		  var ctgryId =  selectBox.options[selectBox.selectedIndex].value;
    		  funDataTypeSearchChange(ctgryId);
    		  //funDataTypeSearch();//상단 데이타유형 선택 시
		  });   

          //모바일 자원소트 세렉트박스
		  $('#rscSort').on('selectmenuchange', function(event, ui) {
	          $("#rscListArea").empty();
    		  $('#hdnOrderByKey').val($(this).val()); 
    		  funSelectDgtlClrcsRscList(); //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
		  });   
          
		  //모바일 컬렉션소트 세렉트박스
		  $('#clctSort').on('selectmenuchange', function(event, ui) {
    		  $('input[name="orderByKey"][value="'+$(this).val()+'"]').prop('checked', true);
			  $("#clctListArea").empty();
	    	  $('#hdnClctOrderByKey').val($(this).val()); 
	    	  funSelectDgtlClrcsClctList(); //디지털 문화자원 - 컬렉션 보기 목록 조회 (다운, 최신, 인기)
		  });  
		  
		  $('#srchVal').on('keydown', function(event) {
  	        if (event.key === 'Enter') {
  	        	funSrch();
  	        }
  	      });
	          
     });
      
      $('#dataTypeActive li').click(function() {
    	    var id = $(this).attr('id');
    	    if (id) {
    	        srchDataTypeCtgryId = id.replace('dataType', '');
    	    } else {
    	        // 전체보기 카테고리에 해당하는 경우
    	        srchDataTypeCtgryId = '';
    	    }
    	    funSelectDgtlClrcsRscList(srchDataTypeCtgryId);
    	});
      
     //디지탈 문화자원 자원별보기 목록조회 (다운,최신,인기)
     function funSelectDgtlClrcsRscList(){
    
       var srchDataTypeCtgryId = $('input[name="srchDataTypeCtgryId"]').val(); //데이터유형	
       
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
        	   		srchDataTypeCtgryId: srchDataTypeCtgryId
        	   		,srchInstId: srchInstId
        	   		,srchContsTypeCtgryIdArr: srchContsTypeCtgryIdArr
        	   		,srchNtnTageTypeCtgryId: srchNtnTageTypeCtgryId
        	   		,srchRgnCd: srchRgnCd
        	   		,srchRlsDt: srchRlsDt
        	   		,orderByKey: orderByKey
         	   		,srchVal: srchVal
        	     },
           success: function(data) {
        	   if (data.resultCode == 200) {
              	  $.each(data.result.dataTypeSrchStat, function(index, option) {
					$("#dataTypeTabCnt"+option.ctgryId).text(option.rscCnt.toLocaleString('ko-KR'));
					if (option.ctgryId === "00") {
						$("#srchMbDataTypeCtgryId option[value='']").text("전체보기 ("+option.rscCnt.toLocaleString('ko-KR')+")");
					} else {
						$("#srchMbDataTypeCtgryId option[value='"+option.ctgryId+"']").text(option.ctgryNm + " ("+option.rscCnt.toLocaleString('ko-KR')+")");
					}
					
					$("#srchMbDataTypeCtgryId-button .ui-selectmenu-text").text($("#srchMbDataTypeCtgryId option:selected").text());
               	  	//console.log(index+" 번째 ctgryId : "+option.ctgryId+" ctgryNm : "+option.ctgryNm+" rscCnt : "+option.rscCnt);
             	  });
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
      
	   var queryString = "srchDataTypeCtgryId=" + srchDataTypeCtgryId +
	   "&srchInstId=" + srchInstId +
	   "&srchContsTypeCtgryIdArr=" + srchContsTypeCtgryIdArr+
	   "&srchNtnTageTypeCtgryId=" + srchNtnTageTypeCtgryId+
	   "&srchRgnCd=" + srchRgnCd+
	   "&srchRlsDt=" + srchRlsDt+
	   "&orderByKey=" + orderByKey+
	   "&srchVal=" + encodedSrchVal+
	   "&currentPage=" + currentPage;
    
       $("#rscListArea").load("<c:url value='/dgtlcltrsc/dgtlCltRscList.do'/>" + "?"+queryString);
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
	  	 $("#clctListArea").load("<c:url value='/dgtlcltrsc/dgtlCltClctGroupList.do'/>" + "?"+queryString);
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
        	fncTopMvmnScrl('rscListTop');//스크롤 이동
        	funSelectDgtlClrcsRscList();	
    	}else{ //컬렉션
    		var orderByKey = $('#hdnClctOrderByKey').val();
        	$('#hdnClctCurrentPage' + orderByKey).val(currentPage.currentPage);
        	fncTopMvmnScrl('clctListTop');//스크롤 이동
        	funSelectDgtlClrcsClctList();
    	}
    }
    
    function funSrch(){
    	
    	var srchVal = document.getElementById("srchVal").value.trim();
    	    
   	    if (srchVal !== '') { 
   	        document.getElementById("dgtlClrcsRscSrchSpan").innerHTML = "\""+"<strong>" + srchVal + "</strong>"+"\"로 검색한 결과";
   	        document.getElementById("dgtlClrcsClctSrchSpan").innerHTML = "\""+"<strong>" + srchVal + "</strong>"+"\"로 검색한 결과";
   	        document.getElementById("dgtlClrcsRscSrchSpan").style.visibility = "visible";
   	        document.getElementById("dgtlClrcsClctSrchSpan").style.visibility = "visible";
   	    } else {
   	        document.getElementById("dgtlClrcsRscSrchSpan").innerHTML = "";
   	        document.getElementById("dgtlClrcsRscSrchSpan").style.visibility = "hidden";
   	        document.getElementById("dgtlClrcsClctSrchSpan").innerHTML = "";
   	        document.getElementById("dgtlClrcsClctSrchSpan").style.visibility = "hidden";
   	    }
   	    
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
    
    //초기화버튼 선택 시
    function funInitItems(){
    	$('#srchForm')[0].reset();
    }
    //상단 데이터 유형 선택 시 
    function funDataTypeSearch(){
    	
    	//소트조건, 조건별 페이징 초기화
    	$('#hdnOrderByKey').val("A");
    	$('#hdnCurrentPageA').val("1");
    	$('#hdnCurrentPageB').val("1");
    	$('#hdnCurrentPageC').val("1");
    	//자원소트탭 초기화
    	$('#dgtlClrcsRscListTab li').removeClass("active");
    	$('#dgtlClrcsRscListTab li:first-child').addClass("active");
    	
    	if($(window).width() <= 980){
    		//모바일 소트 초기화
        	$("#rscSort").val("A");
        	$("#rscSort").selectmenu("refresh");
        	$("#clctSort").val("A");
        	$("#clctSort").selectmenu("refresh");
    	}
    	//자원별 조회
    	funSelectDgtlClrcsRscList();	
    }
    function funDataTypeSearchChange(ctgryId) {
        // hidden input의 값을 변경합니다.
        document.getElementById("srchDataTypeCtgryId").value = ctgryId;
        funDataTypeSearch();
    }
    
	  document.addEventListener('DOMContentLoaded', function() {
		    var categoryItems = document.querySelectorAll('.tab-menu li');
		    
		    categoryItems.forEach(function(item) {
		      item.addEventListener('click', function() {
		        categoryItems.forEach(function(item) {
		          item.classList.remove('active');
		        });
		        this.classList.add('active');
		      });
		    });
		  });
    
	  /* 헤더 타고 들어오는 URL */
		var url = window.location.href;
		var queryString = url.split('?')[1];
		var queryParams = queryString.split('&');

		var srchDataTypeCtgryId = "";

		for (var i = 0; i < queryParams.length; i++) {
		    var param = queryParams[i].split('=');
		    var paramName = param[0];
		    var paramValue = param[1];

		    if (paramName === 'srchDataTypeCtgryCd') {
		        if (paramValue === 'A') {
		            srchDataTypeCtgryId = 'D01';
		        } else if (paramValue === 'B') {
		            srchDataTypeCtgryId = 'D02';
		        } else if (paramValue === 'C') {
		            srchDataTypeCtgryId = 'D03';
		        } else if (paramValue === 'D') {
		            srchDataTypeCtgryId = 'D04';
		        } else if (paramValue === 'E') {
		            srchDataTypeCtgryId = 'D05';
		        } else if (paramValue === 'F') {
		            srchDataTypeCtgryId = 'D07';
		        }
		    }
		}
		if (srchDataTypeCtgryId !== "") {
		    document.getElementById("srchDataTypeCtgryId").value = srchDataTypeCtgryId;
		    var srchVal = document.getElementById("srchVal").value.trim();
		    funDataTypeSearch();
		}
		
		var urlParams = new URLSearchParams(window.location.search);
		var orderByKey = urlParams.get('orderByKey');
		var srchTypeCd = urlParams.get('srchTypeCd');
		var srchVal = document.getElementById("srchVal").value.trim();
		
		if(srchTypeCd === "A"){
			if (srchTypeCd === "A" && orderByKey === "B") {
				$('#orderByKeyB').prop('checked', true).closest('span').addClass('active');
			}else{
				$('#orderByKeyA').prop('checked', true).closest('span').addClass('active');
			}
		}
		
    </script>