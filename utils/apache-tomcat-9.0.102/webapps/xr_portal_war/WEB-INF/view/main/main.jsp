<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<style>
    .visual {
        position: relative; !important;
    }
    .backBtn {
      z-index: 999999; !important;
      position: absolute; !important;
    }
</style>
      <!-- container(S) -->
      <section class="container">
        <section id="contents" class="contents main">
          <div class="inner key-visual">
            <h2>고품질 디지털 문화자원 소개</h2>
            <p class="text">문화체육관광부 내에 소속/유관 기관에서 보유한 고품질의 디지털 문화자원을 소개합니다.</p>
            <div class="swiper">
              <div class="swiper-wrapper">
               <c:forEach var="row" items="${rcmdtnCltRscList}" varStatus="loopIndex"> 
                <c:set target="${relMap}" property="${loopIndex.index}" value="${row.lnkgCltRscList}" />
                <div class="swiper-slide">
                  <div class="visual" id="rscConts<c:out value="${loopIndex.index}"/>" style="display: flex; justify-content: center">
                	<c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
                  		<c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
                  		<c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
                  		<c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
			      	</c:url>		                  	
                    <img id="prvwImg<c:out value="${loopIndex.index}"/>" src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>">
                    <c:if test="${row.dataTypeRootCtgryId eq 'D01' or row.dataTypeRootCtgryId eq 'D02' or row.dataTypeRootCtgryId eq 'D04'}">
                    <button id="3dBtn<c:out value="${loopIndex.index}"/>" type="button" class="btns" onClick="funPrvw('<c:out value="${row.clrcsId}"/>','<c:out value="${row.dataTypeRootCtgryId}"/>',<c:out value="${loopIndex.index}"/>)">미리보기</button>
                    <button id="backBtn<c:out value="${loopIndex.index}"/>" type="button" class="btns backBtn" style="display:none;" onClick="funBackPrvw('<c:out value="${row.dataTypeRootCtgryId}"/>',<c:out value="${loopIndex.index}"/>)">돌아가기</button>
                    </c:if>
                    
                  </div>
                  <div class="cont">
                    <div class="tag-wrap" data-swiper-parallax="-500">
                      <span class="tag color-green"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
                      <span class="tag brd-color-white"><c:out value='${row.instNm}'/></span>
                    </div>
                    <strong data-swiper-parallax="-500">
                    <a href="javascript:fncSelectCltRscDtl('<c:out value="${row.clrcsId}"/>')">
                      <c:out value='${row.clrcsNm}'/>
                      <span>
                      <c:if test="${not empty row.clrcsSbttl }">
                      (<c:out value='${row.clrcsSbttl}'/>)
                      </c:if>
                      </span>
                    </a>  
                    </strong>
                    <p data-swiper-parallax="-1000">
                    <a href="javascript:fncSelectCltRscDtl('<c:out value="${row.clrcsId}"/>')">
                      <c:out value='${row.clrcsExpln}'/>
                    </a>  
                    </p>
                  </div>
                </div>
              </c:forEach>   
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>
          
          <div class="associate" id="relDiv">
            <div class="inner">
              <h2>연관 디지털문화자원 보기</h2>
              <div class="associate-swiper">
                <div class="swiper">
                  <div class="swiper-wrapper" id="relSource">
                    
                    <c:forEach var="entry" items="${relMap}" varStatus="relStatus">
				        <c:forEach var="row" items="${entry.value}" varStatus="relStatusCnt">
					      <c:choose>
					          <c:when test="${relStatus.index eq 0}">
					              <div class="swiper-slide close_cls show_cls_<c:out value='${relStatus.index}'/>">
						      </c:when>
						  <c:otherwise>
						      <div class="swiper-slide close_cls show_cls_<c:out value='${relStatus.index}'/>" style="display:none">
						  </c:otherwise>
					      </c:choose>
					      
	                      <a href="#">
	                        <div class="img">
			                  <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
			                  	<c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
			                  	<c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
			                  	<c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
						      </c:url>		                  	
			                  <img src="${rprsImgUrl}" alt="" onClick="fncSelectCltRscDtl('${row.clrcsId}')" title="<c:out value="${row.clrcsNm}"/>"/>
	                        </div>
	                        <p onClick="fncSelectCltRscDtl('${row.clrcsId}')"><c:out value="${row.clrcsNm}"/></p>
	                      </a>
	                    </div>
	 				    </c:forEach>
	 				</c:forEach> 
				  </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
              </div>
            </div>
            
          </div>
          <div class="inner newone"  data-aos="fade-up" data-aos-anchor-placement="top-bottom">
            <h2>디지털문화자원</h2>
            <p class="text">플랫폼에 등록된 디지털문화자원을 확인하세요.</p>
			<input type="hidden" value="tabViewRnkgCltRscList" id="oldTabMenu">
            <div class="tab-wrap as-tab-wrap">
              <div class="list-option">
                <ul class="tab-menu flexible">
                  <li data-value="" class="active" id="tabViewRnkgCltRscList">
                    <a href="javascript:classActive('tabViewRnkgCltRscList');">인기있는 디지털문화자원</a>
                  </li>
                  <li data-value="" id="tabNewCltRscList">
                    <a href="javascript:classActive('tabNewCltRscList');">신규 디지털문화자원</a>
                  </li>
                  <li data-value="" id="tabDwnldRnkgCltRscList">
                    <a href="javascript:classActive('tabDwnldRnkgCltRscList');">인기 다운로드 디지털문화자원</a>
                  </li>
                </ul>
                <div class="link">
                  <c:url value="/dgtlcltrsc/dgtlCltRscMain.do?srchTypeCd=A" var="dgtlcltrscUrl"></c:url>
                  <a href="${dgtlcltrscUrl}">모두보기</a>
                </div>
              </div>
              <div class="inner-depth" id="viewRnkgCltRscList">
                <div class="newone-swiper">
                  <div class="swiper">
                    <div class="swiper-wrapper">
                    <c:forEach var="row" items="${viewRnkgCltRscList }">
                      <div class="swiper-slide">
                        <a href="javascript:fncSelectCltRscDtl('${row.clrcsId}')">
                          <div class="img">
                          <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
                            <c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
                            <c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
                            <c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
                          </c:url>		                  	
                          <img src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
                          </div>
                          <div class="cont">
                            <div class="title">
                              <div class="tag-wrap">
                                <span class="tag color-green"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
                                <span class="tag brd-color-blue"><c:out value='${row.instNm}'/></span>
                              </div>
                              <strong><c:out value='${row.clrcsNm}'/></strong>
                            </div>
                            <div class="cont">
                              <p>
                                <c:out value='${row.clrcsExpln}'/>
                              </p>
                            </div>
                            <div class="subsection">
                              <dl>
                                <dt>데이터 유형</dt>
                                <dd><c:out value='${row.dataTypeCtgryNm}'/></dd>
                                <dt>공통분류</dt>
                                <dd><c:out value='${row.contsTypeCtgryNm}'/></dd>
                                <dt>서비스 유형</dt>
                                <dd><c:out value='${row.srvcTypeCtgryNm}'/></dd>
                                <dt>산업유형</dt>
                                <dd><c:out value='${row.indrTypeCtgryNm}'/></dd>
                              </dl>
                              <dl>
                                <dt>기관별분류</dt>
                                <dd><c:out value='${row.instCtgryNm}'/></dd>
                                <dt>국가/시대</dt>
                                <dd><c:out value='${row.ntnTageTypeCtgryNm}'/></dd>
                                <dt>재질</dt>
                                <dd><c:out value='${row.mtrTypeCtgryNm}'/></dd>
                                <dt>최신 등록일</dt>
                                <dd><c:out value='${row.lastMdfcnDt}'/></dd>
                              </dl>
                            </div>
                          </div>
                        </a>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
				</div>
                <div class="inner-depth" id="dwnldRnkgCltRscList" style="display:none;">
                <div class="newone-swiper">
                  <div class="swiper">
                    <div class="swiper-wrapper">
                    <c:forEach var="row" items="${dwnldRnkgCltRscList }">
                      <div class="swiper-slide">
                        <a href="javascript:fncSelectCltRscDtl('${row.clrcsId}')">
                          <div class="img">
                          <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
                            <c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
                            <c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
                            <c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
                          </c:url>		                  	
                          <img src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
                          </div>
                          <div class="cont">
                            <div class="title">
                              <div class="tag-wrap">
                                <span class="tag color-green"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
                                <span class="tag brd-color-blue"><c:out value='${row.instNm}'/></span>
                              </div>
                              <strong><c:out value='${row.clrcsNm}'/></strong>
                            </div>
                            <div class="cont">
                              <p>
                                <c:out value='${row.clrcsExpln}'/>
                              </p>
                            </div>
                            <div class="subsection">
                              <dl>
                                <dt>데이터 유형</dt>
                                <dd><c:out value='${row.dataTypeCtgryNm}'/></dd>
                                <dt>공통분류</dt>
                                <dd><c:out value='${row.contsTypeCtgryNm}'/></dd>
                                <dt>서비스 유형</dt>
                                <dd><c:out value='${row.srvcTypeCtgryNm}'/></dd>
                                <dt>산업유형</dt>
                                <dd><c:out value='${row.indrTypeCtgryNm}'/></dd>
                              </dl>
                              <dl>
                                <dt>기관별분류</dt>
                                <dd><c:out value='${row.instCtgryNm}'/></dd>
                                <dt>국가/시대</dt>
                                <dd><c:out value='${row.ntnTageTypeCtgryNm}'/></dd>
                                <dt>재질</dt>
                                <dd><c:out value='${row.mtrTypeCtgryNm}'/></dd>
                                <dt>최신 등록일</dt>
                                <dd><c:out value='${row.lastMdfcnDt}'/></dd>
                              </dl>
                            </div>
                          </div>
                        </a>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
                </div>
                <div class="inner-depth" id="newCltRscList" style="display:none;">
                <div class="newone-swiper">
                  <div class="swiper">
                    <div class="swiper-wrapper">
                    <c:forEach var="row" items="${newCltRscList }">
                      <div class="swiper-slide">
                        <a href="javascript:fncSelectCltRscDtl('${row.clrcsId}')">
                          <div class="img">
                          <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
                            <c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
                            <c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
                            <c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
                          </c:url>		                  	
                          <img src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
                          </div>
                          <div class="cont">
                            <div class="title">
                              <div class="tag-wrap">
                                <span class="tag color-green"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
                                <span class="tag brd-color-blue"><c:out value='${row.instNm}'/></span>
                              </div>
                              <strong><c:out value='${row.clrcsNm}'/></strong>
                            </div>
                            <div class="cont">
                              <p>
                                <c:out value='${row.clrcsExpln}'/>
                              </p>
                            </div>
                            <div class="subsection">
                              <dl>
                                <dt>데이터 유형</dt>
                                <dd><c:out value='${row.dataTypeCtgryNm}'/></dd>
                                <dt>공통분류</dt>
                                <dd><c:out value='${row.contsTypeCtgryNm}'/></dd>
                                <dt>서비스 유형</dt>
                                <dd><c:out value='${row.srvcTypeCtgryNm}'/></dd>
                                <dt>산업유형</dt>
                                <dd><c:out value='${row.indrTypeCtgryNm}'/></dd>
                              </dl>
                              <dl>
                                <dt>기관별분류</dt>
                                <dd><c:out value='${row.instCtgryNm}'/></dd>
                                <dt>국가/시대</dt>
                                <dd><c:out value='${row.ntnTageTypeCtgryNm}'/></dd>
                                <dt>재질</dt>
                                <dd><c:out value='${row.mtrTypeCtgryNm}'/></dd>
                                <dt>최신 등록일</dt>
                                <dd><c:out value='${row.lastMdfcnDt}'/></dd>
                              </dl>
                            </div>
                          </div>
                        </a>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
            </div>
          </div>

