<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<c:if test="${empty dgtlClrcsRscRvList}">
<div class="list-nodata">조회된 리뷰가 없습니다.</div>
</c:if>

<ul>
<c:forEach var="row" items="${dgtlClrcsRscRvList}">
<li>
   <div>
     <div>
       <strong><c:out value="${pf:getMaskingID(row.wrtrId)}" /></strong>
       
       <c:if test="${row.wrtrId eq loginId}">
       <em class="tag brd-color-blue">작성자</em>
       </c:if>
       
       <span><c:out value="${row.lastMdfcnDt}"/></span>
       <c:if test="${row.wrtrId eq loginId}">
       <button type="button" class="btn-delete" onClick="funDelRv('<c:out value='${row.pstId}'/>')">
         삭제
       </button>
       </c:if>
     </div>
     <p class="star<c:out value="${row.rtngScr}"/>">
       <span></span><span></span><span></span
       ><span></span><span></span>
     </p>
   </div>
   <p>
     <c:out value="${row.pstCn}"/>
   </p>
 </li>
</c:forEach> 
</ul>

<c:import url="/WEB-INF/view/include/cmmnPaging.jsp" > 
<c:param name="currentPage" value="${dgtlClrcsRscRvList[0].currentPage}" />
<c:param name="pagePerBlock" value="${dgtlClrcsRscRvList[0].pagePerBlock}" />
<c:param name="totalPage" value="${dgtlClrcsRscRvList[0].totalPage}" />
<c:param name="recordCountPerPage" value="${dgtlClrcsRscRvList[0].recordCountPerPage}" /> 
<c:param name="funNm" value="fnRvPaging" />
<c:param name="url" value="" />
</c:import>   