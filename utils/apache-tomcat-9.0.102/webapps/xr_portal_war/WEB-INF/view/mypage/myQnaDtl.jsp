<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>    

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>나의 문의 내역</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <a href="<c:url value="/mypage/mypageMain.do"/>">마이페이지</a>
              <a href="<c:url value="/mypage/myQnaList.do"/>">나의 문의 내역</a>
            </div>
          </div>
        </header>
        <section id="contents" class="contents qna-wrap">
          <div class="inner">
            <div class="cont-bg">
              <div class="view-wrap">
                  <c:forEach var="item" items="${myQnaDtl}">
                <div class="title">
                  <!--
                    신규글 = new
                    답변대기 = unanswered
                    비밀글 = secret
                  -->
                    <div class="${item.newYn == 'Y' ? 'new' : ''}">
                      <c:choose>
          			    <c:when test="${not empty item.ansCn}">
            			  <strong>[답변완료]</strong>
          				</c:when>
          			   <c:otherwise>
            			<strong class="unanswered">[답변대기]</strong>
          			   </c:otherwise>
        			 </c:choose>
                      <c:out value="${item.pstTtl}"/>
                    </div>
                  <p>
                    <fmt:parseDate value="${item.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                    <span><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd HH:mm"/></span>
                    <span><c:out value="${pf:getMaskingID(item.wrtrId)}"/></span>
                  </p>
                </div>
                <div class="content">
                  <div class="cont">
                    <c:set var="pstCn" value="${item.pstCn}"/>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
                  </div>
                  <c:if test="${not empty item.ansCn}">
                  <div class="comment">
                    <div>
                      <strong>관리자 답변</strong><span><c:out value="${item.ansLastMdfcnDt}"/></span>
                      <%-- <span><c:out value="${item.answrNm}"/></span> --%>
                    </div>
                    <p>
                      [관리자]
                      <c:set var="ansCn" value="${item.ansCn}"/>
                   	  <c:set var="ansCn" value="${pf:nl2br(ansCn)}" />
                      <c:out value="${ansCn}" escapeXml="false"/>
                    </p>
                  </div>
                  </c:if>
                </div>
               </c:forEach>
                
              </div>
              <div class="btn-wrap">
                <label for="backBtn" class="blind"></label>
                <button type="button" id="backBtn" class="btns color-primary" onClick="ListHistoryBack()">목록</button>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
<script>
   
      function ListHistoryBack(){
      
      window.location.href = "javascript:history.back()";
   }
      
</script>
