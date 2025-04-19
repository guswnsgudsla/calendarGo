<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
    <ul class="list-resource">
        <c:forEach var="row" items="${dgtlClrcsRscList}" varStatus="status">
        <li>
          <a href="#">
            <div class="img">
              <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
              	<c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
              	<c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
              	<c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
              </c:url>		                  	
                 <img src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
            </div>
            <div class="tag-wrap">
              <span class="tag size-small color-green"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
              <span class="tag size-small brd-color-blue"><c:out value='${row.instNm}'/></span>
            </div>
            <p>
              <strong>
                <c:out value='${row.clrcsNm}'/>
              </strong>
            </p>
          </a>
          <div class="btn-wrap">
            <button type="button" class="view"><fmt:formatNumber value="${row.inqCnt}" pattern="#,###"/></button>
            <button type="button" class="download"><fmt:formatNumber value='${row.dwnldCnt}' pattern="#,###"/></button>
            <button type="button" class="like"><fmt:formatNumber value='${row.rcmdtnCnt}' pattern="#,###"/></button>
          </div>
        </li>
        </c:forEach>
      </ul>
      <div class="btn-wrap">
        <button type="button" class="btns color-primary btn-collection" onclick="fncSelectClctDtl('<c:out value='${dgtlClrcsRscVo.exbiId}'/>')">컬렉션 상세보기</button>
      </div>
