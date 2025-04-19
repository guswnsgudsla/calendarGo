<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>    
    
	<!-- container(S) -->
	 <section class="container">
	   <header>
	     <div class="inner">
	       <h2>이벤트</h2>
	       <div class="breadcrumbs">
	         <a href="<c:url value="/index.do"/>">메인</a>
	         <span>이용안내</span>
	         <span>이벤트</span>
	         <span>상세</span>
	       </div>
	     </div>
	   </header>
	   <section id="contents" class="contents use-guide">
	     <div class="inner">
	       <div class="tab-wrap">
	         <ul class="tab-menu flexible">
	           <li class="active"><a href="<c:url value='/utztngdnc/evtView.do'/>" title="이벤트">이벤트</a></li>
	           <li><a href="<c:url value='/utztngdnc/eventWinList.do'/>" title="당첨자 보기">당첨자 보기</a></li>
	         </ul>
	         <div class="inner-depth">
	           <div class="tab-inner">
	             <div class="event-wrap cont-bg">
	               <div class="view-wrap">
	                 <div class="title">
	                   <div><c:out value="${evtView.evntTtl}" /></div>
	                   <p>
	                     <span><c:out value="${evtView.frstRegDt}" /></span>
	                     <span>작성자 : <c:out value="${pf:getMaskingID(evtView.frstRgtrId)}" /></span>
	                     <span>조회수 : <c:out value="${evtView.inqCnt}" /></span>
	                   </p>
	                   <dl>
	                     <dt>이벤트 기간</dt>
	                     <dd><c:out value="${evtView.eventPeriod}" /></dd>
	                     <dt>당첨자 발표</dt>
	                     <dd><c:out value="${evtView.slctnNtcYmd}" /></dd>
	                   </dl>
	                 </div>
	                 <!-- editer 영역 = class="content"으로 하시면 됩니다. -->
	                 <div class="content">
	                 <c:if test="${!empty item.rprsImgFileStrgPathNm or !empty item.rprsImgStrgFileNm } ">
	                   <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}'/>" alt="" />
	                 </c:if>
	                   <div class="cont">
	                   <c:set var="evntCn" value="${evtView.evntCn}" />
					<c:set var="evntCn" value="${pf:nl2br(evntCn)}" />
					<c:out value="${evntCn}" escapeXml="false"/>
	                   </div>
	                 </div>
	               </div>
	               <div class="btn-wrap">
	                 <button type="button" id="backBtn" class="btns size-s color-primary" title="목록" onClick="ListHistoryBack()">
	                   목록
	                 </button>
	               </div>
	             </div>
	           </div>
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