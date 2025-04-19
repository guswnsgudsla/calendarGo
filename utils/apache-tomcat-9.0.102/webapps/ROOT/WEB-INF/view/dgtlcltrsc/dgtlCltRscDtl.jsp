<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- container(S) -->
    <section class="container">
      <header>
        <div class="inner">
          <h2>디지털문화자원</h2>
          <div class="breadcrumbs">
            <a href="<c:url value="/index.do"/>">메인</a>
            <span>디지털문화자원</span>
            <span>자원별 보기</span>
          </div>
        </div>
      </header>
      <section id="contents" class="contents resource">
        <div class="inner">
    
          <div class="detail-wrap">
            <div class="detail-cont cont-bg">
              <div class="item-box">
                <div class="item" id="rscDtlConts" style="display: flex; justify-content: center">
                	<c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
                  		<c:param name="filePath" value="${dgtlClrcsRscDtl.rprsImgFileStrgPathNm}" />
                  		<c:param name="fileNm" value="${dgtlClrcsRscDtl.rprsImgStrgFileNm}" />
                  		<c:param name="dataCtgryId" value="${dgtlClrcsRscDtl.dataTypeRootCtgryId}" />
			      	</c:url>		                  	
                  <img id="prvwImg" src="${rprsImgUrl}" alt="" style="display:flex;" title="<c:out value='${dgtlClrcsRscDtl.clrcsNm}'/>"/>
                  <c:if test="${dgtlClrcsRscDtl.dataTypeRootCtgryId eq 'D01' or dgtlClrcsRscDtl.dataTypeRootCtgryId eq 'D02' or dgtlClrcsRscDtl.dataTypeRootCtgryId eq 'D04'}">
                    <button id="3dBtn" type="button" class="btns" onClick="funPrvw()">미리보기</button>
                    <button id="backBtn" type="button" class="btns" style="display:none" onClick="funBackPrvw()">돌아가기</button>
                  </c:if> 
                </div>
                <div class="count">
                  <span class="view"><fmt:formatNumber value='${dgtlClrcsRscDtl.inqCnt}' pattern="#,###" /></span>
                  <span class="download"><fmt:formatNumber value='${dgtlClrcsRscDtl.dwnldCnt}' pattern="#,###" /></span>
                  <span class="like" id="likeCnt"><fmt:formatNumber value='${dgtlClrcsRscDtl.rcmdtnCnt}' pattern="#,###" /></span>
                </div>
            
              </div>
              <div class="info">
                <div class="title">
                  <div class="tag-wrap">
                    <span class="tag color-green"><c:out value='${dgtlClrcsRscDtl.dataTypeRootCtgryNm}'/></span>
                    <span class="tag brd-color-blue"><c:out value='${dgtlClrcsRscDtl.instNm}'/></span>
                  </div>
                  <strong><c:out value='${dgtlClrcsRscDtl.clrcsNm}'/></strong>
                  <button type="button" class="btns size-s color-skyblue btn-like <c:if test="${dgtlClrcsRscDtl.rcmdtnYn eq 'Y'}">active</c:if>" 
                  onClick="funScrapDgtlCltRscInfo(this,'<c:out value='${dgtlClrcsRscDtl.clrcsId}'/>')">좋아요</button>
             <c:choose>
			    <c:when test="${dgtlClrcsRscDtl.dwnldAplcnYn eq 'N'}">
                  <button type="button" class="btns size-s color-primary btn-download" onclick="alert('담당자에게 문의하시기 바랍니다.'); return false;">문의하기</button>
	            </c:when>
				<c:otherwise>
                  <button type="button" class="btns size-s color-primary btn-download" onclick="fncDwnldNotePopup('<c:out value='${dgtlClrcsRscDtl.clrcsId}'/>');">다운로드</button>
				</c:otherwise>
             </c:choose>
                </div>
                <div class="box">
                <c:if test="${not empty clrcsTagInfoList}">
	                <div class="tag-wrap">
		                <c:forEach var="tagRow" items="${clrcsTagInfoList}">
		                	<span class="tag color-gray" style="cursor:pointer" onclick="funSrchPageWithTag('<c:out value="${tagRow.tagNm}"/>')">#<c:out value='${tagRow.tagNm}'/></span>
		                </c:forEach>
	                </div>
                </c:if>
                <div class="subsection">
                <dl>
                  <dt>데이터 유형</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.dataTypeCtgryNm}'/></dd>
                  <dt>공통분류</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.contsTypeCtgryNm}'/></dd>
                  <dt>서비스 유형</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.srvcTypeCtgryNm}'/></dd>
                  <dt>산업 유형</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.indrTypeCtgryNm}'/></dd>
                </dl>
                <dl>
                  <dt>기관별분류</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.instCtgryNm}'/></dd>
                  <dt>국가/시대</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.ntnTageTypeCtgryNm}'/></dd>
                  <dt>재질</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.mtrTypeCtgryNm}'/></dd>
                  <dt>최신 등록일</dt>
                  <dd><c:out value='${dgtlClrcsRscDtl.lastMdfcnDt}'/></dd>
                </dl>
                </div>
                </div>
              </div>
              <div class="tab-wrap type02 as-tab-wrap" id="scrlTop">
                <ul class="tab-menu flexible">
                  <li><a href="#">개요</a></li>
                  <li><a href="#">패키지 콘텐츠</a></li>
                  <li><a href="#">출처표기</a></li>
                  <!--  
                  <li><a href="#">리뷰</a></li>
                  <li><a href="#">Q&A</a></li>
                  -->
                  <li><a href="#">유의사항</a></li>
                </ul>
                <div class="inner-depth">
                  <!-- 개요 -->
                  <div class="tab-inner">
                    <ul class="summary">
                      <li>
                        <em>소장기관 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.instNm}'/></p>
                      </li>
                      <li>
                        <em>명칭 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.clrcsNm}'/></p>
                      </li>
                      <c:if test="${dgtlClrcsRscDtl.clrcsSbttl ne null && dgtlClrcsRscDtl.clrcsSbttl ne '' }">
                      <li>
                        <em>다른명칭 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.clrcsSbttl}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.clrcsSz ne null && dgtlClrcsRscDtl.clrcsSz ne '' }">
                      <li>
                        <em>크기 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.clrcsSz}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.instItslMngNo ne null && dgtlClrcsRscDtl.instItslMngNo ne '' }">
                      <li>
                        <em>기관자체관리번호 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.instItslMngNo}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.wriNm ne null && dgtlClrcsRscDtl.wriNm ne '' }">
                      <li>
                        <em>작가 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.wriNm}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.fdspNm ne null && dgtlClrcsRscDtl.fdspNm ne '' }">
                      <li>
                        <em>출토지 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.fdspNm}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.dspyNm ne null && dgtlClrcsRscDtl.dspyNm ne '' }">
                      <li>
                        <em>전시명 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.dspyNm}'/></p>
                      </li>
                      </c:if>
                      <c:if test="${dgtlClrcsRscDtl.dspyPlcNm ne null && dgtlClrcsRscDtl.dspyPlcNm ne '' }">
                      <li>
                        <em>전시장소 : </em>
                        <p><c:out value='${dgtlClrcsRscDtl.dspyPlcNm}'/></p>
                      </li>
                      </c:if>
                      <li>
                        <em>설명 : </em>
                        <p class="normal">
		                    <c:set var="clrcsExpln" value="${pf:nl2br(dgtlClrcsRscDtl.clrcsExpln)}" />
		   					<c:out value="${clrcsExpln}" escapeXml="false"/>
                        </p>
                      </li>
                      <c:if test="${dgtlClrcsRscDtl.clrcsAnxtExpln ne null && dgtlClrcsRscDtl.clrcsAnxtExpln ne '' }">
                      <li>
                        <em>부가설명 : </em>
                        <p class="normal">
		                    <c:set var="clrcsAnxtExpln" value="${pf:nl2br(dgtlClrcsRscDtl.clrcsAnxtExpln)}" />
		   					<c:out value="${clrcsAnxtExpln}" escapeXml="false"/>
                        </p>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                  <!-- //개요 -->
                  <!-- 패키지 콘텐츠 -->
                  <div class="tab-inner">
                  <div class="contents-wrap">
                    <div class="contents-list">
                      <strong>최종 산출물 (
                      <c:set var="finalPrdctCount" value="0" />
					  <c:forEach var="finalPrdctRow" items="${dgtlClrcsPrdctFileFinalInfoList}">
					    <c:choose>
					      <c:when test="${finalPrdctRow.fileType eq 'FL'}">
					        <c:set var="finalPrdctCount" value="${finalPrdctCount + 1}" />
					      </c:when>
					    </c:choose>
					  </c:forEach>
					  <c:out value="${finalPrdctCount}"/>
                      )</strong>
                      <ul>
                      <c:forEach var="finalPrdctRow" items="${dgtlClrcsPrdctFileFinalInfoList}">
	                        <c:choose>
							    <c:when test="${finalPrdctRow.fileType eq 'DR'}">
							    	<li><c:forEach begin="2" end="${finalPrdctRow.lvl}">
							                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							            </c:forEach>
							    	<p class="folder"><c:out value='${finalPrdctRow.prdctNm}'/></p>
				                    <c:if test="${dgtlClrcsRscDtl.dataTypeRootCtgryId eq 'D01'}">
				                    <c:choose>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'FBX'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.fbx : "Filmbox"의 약어로, Autodesk가 개발한 파일 형식의 확장자입니다. 
					                    	이 형식은 주로 3D 모델 및 애니메이션 데이터를 저장하고 교환하기 위해 사용됩니다. 
					                    	게임엔진 사용시 가장 보편적으로 불러들이는 지오메트리이며, 해당 확장자 내에 머터리얼을 
					                    	포함하는 경우와 순수 지오메트리만 있는 경우로 구분됩니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'OBJ'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.obj : Wavefront Object 파일 형식의 확장자로, 3D 모델의 기하학적 구조와 관련된 
					                    	데이터를 저장하는 데 사용됩니다. Wavefront Technologies가 개발한 이 형식은 간단하고 
					                    	텍스트 기반으로, 여러 3D 모델링 소프트웨어 간에 모델을 교환하는 데 널리 사용됩니다. 
					                    	fbx와 더불어 대중적으로 널리 사용되는 포맷입니다.  
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'STL'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.stl : "Stereolithography"의 약어로, 3D 컴퓨터 그래픽스 및 3D 프린팅에서 사용되는 
					                    	파일 형식의 확장자입니다. .stl 파일은 3D 모델의 표면을 삼각형 폴리곤으로 나타내며, 주로 3D 프린터가 
					                    	이해하고 처리할 수 있는 형식으로 사용됩니다. 별도의 텍스쳐 맵핑에 대한 정보가 존재하지 않습니다. 
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'PLY'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.ply : Polygon File Format의 약어로, 3D 그래픽스 및 3D 모델링 소프트웨어에서 사용되는 파일 형식의 
					                    	확장자입니다. .ply 파일은 다양한 3D 모델의 기하학적 구조와 색상 정보를 저장하는 데 사용됩니다. 
					                    	주로 포인트클라우드 정보의 제공에 자주 사용되며, 텍스쳐 대신 각 포인트마다 색상값을 부여한 데이터로 어느정도의 컬러가 
					                    	담긴 객체 확인이 가능합니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'TEXTURE'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	_BC(BaseColor) : 광원의 영향을 끼치지 않는 객체 본연 그대로의 무늬를 의미합니다. 모든 디지털 문화자산은 
					                    	특유의 기본 텍스쳐를 보유합니다 유사한 데이터로 Albedo, Diffuse 도 적용 가능합니다. 
					                    	</p>
					                    	<p>
					                    	_MT(Metalness) : 재질의 금속성이 있는 부분과 없는 부분을 구분하는 텍스쳐 입니다. 금속의 재질감이 있거나 
					                    	혼재되어있는 디지털 문화자산을 실감있게 표현하는 데 사용됩니다.
					                    	</p>
					                    	<p>
					                    	_RN(Roughness) : 대상의 재질이 반사값의 편차가 크거나, 데칼 등으로 표현하지 않은 스크래치를 재현하기 위해 
					                    	사용될 수 있습니다. 불상 등과 같이 노후된 금속재를 표현해야 하는 디지털 문화자산에 유용합니다.
					                    	</p>
					                    	<p>
					                    	_AO(Ambient Occlusion) : 디지털 문화자산이 WebGL과 같이 실시간 트레이싱이 아닌 랜더링의 경우, 
					                    	객체의 굴곡상 항시 당연하게 표시되는 음영값을 미리 계산하여 재질용 텍스쳐에 반영합니다. 유리재질을 제외하고, 완
					                    	벽한 반사율을 가진 재질을 제외한 모든 디지털 문화자산을 표현하는 데 필요합니다.
					                    	</p>
					                    	<p>
					                    	_NM(Normal) : 경량화 과정에서 소멸된 지오메트리를 실시간 랜더링상에서 실제 재질과 유사하게 복원해주는 
					                    	텍스쳐 입니다.경량화된 모든 객체에 필요한 텍스쳐이며, 범프(Bump)맵이 적용되는 경우도 있습니다. 
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'SPP'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.spp(Substance Painter) : 대상의 재질감이 충실한 실감형 에셋을 생성하기 위해 재질텍스쳐의 맵핑 및 
					                    	새로운 재질을 창조하는 데 사용했던 파일 원본입니다. 기본 객체 지오메트리,완성된 머터리얼 텍스쳐 및 해당 SW에서 
					                    	지원되는 머터리얼 목록이 포함되어 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'GLTF'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.gltf(GL Transmission Format) : Khronos Group에서 개발한 것으로, WebGL을 비롯한 여러 그래픽 
					                    	애플리케이션에서 3D 콘텐츠를 효과적으로 전송하고 로드하기 위한 목적으로 설계되었습니다. 높은 압축률과 물리기반 
					                    	랜더링 지원으로 웹에서 서비스되는 많은 실감데이터가 해당 확장자로 로드되어 표출되고 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'GLB'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.glb : "GL Transmission Format Binary file"의 약자인 GLB 파일(.glb)은 3D 데이터를 공유하는 데 
					                    	사용되는 표준화된 파일 형식입니다. 정확하게는 3D 모델, 장면, 모델, 조명, 재료, 노드 계층 및 애니메이션에 대한 
					                    	정보를 포함할 수 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(finalPrdctRow.prdctNm) eq 'OFF'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.off : "Object File Format"의 약자인 OFF 파일(.off)은 기하학적 객체를 구성하는 다각형에 대한 설명이 
					                    	포함된 기하학적 정의 파일 형식입니다. 2D 또는 3D 개체를 저장할 수 있으며 간단한 확장을 통해 고차원 개체도 
					                    	표현할 수 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
				                    </c:choose>
				                    </c:if>
				                   </li>
								</c:when>
						    <c:otherwise>
						        <li><c:forEach begin="2" end="${finalPrdctRow.lvl}">
						                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            </c:forEach>
						        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        <a href="javascript:funPrdctPrvw('<c:out value='${finalPrdctRow.prdctSn}'/>')">
						        <p><c:out value='${finalPrdctRow.prdctNm}'/></p>
						        </a>
                		        </li>
						    </c:otherwise>
					        </c:choose>
                        </c:forEach>
                      </ul>
                      
                      <br>
                      <strong>단계 산출물 (
                      <c:set var="stepPrdctCount" value="0" />
					  <c:forEach var="stepPrdctRow" items="${dgtlClrcsPrdctFileStepInfoList}">
					    <c:choose>
					      <c:when test="${stepPrdctRow.fileType eq 'FL'}">
					        <c:set var="stepPrdctCount" value="${stepPrdctCount + 1}" />
					      </c:when>
					    </c:choose>
					  </c:forEach>
					  <c:out value="${stepPrdctCount}"/>
                      )</strong>
                      
                      <ul>
                      <c:forEach var="stepPrdctRow" items="${dgtlClrcsPrdctFileStepInfoList}">
	                        <c:choose>
							    <c:when test="${stepPrdctRow.fileType eq 'DR'}">
							    	<li><c:forEach begin="2" end="${stepPrdctRow.lvl}">
							                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							            </c:forEach>
							    	<p class="folder"><c:out value='${stepPrdctRow.prdctNm}'/></p>
				                    <c:if test="${dgtlClrcsRscDtl.dataTypeRootCtgryId eq 'D01'}">
				                    <c:choose>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'FBX'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.fbx : "Filmbox"의 약어로, Autodesk가 개발한 파일 형식의 확장자입니다. 
					                    	이 형식은 주로 3D 모델 및 애니메이션 데이터를 저장하고 교환하기 위해 사용됩니다. 
					                    	게임엔진 사용시 가장 보편적으로 불러들이는 지오메트리이며, 해당 확장자 내에 머터리얼을 
					                    	포함하는 경우와 순수 지오메트리만 있는 경우로 구분됩니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'OBJ'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.obj : Wavefront Object 파일 형식의 확장자로, 3D 모델의 기하학적 구조와 관련된 
					                    	데이터를 저장하는 데 사용됩니다. Wavefront Technologies가 개발한 이 형식은 간단하고 
					                    	텍스트 기반으로, 여러 3D 모델링 소프트웨어 간에 모델을 교환하는 데 널리 사용됩니다. 
					                    	fbx와 더불어 대중적으로 널리 사용되는 포맷입니다.  
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'STL'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.stl : "Stereolithography"의 약어로, 3D 컴퓨터 그래픽스 및 3D 프린팅에서 사용되는 
					                    	파일 형식의 확장자입니다. .stl 파일은 3D 모델의 표면을 삼각형 폴리곤으로 나타내며, 주로 3D 프린터가 
					                    	이해하고 처리할 수 있는 형식으로 사용됩니다. 별도의 텍스쳐 맵핑에 대한 정보가 존재하지 않습니다. 
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'PLY'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.ply : Polygon File Format의 약어로, 3D 그래픽스 및 3D 모델링 소프트웨어에서 사용되는 파일 형식의 
					                    	확장자입니다. .ply 파일은 다양한 3D 모델의 기하학적 구조와 색상 정보를 저장하는 데 사용됩니다. 
					                    	주로 포인트클라우드 정보의 제공에 자주 사용되며, 텍스쳐 대신 각 포인트마다 색상값을 부여한 데이터로 어느정도의 컬러가 
					                    	담긴 객체 확인이 가능합니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'TEXTURE'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	_BC(BaseColor) : 광원의 영향을 끼치지 않는 객체 본연 그대로의 무늬를 의미합니다. 모든 디지털 문화자산은 
					                    	특유의 기본 텍스쳐를 보유합니다 유사한 데이터로 Albedo, Diffuse 도 적용 가능합니다. 
					                    	</p>
					                    	<p>
					                    	_MT(Metalness) : 재질의 금속성이 있는 부분과 없는 부분을 구분하는 텍스쳐 입니다. 금속의 재질감이 있거나 
					                    	혼재되어있는 디지털 문화자산을 실감있게 표현하는 데 사용됩니다.
					                    	</p>
					                    	<p>
					                    	_RN(Roughness) : 대상의 재질이 반사값의 편차가 크거나, 데칼 등으로 표현하지 않은 스크래치를 재현하기 위해 
					                    	사용될 수 있습니다. 불상 등과 같이 노후된 금속재를 표현해야 하는 디지털 문화자산에 유용합니다.
					                    	</p>
					                    	<p>
					                    	_AO(Ambient Occlusion) : 디지털 문화자산이 WebGL과 같이 실시간 트레이싱이 아닌 랜더링의 경우, 
					                    	객체의 굴곡상 항시 당연하게 표시되는 음영값을 미리 계산하여 재질용 텍스쳐에 반영합니다. 유리재질을 제외하고, 완
					                    	벽한 반사율을 가진 재질을 제외한 모든 디지털 문화자산을 표현하는 데 필요합니다.
					                    	</p>
					                    	<p>
					                    	_NM(Normal) : 경량화 과정에서 소멸된 지오메트리를 실시간 랜더링상에서 실제 재질과 유사하게 복원해주는 
					                    	텍스쳐 입니다.경량화된 모든 객체에 필요한 텍스쳐이며, 범프(Bump)맵이 적용되는 경우도 있습니다. 
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'SPP'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.spp(Substance Painter) : 대상의 재질감이 충실한 실감형 에셋을 생성하기 위해 재질텍스쳐의 맵핑 및 
					                    	새로운 재질을 창조하는 데 사용했던 파일 원본입니다. 기본 객체 지오메트리,완성된 머터리얼 텍스쳐 및 해당 SW에서 
					                    	지원되는 머터리얼 목록이 포함되어 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'GLTF'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.gltf(GL Transmission Format) : Khronos Group에서 개발한 것으로, WebGL을 비롯한 여러 그래픽 
					                    	애플리케이션에서 3D 콘텐츠를 효과적으로 전송하고 로드하기 위한 목적으로 설계되었습니다. 높은 압축률과 물리기반 
					                    	랜더링 지원으로 웹에서 서비스되는 많은 실감데이터가 해당 확장자로 로드되어 표출되고 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'GLB'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.glb : "GL Transmission Format Binary file"의 약자인 GLB 파일(.glb)은 3D 데이터를 공유하는 데 
					                    	사용되는 표준화된 파일 형식입니다. 정확하게는 3D 모델, 장면, 모델, 조명, 재료, 노드 계층 및 애니메이션에 대한 
					                    	정보를 포함할 수 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
					                    <c:when test="${fn:toUpperCase(stepPrdctRow.prdctNm) eq 'OFF'}">
								    	<button type="button" class="tooltip"><span class="tooltiptxt">툴팁보기</span></button>
					                    <div role="tooltip" style="max-width:39.5834vw;">
					                    	<p>
					                    	.off : "Object File Format"의 약자인 OFF 파일(.off)은 기하학적 객체를 구성하는 다각형에 대한 설명이 
					                    	포함된 기하학적 정의 파일 형식입니다. 2D 또는 3D 개체를 저장할 수 있으며 간단한 확장을 통해 고차원 개체도 
					                    	표현할 수 있습니다.
					                    	</p>
					                    </div>
					                    </c:when>
				                    </c:choose>
				                    </c:if>
							    	</li>
								</c:when>
						    <c:otherwise>
						        <li><c:forEach begin="2" end="${stepPrdctRow.lvl}">
						                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            </c:forEach>
						            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        <a href="javascript:funPrdctPrvw('<c:out value='${stepPrdctRow.prdctSn}'/>')">
						        <p><c:out value='${stepPrdctRow.prdctNm}'/></p>
						        </a>
						        </li>
						    </c:otherwise>
					        </c:choose>
                        </c:forEach>
                      </ul>
                                            
                    </div>
                    <br />
                    <div class="contents-view" id="contsView" style="position: relative">
                    </div>
                  </div>
                  </div>
                  <!-- //패키지 콘텐츠 -->
                  <!-- 출처표기 -->
                  <div class="tab-inner">
                    <div class="source-info">
                      <h3>
                        공공누리의 제 1유형
                        <img
                          src="<c:url value='/assets/images/logo_open.png'/>"
                          alt="공공누리 OPEN로고"
                        />
                      </h3>
                      <p>
                        제 1유형: 출처표시<br />상업적, 비상업적 이용가능<br />변형
                        등 2차적 저작물 작성 가능
                      </p>
                      <span class="noti"
                        >※ 주의 : 기관사용자는 공공누리 유형마크를 내려받기 후
                        사용시 지정된 유형마크 파일명 변경을 금지</span
                      >
                      <strong class="title"
                        >공공누리의 제 1유형 개별조건</strong
                      >
                      <div class="source-indicator">
                        <i
                          ><img
                            src="<c:url value='/assets/images/mask_source.png'/>"
                            alt="출처표시 로고"
                        /></i>
                        <strong>출처표시</strong>
                        <p>저작물의 출처를 표시해야 됩니다.</p>
                        <div>
                          이용자는 공공저작물을 이용할 경우, 다음과 같이 출처
                          또는 저작권자를 표시해야 합니다. ex) "본 저작물은
                          'OOO(기관명)'에서 'OO년' 작성하여 공공누리
                          제O유형으로 개방한 '저작물명(작성자:OOO)'을
                          이용하였으며, 해당 저작물은 'OOO(기관명), OOO(누리집
                          주소)'에서 무료로 내려받으실 수 있습니다.”
                        </div>
                      </div>
                      <span class="noti"
                        >* 위 내용은 예시이므로 작성연도 및 해당 기관명과
                        누리집 주소, 작성자명 기입 온라인에서 출처 웹사이트에
                        대한 하이퍼링크를 제공하는 것이 가능한 경우에는 링크를
                        제공하여야 합니다. 이용자는 공공기관이 이용자를
                        후원한다거나 공공기관과 이용자가 특수한 관계에 있는
                        것처럼 제3자가 오인하게 하는 표시를 해서는
                        안됩니다.</span
                      >
                    </div>
                  </div>
                  <!-- //출처표기 -->
                  <!-- 리뷰 -->
                  <!--  
                  <div class="tab-inner">
                      
                      <div class="comment-write">
                      <strong>
                      <c:choose>
						  <c:when test="${empty loginId}">
						      <u>댓글 작성 시 로그인이 필요합니다.</u>
						  </c:when>
						  <c:otherwise>
						  </c:otherwise>
					  </c:choose>
                      </strong>
                      <c:if test='${not empty loginId}'>
                      <div class="write">
                          <fieldset>
                            <input type="radio" name="rtngScr" value="5" id="rtngScr5"/><label for="rtngScr5">★</label>
                            <input type="radio" name="rtngScr" value="4" id="rtngScr4"/><label for="rtngScr4">★</label>
                            <input type="radio" name="rtngScr" value="3" id="rtngScr3"/><label for="rtngScr3">★</label>
                            <input type="radio" name="rtngScr" value="2" id="rtngScr2"/><label for="rtngScr2">★</label>
                            <input type="radio" name="rtngScr" value="1" id="rtngScr1"/><label for="rtngScr1">★</label>
                          </fieldset>
                          <div class="fm-focus fm-textarea">
                            <textarea type="text" id="pstCn" name="pstCn" placeholder="댓글을 남겨주세요."></textarea>
                          </div>
                          <button type="button" class="btns color-primary" onClick="funRegRv()">
                            등록
                          </button>
                      </div>
                      </c:if>
                    </div>
                    <div class="review-list" id="rvList">
                    </div>
                  </div>
                  -->
                  <!-- //리뷰 -->
                  
                  <!-- Q&A -->
                  <!--  
                  <div class="tab-inner">
                  <div class="comment-write">
                      <strong>
                      <c:choose>
						  <c:when test="${empty loginId}">
						      <u>질문 작성 시 로그인이 필요합니다.</u>
						  </c:when>
						  <c:otherwise>
						  </c:otherwise>
					  </c:choose>
                      </strong>
                      <c:if test='${not empty loginId}'>
                      <div class="write">
                          <div class="fm-focus fm-textarea">
                            <textarea type="text" id="qnaPstCn" name="qnaPstCn" placeholder="질문을 등록해주세요."></textarea>
                          </div>
                          <button type="button" class="btns color-primary" onClick="funRegQna()">
                            등록
                          </button>
                      </div>
                      </c:if>
                    </div>
                    <div class="qna-list" id="qnaList">
                    </div>
                  </div>
                  -->
                  <!-- //Q&A -->
                  <!-- 유의사항 -->
                  <div class="tab-inner">
                    <ul class="note">
                      <li>
                        <strong>이용자가 가지는 권리</strong>
                        <ul>
                          <li>
                            1. 온·오프라인 상에 공유 및 이용 : 온·오프라인을
                            통하여 공유 및 이용 가능
                          </li>
                          <li>
                            2. 저작물 변경 : 2차적 저작물로 변경하여 이용 가능
                          </li>
                          <li>
                            3. 이 저작물은 영리 목적으로 이용할 수 있습니다.
                          </li>
                        </ul>
                        <strong>저작물 사용 조건</strong>
                        <p>
                          - 출처 표시 : 저작물의 출처를 표시하셔야 합니다.<br />❖
                          공공기관이 후원 한다고 하거나 공공기관과 특수한
                          관계에 있는 것처럼 제 3자가 오인하게 하는 표시를
                          해서는 안됩니다.
                        </p>
                        <strong>알아야 할 사항</strong>
                        <ul>
                          <li>
                            I. 이용조건의 표시 및 변경
                            <ul>
                              <li>
                                1. 이용자가 공공누리 저작물 활용 시 출처표시를
                                꼭 해 주셔야 합니다.
                              </li>
                              <li>
                                2. 공공누리 저작물의 이용조건은 변경될 수
                                있습니다.<br />다만 이용자가 이용조건 변경 전
                                사용하셨다면 해당저작물 한해 용도변경 없이
                                계속 이용할 수 있습니다.
                              </li>
                            </ul>
                          </li>
                          <li>
                            II. 이용조건의 위반
                            <ul>
                              <li>
                                1. 이용자가 공공누리 이용조건을 위반할 경우 그
                                즉시 이용허락이 종료됩니다.
                              </li>
                              <li>
                                2. 이용자가 이용조건 위반 후 지속적으로
                                공공저작물을 이용할 경우 저작권 침해가
                                성립되므로 형사상, 민사상 책임을 부담 하실 수
                                있습니다.
                              </li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <!-- //유의사항 -->
                </div>
              </div>
            </div>
            <div class="detail-list cont-bg">
              <div>
                <h3>관련 컬렉션 보기</h3>
                <c:if test="${empty relatedClctList}">
				<div class="text-cont">
				조회된 데이터가 없습니다.
				</div>
				</c:if>
                <ul class="list-collection">
                  <c:forEach var="row" items="${relatedClctList}"> 
                  <li>
                    <a href="javascript:fncSelectClctDtl('<c:out value='${row.exbiId}'/>')" class="btn-detail">상세보기</a>
                    <div class="img">
                    <c:forEach var="imgRow" items="${row.rprsImgList}">
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
				           <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${filePath}&fileNm=${fileNm}&dataCtgryId=${dataCtgryId}'/>" alt=""> 
				      	</c:if>
				      </c:forEach>          
				    </div>
                    <p>
                      <strong><c:out value='${row.exbiNm}'/></strong>
                    </p>
                    <!-- <div class="dim">
                      <button type="button" class="btns color-primary btn-preview" onclick="fncClctPreviewPopup('<c:out value='${row.exbiId}'/>')">미리보기</button>
                      <button type="button" class="btns color-white btn-detail" onclick="fncSelectClctDtl('<c:out value='${row.exbiId}'/>')">상세보기</button>
                    </div> -->
                  </li>
                  </c:forEach>
                </ul>
                
              </div>
              <div>
                <h3><u><a href="<c:url value='/invlinst/invlInstDtl.do?instId=${dgtlClrcsRscDtl.instId}'/>">#<c:out value='${dgtlClrcsRscDtl.instNm}'/></a></u>의 다른 디지털문화자원 보기</h3>
                <c:if test="${empty instDiffRscList}">
				<div class="text-cont">
				조회된 데이터가 없습니다.
				</div>
				</c:if>
                <ul class="list-resource">
                  <c:forEach var="diffRow" items="${instDiffRscList}"> 
                  <li>
                    <a href="javascript:fncSelectCltRscDtl('${diffRow.clrcsId}')">
                      <div class="img">
                        <img src="<c:url value='/cmmn/getRprsImageSrc.do?filePath=${diffRow.rprsImgFileStrgPathNm}&fileNm=${diffRow.rprsImgStrgFileNm}&dataCtgryId=${diffRow.dataTypeRootCtgryId}'/>" alt=""/>
                      </div>
                      <div class="tag-wrap">
                        <span class="tag size-small color-green"><c:out value='${diffRow.dataTypeRootCtgryNm}'/></span>
                        <span class="tag size-small brd-color-blue"><c:out value='${diffRow.instNm}'/></span
                        >
                      </div>
                      <p>
                        <strong><c:out value='${diffRow.clrcsNm}'/></strong>
                      </p>
                    </a>
                    <div class="btn-wrap">
                      <button type="button" class="view"><fmt:formatNumber value='${diffRow.inqCnt}' pattern="#,###" /></button>
                      <button type="button" class="download"><fmt:formatNumber value='${diffRow.dwnldCnt}' pattern="#,###" /></button>
                      <!-- <button type="button" class="like"><fmt:formatNumber value='${diffRow.rcmdtnCnt}' pattern="#,###" /></button> -->
                    </div>
                  </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
    </section>
    <!-- //container(E) -->
    <form id="rvForm" name="rvForm">
    	<input type="hidden" id="hdnRvCurrentPage" name="hdnRvCurrentPage" value="1">
    	<input type="hidden" id="hdnQnaCurrentPage" name="hdnQnaCurrentPage" value="1">
    	<input type="hidden" id="hdnLnkgContsId" name="hdnLnkgContsId" value="<c:out value='${paramVo.clrcsId}'/>" >
    	<input type="hidden" id="hdnDataTypeRootCtgryId" name="hdnDataTypeRootCtgryId" value="<c:out value='${dgtlClrcsRscDtl.dataTypeRootCtgryId}'/>" >
    </form>
    
    <script>
    $(document).ready(function(){
  		//funSelectDgtlClrcsRscRvList();   //리뷰
  		//funSelectDgtlClrcsRscQnaList();  //QNA
  	});
    
    //3d 미리보기
    function funPrvw(){
    	$('#prvwImg').hide();
        $('#3dBtn').hide();
        $('#backBtn').show();
        //미디어 실행
        fncShowConts($('#hdnLnkgContsId').val(), '', $('#hdnDataTypeRootCtgryId').val(), 'rscDtlConts');
    }
    
    //돌아가기
    function funBackPrvw(){
    	$('#prvwImg').show();
        $('#3dBtn').show();
        $('#backBtn').hide();

        var ctgryId = $('#hdnDataTypeRootCtgryId').val();
        if(ctgryId == 'D01'){
        	$('#rscDtlConts').find('canvas').remove();//3d 캔버스 제거
        }else if(ctgryId == 'D02'){
        	$('#rscDtlConts').find('video').remove();//비디오 제거
            $('#rscDtlConts').removeAttr('style');//비디오관련 클래스 제거
            $('#rscDtlConts').css({
                'display': 'flex',
                'justify-content': 'center'
            });
        }else if(ctgryId == 'D03'){
        	$('#rscDtlConts').find('#viewerImg').remove();//이미지 제거
            $('#rscDtlConts').removeAttr('style');//비디오관련 클래스 제거
            $('#rscDtlConts').css({
                'display': 'flex',
                'justify-content': 'center'
            });
        }else if(ctgryId == 'D04'){
        	$('#rscDtlConts').find('canvas').remove();//캔버스 제거
        	$('#rscDtlConts').find('audio').remove();//오디오 제거
            $('#rscDtlConts').removeAttr('style');//비디오관련 클래스 제거
            $('#rscDtlConts').css({
                'display': 'flex',
                'justify-content': 'center'
            });
        }else if(ctgryId == 'D07'){
        	$('#rscDtlConts').find('#viewerImg').remove();//이미지 제거
            $('#rscDtlConts').removeAttr('style');//비디오관련 클래스 제거
            $('#rscDtlConts').css({
                'display': 'flex',
                'justify-content': 'center'
            });
        } else {
        	$('#rscDtlConts').find('#viewerImg').remove();//이미지 제거
            $('#rscDtlConts').removeAttr('style');//비디오관련 클래스 제거
            $('#rscDtlConts').css({
                'display': 'flex',
                'justify-content': 'center'
            });
        }
    }
    
    //산출물 미리보기
    function funPrdctPrvw(prdctSn){
	    $('#contsView').empty();
	    fncShowConts($('#hdnLnkgContsId').val(),prdctSn,$('#hdnDataTypeRootCtgryId').val(),'contsView');
    }
    
    //리뷰 페이징 선택시 호출
    function fnRvPaging(url, currentPage){
       	$('#hdnRvCurrentPage').val(currentPage.currentPage);
        fncTopMvmnScrl('rvList');//스크롤 이동
       	funSelectDgtlClrcsRscRvList();
    }
    
    //리뷰 목록 조회
    function funSelectDgtlClrcsRscRvList(){
   	    var queryString = "currentPage=" + $('#hdnRvCurrentPage').val()+
   	                      "&lnkgContsId=" + $('#hdnLnkgContsId').val();
	  	$("#rvList").load("<c:url value='/dgtlcltrsc/selectDgtlClrcsRscRvList.do'/>"+"?"+queryString);
    }
    
    //리뷰 등록
    function funRegRv(){
    	var rtngScr = $('input[name="rtngScr"]:checked').val(); 
    	var pstCn = $('#pstCn').val();
    	
    	if(fncIsNull(pstCn)){
    		alert("입력한 내용이 없습니다.");
    		$('#pstCn').focus();
    		return;
    	}
    	
    	if(fncIsNull(rtngScr)){
    		alert("별점이 선택되지 않았습니다.");
    		return;
    	}
    	
    	$.ajax({
            url: "<c:url value='/dgtlcltrsc/regDgtlClrcsRscRv.do'/>",
            type: 'POST',
            data: { 'rtngScr'     : rtngScr,
            	    'pstCn'       : pstCn,
            	    'lnkgContsId' : $('#hdnLnkgContsId').val() 
            },
            success: function(data) {
            	if(data.resultCode == 200){
    				$('#pstCn').val("");
    				$('input[name="rtngScr"]').prop('checked', false);
    				alert("등록되었습니다.");
            	} else if(data.resultCode == 401){
       				alert("사용시간이 초과 되었습니다. 다시 로그인 후 등록하시기 바랍니다.");
    	    	}else{
            		alert("등록에 실패하였습니다.");
            	}
            	funSelectDgtlClrcsRscRvList();
            },
            error: function() {
            	alert("등록에 실패하였습니다.");
            }
        });
    }
    
    //리뷰 삭제
    function funDelRv(id){
    	$.ajax({
            url: "<c:url value='/dgtlcltrsc/delDgtlClrcsRscRv.do'/>",
            type: 'POST',
            data: { 'pstId':id
            },
            success: function(data) {
              
            	if(data.resultCode == 200){
    				alert("삭제되었습니다.");
            	}else{
            		alert("삭제에 실패하였습니다.");
            	}
            	funSelectDgtlClrcsRscRvList();
            },
            error: function() {
            	alert("삭제에 실패하였습니다.");
            }
      });
    }
    
    //Qna 페이징 선택시 호출
    function fnQnaPaging(url, currentPage){
       	$('#hdnQnaCurrentPage').val(currentPage.currentPage);
       	fncTopMvmnScrl('qnaList');//스크롤 이동
       	funSelectDgtlClrcsRscQnaList();
    }
    
    //Qna 목록 조회
    function funSelectDgtlClrcsRscQnaList(){
   	    var queryString = "currentPage=" + $('#hdnQnaCurrentPage').val()+
                          "&lnkgContsId=" + $('#hdnLnkgContsId').val();
	  	$("#qnaList").load("<c:url value='/dgtlcltrsc/selectDgtlClrcsRscQnaList.do'/>" + "?"+queryString);
    }
    
    //Qna 등록
    function funRegQna(){

    	var qnaPstCn = $('#qnaPstCn').val();
    	
    	if(fncIsNull(qnaPstCn)){
    		alert("입력한 내용이 없습니다.");
    		$('#qnaPstCn').focus();
    		return;
    	}
    	
    	$.ajax({
            url: "<c:url value='/dgtlcltrsc/regDgtlClrcsRscQna.do'/>",
            type: 'POST',
            data: { 'pstCn'       : qnaPstCn,
            	    'lnkgContsId' : $('#hdnLnkgContsId').val() 
            },
            success: function(data) {
            	if(data.resultCode == 200){
    				$('#qnaPstCn').val("");
    				alert("등록되었습니다.");
            	} else if(data.resultCode == 401){
       				alert("사용시간이 초과 되었습니다. 다시 로그인 후 등록하시기 바랍니다.");
    	    	}else{
            		alert("등록에 실패하였습니다.");
            	}
            	funSelectDgtlClrcsRscQnaList();
            },
            error: function() {
            	alert("등록에 실패하였습니다.");
            }
        });
    }
    
    //Qna 삭제
    function funDelQna(id){
    	$.ajax({
            url: "<c:url value='/dgtlcltrsc/delDgtlClrcsRscQna.do'/>",
            type: 'POST',
            data: { 'pstId':id
            },
            success: function(data) {
              
            	if(data.resultCode == 200){
    				alert("삭제되었습니다.");
            	} else if(data.resultCode == 401){
       				alert("사용시간이 초과 되었습니다. 다시 로그인 후 삭제하시기 바랍니다.");
            	} else{
            		alert("삭제에 실패하였습니다.");
            	}
            	funSelectDgtlClrcsRscQnaList();
            },
            error: function() {
            	alert("삭제에 실패하였습니다.");
            }
      });
    }
    
    //스크랩 선택, 해제
    function funScrapDgtlCltRscInfo(ele, clrcsId){
        var isLiked = $(ele).hasClass('active');
        var rcmdtnClsfCd = "";
    	
    	if(isLiked){
    		rcmdtnClsfCd = "B";
    	}else{
    		rcmdtnClsfCd = "A";
    	}
    	
    	$.ajax({
                url: "<c:url value='/dgtlcltrsc/scrapDgtlCltRscInfo.do'/>",
                type: 'POST',
                dataType: "json",
                data: { 'clrcsId':clrcsId,
                        'rcmdtnClsfCd' : rcmdtnClsfCd
                },
                success: function(data) {
                	if(data.resultCode == 200){
                		
                		if(isLiked){
                    		$(ele).removeClass('active');
                    		alert("스크랩이 해제되었습니다."); 
                    	}else{
                    		$(ele).addClass('active');
                    		alert("스크랩이 저장되었습니다.");
                    	}
                		
        				 var rcmdtnCnt = data.result.rcmdtnCnt;
        		         $('#likeCnt').text(fncAddComma(rcmdtnCnt));
                	}else{
                		alert(data.resultMessage);
                	}
                },
                error: function() {
                	alert("스크랩저장이 실패하였습니다.");
                }
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
    import {STLLoader} from "three/addons/loaders/STLLoader.js";
    import {PLYLoader} from "three/addons/loaders/PLYLoader.js";

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
              console.log('FBXLoader');
          }else if(ext === 'obj'){
              //OBJ일 경우 OBJ LOADER 호출
              loader = new OBJLoader();
              console.log('OBJLoader');
          }else if(ext === 'glb' || ext === 'gltf'){
              loader = new GLTFLoader();
              console.log('GLTFLoader');
          }else if(ext === 'stl'){
              loader = new STLLoader();
              console.log('STLLoader');
          }else if(ext === 'ply'){
              loader = new PLYLoader();
              console.log('PLYLoader');
          }

        let totalResources = textureFiles.length + 1; // 텍스처 파일 수 + 모델 파일 1개
		if(ext === 'stl' || ext === 'ply' || ext === 'glb'){
			totalResources = 1;
		}
        let loadedResources = 0;

        const updateTextureProgress = (resourceName) => {
          let overallProgress = (loadedResources / totalResources) * 100;

          //loadingLogoSpan.style.width = overallProgress + '%';
          loadingLogoSpan.style.opacity  = overallProgress / 100;

          progressBar.style.width = overallProgress + '%';
          loadingTxtDiv.innerText = '데이터를 불러오는 중입니다. (' + Math.floor(overallProgress) + '%)';
          fileTxtDiv.innerText = 'Texture : '+ resourceName ;
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
            if(ext === 'fbx' || ext === 'obj' || ext === 'glb' || ext === 'glft') {
                for (const item of textureFiles) {

                    let textureUrl = await getModelResource(item.name, clrcsId, item.prdctSn).then(data => {
                        const blob = new Blob([data]);
                        return window.URL.createObjectURL(blob);
                    });

                    textureLoader.load(textureUrl, (texture) => {
                        if (item.name.includes('BC')) {
                            texture.encoding = THREE.sRGBEncoding;
                            baseColorUrl = texture;
                        } else if (item.name.includes('NM')) {
                            normalUrl = texture;
                        } else if (item.name.includes('RN')) {
                            roughUrl = texture;
                        } else if (item.name.includes('AO')) {
                            aoUrl = texture;
                        } else if (item.name.includes('MT')) {
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
            }


          const fbxUrl = await getModelResource(fileName, clrcsId, prdctSn).then(data=>{
            const blob = new Blob([data]);
            return window.URL.createObjectURL(blob);
          });

            const metaMaterial = new THREE.MeshStandardMaterial({
				color : 0xffffff,
			});

			if(baseColorUrl){
				metaMaterial.map = baseColorUrl;
			}

			if(normalUrl){
				metaMaterial.normalMap = normalUrl;
			}

			if(metaUrl){
				metaMaterial.metalnessMap = metaUrl;
				metaMaterial.reflectivity = 0.1;
				metaMaterial.metalness = 1.0;
			}

			if(roughUrl){
				metaMaterial.roughnessMap = roughUrl
				metaMaterial.roughness = 1.0;
			}

			if(aoUrl){
				metaMaterial.aoMap = aoUrl;
				metaMaterial.aoMapIntensity = 1;
			}

          loader.load(fbxUrl,
                  (object) => {
                      if(ext === 'stl'){

                          var stlMaterial = new THREE.MeshStandardMaterial({ color: 0xffffff });
                          var stlMesh = new THREE.Mesh(object, stlMaterial);
                          this.scene.add(stlMesh);


                          loadedResources++;
                          updateTextureProgress(fileName);

                      }else if(ext === 'ply'){
                          object.computeVertexNormals();
                          var plyMaterial = new THREE.MeshStandardMaterial({ color: 0xffffff });
                          var plyMesh = new THREE.Mesh(object, plyMaterial);
                          this.scene.add(plyMesh);

                          loadedResources++;
                          updateTextureProgress(fileName);

                      }
                      else if(ext === 'glb') {
                          this.scene.add(object.scene);
                          this.animate();
                          loadedResources++;
                          updateTextureProgress(fileName);
                      }
                      else {
                          object.traverse(child => {
                              //debugger;
                              //console.log(child.name);
                              if (child.isMesh) {

                                  // 기존 텍스처 맵 참조 제거
                                  // if (child.material.map) {
                                  //     child.material.map.dispose(); // 텍스처 메모리 해제
                                  //     child.material.map = null;    // 기존 텍스처 맵 참조 제거
                                  // }


                                  if(textureFiles.length > 0){
                                      child.material = metaMaterial;
                                      child.material.needsUpdate = true;
                                      console.log(child.geometry.attributes.position.count);
                                  }
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

                          URL.revokeObjectURL(baseColorUrl);
                          URL.revokeObjectURL(normalUrl);
                          URL.revokeObjectURL(roughUrl);
                          URL.revokeObjectURL(metaUrl);
                          URL.revokeObjectURL(aoUrl);
                      }

                  },
                  (xhr) => {
                    //console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
                  }, (error) => {
                  console.log('Error loading '+ fileName + 'error : '+ error);
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
