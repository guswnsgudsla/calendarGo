<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>공지사항</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span>공지사항</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide">
          <div class="inner">
            <div class="cont-bg">
              <div class="view-wrap">
                <div class="title">
                  <div>
                    <c:out value="${ntcMttrDtlList.pstTtl}"/>
                  </div>
                  <p>
                  	<fmt:parseDate value="${ntcMttrDtlList.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                    <span><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd HH:mm"/></span>
                    <span>작성자 : <c:out value="${ntcMttrDtlList.frstRgtrId}"/></span>
                    <span>조회수 : <c:out value="${ntcMttrDtlList.inqCnt}"/></span>
                  </p>
                </div>
                <!-- editer 영역 = class="content"으로 하시면 됩니다. -->
                <div class="content">
                  <div class="cont" id="cont">
                    <c:set var="pstCn" value="${ntcMttrDtlList.pstCn}"/>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
                  </div>
                <c:if test="${resultVo.totalRecord > 0 and not empty atchFileLists}">
              	 <!-- 첨부파일 개수 출력-->
                  <div class="link">
              	  <p>
              	  첨부(<strong><fmt:formatNumber value="${resultVo.totalRecord}" groupingUsed="true" pattern="#,###" /></strong>)
                  </p>
                   <c:forEach var="file" items="${atchFileLists}">
                  	<c:url var="url" value="/cmmn/downloadFile.do">
                      <c:param name="filePath" value="${file.fileStrgPathNm}" />
                      <c:param name="fileNm" value="${file.strgFileNm}" />
                      <c:param name="orgnlFileNm" value="${file.orgnlAtchFileNm}" />
                    </c:url>
                     <a href="${url}">
                      <c:out value="${file.orgnlAtchFileNm}" />  (<c:out value="${file.fileSz}"/>)
                     </a>
                   </c:forEach>
                  </div>
                 </c:if>
                </div>
              </div>
              <div class="btn-wrap">
                <button type="button" id="backBtn" class="btns size-s color-primary" title="목록" onClick="ListHistoryBack()">
                  목록
                </button>
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
    
  
   // 게시물 내용 안에 url있는 경우 링크 설정. shCore.js 참조
      function processUrls(code) {
	   
    	 var urlRegex = /https?:\/\/[\w\-\.~:\/?#\[\]@!$&'()*+,;=]+/g;
    	 
    	 return code.replace(urlRegex, function(m) {

			return '<a href="' + m + '">' + m + '</a>';
    	       });
    	   }

      // 페이지 로딩 시 content 요소 내의 텍스트에 processUrls 함수 적용 
      $(document).ready(function(){
          var element = document.getElementById('cont');
          if (element) {
              element.innerHTML = processUrls(element.innerHTML);
          }
      });
      
</script>