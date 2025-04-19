<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<c:if test="${empty dgtlClrcsRscQnaList}">
<div class="list-nodata">조회된 Q&A가 없습니다.</div>
</c:if>

<ul>
<c:forEach var="row" items="${dgtlClrcsRscQnaList}">
  <li>
    <div>
      <div>
        <strong><c:out value="${pf:getMaskingID(row.wrtrId)}" /></strong>
        <c:if test="${row.wrtrId eq loginId}">
        <em class="tag brd-color-blue">작성자</em>
        </c:if>
       
        <span><c:out value="${row.lastMdfcnDt}"/></span>
        <c:if test="${row.wrtrId eq loginId}">
        <button type="button" class="btn-delete" onClick="funDelQna('<c:out value='${row.pstId}'/>')">
         삭제
        </button>
        </c:if>
      </div>
    </div>
    <p>
      <c:out value="${row.pstCn}"/>
    </p>
    <c:if test="${not empty row.ansCn}">
    <div class="answer">
      <strong
        ><em>[<c:out value="${row.answrNm}"/>]</em
        ><span><c:out value="${row.ansLastMdfcnDt}"/></span></strong
      >
      <p>
        [<c:out value="${row.wrtrNm}"/>] <c:out value="${row.ansCn}"/>
      </p>
    </div>
    </c:if>
    
  </li>
</c:forEach> 
</ul>

<c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
<c:param name="currentPage" value="${dgtlClrcsRscQnaList[0].currentPage}" />
<c:param name="pagePerBlock" value="${dgtlClrcsRscQnaList[0].pagePerBlock}" />
<c:param name="totalPage" value="${dgtlClrcsRscQnaList[0].totalPage}" />
<c:param name="recordCountPerPage" value="${dgtlClrcsRscQnaList[0].recordCountPerPage}" /> 
<c:param name="funNm" value="fnQnaPaging" />
<c:param name="url" value="" />
</c:import>   