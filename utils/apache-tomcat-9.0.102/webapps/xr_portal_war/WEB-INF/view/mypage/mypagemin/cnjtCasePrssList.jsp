<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %> 
		<c:if test="${empty cnjtCaseList}">
			<div class="list-nodata">등록된 활용 사례가 없습니다.</div>
		</c:if>
		
        <div class="swiper list-useful item-swiper">
           <div class="swiper-wrapper">
           <c:forEach var="item" items="${cnjtCaseList}" begin="0" end="3">                
             <div class="swiper-slide">
               <a href="<c:url value='/cltrscprss/cnjtCaseView.do?prId=${item.prId}'/>" >
                 <!-- 승인대기중 approval, 승인완료 ok, 반려 err -->
                 
                 <c:if test="${!empty item.aprvYn}">
					    <c:choose>
					        <c:when test="${item.aprvYn eq 'Y'}">
					            <!-- 'Y' (승인완료)일 때의 내용 -->
					            <span class="approval ok">승인완료</span>
					        </c:when>
					        <c:when test="${item.aprvYn eq 'N'}">
					            <!-- 'D' (승인대기중)일 때의 내용 -->
					            <span class="approval">승인대기중</span>
					        </c:when>
					        <c:when test="${item.aprvYn eq 'D'}">
					            <!-- 'N' (반려)일 때의 내용 -->
					            <span class="approval err">반려</span>
					        </c:when>
					        <c:otherwise>
					            <!-- 다른 모든 경우 -->
					            <span class="ok">대기중</span>
					        </c:otherwise>
					    </c:choose>
					</c:if>
                 
                 <div class="img">
					<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}'/>" alt="" />
                 </div>
                 <div class="tag-wrap">
                   <span class="tag size-small brd-color-blue"><c:out value="${item.entNm}" /></span>
                 </div>
                 <p>
                   <strong><c:out value="${item.prTtl}" /></strong>
                 </p>
               </a>
               <div class="btn-wrap">
                 <p><c:out value="${item.frstRegDt}" /></p>
                   <label for="viewBtn" class="blind"></label>
                 <button type="button" id="viewBtn" class="view"><c:out value="${item.inqCnt}" /></button>
               </div>
             </div>
             </c:forEach>                  
           </div>
         </div>

       
  <script>
      front.selectmenu("area");
      front.selectmenu("cont");
    </script>
