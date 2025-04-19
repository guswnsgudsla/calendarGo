<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
    <c:if test="${empty myDwnldRscList}">
    	<div class="list-nodata">다운로드 현황이 없습니다.</div>
	</c:if>
	<div class="swiper list-resource item-swiper">
		<div class="swiper-wrapper">
		  <c:forEach var="item" items="${myDwnldRscList}">
			<div class="swiper-slide">
				<a href="<c:url value='/dgtlcltrsc/dgtlCltRscDtl.do?clrcsId=${item.clrcsId}'/>">
					<div class="img">
					<img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${item.rprsImgFileStrgPathNm}&fileNm=${item.rprsImgStrgFileNm}&dataCtgryId=${item.dataTypeRootCtgryId}'/>" alt="" />
		            </div>
					<div class="tag-wrap">
						<span class="tag size-small color-green">
						<c:out value="${item.dataTypeRootCtgryNm}" /></span> 
						<span class="tag size-small brd-color-blue"><c:out value="${item.instNm}" /></span>
					</div>
					<p>
						<strong> <c:out value="${item.clrcsNm}" />
						</strong>
					</p>
				</a>
				<div class="btn-wrap">
					<label for="viewBtn" class="blind"></label>
					<button type="button" id="viewBtn" class="view">
						<c:out value="${item.inqCnt}" />
					</button>
					<label for="downloadBtn" class="blind"></label>
					<button type="button" id="downloadBtn" class="download">
						<c:out value="${item.dwnldCnt}" />
					</button>
					<!-- <label for="likeBtn" class="blind"></label>
					<button type="button" id="likeBtn" class="like">
						<c:out value="${item.rcmdtnCnt}" />
					</button> -->
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<script>
		var resourceSwiper = new Swiper(".swiper.item-swiper", {
			slidesPerView : 1,
			spaceBetween : 10,
			breakpoints : {
				980 : {
					slidesPerView : 4,
					spaceBetween : 40,
				},
			},
		});
	</script>
