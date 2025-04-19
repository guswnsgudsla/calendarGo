<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

		  <input type="hidden" id="clrcsId" name="clrcsId" value="<c:out value='${dgtlClrcsRscDtl.clrcsId}'/>"/>
		  <input type="hidden" id="contsUseAgreYn" name="contsUseAgreYn" value="Y"/>
          <div class="title">
            <div class="tag-wrap">
              <span class="tag color-green"><c:out value='${dgtlClrcsRscDtl.dataTypeRootCtgryNm}'/></span>
              <span class="tag brd-color-blue"><c:out value='${dgtlClrcsRscDtl.instNm}'/></span>
            </div>
            <strong><c:out value='${dgtlClrcsRscDtl.clrcsNm}'/></strong>
          </div>
          <div class="about">
            <table>
              <colgroup>
                <col width="150px" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>해당기관</th>
                <td><c:out value='${dgtlClrcsRscDtl.instNm}'/></td>
              </tr>
              <tr>
                <th>활용목적</th>
                <td>
                  <div class="fm-check">
                <c:forEach var="row" items="${cnjtTypeCdList}" varStatus="status">
                    <span class="fm-ele">
                      <input type="radio" id="purpose-${status.index}" name="contsCnjtTypeCd" value="<c:out value="${row.cdId}"/>" />
                      <label for="purpose-${status.index}"><c:out value="${row.cdNm}"/></label>
                    </span>
                </c:forEach>
                  </div>
                  <div class="fm-group" data-size="xl">
                    <div class="fm-focus">
                      <input
                        type="text"
                        id="contsCnjtEfctExpln"
                        name="contsCnjtEfctExpln"
                        class="fm-control"
                        placeholder="세부목적을 입력해주세요."
                      />
		              <label for="contsCnjtEfctExpln" class="blind">세부목적을 입력해주세요.</label>
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <th>이용조건</th>
                <td>
                  <img src="<c:url value='/assets/images/logo_open.png'/>" alt="공공누리 OPEN로고"/>
                  출처표시
                </td>
              </tr>
              <tr>
                <th>이용약관</th>
                <td>
                  공공저작물 다운로드 시 개인정보 (회원가입 정보) 활용과
                  공공저작물 이용조건에 동의 하셔야 합니다. 개인정보활용 목적은
                  공공저작물 활용용도 분석과 더 나은 공공저작물 서비스를
                  위함입니다. 활용되는 개인정보는 디지털문화자원 공동활용플랫폼 개인정보처리방침에
                  따라 관리됩니다. 다운로드된 공공저작물은 공공누리 유형에 맞는
                  이용조건으로 사용하셔야 합니다.
                  <a href="<c:url value="/footer/useTerms.do"/>" target="_blank">
                  <button type="button" class="btns btn-terms">
                    이용약관 전체보기
                  </button>
                  </a>
                </td>
              </tr>
            </table>
            <div class="fm-check">
              <span class="fm-ele">
                <input type="checkbox" id="prvcClctAgreYn" name="prvcClctAgreYn" value="Y" />
                <label for="prvcClctAgreYn">
                  디지털문화자원 공동활용플랫폼 이용약관 및 개인정보이용 동의 내용을 숙지하고
                  동의합니다.
                </label>
              </span>
            </div>
            <div class="btn-wrap">
              <button type="button" class="btns size-s color-primary btn-download" onclick="fnRegDwnldNote(); return false;">
                다운로드
              </button>
            </div>
          </div>

<script>

/**
 * 다운로드 이용동의 등록
 */
function fnRegDwnldNote() {
	const contsCnjtTypeCd = $("input[name=contsCnjtTypeCd]:checked").val();
	const prvcClctAgreYn = $("input[name=prvcClctAgreYn]:checked").val();
	
	if (fncIsNull(contsCnjtTypeCd)) {
		alert("활용목적을 입력해주세요.");
		return false;
	}
	
	if (fncIsNull($("#contsCnjtEfctExpln").val()) || $("#contsCnjtEfctExpln").val().trim() === "") {
		alert("세부목적을 입력해주세요.");
		return false;
	}
	
	if (fncIsNull(prvcClctAgreYn)) {
		alert("이용약관 및 개인정보이용 동의해주세요.");
		return false;
	}

   	const formData = $("#dwnldNoteForm").serialize();
    $.ajax({
        type: 'POST',
        url: '<c:url value="/dgtlcltrsc/regMbrDwnldHstry.do"/>',
        data: formData,
        cache: false,
        success: function (data) {
            if(data.resultCode == 200){
				front.layerClose('dwnldNoteLayer');
				fncDwnldExecPopup(data.result.clrcsId);
            }
        },
        error: function (e) {
            console.log('ERROR : ', e);
        }
    }); 
}

</script>          