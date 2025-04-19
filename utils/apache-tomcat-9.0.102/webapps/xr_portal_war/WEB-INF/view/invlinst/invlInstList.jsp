<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<section class="container">
  <header>
    <div class="inner">
      <h2>참여기관</h2>
      <div class="breadcrumbs">
        <a href="<c:url value='/index.do'/>">메인</a>
        <span>참여기관</span>
      </div>
    </div>
  </header>
  <section id="contents" class="contents institution">
    <div class="inner">
      <div class="list cont-bg">
        <div class="list-option between">
          <p>총 <strong><fmt:formatNumber value="${srchVo.totalRecord}" pattern="#,###" /></strong>개</p>
          <form id="srchForm" name="srchForm">
          <input type="hidden" id="currentPage" name="currentPage" value="1" />
          <div class="sort">
            <div class="fm-focus selectmenu" data-size="s">
                <label for="rgnCd" class="blind">지역을 선택해주세요.</label>
                <select id="rgnCd" name="rgnCd">
                  <option value="" selected="selected">
                    지역을 선택해주세요.
                  </option>
                  <c:forEach var="row" items="${regionCodes}">
                   <option value="${row.cdId }" <c:if test="${srchVo.rgnCd eq row.cdId}">selected</c:if>><c:out value="${row.cdNm }"/></option>
                  </c:forEach>
                </select>
            </div>
            <div class="fm-focus selectmenu" data-size="s">
                <label for="instTypeCd" class="blind">기관 구분을 선택해주세요.</label>
                <select id="instTypeCd" name="instTypeCd">
                  <option value="" selected="selected">
                    기관 구분을 선택해주세요.
                  </option>
                  <c:forEach var="row" items="${instCategories }">
                    ${row}
                   <option value="${row.cdId }" <c:if test="${srchVo.instTypeCd eq row.cdId}">selected</c:if>><c:out value="${row.cdNm }"/></option>
                  </c:forEach>
                </select>
            </div>
            <div class="fm-group fm-focus fm-search">
              <label for="instNm" class="blind">검색어를 입력해 주세요.</label>
              <input type="text" id="instNm" name="instNm" class="fm-control" placeholder="검색어를 입력해 주세요." value="<c:out value='${srchVo.instNm}'/>"/>
              <label for="submitBtn" class="blind"></label>
              <button type="submit" id="submitBtn">
                <span class="blind">검색</span>
              </button>
            </div>
          </div>
          </form>
        </div>
        <ul class="list-institution">
          <c:forEach var="row" items="${invlInstList }">
            <li data-id="${row.instId }" class="instLi">
              <a href="#">
                <div class="img">
                  <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${row.rprsImgFileStrgPathNm}&fileNm=${row.rprsImgStrgFileNm}'/>" alt="" />
                </div>
                <p>
                  <strong><c:out value="${row.instNm }"/></strong>
                </p>
              </a>
            </li>
          </c:forEach>
        </ul>
        <c:import url="/WEB-INF/view/include/cmmnPaging.jsp" >
          <c:param name="currentPage" value="${invlInstList[0].currentPage}" />
          <c:param name="pagePerBlock" value="${invlInstList[0].pagePerBlock}" />
          <c:param name="totalPage" value="${invlInstList[0].totalPage}" />
          <c:param name="recordCountPerPage" value="${invlInstList[0].recordCountPerPage}" />
          <c:param name="funNm" value="fnList" />
          <c:param name="url" value="invlInstList.do" />
        </c:import>
      </div>
    </div>
  </section>
</section>
      
<script>
  function fnList(url, currentPage) {
    $('#currentPage').val(currentPage.currentPage);
    $('#srchForm').submit();
  }
  $(document).ready(function(){

    $('#rgnCd').selectmenu();
    $('#instTypeCd').selectmenu();

    $('.instLi').click(function() {
      const instId = $(this).data('id');
      window.location.href = "<c:url value='/invlinst/invlInstDtl.do'/>" + "?instId=" + instId;
    })

  });
</script>