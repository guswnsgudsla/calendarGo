<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>관리자 승인 요청</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span>관리자 승인 요청</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
                <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
                <form id="srchForm" name="srchForm" method="get">
                <input type="hidden" id="currentPage" name="currentPage" value="1" />
                <div class="sort">
                  <div class="fm-focus selectmenu" data-size="s">
                    <select id="srchKey" name="srchKey">
                      <option value="" selected="selected">전체검색</option>
                      <option value="A" <c:if test="${srchVo.srchKey eq 'A'}">selected</c:if>>제목</option>
                      <option value="C" <c:if test="${srchVo.srchKey eq 'C'}">selected</c:if>>작성자</option>
                    </select>
                    <label for="srchKey" class="blind">검색 유형 선택</label>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                    <input type="text" class="fm-control" id="srchValue" name="srchValue" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.srchValue}'/>"/>
                    <label for="srchValue" class="blind">검색어를 입력해 주세요.</label>
                    <button type="submit" id="srchButton">
                      <span class="blind">검색</span>
                    </button>
                    <label for="srchButton" class="blind">검색</label>
                  </div>
                </div>
              </div>
              <div class="qna">
                <!--
                  신규글 = new
                -->
                <div class="table-grid confirm">
                  <div class="thead">
                    <strong>번호</strong>
                    <strong>제목</strong>
                    <strong>작성자</strong>
                    <strong>등록일</strong>
                    <strong>답변여부</strong>
                  </div>
                 <c:if test="${!empty joinList}"> 
                 <c:forEach var="item" items="${joinList}" varStatus="status">
				  <div class="row">
				    <!-- userId가 존재하고, 현재 사용자가 등록자인지 확인 -->
				    <c:if test="${not empty userId and  userId == item.frstRgtrId}">
				      <a href="<c:url value='/utztngdnc/joinDtl.do?pstId=${item.pstId}'/>" title="<c:out value="${item.pstTtl}"/>" class="secret pointer">
				    </c:if>
				    <!-- userId가 존재하고, 등록자가 아닌 경우 -->
				    <c:if test="${not empty userId and userId != item.frstRgtrId}">
				      <a href="javascript:void(0);" title="<c:out value="${item.pstTtl}"/>" class="${item.secrYn == 'Y' ? 'secret' : ''}">
				    </c:if>
				    <!-- userId가 존재하지 않는 경우 -->
				    <c:if test="${empty userId}">
				      <a href="<c:url value='/utztngdnc/joinDtl.do?pstId=${item.pstId}'/>" title="<c:out value="${item.pstTtl}"/>" class="${item.secrYn == 'Y' ? 'secret' : ''}">
				    </c:if>
                      <p><c:out value="${item.pstSn}"/></p>
                      <div class="${item.newYn == 'Y' ? 'new' : ''}"><c:out value="${item.pstTtl}"/></div><!--secrYn 비밀글여부 Y:비밀글, N:공개글 -->
                      <p><c:out value="${pf:getMaskingID(item.frstRgtrId)}" /></p>
                      <fmt:parseDate value="${item.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                      <p><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd" /></p>
                      <p>    
                      <c:choose>
				        <c:when test="${not empty item.ansCn}">
				            답변완료
				        </c:when>
				        <c:otherwise>
				            답변대기중
				        </c:otherwise>
				    </c:choose>
				    </p>	
                    </a>
                  </div>
                 </c:forEach>
                 </c:if>
		           <c:if test="${empty joinList}">
              		 <div class="row">
                	  <div class="list-nodata">검색 결과가 없습니다.</div>
              		 </div>
            	   </c:if>
                </div>
              </div>
              <div class="pagination">
               <c:import url="/WEB-INF/view/include/cmmnPaging.jsp">
                 <c:param name="currentPage" value="${joinList[0].currentPage}" />
                 <c:param name="pagePerBlock" value="${joinList[0].pagePerBlock}" />
                 <c:param name="totalPage" value="${joinList[0].totalPage}" />
                 <c:param name="recordCountPerPage" value="${joinList[0].recordCountPerPage}" />
                 <c:param name="funNm" value="fnList" />
                 <c:param name="url" value="joinList.do" />
               </c:import>
                <!-- pagination 모바일용 -->
                <button type="button" class="btns color-gray btn-more">
                  더보기
                </button>
              </div>
			  <c:if test="${writeFlag == 'do' }">
			  <div class="btn-wrap btn-apply">
			    <button type="button" class="btns size-s color-primary apply" onclick="joinWrite()" id='joinWriteButton' title='승인요청'>
			      승인요청하기
			    </button>
			  </div>
			  </c:if>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->

    <script>
	function joinWrite() {
		window.location.href = "<c:url value='/utztngdnc/joinWrite.do'/>" + "?mode=register";
	  }
    function fnList(url, currentPage) {
	    $('#currentPage').val(currentPage.currentPage);
	    $('#srchForm').submit();
	}
	
	$(document).ready(function(){
	 	$('#srchKey').selectmenu();
    $('#clsfCd').selectmenu();
	});
    </script>
