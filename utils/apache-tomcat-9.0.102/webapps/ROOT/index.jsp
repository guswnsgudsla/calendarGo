<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<script type="text/javascript" src="<c:url value="/assets/js/jquery.3.4.1.min.js"/>"></script>

<script>
$(document).ready(function() {
	location.replace("<c:url value='/index.do'/>");
});
</script>