<!-- 
          <div class="count-wrap">
            <div class="inner">
              <div data-aos="fade-right">
                <p>참여기관</p>
                <strong><fmt:formatNumber value="${cltRscBrifStat.invlInstCnt }" pattern="#,###" /></strong>
              </div>
              <div data-aos="fade-up">
                <p>공개 디지털문화자원수</p>
                <strong><fmt:formatNumber value="${cltRscBrifStat.rlsRscCnt }" pattern="#,###" /></strong>
              </div>
              <div data-aos="fade-left">
                <p>전체 다운로드 수</p>
                <strong><fmt:formatNumber value="${cltRscBrifStat.dwnldCnt }" pattern="#,###" /></strong>
              </div>
              !--  
              <div>
                <p>전체 좋아요 수</p>
                <strong><fmt:formatNumber value="${cltRscBrifStat.itrstCnt }" pattern="#,###" /></strong>
              </div>
              --
            </div>
          </div> -->


          <div class="inner search" style="margin-top: 100px;">
            <h2>디지털문화자원 상세 검색</h2>
            <p class="text">상세한 조건을 통해 디지털문화자원 을 검색하세요.</p>

            <div class="tab-wrap as-tab-wrap">
              <!-- tab 활성화 li class=active -->
              <ul class="tab-menu flexible">
                <li><a href="#">소장기관</a></li>
                <li class="active"><a href="#">지역별</a></li>
                <li><a href="#">디지털문화자원별</a></li>
              </ul>
              <div class="inner-depth">
                <div class="tab-inner agency">
                  <fieldset>
                    <div class="fm-check">
                    <c:forEach var="item" items="${instTypeList}"  varStatus="rdoStatus">
                      <span class="fm-ele">
                        <input
                          type="radio"
                          id="agency<c:out value='${rdoStatus.index}'/>"
                          name="agency"
                          ${rdoStatus.first ? 'checked' : ''} 
                          value="<c:out value='${item.cdId}'/>"
                          onclick="funInstTypeClick(this)"
                        />
                        <label for="agency<c:out value='${rdoStatus.index}'/>"><c:out value='${item.cdNm}'/></label>
                      </span>
                      </c:forEach>
                    </div>
                    <div class="menu-wrap">
                      <div class="selectmenu">
                        <select name="srchInstId" id="srchInstId" title="기관 선택">
                          <option value="" selected>해당 기관을 선택해주세요.</option>
                          <c:forEach var="item" items="${instList}">
                          <option value="<c:out value='${item.instId}'/>"><c:out value='${item.instNm}'/></option>
                          </c:forEach>
                        </select>
                      </div>
                      <div class="searchmenu">
                        <div class="fm-group">
                          <div class="fm-focus">
                            <input type="text" class="fm-control" id="instSrwd" placeholder="검색어를 입력해 주세요."/>
                            <label for="instSrwd" class="blind">검색어를 입력해 주세요.</label>
                            <button type="button" id="srchByInst">
                              <span class="blind">검색</span>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>
                </div>
                <div class="tab-inner area">
                  <fieldset>
                    <div class="selectmenu">
                      <select name="srchRgnCd" id="srchRgnCd" title="지역 선택">
                        <option value="" selected>해당 지역을 선택해주세요.</option>
						    <c:forEach var="item" items="${rgnCdList}">
						        <option value="${item.cdId}">${item.cdNm}</option>
						    </c:forEach>
						</select>
                    </div>
                    <div class="searchmenu">
                      <div class="fm-group">
                        <div class="fm-focus">
                          <input type="text" class="fm-control" id="rgnSrwd" placeholder="검색어를 입력해 주세요."/>
                          <label for="rgnSrwd" class="blind">검색어를 입력해 주세요.</label>
                          <button type="button" id="srchByRgn">
                            <span class="blind">검색</span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </fieldset>
                </div>
                <div class="tab-inner resource">
                  <fieldset>
                    <div class="fm-check">
                      <c:forEach var="item" items="${ctry3CmbList}" varStatus="chkStatus">
                      <span class="fm-ele">
                        <input type="checkbox" id="srchContsTypeCtgryId<c:out value='${chkStatus.index}'/>" 
                        name="srchContsTypeCtgryIdArr" value="<c:out value='${item.ctgryId}'/>"/>
                        <label for="srchContsTypeCtgryId<c:out value='${chkStatus.index}'/>"><c:out value='${item.ctgryNm}'/></label>
                      </span>
                      </c:forEach>
                    </div>
                    <div class="menu-wrap">
                      <div class="searchmenu">
                        <div class="fm-group">
                          <div class="fm-focus">
                            <input type="text" class="fm-control" id="contsTypeSrwd" placeholder="검색어를 입력해 주세요."/>
	                        <label for="contsTypeSrwd" class="blind">검색어를 입력해 주세요.</label>
                            <button type="button" id="srchByContsType">
                              <span class="blind">검색</span>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>
                </div>
              </div>
            </div>
          </div>

