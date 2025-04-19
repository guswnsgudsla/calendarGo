<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<section class="container">
  <header>
    <div class="inner">
      <h2>부가정보 입력</h2>
      <div class="breadcrumbs">
        <a href="<c:url value="/index.do"/>">메인</a>
        <a href="<c:url value="/mypage/mypageMain.do"/>"><span>마이페이지</span></a>
        <span>개인정보 관리</span>
      </div>
    </div>
  </header>
  <section id="contents" class="contents add-information">
    <form id="form"  name="form" method="post">
      <div class="inner">
        <p>가입시 입력한 부가정보 확인 및 수정이 가능합니다.</p>
        <div class="information">
          <strong>방문 목적을 선택해주세요.</strong>
          <div class="fm-check">
            <c:forEach var="row" items="${vstPrpsCdList }" varStatus="status">
              <span class="fm-ele">
                <c:set var="isChecked" value="${row.cdId eq dtlInfo.vstPrpsCd}" />

                  <label for="info01-${status.index + 1}" class="blind"></label>
                <input type="radio" id="info01-${status.index + 1}" value="${row.cdId}" name="vstPrpsCd" ${isChecked ? 'checked' : ''} />
                <label for="info01-${status.index + 1}"><c:out value="${row.cdNm}" /></label>
                <c:if test="${row.cdId eq '99'}">
		          <div class="fm-group">
		            <div class="fm-focus">
                        <label for="info01_text" class="blind"></label>
		              <input
		                type="text"
		                name="vstPrpsEtcCn"
		                id="info01_text"
		                class="fm-control"
		                <c:if test="${dtlInfo.vstPrpsCd != '99'}">
		                style="display:none;"
		                </c:if>
		                <c:if test="${dtlInfo.vstPrpsCd eq '99'}">
		                value="<c:out value="${dtlInfo.vstPrpsEtcCn}" />"
		                </c:if>
		                placeholder="기타 목적을 입력해주세요"
		              />
		            </div>
		          </div>
                </c:if>
              </span>
            </c:forEach>
          </div>
          <strong>현재 업종을 선택해주세요.</strong>
          <div class="fm-check">
            <c:forEach var="row" items="${mbrTpbizCdList }" varStatus="status">
              <span class="fm-ele">
                <c:set var="isMbrTpbizChecked" value="${row.cdId eq dtlInfo.mbrTpbizCd}" />
                <label for="info02-${status.index + 1}" class="blind"></label>
                <input type="radio" id="info02-${status.index + 1}" value="${row.cdId}" name="mbrTpbizCd" ${isMbrTpbizChecked ? 'checked' : ''} />
                <label for="info02-${status.index + 1}"><c:out value="${row.cdNm}" /></label>
                <c:if test="${row.cdId eq '99'}">
		          <div class="fm-group">
		            <div class="fm-focus">
                        <label for="info02_text" class="blind"></label>
		              <input
		                type="text"
		                name="mbrTpbizEtcCn"
		                id="info02_text"
		                class="fm-control"
		                <c:if test="${dtlInfo.mbrTpbizCd != '99'}">
		                style="display:none;"
		                </c:if>
		                <c:if test="${dtlInfo.mbrTpbizCd eq '99'}">
		                value="<c:out value="${dtlInfo.mbrTpbizEtcCn}" />"
		                </c:if>
		                placeholder="기타 업종을 입력해주세요"
		              />
		            </div>
		          </div>
                </c:if>
              </span>
            </c:forEach>
          </div>
          <strong>
          관심 키워드를 선택해주세요. <br class="m-br" />(복수선택
            가능)
          </strong>
          <div class="fm-check">
            <c:forEach var="row" items="${itrstFldCdList }" varStatus="status">
              <span class="fm-ele">
                <c:choose>
                  <c:when test="${fn:contains(dtlInfo.mbrItrstFldInfoList, row.cdId)}">
                    <input type="checkbox" id="info03-${status.index + 1 }" value="${row.cdId }" name="mbrItrstFldInfoList" checked />
                    <label for="info03-${status.index + 1 }"><c:out value="${row.cdNm }"/></label>
                  </c:when>
                  <c:otherwise>
                    <input type="checkbox" id="info03-${status.index + 1 }" value="${row.cdId }" name="mbrItrstFldInfoList" />
                    <label for="info03-${status.index + 1 }"><c:out value="${row.cdNm }"/></label>
                  </c:otherwise>
                </c:choose>
              </span>
            </c:forEach>

          </div>
        </div>
        <input type="hidden" value="<c:out value="${dtlInfo.mbrId}"/>" name="mbrId"/>
        <div class="btn-wrap">
            <label for="saveBtn" class="blind"></label>
          <button id="saveBtn" type="button" class="btns color-primary">저장하기</button>
            <label for="btn-leave" class="blind"></label>
          <button type="button" id="btn-leave" class="btn-leave" onclick="location.href='<c:url value="/mypage/mbrInfoMng.do"/>'">
            회원 정보 수정 및 탈퇴
          </button>
        </div>
      </div>
    </form>
  </section>
</section>
<script>
$(document).ready(function () {
	$("input[name=vstPrpsCd]").click(function () {
	    const selectVal = $("input[name=vstPrpsCd]:checked").val();

	    $('#info01_text').toggle(selectVal === '99');
	});

    $("input[name=mbrTpbizCd]").click(function () {
        const selectVal = $("input[name=mbrTpbizCd]:checked").val();

        $('#info02_text').toggle(selectVal === '99');
    });
   let mbrItrstFldInfoList = [];  
	  
  $("#saveBtn").click(() => {
	  const vstPrpsCd = $("input[name=vstPrpsCd]:checked").val(); // 방문목적 코드
	  const mbrTpbizCd = $("input[name=mbrTpbizCd]:checked").val(); // 업종 코드

      $("input[name=mbrItrstFldInfoList]:checked").each(function(){ // 키워드 코드
          mbrItrstFldInfoList.push($(this).val());
      });

      let vstPrpsEtcCn = $("#info01_text").val(); // 방문 기타 사유
      let mbrTpbizEtcCn = $("#info02_text").val(); // 업종 기타 사유
	  
      if (!vstPrpsCd) {
           return alert("방문목적을 선택해주세요");
      }
      if(vstPrpsCd === "99" && !vstPrpsEtcCn){
          return alert("기타 사유를 입력해주세요");
      }
      if(vstPrpsCd !== "99"){
        $("#info01_text").val("");
      }

      if (!mbrTpbizCd) {
          return alert("현재업종을 선택해주세요");
      }
      if(mbrTpbizCd === "99" && !mbrTpbizEtcCn){
        return alert("업종을 기입해주세요.")
      }
      if(mbrTpbizCd !== "99"){
        $("#info02_text").val("");
      }


      if (mbrItrstFldInfoList.length === 0) {
          return alert("관심키워드를 선택해주세요");
      }

      var formData = $("#form").serialize();

      $.ajax({
          type: 'POST',
          //enctype: 'multipart/form-data',
          //contentType: 'application/json',
          url: '<c:url value="/mbr/saveMbrAnxtInfo.do"/>',
          data: formData,
          cache: false,
          success: function (data) {
              if(data.resultCode == 200){
                alert("저장되었습니다.");
                window.location.href = '<c:url value="/index.do" />';
              } else {
                alert("저장중 오류가 발생하였습니다.")
              }
          },
          error: function (e) {
              console.log('ERROR : ', e);
          }
      });
  })
});
</script>