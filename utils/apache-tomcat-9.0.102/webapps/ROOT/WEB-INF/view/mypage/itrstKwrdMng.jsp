<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<section class="container">
  <header>
    <div class="inner">
      <h2>관심 키워드 관리</h2>
      <div class="breadcrumbs">
		<a href="<c:url value="/index.do"/>">메인</a> 
		<a href="<c:url value="/mypage/mypageMain.do"/>">마이페이지</a>
        <a href="<c:url value="/mypage/itrstKwrdMng.do"/>"><span>관심 키워드 관리</span></a>
      </div>
    </div>
  </header>
  <section id="contents" class="contents keyword-wrap">
    <div class="inner">
      <div class="cont-bg">
        <div class="keyword-register">
         <form id="myForm" method="post" onsubmit="return validateForm()">
          <div class="fm-focus">
            <label for="kwrdNm" class="blind"></label>
            <input  type="text"  id="kwrdNm"  placeholder="등록할 키워드를 입력해주세요." />
            <label for="kwrdSubmit" class="blind"></label>
            <button id="kwrdSubmit" type="button" class="btns size-s color-primary">
              등록
            </button>
          </div>
          </form>
        </div>
      </div>
      <div class="keyword-tag cont-bg">
      	<c:if test="${empty myItrstKwrdList}">
			<div class="list-nodata keyword">관심 키워드가 없습니다.</div>
		</c:if>
        <c:forEach var="item" items="${myItrstKwrdList}">
        <span class="tag size-latge color-gray"><c:out value="${item.kwrdNm}" />
          <label for="deleteBtn" class="blind"></label>
          <button type="button" id="deleteBtn" class="btn-delete" onclick="deleteKeyword(${item.kwrdSn})">
            <span class="blind">삭제</span>
          </button>
        </span>
        </c:forEach>
      </div>
    </div>
  </section>
</section>
<script>
	var existingKeywords = [];
	<c:forEach items="${myItrstKwrdList}" var="item">
	  existingKeywords.push('<c:out value="${item.kwrdNm}"/>');
	</c:forEach>
 
 $(document).ready(function () {
    $("#kwrdNm").keypress(function (event) {
    	//Enter 키 키 코드(13)
        if (event.which === 13) { 
            event.preventDefault();
            //kwrdSubmit 실행
            $("#kwrdSubmit").click(); 
        }
    });
     $("#kwrdSubmit").on("click", function () {
         // validateForm 함수호출
         if (validateForm()) {
         var kwrdNm = $("#kwrdNm").val();
         // Ajax 요청
         $.ajax({
             type: "POST",
             url: '<c:url value="/mypage/regItrstKwrd.do"/>',
             data: {kwrdNm: kwrdNm},
             success: function (data) {
                location.reload();
             },
             error: function (error) {
            	 alert("입력한 내용을 확인해주세요.");
             }
         });
        }
     });
 });
//유효성 검사 
function validateForm() {
	    var kwrdNm = $("#kwrdNm").val();

	    // 입력값이 비어 있는지 확인
	    if (kwrdNm.trim() === "") {
	    	alert("등록할 키워드를 입력해주세요.");
	   
	        return false; // 폼 전송 중단
	    }

	    // 입력 키워드의 중복유무 확인
	    if (existingKeywords.includes(kwrdNm.trim())) {
	      alert("이미 등록된 키워드가 있습니다.");
	      
	      return false; // 폼 전송 중단
	    }
	    
	    // 빈값이 아니면 true 반환
	    return true;
	}
//삭제
function deleteKeyword(kwrdSn) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url:  '<c:url value="/mypage/delItrstKwrd.do"/>',
            data: { kwrdSn: kwrdSn },
            success: function(response) {
                location.reload();
            },
            error: function(error) {
            }
        });
    }
}

        
</script>
