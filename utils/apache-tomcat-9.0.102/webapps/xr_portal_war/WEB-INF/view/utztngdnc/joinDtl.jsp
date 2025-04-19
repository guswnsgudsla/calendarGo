<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
        <c:if test="${not empty accessDeniedMessage}">
		    <script>
		        alert("${accessDeniedMessage}");
		        window.location.href = "<c:url value='/utztngdnc/joinList.do'/>"; // 접근 거부시 리다이렉트될 경로
		    </script>
		</c:if>
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
            <div class="cont-bg">
              <div class="view-wrap">
                <div class="title">
                  <div>
                    <c:out value="${joinDtlList.pstTtl}"/>
                    <input type="hidden" name="pstId" id="pstId" class="fm-control" value="<c:out value='${joinDtlList.pstId}'/>" />
                  </div>
                  <p>
                  	<fmt:parseDate value="${joinDtlList.frstRegDt}" pattern="yyyy-MM-dd HH:mm" var="frstRegDt"/>
                    <span><fmt:formatDate value="${frstRegDt}" pattern="yyyy.MM.dd HH:mm"/></span>
                    <span>작성자 : <c:out value="${pf:getMaskingID(joinDtlList.frstRgtrId)}"/></span>
                    <span>조회수 : <c:out value="${joinDtlList.inqCnt}"/></span>
                  </p>
                </div>
                <!-- editer 영역 = class="content"으로 하시면 됩니다. -->
                <div class="content">
                  <div class="cont" id="cont">
                    <c:set var="pstCn" value="${joinDtlList.pstCn}"/>
                    <c:set var="pstCn" value="${pf:nl2br(pstCn)}" />
                    <c:out value="${pstCn}" escapeXml="false"/>
                  </div>
                  <c:if test="${not empty joinDtlList.ansCn}">
                    <div class="comment">
                      <div>
                        <strong>관리자 답변</strong>
                        <span><c:out value="${joinDtlList.ansLastMdfcnDt}"/></span>
                      </div>
                      <p>
                         <%--  [<c:out value="${joinDtlList.wrtrNm}"/>]<c:out value="${joinDtlList.ansCn}"/> --%>
                       	 	[관리자]
		                    <c:set var="ansCn" value="${joinDtlList.ansCn}"/>
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
                <c:if test="${userId == joinDtlList.frstRgtrId}">
		          <button type="button" id="editBtn" class="btns size-s color-primary" title="수정" onClick="joinEdit()">
		            수정
		          </button>
		          <button type="button" id="delBtn" class="btns size-s color-primary" title="삭제" onClick="funDelJoin('${joinDtlList.pstId}')">
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

      //join 삭제
      function funDelJoin(pstId){
  	    // 확인 메시지 표시
  	    var result = confirm("정말로 삭제하시겠습니까?");
  	  if (result) {
      	$.ajax({
              url: "<c:url value='/utztngdnc/delJoin.do'/>",
              type: 'POST',
              data: { 'pstId':pstId
              },
              success: function(response) {
                
              	if(response.resultCode == 200){
      				alert("삭제되었습니다.");
      				window.location.href = "<c:url value='/utztngdnc/joinList.do'/>";
              	} else if(response.resultCode == 401){
         				alert("사용시간이 초과 되었습니다. 다시 로그인 후 삭제하시기 바랍니다.");
              	} else{
              		alert("삭제에 실패하였습니다.");
              	}
              	window.location.href = "<c:url value='/utztngdnc/joinList.do'/>";
              },
              error: function() {
              	alert("삭제에 실패하였습니다.");
              }
        });
      }
    }
      
  	function joinEdit() {
  	    var pstId = $('#pstId').val();
  	  	window.location.href = "<c:url value='/utztngdnc/joinWrite.do'/>?pstId=" + pstId+ "&mode=edit"
	  }
  	
      // 페이지 로딩 시 content 요소 내의 텍스트에 processUrls 함수 적용 
      $(document).ready(function(){
          var element = document.getElementById('cont');
          if (element) {
              element.innerHTML = processUrls(element.innerHTML);
          }
      });
      
</script>