<!--           
          <div class="download">
            <div class="inner">
              <h2>인기 다운로드 디지털문화자원</h2>
              <div class="swiper">
                <div class="swiper-wrapper">
                  <c:forEach var="row" items="${dwnldRnkgCltRscList }">
                  <div class="swiper-slide">
                    <a href="javascript:fncSelectCltRscDtl('${row.clrcsId}')">
                      <div class="img" data-aos="zoom-in">
	                    <c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
	                  	  <c:param name="filePath" value="${row.rprsImgFileStrgPathNm}" />
	                  	  <c:param name="fileNm" value="${row.rprsImgStrgFileNm}" />
	                  	  <c:param name="dataCtgryId" value="${row.dataTypeRootCtgryId}" />
				        </c:url>		                  	
	                    <img src="${rprsImgUrl}" alt="" title="<c:out value='${row.clrcsNm}'/>"/>
                      </div>
                      <div class="cont">
                        <span class="tag color-blue"><c:out value='${row.dataTypeRootCtgryNm}'/></span>
                        <p><c:out value='${row.clrcsNm}'/></p>
                      </div>
                    </a>
                  </div>
				      </c:forEach>
                </div>
              </div>
            </div>
          </div>
         -->

         
        <div class="status">
          <div class="inner">

            <h2>디지털문화자원 현황</h2>
            <p class="text">참여기관 및 등록된 디지털 문화자원 현황을 확인하세요</p>
            
            <div class="count-wrap">
              <div class="item">
                  <i class="asset"></i>
                  <p>3D데이터 에셋</p>
                  <strong class="counter" data-target="<c:out value='${dataTypeStatList[0].rscCnt}'/>">&#40;<c:out value='${dataTypeStatList[0].rscCnt}'/>&#41;</strong>
              </div>
              <div class="item">
                  <i class="video"></i>
                  <p>동영상</p>
                  <strong class="counter" data-target="<c:out value='${dataTypeStatList[1].rscCnt}'/>">&#40;<c:out value='${dataTypeStatList[1].rscCnt}'/>&#41;</strong>
              </div>
              <div class="item">
                  <i class="audio"></i>
                  <p>오디오</p>
                  <strong class="counter" data-target="<c:out value='${dataTypeStatList[2].rscCnt}'/>">&#40;<c:out value='${dataTypeStatList[2].rscCnt}'/>&#41;</strong>
              </div>
              <div class="item">
                  <i class="image"></i>
                  <p>이미지</p>
                  <strong class="counter" data-target="<c:out value='${dataTypeStatList[3].rscCnt}'/>">&#40;<c:out value='${dataTypeStatList[3].rscCnt}'/>&#41;</strong>
              </div>
              <div class="item">
                  <i class="text"></i>
                  <p>텍스트</p>
                  <strong class="counter" data-target="<c:out value='${dataTypeStatList[4].rscCnt}'/>">&#40;<c:out value='${dataTypeStatList[4].rscCnt}'/>&#41;</strong>
              </div>
              
            </div>
            
            <div class="swiper-wrap swiper-one">
              <div class="inner">
                <h3>참여기관</h3>
                <div class="swiper stauts-swiper1">
                  <div class="swiper-wrapper">
                    <c:forEach var="rowInst" items="${invlInstList}">
                    	<div class="swiper-slide">
                    	  <c:url value="/invlinst/invlInstDtl.do?instId=${rowInst.instId }" var="invlInstDtlUrl"></c:url>	
	                      <a href="${invlInstDtlUrl}">상세보기</a>
	                      <div class="img" data-aos="zoom-in" style="text-align: center;">
	                        <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${rowInst.rprsImgFileStrgPathNm}&fileNm=${rowInst.rprsImgStrgFileNm}'/>" alt="" title="<c:out value="${rowInst.instNm}"/>"/>
	                      </div>
	                      <div class="cont">
	                        <strong><c:out value="${rowInst.instNm }"/></strong>
	                        <p><c:out value="${rowInst.instExpln }"/></p>
	                        <%-- 
	                        <div class="count">
	                          <p>등록된 참여기관 수</p>
	                          <p><c:out value="${instCnt }"/></p>
	                        </div>
	                        --%>
	                      </div>
	                    </div>
                    </c:forEach>
                  </div>
                  <div class="swiper-pagination"></div>
                  <!-- <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div> -->
                </div>
              </div>
              
              <div class="inner">
                <h3>컬렉션</h3>
                <div class="swiper stauts-swiper2">
                  <div class="swiper-wrapper">
                    <c:forEach var="rowClc" items="${dgtlClrcsClctList}">
                    	<div class="swiper-slide">
                    	  <c:url value="/dgtlcltrsc/dgtlCltClctGroupDtl.do?exbiId=${rowClc.exbiId }&orderByKey=A" var="dgtlCltClctGroupDtlUrl"></c:url>
	                      <a href="${dgtlCltClctGroupDtlUrl}">상세보기</a>
	                       <div class="img">
						      <c:forEach var="imgRow" items="${rowClc.rprsImgList}">
						      	<c:if test="${not empty imgRow}">
						           <c:forEach var="mapRow" items="${imgRow}" varStatus="status">
						             <c:if test="${mapRow.key eq 'rprs_img_file_strg_path_nm'}">
						             <c:set var="filePath" value="${mapRow.value}" />
						             </c:if>  
						             <c:if test="${mapRow.key eq 'rprs_img_strg_file_nm'}">
						             <c:set var="fileNm" value="${mapRow.value}" />
						             </c:if>  
						             <c:if test="${mapRow.key eq 'data_type_root_ctgry_id'}">
						             <c:set var="dataCtgryId" value="${mapRow.value}" />
						             </c:if>  
						           </c:forEach>
						           <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt="" title="<c:out value='${row.exbiNm}'/>"> 
						      	</c:if>
						      </c:forEach>          
						    </div>
	                      <div class="cont">
	                        <strong><c:out value="${rowClc.exbiNm }"/></strong>
	                        <p><c:out value="${rowClc.exbiExpln }"/></p>
	                        <%-- 
	                        <div class="count">
	                          <p>등록된 컬렉션 수</p>
	                          <p><c:out value="${clcCnt }"/></p>
	                        </div>
	                        --%>
	                      </div>
	                    </div>
                    </c:forEach>

                  </div>
                  <div class="swiper-pagination"></div>
                  <!-- <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div> -->
                </div>
              </div>

            </div>
          </div>
        </div>



        </section>
      </section>
      <!-- //container(E) -->
      
      <!-- selectmenu 관련 변수들 -->
      <form id="srchForm" name="srchForm">
	  <input type="hidden" id="hdnSrchInstId">
	  <input type="hidden" id="hdnSrchRgnCd">
	  </form>
      
    <script>
      function classActive(tabId){
    	  var oldtabId = document.getElementById('oldTabMenu').value;
		  if(oldtabId == 'tabViewRnkgCltRscList'){
			  $("#tabViewRnkgCltRscList").removeClass("active");
			  $("#viewRnkgCltRscList").hide();
    	  }
		  if(oldtabId == 'tabDwnldRnkgCltRscList'){
			  $("#tabDwnldRnkgCltRscList").removeClass("active");
			  $("#dwnldRnkgCltRscList").hide();  		  
		  }
	      if(oldtabId == 'tabNewCltRscList'){
	    	  $("#tabNewCltRscList").removeClass("active");
			  $("#newCltRscList").hide(); 	  
		  }
    	  if(tabId == 'tabViewRnkgCltRscList'){
    		  $("#tabViewRnkgCltRscList").addClass("active");
			  $("#viewRnkgCltRscList").show();
    	  }
		  if(tabId == 'tabDwnldRnkgCltRscList'){
			  $("#tabDwnldRnkgCltRscList").addClass("active");
			  $("#dwnldRnkgCltRscList").show();     		  
		  }
	      if(tabId == 'tabNewCltRscList'){
	    	  $("#tabNewCltRscList").addClass("active");
			  $("#newCltRscList").show(); 	  
		  }
	      document.getElementById('oldTabMenu').value = tabId;
      }
      AOS.init();
      var keyVisual = new Swiper(".key-visual .swiper", {
   	    autoplay: {
   		    delay: 10000,
   		    disableOnInteraction: false,
    	},
        parallax: true,
        pagination: {
          el: ".key-visual .swiper-pagination",
          clickable: true,
        },
        on: {
            slideChange: function () {
                var swiperIndex = this.activeIndex;
                //하단 슬라이드 세팅
                updateSlide(swiperIndex);
	            //연관자원 없으면 태그 전체 숨기기
	      		funRelDivShow();
            }
        },
      });
      
      function updateSlide(swiperIndex) {
  	    $('.close_cls').hide();
  	    var showClsSelector = '.show_cls_' + swiperIndex;
  	    $(showClsSelector).show();
  	    associateSwiper.slideTo(0, 500, false);//페이징 첫번째로
        associateSwiper.update(); //스와이프 업데이트
      }
      
      //최상단 자동 스와이프 마우스 오버시 멈추게
	  $('.key-visual .swiper').on('mouseover', function(){
		  keyVisual.autoplay.stop();
	  });
	  //연관보기 마우스 오버시 멈추게
	  $('.associate-swiper .swiper').on('mouseover', function(){
		  keyVisual.autoplay.stop();
	  });
      
	  $('.key-visual .swiper').on('mouseout', function(){
		  keyVisual.autoplay.start();
	  });
	  $('.associate-swiper .swiper').on('mouseout', function(){
		  keyVisual.autoplay.start();
	  });
	  
	  $('.key-visual .swiper').on('touchStart', function(){
		  keyVisual.autoplay.stop();
	  });
	  $('.associate-swiper .swiper').on('touchStart', function(){
		  keyVisual.autoplay.stop();
	  });
      
      $('.key-visual .swiper').on('touchEnd', function(){
		  keyVisual.autoplay.start();
	  });
	  $('.associate-swiper .swiper').on('touchEnd', function(){
		  keyVisual.autoplay.start();
	  });
	  
      var associateSwiper = new Swiper(".associate-swiper .swiper", {
        slidesPerView: 2.5,
        spaceBetween: 20,
        centeredSlides: false,
        pagination: {
            el: ".associate-swiper .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".associate-swiper .swiper-button-next",
            prevEl: ".associate-swiper .swiper-button-prev",
        },
        breakpoints: {
          980: {
            loop: false,
            slidesPerView: 5,
            spaceBetween: 64,
            centeredSlides: false,
          },
        },
      });
