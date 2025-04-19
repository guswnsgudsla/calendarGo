<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
        <c:if test="${not empty accessDeniedMessage}">
		    <script>
		        alert("${accessDeniedMessage}");
		        window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>"; // 접근 거부시 리다이렉트될 경로
		    </script>
		</c:if>
          <div class="inner">
            <h2>문의하기</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span>문의하기</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents use-guide">
          <div class="inner">
            <div class="cont-bg">
              <div class="view-wrap">
                <div class="title">
                  <div>
                    <c:out value="${qnaDtlList.pstTtl}"/>
                    <input type="hidden" name="pstId" id="pstId" class="fm-control" value="<c:out value='${qnaDtlList.pstId}'/>" />
                  </div>
                  <p>
                  	<fmt:parseDate value="${qnaDtlList.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                    <span><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd HH:mm"/></span>
                    <span>작성자 : <c:out value="${pf:getMaskingID(qnaDtlList.frstRgtrId)}"/></span>
                    <span>조회수 : <c:out value="${qnaDtlList.inqCnt}"/></span>
                    <span>공개여부 : 
					    <c:choose>
					        <c:when test="${qnaDtlList.secrYn eq 'Y'}">
					            비밀글
					        </c:when>
					        <c:otherwise>
					            공개
					        </c:otherwise>
					    </c:choose>
					</span>
                  </p>
                </div>
                <!-- editer 영역 = class="content"으로 하시면 됩니다. -->
                <div class="content">
                  <div class="cont" id="cont">
                    <c:set var="pstCn" value="${qnaDtlList.pstCn}"/>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
                  </div>
                  <c:if test="${not empty qnaDtlList.ansCn}">
                    <div class="comment">
                      <div>
                        <strong>관리자 답변</strong>
                        <span><c:out value="${qnaDtlList.ansLastMdfcnDt}"/></span>
                      </div>
                      <p>
                         <%--  [<c:out value="${qnaDtlList.wrtrNm}"/>]<c:out value="${qnaDtlList.ansCn}"/> --%>
                       	 	[관리자]
		                    <c:set var="ansCn" value="${qnaDtlList.ansCn}"/>
		                    <c:set var="ansCn" value="${pf:nl2br(ansCn)}" />
		                    <c:out value="${ansCn}" escapeXml="false"/>
                      </p>
                    </div>
                  </c:if>
                </div>
              </div>
              <div class="btn-wrap">
                <button type="button" id="backBtn" class="btns size-s color-primary" title="목록" onClick="ListHistoryBack()">
                  목록
                </button>
                <c:if test="${userId == qnaDtlList.frstRgtrId}">
		          <button type="button" id="editBtn" class="btns size-s color-primary" title="수정" onClick="qnaEdit()">
		            수정
		          </button>
		          <button type="button" id="delBtn" class="btns size-s color-primary" title="삭제" onClick="funDelQna('${qnaDtlList.pstId}')">
		            삭제
		          </button>
		        </c:if>
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

      //Qna 삭제
      function funDelQna(pstId){
  	    // 확인 메시지 표시
  	    var result = confirm("정말로 삭제하시겠습니까?");
  	  if (result) {
      	$.ajax({
              url: "<c:url value='/utztngdnc/delQna.do'/>",
              type: 'POST',
              data: { 'pstId':pstId
              },
              success: function(data) {
                
              	if(data.resultCode == 200){
      				alert("삭제되었습니다.");
      				window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>";
              	} else if(data.resultCode == 401){
         				alert("사용시간이 초과 되었습니다. 다시 로그인 후 삭제하시기 바랍니다.");
              	} else{
              		alert("삭제에 실패하였습니다.");
              	}
              	window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>";
              },
              error: function() {
              	alert("삭제에 실패하였습니다.");
              }
        });
      }
    }
      
  	function qnaEdit() {
  	    var pstId = $('#pstId').val();
  	  	window.location.href = "<c:url value='/utztngdnc/qnaWrite.do'/>?pstId=" + pstId+ "&mode=edit"
	  }
  	
      // 페이지 로딩 시 content 요소 내의 텍스트에 processUrls 함수 적용 
      $(document).ready(function(){
          var element = document.getElementById('cont');
          if (element) {
              element.innerHTML = processUrls(element.innerHTML);
          }
      });
      
</script>