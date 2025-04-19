<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<%-- 공통으로 쓰이는 JS --%>

<script type="text/javascript" src="<c:url value="/assets/js/jquery.3.4.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/swiper-bundle.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/front.js"/>?ver=240325"></script>
<script type="text/javascript" src="<c:url value="/js/common.js"/>?ver=240325"></script>
<script type="text/javascript" src="<c:url value="/js/lib/axios.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/lib/tus.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/lib/three.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/lib/o3dv.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/aos.js"/>?ver=240325"></script>

<script>
	/* form clear 함수 */
	$.fn.clearForm = function() {
		return this.each(function(){
			this.reset();
		});
	};
	
	//Form Submit 중복 방지
	var prevent_data = null;
	var fnPrevent_init = function() {
		//중복방지 시간 초기화
		prevent_data = null;
		
		//로딩바 지우기
		fnLoading_hide();
	}
	
	//로딩페이지
	var fnLoading_show = function() {
		var div = $("<div />",{
				"id" : "viewLoading"
			,	"style" : "display:block; position:fixed; top:0; left:0; right:0; bottom:0; width:100%; height:100%; z-Index:9999; text-align:center; background:rgba(0, 0, 0, 0.3); "
		})
		var img = $("<img />",{
				"src" : "<c:url value="/images/common/loading.gif" />"
			,	"style" : "position:fixed; left:50%; top:50%; margin-left:-16px; margin-top:-16px;"
			,	"alt" : "로딩"
		});
		div.append(img);
		
		$("body").append(div);
	}
	var fnLoading_hide = function() {
		$("#viewLoading").remove();
	}
</script>