/*       var newoneSwiper = new Swiper(".newone-swiper .swiper", {
        navigation: {
          nextEl: ".newone-swiper .swiper-button-next",
          prevEl: ".newone-swiper .swiper-button-prev",
        },
      }); */
      
      // 인기있는 디지털문화자원 스와이퍼 초기화
      var swiperPopular = new Swiper('#viewRnkgCltRscList .swiper', {
          // 여기에 스와이퍼 옵션을 설정
          navigation: {
              nextEl: '#viewRnkgCltRscList .swiper-button-next',
              prevEl: '#viewRnkgCltRscList .swiper-button-prev',
          },
      });

      // 인기 다운로드 디지털문화자원 스와이퍼 초기화
      var swiperDownload = new Swiper('#dwnldRnkgCltRscList .swiper', {
          // 여기에 스와이퍼 옵션을 설정
          navigation: {
              nextEl: '#dwnldRnkgCltRscList .swiper-button-next',
              prevEl: '#dwnldRnkgCltRscList .swiper-button-prev',
          },
      });

      // 신규 디지털문화자원 스와이퍼 초기화
      var swiperNew = new Swiper('#newCltRscList .swiper', {
          // 여기에 스와이퍼 옵션을 설정
          navigation: {
              nextEl: '#newCltRscList .swiper-button-next',
              prevEl: '#newCltRscList .swiper-button-prev',
          },
      });
      var downloadSwiper = new Swiper(".download .swiper", {
        loop: true,
        slidesPerView: 1.375,
        spaceBetween: 25,
        breakpoints: {
          980: { 
            slidesPerView: 4,
            spaceBetween: 40,
          },
        },
      });


      var statusSwiper1 = new Swiper(".status .stauts-swiper1", {
        loop: true,
        slidesPerView: 1,
        spaceBetween: 25,
        pagination: {
            el: ".stauts-swiper1 .swiper-pagination",
            clickable: true,
        },
        // breakpoints: {
        //   980: {
        //     slidesPerView: 4,
        //     spaceBetween: 40,
        //   },
        // },
      });
      var statusSwiper2 = new Swiper(".status .stauts-swiper2", {
        loop: true,
        slidesPerView: 1,
        spaceBetween: 25,
        pagination: {
            el: ".stauts-swiper2 .swiper-pagination",
            clickable: true,
        },
        // breakpoints: {
        //   980: {
        //     slidesPerView: 4,
        //     spaceBetween: 40,
        //   },
        // },
      });
      
      
      $(document).ready(function(){
    	  
    	  //소장기관 검색
    	  $('#srchByInst').click(function() {
   			
    		var srchVal = $('#instSrwd').val();
    		var encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
   			var srchInstId = $("#hdnSrchInstId").val();
   			var queryString = "srchInstId=" + srchInstId +
   		                      "&srchVal=" + encodedSrchVal;
   	    	location.href = "<c:url value='/dgtlcltrsc/srchDgtlCltRsc.do'/>" + "?"+queryString;
   		  
    	  });
    	  
    	  //지역 검색
    	  $('#srchByRgn').click(function() {
   			
    		var srchVal = $('#rgnSrwd').val();
    		var encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
   			var srchRgnCd = $('#hdnSrchRgnCd').val();
   			var queryString = "srchRgnCd=" + srchRgnCd +
   		                      "&srchVal=" + encodedSrchVal;
   	    	location.href = "<c:url value='/dgtlcltrsc/srchDgtlCltRsc.do'/>" +  "?"+queryString;
   		  });
    	  
    	  //문화자원별 검색
    	  $('#srchByContsType').click(function() {
   			
    		var srchVal = $('#contsTypeSrwd').val();
    		var encodedSrchVal = encodeURIComponent(srchVal); // 검색어 URL 인코딩
    		var srchContsTypeCtgryIdArr = []; //컨텐츠유형 
    	       $('input[name="srchContsTypeCtgryIdArr"]:checked').each(function() {
    	    	   srchContsTypeCtgryIdArr.push($(this).val());
    	       });
    		var queryString = "srchContsTypeCtgryIdArr=" + srchContsTypeCtgryIdArr+
   		                      "&srchVal=" + encodedSrchVal;
   	    	location.href = "<c:url value='/dgtlcltrsc/srchDgtlCltRsc.do'/>" + "?"+queryString;
   		  });
    	
    	  // 지역 Selectmenu 생성
    	  $('#srchRgnCd').selectmenu();
	      // Selectmenu의 selectmenuchange 이벤트에 대한 핸들러 등록
  		  $('#srchRgnCd').on('selectmenuchange', function(event, ui) {
		        $('#hdnSrchRgnCd').val($(this).val());
  		  });   
	          
  		  // 기관 Selectmenu 생성
	      $('#srchInstId').selectmenu();
          // Selectmenu의 selectmenuchange 이벤트에 대한 핸들러 등록
		  $('#srchInstId').on('selectmenuchange', function(event, ui) {
		        $('#hdnSrchInstId').val($(this).val());
		  });
          
          //드래그
		  funSwipeDragStop();  
          //연관자원 없으면 태그 전체 숨기기
		  funRelDivShow();
          //카운트 애니메이션
          funCounter();
		  
      });

      function funCounter() {
        const counters = document.querySelectorAll('strong.counter');
        let observer;

        const animateCount = (counter) => {
          const target = +counter.dataset.target;
          let current = 0;
          const step = target / 200;

          const updateCount = () => {
            current += step;
            if (current < target) {
              counter.innerText = '(' + Math.ceil(current).toLocaleString() + ')';
              requestAnimationFrame(updateCount);
            } else {
              counter.innerText = '(' + target.toLocaleString() + ')';
            }
          };

          updateCount();
        };

        const onEntry = (entries, observer) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              animateCount(entry.target);
              observer.unobserve(entry.target); // 요소가 한 번 애니메이션을 실행한 후 다시 감지하지 않도록 observer에서 제거
            }
          });
        };

        if ('IntersectionObserver' in window) {
          observer = new IntersectionObserver(onEntry, {
            threshold: 0.5 // 50% 이상 보일 때 애니메이션 시작
          });

          counters.forEach(counter => {
            observer.observe(counter); // 각 카운터를 observer에 등록
          });
        } else {
          // Fallback for browsers that don't support IntersectionObserver
          // 모든 카운터에 대해 바로 애니메이션을 실행
          counters.forEach(animateCount);
        }
      }
      
      //연관자원 없으면 태그 전체 숨기기
      function funRelDivShow(){
    	  var totalVisibleSlides = 0;
          var slides = associateSwiper.slides;
          for (var i = 0; i < slides.length; i++) {
              if (slides[i].style.display != "none") {
                  totalVisibleSlides++;
              }
          }
          if(totalVisibleSlides == 0){
          	$('#relDiv').hide();
          }else{
          	$('#relDiv').show();
          }
      }
      
      //미리보기
      function funPrvw(clrcsId,ctgryId,index){
      	$('#prvwImg'+index).hide();
        $('#3dBtn'+index).hide();
        $('#backBtn'+index).show();
        //미디어 실행
    	fncShowConts(clrcsId, '', ctgryId, 'rscConts'+index);
      }
      
      //돌아가기
      function funBackPrvw(ctgryId, index){
      	$('#prvwImg'+index).show();
        $('#3dBtn'+index).show();
        $('#backBtn'+index).hide();
        
        if(ctgryId == 'D01'){
        	$('#rscConts'+index).find('canvas').remove();//3d 캔버스 제거
        }else if(ctgryId == 'D02'){
        	$('#rscConts'+index).find('video').remove();//비디오 제거	
        	$('#rscConts'+index).removeAttr('style');//비디오관련 클래스 제거
            $('#rscConts'+index).css({
              'display': 'flex',
              'justify-content': 'center'
            });
        }else if(ctgryId == 'D03'){
        	$('#rscConts'+index).find('#viewerImg').remove();//이미지 제거
            $('#rscConts'+index).removeAttr('style');//비디오관련 클래스 제거
            $('#rscConts'+index).css({
              'display': 'flex',
              'justify-content': 'center'
            });
        }else if(ctgryId == 'D04'){
        	$('#rscConts'+index).find('canvas').remove();//캔버스 제거
        	$('#rscConts'+index).find('audio').remove();//오디오 제거
            $('#rscConts'+index).removeAttr('style');//비디오관련 클래스 제거
            $('#rscConts'+index).css({
                'display': 'flex',
                'justify-content': 'center'
            });
        }else if(ctgryId == 'D07'){
        	$('#rscConts'+index).find('#viewerImg').remove();//이미지 제거
            $('#rscConts'+index).removeAttr('style');//비디오관련 클래스 제거
            $('#rscConts'+index).css({
              'display': 'flex',
              'justify-content': 'center'
            });
        } else {
        	$('#rscConts'+index).find('#viewerImg').remove();//이미지 제거
            $('#rscConts'+index).removeAttr('style');//비디오관련 클래스 제거
            $('#rscConts'+index).css({
              'display': 'flex',
              'justify-content': 'center'
            });
        }
      } 
      
     //소장기관 라디오 버튼 선택 시
     function funInstTypeClick(radio) {
          var selectedValue = radio.value;
          
          $('#srchInstId').empty();
          
          var instListSelectmenu = $('#srchInstId').data('ui-selectmenu');
          if (instListSelectmenu) {
              $('#srchInstId').selectmenu('destroy').next('.ui-selectmenu-button').remove();
          }
                 
          $('#srchInstId').append("<option value='' selected>해당 기관을 선택해주세요.</option>");
    	  
          $.ajax({
              url: "<c:url value='/cmmn/selectInstInfoList.do'/>",
              type: 'GET',
              data: { instTypeCd: selectedValue },
              success: function(data) {
            	  $.each(data, function(index, option) {
            		  var html = "<option value='"+option.instId+"'>"+option.instNm+"</option>";
            		  $('#srchInstId').append(html);
            	  });
            	  
            	  // 기관 Selectmenu 생성
            	  $('#srchInstId').selectmenu();
	      		   
              },
              error: function() {
                  
              }
          });
      }
     
     //뷰어에 머물면 스와이프의 드래그를 뷰어에게
     function funSwipeDragStop(){
   	    $('.visual').on('mouseover', function(){
		    keyVisual.allowTouchMove = false;
		});
		$('.visual').on('mouseout', function(){
		    keyVisual.allowTouchMove = true;
		});
		$('.visual').on('touchStart', function(){
		    keyVisual.allowTouchMove = false;
		});
	    $('.visual').on('touchEnd', function(){
	        keyVisual.allowTouchMove = true;
		});
     }
    </script>


