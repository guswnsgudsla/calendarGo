<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<jsp:include page="/WEB-INF/view/include/popHeader.jsp" />

	<c:if test="${fn:contains(SCRIPT_OPTION, 'POST') }">
		<c:set var="target" value="_top" />
		<c:if test="${SCRIPT_OPTION eq 'POST_SELF' }">
			<c:set var="target" value="" />
		</c:if>
		
		<form id="message" action="<c:out value='${SCRIPT_SOURCE}'/>" method="post" target="<c:out value='${target}'/>">
			<c:forEach var="row" items="<c:out value='${postParamMap}'/>">
				<input type="hidden" name="<c:out value='${row.key}'/>" value="<c:out value="${row.value}" />" />
			</c:forEach>
		</form>
	</c:if>
		
	<script type="text/javascript">
		$(document).ready(function(){
			try {
				parent.fnPrevent_init(); 
			} catch(e) { }
			
			<c:if test="${not empty MESSAGE }">
				alert("<c:out value='${MESSAGE}'/>");
			</c:if>
			
			<c:choose>
				<c:when test="${SCRIPT_OPTION eq 'HREF' }">
					location.href = "<c:out value='${SCRIPT_SOURCE}'/>";
				</c:when>
				<c:when test="${SCRIPT_OPTION eq 'REPLACE' }">
					location.replace("<c:out value='${SCRIPT_SOURCE}'/>");
				</c:when>
				<c:when test="${SCRIPT_OPTION eq 'TOPHREF' }">
					top.window.location.href = "<c:out value='${SCRIPT_SOURCE}'/>";
				</c:when>
				<c:when test="${SCRIPT_OPTION eq 'OPERNER' }">
					opener.window.location.href = "<c:out value='${SCRIPT_SOURCE}'/>";
				</c:when>
				<c:when test="${SCRIPT_OPTION eq 'PARENT' }">
					parent.window.location.href = "<c:out value='${SCRIPT_SOURCE}'/>";
				</c:when>
				<c:when test="${fn:contains(SCRIPT_OPTION, 'POST') }">
					$("#message").submit();
				</c:when>
				<c:when test="${SCRIPT_OPTION eq 'SCRIPT' }">
					<c:out value='${SCRIPT_SOURCE}'/>
				</c:when>
			</c:choose>
			
			if($("#viewLoading", parent.document).length > 0){
				fnLoading_hide();
			}else if($("#viewLoading").length > 0) {
				fnLoading_hide();
			}
			
		});
	</script>
		
<jsp:include page="/WEB-INF/view/include/popFooter.jsp" />
