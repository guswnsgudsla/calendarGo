<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
		  <input type="hidden" id="clrcsId" name="clrcsId" value="<c:out value='${dgtlClrcsRscDtl.clrcsId}'/>"/>
          <div class="title">
            <div class="tag-wrap">
              <span class="tag color-green"><c:out value='${dgtlClrcsRscDtl.dataTypeRootCtgryNm}'/></span>
              <span class="tag brd-color-blue"><c:out value='${dgtlClrcsRscDtl.instNm}'/></span>
            </div>
            <strong><c:out value='${dgtlClrcsRscDtl.clrcsNm}'/></strong>
            <button
              type="button"
              class="btns size-s color-primary btn-download"
<%--              onclick="fncFileDownload('<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>', 'all', null, null,'downloadProgress', 'progressText', '<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>.zip');"--%>
			  onclick="fncFileDownload('<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>', 'all', null, null,'downloadProgress', 'progressText', '<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>.zip');"
            >
              전체 다운로드
            </button>
          </div>
		  <div id="downloadArea" class="progressbar" style="display: none">
			 <progress id="downloadProgress" value="0" max="100"></progress>
			 <span id="progressText">다운로드 대기중</span>
		  </div>
          <div class="contents-list">
            <strong>최종 산출물(<c:out value='${finalFileCnt}'/>)</strong>
            <ul>
                <c:if test="${fn:length(dgtlClrcsPrdctFileFinalInfoList) eq '0'}">
	              <li>
	                <p>최종 산출물 내역이 없습니다.</p>
	              </li>
                </c:if>
                <c:forEach var="row" items="${dgtlClrcsPrdctFileFinalInfoList}" varStatus="status">
	              <li>
	              	<c:choose>
                    <c:when test="${null ne row.fileType && row.fileType eq 'FL'}">
	                <c:if test="${row.lvl gt 0}">
                	<c:forEach var="cnt" begin="1" end="${row.lvl - 1}" step="1" varStatus="a">
                	&nbsp;&nbsp;&nbsp;&nbsp;
                	</c:forEach>
                	</c:if>
	                <p>
	                	<c:out value='${row.prdctNm}'/>
	                	<span><c:out value='${row.fileSz}'/></span>
	                </p>
	                <button
	                  type="button"
	                  class="btn-download"
	                  onclick="fncFileDownload('<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>', 'selectOne', <c:out value="${row.prdctSn}"/>, null,null, null, '<c:out value="${row.prdctNm}"/>');"
	                >
	                  다운로드
	                </button>
	                </c:when>    
                    <c:otherwise>
	                <c:if test="${row.lvl gt 0}">
                	<c:forEach var="cnt" begin="1" end="${row.lvl - 1}" step="1" varStatus="a">
                	&nbsp;&nbsp;&nbsp;&nbsp;
                	</c:forEach>
                	</c:if>
	                <p class="folder">
	                	<c:out value='${row.prdctNm}'/>
	                </p>
	                </c:otherwise> 
	                </c:choose>   
	              </li>
                </c:forEach>
             </ul>
            <strong>단계별 산출물(<c:out value='${stepFileCnt}'/>)</strong>
            <ul>
                <c:if test="${fn:length(dgtlClrcsPrdctFileStepInfoList) eq '0'}">
	              <li>
	                <p>단계별 산출물 내역이 없습니다.</p>
	              </li>
                </c:if>
                <c:forEach var="row" items="${dgtlClrcsPrdctFileStepInfoList}" varStatus="status">
	              <li>
	              	<c:choose>
                    <c:when test="${null ne row.fileType && row.fileType eq 'FL'}">
	                <c:if test="${row.lvl gt 0}">
                	<c:forEach var="cnt" begin="1" end="${row.lvl - 1}" step="1" varStatus="a">
                	&nbsp;&nbsp;&nbsp;&nbsp;
                	</c:forEach>
                	</c:if>
	                <p>
	                	<c:out value='${row.prdctNm}'/>
	                	<span><c:out value='${row.fileSz}'/></span>
	                </p>
	                <button
	                  type="button"
	                  class="btn-download"
	                  onclick="fncFileDownload('<c:out value="${dgtlClrcsRscDtl.clrcsId}"/>', 'selectOne', <c:out value="${row.prdctSn}"/>, null,null, null, '<c:out value="${row.prdctNm}"/>')"
	                >
	                  다운로드
	                </button>
	                </c:when>    
                    <c:otherwise>
	                <c:if test="${row.lvl gt 0}">
                	<c:forEach var="cnt" begin="1" end="${row.lvl - 1}" step="1" varStatus="a">
                	&nbsp;&nbsp;&nbsp;&nbsp;
                	</c:forEach>
                	</c:if>
	                <p class="folder">
	                	<c:out value='${row.prdctNm}'/>
	                </p>
	                </c:otherwise> 
	                </c:choose>   
	              </li>
                </c:forEach>
            </ul>
          </div>