<script type="importmap">
	{
		"imports": {
			"three" : "<c:url value='/js/lib/three.module.min.js'/>",
			"three/addons/" : "<c:url value='/js/lib/jsm/'/>"
		}
	}
</script>

<script type="module">
    import  * as THREE from 'three';
    import {OrbitControls} from "<c:url value='/js/lib/jsm/controls/OrbitControls.js'/>";

    import {FBXLoader} from "three/addons/loaders/FBXLoader.js";
    import {OBJLoader} from "three/addons/loaders/OBJLoader.js";
    import {GLTFLoader} from "three/addons/loaders/GLTFLoader.js";

    class ThreeDViewer {
      constructor(elementId, clrcsId, prdctSn, fileName,textureFiles) {
        this.container = document.getElementById(elementId);
        this.initScene();
        this.initCamera();
        this.initRenderer();
        this.initControls();
        this.addLights();
        this.setupResizeListener();
        this.loadModels(clrcsId, prdctSn, fileName, textureFiles);
      }

      initScene() {
        this.scene = new THREE.Scene();
        this.scene.background = new THREE.Color(0xdbdbdb);
      }

      initCamera() {
        const width = this.container.clientWidth;
        const height = this.container.clientHeight === 0 ? 600 : this.container.clientHeight;
        this.camera = new THREE.PerspectiveCamera(45, width / height, 1, 10000);
        this.camera.position.set(0, 10, 30);
      }

      initRenderer() {
        this.renderer = new THREE.WebGLRenderer({ antialias: true });
        this.renderer.outputEncoding = THREE.sRGBEncoding;
        this.renderer.setPixelRatio(window.devicePixelRatio);
        this.renderer.setSize(this.container.clientWidth, this.container.clientHeight);
        this.renderer.setClearColor(0xffffff, 1);
        this.container.appendChild(this.renderer.domElement);
      }

      initControls() {
        this.controls = new OrbitControls(this.camera, this.renderer.domElement);
        this.controls.screenSpacePanning = true;
        this.controls.target.set(0, 5, 0);
        this.controls.update();
      }

      addLights() {
        // Lights can be adjusted as needed
        const ambientLight = new THREE.AmbientLight(0xffffff, 1);
        this.scene.add(ambientLight);

        const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
        directionalLight.position.set(0, 200, 0);
        this.scene.add(directionalLight);

        const light2 = new THREE.DirectionalLight( 0xffffff, 1 );
        light2.position.set( 100, 200, 100 );
        this.scene.add( light2 );

        const light3 = new THREE.DirectionalLight( 0xffffff, 1 );
        light3.position.set( - 100, - 200, - 100 );
        this.scene.add( light3 );
      }

      setupResizeListener() {
        window.addEventListener('resize', () => this.onWindowResize(), false);
      }

      onWindowResize() {
        const width = this.container.clientWidth;
        const height = this.container.clientHeight;
        this.camera.aspect = width / height;
        this.camera.updateProjectionMatrix();
        this.renderer.setSize(width, height);
      }

      animate() {
        requestAnimationFrame(() => this.animate());
        this.controls.update();
        this.renderer.render(this.scene, this.camera);
      }

      async loadModels(clrcsId, prdctSn, fileName, textureFiles) {
        await this.modelLoader(clrcsId, prdctSn, textureFiles, fileName);
      }

      async modelLoader(clrcsId, prdctSn, textureFiles, fileName) {
        // 진행율 DIV 추가
        const progressDiv = document.createElement('div');
        progressDiv.id = 'loadingProgress';

        progressDiv.style.width = '100%';
        if(this.container.clientHeight === 0){
          progressDiv.style.height = '686px';
        }else{
          progressDiv.style.height = this.container.clientHeight+'px';
        }
        progressDiv.style.backgroundColor = '#ffffff';
        progressDiv.style.display = 'flex';
        progressDiv.style.flexDirection = 'column';
        progressDiv.style.alignItems = 'center';
        progressDiv.style.justifyContent = 'center';
        progressDiv.style.padding = '20px';
        progressDiv.style.position = 'absolute';
        progressDiv.style.top = '0';
        progressDiv.style.left = '0';
        progressDiv.style.transition = 'opacity 2s, filter 2s';
        progressDiv.style.opacity = '1';
        progressDiv.style.filter = 'none';

        //텍스트 그룹 DIV 추가
        const txtContainerDiv = document.createElement('div');
        txtContainerDiv.style.textAlign = 'center';
        txtContainerDiv.style.marginBottom = '20px';

        //로딩 로고
		const loadingLogoDiv = document.createElement('div');
		loadingLogoDiv.style.width = '16.66667vw';
		loadingLogoDiv.style.height = '2.395834vw';
		loadingLogoDiv.style.backgroundImage = "url('" + cmmnLoadingBgUrl + "') 0 0 no-repeat";
		loadingLogoDiv.style.backgroundSize = '100%';
        loadingLogoDiv.style.marginBottom =  '40px';

		const loadingLogoSpan = document.createElement('span');
		loadingLogoSpan.style.display = 'inline-block';
		loadingLogoSpan.style.height = '100%';
		loadingLogoSpan.style.overflow = 'hidden';
		loadingLogoSpan.style.width = '100%';
	  	loadingLogoSpan.style.opacity = 0;
        loadingLogoSpan.style.transition = 'width 0.5s ease-in-out';

		const loadingLogoImg = document.createElement('img');
		loadingLogoImg.style.height = 'auto';
		loadingLogoImg.src = cmmnLoadingImgUrl;
        loadingLogoSpan.appendChild(loadingLogoImg);

        loadingLogoDiv.appendChild(loadingLogoSpan);

        //로딩 상태
        const loadingTxtDiv = document.createElement('div');
        loadingTxtDiv.style.fontSize = '2em';
        loadingTxtDiv.style.fontWeight = 'bold';
        loadingTxtDiv.style.marginBottom = '0,5em';

        //로딩 파일명
        const fileTxtDiv = document.createElement('div');
        fileTxtDiv.style.fontSize = '1.2em';
        fileTxtDiv.style.color = '#424242'
        txtContainerDiv.appendChild(loadingTxtDiv);
        txtContainerDiv.appendChild(fileTxtDiv);

        const progressContainerDiv = document.createElement('div');
        progressContainerDiv.style.width = '40%';
        progressContainerDiv.style.height = '20px';
        progressContainerDiv.style.borderRadius = '10px';
        progressContainerDiv.style.background = '#ffffff';

        const progressBar = document.createElement('div');
        progressBar.style.width = '40%';
        progressBar.style.height = '100%';
        progressBar.style.backgroundColor = '#0f3e87';
        progressBar.style.width = '0%';
        progressBar.style.borderRadius = '10px';
        progressBar.style.transition = 'width 0.5s ease-in-out';
        progressContainerDiv.appendChild(progressBar);

        // 로딩 정보 표시용 텍스트 요소
        const progressText = document.createElement('div');
        progressText.id = 'loadingText';
        progressText.style.padding = '5px';
        progressText.innerText = 'Loading...';
        //progressDiv.appendChild(progressText);

        progressDiv.appendChild(loadingLogoDiv);
        progressDiv.appendChild(txtContainerDiv);
        progressDiv.appendChild(progressContainerDiv);

        this.container.appendChild(progressDiv);

        var ext = fileName.split('.').pop();
        let loader;

        if(ext === 'fbx'){
          //FBX일 경우 FBX LOADER 호출
          loader = new FBXLoader();
        }else if(ext === 'obj'){
          //OBJ일 경우 OBJ LOADER 호출
          loader = new OBJLoader();
        }else if(ext === 'glb'){
          loader = new GLTFLoader();
        }

        let totalResources = textureFiles.length + 1; // 텍스처 파일 수 + 모델 파일 1개
        let loadedResources = 0;

        const updateTextureProgress = (resourceName) => {
          let overallProgress = (loadedResources / totalResources) * 100;

          //loadingLogoSpan.style.width = overallProgress + '%';
          loadingLogoSpan.style.opacity  = overallProgress / 100;

          progressBar.style.width = overallProgress + '%';
          loadingTxtDiv.innerText = '데이터를 불러오는 중입니다. (' + Math.floor(overallProgress) + '%)';
          fileTxtDiv.innerText = resourceName;
          if (loadedResources === totalResources) {
            if(progressDiv) {
              progressDiv.style.opacity = '0';
              progressDiv.style.filter = 'blur(5px)';
              setTimeout(function (){
                progressDiv.remove();
              }, 2000);
            }
          }
        }

        // fbx모델 Texture 설정
        const textureLoader = new THREE.TextureLoader();
        let baseColorUrl, normalUrl, roughUrl, aoUrl, metaUrl;

        try{
          for (const item of textureFiles) {

            let textureUrl = await getModelResource(item.name, clrcsId, item.prdctSn).then(data => {
              const blob = new Blob([data]);
              return window.URL.createObjectURL(blob);
            });

            textureLoader.load(textureUrl, (texture) => {
              if(item.name.includes('BC')){
                texture.encoding = THREE.sRGBEncoding;
                baseColorUrl = texture;
              } else if (item.name.includes('NM')) {
                normalUrl = texture;
              }else if (item.name.includes('RN')) {
                roughUrl = texture;
              }else if (item.name.includes('AO')) {
                aoUrl = texture;
              }else if (item.name.includes('MT')) {
                metaUrl = texture;
              }

              loadedResources++;
              updateTextureProgress(item.name);
            }, (xhr) => {
              //console.log(item.name+ 'loaded ' +(xhr.loaded / xhr.total) * 100);
            }, (error) => {
              //console.log('Error loading '+ item.name + 'error : '+ error);
            });
          }


          const fbxUrl = await getModelResource(fileName, clrcsId, prdctSn).then(data=>{
            const blob = new Blob([data]);
            return window.URL.createObjectURL(blob);
          });

          const metaMaterial = new THREE.MeshStandardMaterial({
            //reflectivity : 0.5,
            //roughness : 1.0,
            //metalness : 1.0,
            color : 0xffffff,
            map: baseColorUrl,
            normalMap: normalUrl,
            roughnessMap: roughUrl,
            metalnessMap: metaUrl,
            aoMap: aoUrl,
            aoMapIntensity: 1
          });

          if(metaUrl){
            metaMaterial.reflectivity = 0.1;
            metaMaterial.metalness = 1.0;
          }

          if(roughUrl){
            metaMaterial.roughness = 1.0;
          }

          loader.load(fbxUrl,
                  (object) => {
                    object.traverse( child => {
                      if(child.isMesh){
                        child.material = metaMaterial;
                        //child.frustumCulled = false;
                        child.material.needsUpdate = true;
                      }
                    });

                    this.scene.add(object);

                    // 모델의 BoundingBox 계산
                    const box = new THREE.Box3().setFromObject(object);

                    // BoundingBox의 중심을 구함
                    const center = box.getCenter(new THREE.Vector3());

                    // 카메라의 OrbitControls 타겟을 설정
                    this.controls.target.copy(center);
                    this.controls.update();

                    //카메라를 조정하여 모델이 잘 보이도록 설정
                    const size = box.getSize(new THREE.Vector3());
                    const maxDim = Math.max(size.x, size.y, size.z);
                    let cameraZ = maxDim * 2; // 카메라와 모델의 거리를 모델의 크기에 따라 조정
                    const cameraY = center.y + maxDim;
                    this.camera.position.set(center.x, cameraY, cameraZ);
                    this.camera.lookAt(center); // 카메라가 모델 중심을 바라보도록 설정

                    // 카메라 near/far 클리핑 평면을 조정
                    this.camera.near = maxDim / 100;
                    this.camera.far = maxDim * 100;
                    this.camera.updateProjectionMatrix();

                    loadedResources++;
                    updateTextureProgress(fileName);

                  },
                  (xhr) => {
                    //console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
                  }, (error) => {

                  }
          );
        }catch (error){
          console.error('An error occurred during model loading:', error);
        }
      }

      // getModelResource method will be similar, but adapted for use within the class

    }
    const getModelResource = await function (fileName, clrcsId, prdctSn){


      return fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          clrcsId: clrcsId,
          type: 'selectOne',
          prdctSn: prdctSn
        })

      }).then(response => {
        const contentLength = response.headers.get('Content-Length');
        if (!contentLength) {
          throw new Error('Content-Length header is missing');
        }

        const total = parseInt(contentLength, 10);
        let loaded = 0;

        const contentDisposition = response.headers.get('Content-Disposition');
        if(contentDisposition){
          const fileNameMatch = contentDisposition.match(/filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/);
          if (fileNameMatch.length > 1) {
            fileName = fileNameMatch[1].replace(/['"]/g, '');
          }
        }

        return new Response(
                new ReadableStream({
                  start(controller) {
                    const reader = response.body.getReader();
                    read();
                    function read() {
                      reader.read().then(({ done, value }) => {
                        if (done) {
                          controller.close();
                          return;
                        }

                        loaded += value.byteLength;
                        //updateProgress(loaded, total);
                        controller.enqueue(value);
                        read();
                      }).catch(error => {
                        console.error('Download failed:', error);
                        controller.error(error);
                      });
                    }
                  }
                })
        );
      })
              .then(response => response.blob())
              .catch(error => {
                console.error('Download failed:', error);
                return null;
              });
    }

    window.ThreeDViewer = ThreeDViewer;
</script>
