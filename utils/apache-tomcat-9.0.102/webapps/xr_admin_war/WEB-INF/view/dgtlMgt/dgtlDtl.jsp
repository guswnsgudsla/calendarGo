<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contants">
	<form name="frmDgtlClrcsSrch" id="frmDgtlClrcsSrch" method="post" enctype="multipart/form-data">
		<input type="hidden" id="clrcsId" name="clrcsId" value="${srchDgtlClrcsInfo.clrcsId}">
		<input type="hidden" class="serverValue" id="srchInstTypeCdVal" name="srchInstTypeCdVal" value="${srchDgtlClrcsInfo.srchInstTypeCdVal}">
		<input type="hidden" class="serverValue" id="srchCntTypeCdVal" name="srchCntTypeCdVal" value="${srchDgtlClrcsInfo.srchCntTypeCdVal}">
		<input type="hidden" class="serverValue" id="srchCntDtlTypeCdVal" name="srchCntDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchCntDtlTypeCdVal}">
		<input type="hidden" class="serverValue" id="srchDataTypeCdVal" name="srchDataTypeCdVal" value="${srchDgtlClrcsInfo.srchDataTypeCdVal}">
		<input type="hidden" class="serverValue" id="srchDataDtlTypeCdVal" name="srchDataDtlTypeCdVal" value="${srchDgtlClrcsInfo.srchDataDtlTypeCdVal}">
		<input type="hidden"  id="srchPageModeVal" name="srchPageModeVal" value="${srchDgtlClrcsInfo.srchPageModeVal}">
		<input type="hidden"  id="srchSaveModeVal" name="srchSaveModeVal" value="${srchDgtlClrcsInfo.srchSaveModeVal}">
		<input type="hidden"  id="srchSaveStepVal" name="srchSaveStepVal" value="${srchDgtlClrcsInfo.srchSaveStepVal}">
	</form>
	<div class="info-wrap">
		<div class="slide">
			<div id="viewer" style="position: relative; height: 425px; width: 100%; overflow: hidden">
				<c:url value="/cmmn/getRprsImageSrc.do" var="rprsImgUrl">
					<c:param name="filePath" value="${dgtlClrcsInfo.rprsImgFileStrgPathNm}" />
					<c:param name="fileNm" value="${dgtlClrcsInfo.rprsImgStrgFileNm}" />
					<c:param name="dataCtgryId" value="${dgtlClrcsInfo.dataTypeRootCtgryId}" />
				</c:url>
				<img id="prvwImg" src="${rprsImgUrl}" alt="" style="width:100%; height: 100%; object-fit: cover; object-position: center;"/>
			</div>
		</div>

		<div class="info full">
			<dl>
				<dt>디지털문화자원명</dt>
				<dd>${dgtlClrcsInfo.clrcsNm}</dd>
				<dt>등록기관</dt>
				<dd>${dgtlClrcsInfo.instNm}</dd>
				<dt>데이터 유형</dt>
				<dd>${dgtlClrcsInfo.dataTypeCtgryNm}</dd>
				<dt>공통분류</dt>
				<dd>${dgtlClrcsInfo.contsTypeCtgryNm}</dd>
				<dt>서비스 유형</dt>
				<dd>${dgtlClrcsInfo.srvcTypeCtgryNm}</dd>
				<dt>산업 유형</dt>
				<dd>${dgtlClrcsInfo.indrTypeCtgryNm}</dd>
				<dt>국가/시대</dt>
				<dd>${dgtlClrcsInfo.ntnTageTypeCtgryNm}</dd>
				<dt>재질</dt>
				<dd>${dgtlClrcsInfo.mtrTypeCtgryNm}</dd>
			</dl>
			<div class="mark">
				<img src="../image/mark.png" alt=""/>
				공공누리 제 1유형 (출처표시)
			</div>
		</div>
	</div>
	<div class="btn-wrap align-right">
		<button type="button" class="btns color-gray" onclick="goBack()">목록</button>
		<button type="button" class="btns" onclick="goModify('${dgtlClrcsInfo.clrcsId}')">수정</button>
	</div>
	<div class="tab-wrap as-tab-wrap"><!-- 탭 액션 class=as-tab-wrap 추가 -->
		<ul class="tab-menu">
			<li><a href="#">기본정보</a></li>
			<li><a href="#">파일정보</a></li>
			<li><a href="#">품질관리정보</a></li>
			<li><a href="#">리뷰</a></li>
			<li><a href="#">Q&A</a></li>
		</ul>
		<div class="inner-depth">
			<div class="tab-inner" id="tabBasic" >
				<div class="information">
					<dl>
						<dt>명칭</dt>
						<dd>${dgtlClrcsInfo.clrcsNm}</dd>
						<dt>부제목</dt>
						<dd>${dgtlClrcsInfo.clrcsSbttl}</dd>
						<dt>영문명</dt>
						<dd>${dgtlClrcsInfo.clrcsEngNm}</dd>
						<dt>중문명</dt>
						<dd>${dgtlClrcsInfo.clrcsChnNm}</dd>
						<dt>저자명</dt>
						<dd>${dgtlClrcsInfo.clrcsAutNm}</dd>
						<dt>설명</dt>
						<dd>${dgtlClrcsInfo.clrcsExpln}</dd>
						<dt>부가설명</dt>
						<dd>${dgtlClrcsInfo.clrcsAnxtExpln}</dd>
						<dt>크기</dt>
						<dd>${dgtlClrcsInfo.clrcsSzCn}</dd>
						<dt>소장품번호</dt>
						<dd>${dgtlClrcsInfo.instItslMngNo}</dd>
						<dt>URL</dt>
						<dd>${dgtlClrcsInfo.clrcsURLAddr}</dd>
						<dt>작가명</dt>
						<dd>${dgtlClrcsInfo.wriNm}</dd>
						<dt>출토지명</dt>
						<dd>${dgtlClrcsInfo.fdspNm}</dd>
						<dt>전시명</dt>
						<dd>${dgtlClrcsInfo.dspyNm}</dd>
						<dt>전시장소명</dt>
						<dd>${dgtlClrcsInfo.dspyPlcNm}</dd>
						<dt>분류</dt>
						<dd>${dgtlClrcsInfo.instCtgryNm}</dd>
					</dl>
				</div>
			</div>


			${dgtlClrcsPrd.clrcsId}
			${dgtlClrcsPrd.prdctSn}


			<div class="tab-inner" id="tabFile">
				<div class="fileinfo">
					<dl>
						<dt>전체파일 사이즈</dt>
						<dd id="totalFileSize">6.09MB</dd>
						<dt>전체파일 개수</dt>
						<dd id="drTypeCount"></dd>
					</dl>
				</div>
				<div class="fileinfo-wrap">
					<div class="contents-list list">
						<strong>최종 산출물 (
							<c:set var="finalPrdctCount" value="0" />
							<c:forEach var="finalPrdctRow" items="${dgtlClrcsPrdFinalInfo}">
								<c:choose>
									<c:when test="${finalPrdctRow.fileType eq 'FL'}">
										<c:set var="finalPrdctCount" value="${finalPrdctCount + 1}" />
									</c:when>
								</c:choose>
							</c:forEach>
							<c:out value="${finalPrdctCount}"/>
							)</strong>
						<ul>
							<c:forEach var="finalPrdctRow" items="${dgtlClrcsPrdFinalInfo}">
								<c:choose>
									<c:when test="${finalPrdctRow.fileType eq 'DR'}">
										<li>
											<c:forEach begin="2" end="${finalPrdctRow.lvl}">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											<p class="folder"><c:out value='${finalPrdctRow.prdctNm}'/></p>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<c:forEach begin="2" end="${finalPrdctRow.lvl}">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											&nbsp;
											<p style="cursor: pointer;" onClick="fileDownload('<c:out value='${finalPrdctRow.clrcsId}'/>', 'selectOne', '<c:out value='${finalPrdctRow.prdctSn}'/>', '<c:out value='${finalPrdctRow.prdctNm}'/>','<c:out value='${finalPrdctRow.prdctTypeCd}'/>'
													,'<c:out value='${finalPrdctRow.imgWdthLng}'/>','<c:out value='${finalPrdctRow.imgHghtLng}'/>','<c:out value='${finalPrdctRow.bitLvlCd}'/>','<c:out value='${finalPrdctRow.vdoStreLng}'/>','<c:out value='${finalPrdctRow.fileSz}'/>', this)" data-value="${finalPrdctRow.prdctSn}"><c:out value='${finalPrdctRow.prdctNm}'/></p>
											<c:if test="${finalPrdctRow.prdctTypeCd eq 'D01'}">
												<p style="cursor: pointer;" onClick="fileDownload('<c:out value='${finalPrdctRow.clrcsId}'/>', 'selectOne', '<c:out value='${finalPrdctRow.prdctSn}'/>', '<c:out value='${finalPrdctRow.prdctNm}'/>','<c:out value='${finalPrdctRow.prdctTypeCd}'/>'
														,'<c:out value='${finalPrdctRow.imgWdthLng}'/>','<c:out value='${finalPrdctRow.imgHghtLng}'/>','<c:out value='${finalPrdctRow.bitLvlCd}'/>','<c:out value='${finalPrdctRow.vdoStreLng}'/>','<c:out value='${finalPrdctRow.fileSz}'/>', this, 'add')" data-value="${finalPrdctRow.prdctSn}">'모델추가'</p>
											</c:if>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>

						<br>
						<strong>단계 산출물 (
							<c:set var="stepPrdctCount" value="0" />
							<c:forEach var="stepPrdctRow" items="${dgtlClrcsPrdStepInfo}">
								<c:choose>
									<c:when test="${stepPrdctRow.fileType eq 'FL'}">
										<c:set var="stepPrdctCount" value="${stepPrdctCount + 1}" />
									</c:when>
								</c:choose>
							</c:forEach>
							<c:out value="${stepPrdctCount}"/>
							)</strong>

						<ul>
							<c:forEach var="stepPrdctRow" items="${dgtlClrcsPrdStepInfo}">
								<c:choose>
									<c:when test="${stepPrdctRow.fileType eq 'DR'}">
										<li>
											<c:forEach begin="2" end="${stepPrdctRow.lvl}">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											<p class="folder"><c:out value='${stepPrdctRow.prdctNm}'/></p>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<c:forEach begin="2" end="${stepPrdctRow.lvl}">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											&nbsp;
											<p style="cursor: pointer;" onClick="fileDownload('<c:out value='${stepPrdctRow.clrcsId}'/>', 'selectOne', '<c:out value='${stepPrdctRow.prdctSn}'/>', '<c:out value='${stepPrdctRow.prdctNm}'/>', '<c:out value='${stepPrdctRow.prdctTypeCd}'/>'
													,'<c:out value='${stepPrdctRow.imgWdthLng}'/>','<c:out value='${stepPrdctRow.imgHghtLng}'/>','<c:out value='${stepPrdctRow.bitLvlCd}'/>','<c:out value='${stepPrdctRow.vdoStreLng}'/>','<c:out value='${stepPrdctRow.fileSz}'/>', this)" data-value="${stepPrdctRow.prdctSn}"><c:out value='${stepPrdctRow.prdctNm}'/></p>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>

					<div class="iteminfo" style="position: relative">
						<div class="item-wrap" id="contentsViewer" style="height: 800px; height: 600px; background-color: #7f8998">
							<strong>왼쪽에 산출물 정보에서 파일을 선택하세요</strong>
						</div>
						<dl id="productDetails">
						</dl>
						<%--						<button id="glbDown" onclick="glbDownload();">GLB 다운로드</button>--%>
					</div>
				</div>
			</div>
			<div class="tab-inner quality-control" id="tabQuality">
				<div id="noData" class="no-data">이미지/영상/텍스트는 품질관리 정보가 없습니다.</div>
				<div id="qltArea">
					<h3>품질관리 판정정보</h3>
					<dl>
						<dt>최종산출물 :</dt>
						<dd id="rowCnt"></dd>
					</dl>
					<table class="table-accordion">
						<colgroup>
							<col width="10%"/><col width="10%"/><col width="10%"/><col width="*"/>
						</colgroup>
						<thead>
						<tr>
							<th>순번</th>
							<th>파일명</th>
							<th>유형</th>
							<th>파일 크기</th>
							<th>텍스처 개수</th>
							<th>폴리곤 개수</th>
							<th>&nbsp;</th>
						</tr>
						</thead>
						<tbody id="qltList">
						</tbody>
					</table>
				</div>
			</div>


			<div class="tab-inner review" id="tabReview">
				<form id="frmReview" name="frmReview">
					<input type="hidden" id="rvPageNo" name="rvPageNo" value="1">
					<input type="hidden" id="rvPageMaxNo" name="rvPageMaxNo" value="1">
					<strong><span id="rvTotCnt"></span>개의 사용자 리뷰가 있습니다.</strong>
					<div class="control">
						<div class="fm-focus fm-select">
							<select id="srchRvSortType" name="srchRvSortType" onChange="funChgSrchRvItem()">
								<option value="" selected="selected">가장 최근</option>
								<option value="A">가장 오래된</option>
							</select>
						</div>
						<div class="fm-focus fm-select">
							<select id="srchTngScr" name="srchTngScr" onChange="funChgSrchRvItem()">
								<option value="" selected="selected">전체 평점</option>
								<option value="5">5</option>
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
							</select>
						</div>
					</div>
					<div class="review-wrap" id="rvList">
					</div>
				</form>
			</div>

			<div class="tab-inner qna" id="tabQna">
				<form id="frmQna" name="frmQna">
					<input type="hidden" id="qnaPageNo" name="qnaPageNo" value="1">
					<input type="hidden" id="qnaPageMaxNo" name="qnaPageMaxNo" value="1">
					<strong><span id="qnaTotCnt"></span>개의 질문이 있습니다.</strong>
					<div class="control">
						<div class="fm-focus fm-select">
							<select id="srchQnaSortType" name="srchQnaSortType" onChange="funChgSrchQnaItem()">
								<option value="" selected="selected">가장 최근</option>
								<option value="A">가장 오래된</option>
							</select>
						</div>
					</div>
					<div class="qna-list" id="qnaList">
					</div>
				</form>
			</div>

		</div>
	</div>

</div>
<!-- Modal layout -->
<div class="modals" id="modals">
	<div class="pop_layer">
		<div class="layer_head">
			<h2>파일 다운로드</h2>
			<button id="mdClsBtn" class="btn_close">팝업 닫기</button>
		</div>
		<div class="layer_cont">
			선택 하신 파일을 다운로드 중입니다. 잠시만 기다려주세요. <br>
			다운로드가 진행되면 진행상황이 업데이트 됩니다.
		</div>
		<progress id="downloadProgress" value="0" max="100" style="height: 50px; width: 100%"></progress>
		<span id="progressText"></span>
	</div>
</div>
<script type="importmap">
	{
		"imports": {
			"three" : "<c:url value='/js/lib/three.module.min.js' />",
			"three/addons/" : "<c:url value='/js/lib/jsm/' />"
		}
	}
</script>
<script type="module">
    import  * as THREE from 'three';
    import {OrbitControls} from "<c:url value='/js/lib/jsm/controls/OrbitControls.js' />";
    import {TransformControls} from "<c:url value='/js/lib/jsm/controls/TransformControls.js' />";
    import {FBXLoader} from "three/addons/loaders/FBXLoader.js";
    import {OBJLoader} from "three/addons/loaders/OBJLoader.js";
    import {GLTFLoader} from "three/addons/loaders/GLTFLoader.js";
    import {GLTFExporter} from 'three/addons/exporters/GLTFExporter.js';
    import {STLLoader} from "three/addons/loaders/STLLoader.js";
    import {PLYLoader} from "three/addons/loaders/PLYLoader.js";



    let container, stats;
    let camera, scene, renderer, controls, light, tControls;

    let tpclrcsId, tpprdctSn, tpfileName, tptextureFiles, tpaction;




    const viewInit = function (elementId){


        THREE.Cache.clear();



        //3D 생성할 DIV
        container = document.getElementById(elementId);



        //Scene 설정
        scene = new THREE.Scene();
        scene.background = new THREE.Color(0xdbdbdb);

        //렌더러 설정
        renderer = new THREE.WebGLRenderer({antialias: true});
        renderer.outputEncoding = THREE.sRGBEncoding;
        renderer.setPixelRatio( window.devicePixelRatio );

        const width = container.clientWidth;
        const height = container.clientHeight === 0 ? 600 : container.clientHeight;
        renderer.setSize(width, height);

        //카메라 설정
        camera =new THREE.PerspectiveCamera(
            45,
            //window.innerWidth / window.innerHeight,
            width / height,
            1,
            10000);
        camera.position.set(0,10,30);



        window.addEventListener('resize', onWindowResize, false);

        function onWindowResize() {
            // container의 새 크기 가져오기
            const newWidth = container.clientWidth;
            const newHeight = container.clientHeight;

            // 카메라와 렌더러 크기 업데이트
            camera.aspect = newWidth / newHeight;
            camera.updateProjectionMatrix();
            renderer.setSize(newWidth, newHeight);
        }

        renderer.setClearColor(0xffffff, 1);
        container.appendChild(renderer.domElement);

        //컨트롤 설정
        controls = new OrbitControls(camera, renderer.domElement);
        controls.screenSpacePanning = true;
        controls.target.set( 0, 5, 0 );
        controls.update();

        //stats = new Stats();
        //container.appendChild(stats.domElement);







        const ambientLight = new THREE.AmbientLight(0xffffff,1) ;
        scene.add(ambientLight);

        const directions = [
            { x: -1, y: 1, z: 0 },  // 좌측상단
            { x: 0, y: 1, z: 0 },   // 상단
            { x: 1, y: 1, z: 0 },   // 우측상단
            { x: 1, y: 0, z: 0 },   // 우측
            { x: 1, y: -1, z: 0 },  // 우측하단
            { x: 0, y: -1, z: 0 },  // 하단
            { x: -1, y: -1, z: 0 }, // 좌측하단
            { x: -1, y: 0, z: 0 },   // 좌측
            { x:0, y:0, z: 10 }, //정면
            // { x:0, y:0, z: -10 } //후면

        ];

        const lightIntensity = 3;
        const distance = 10;

        directions.forEach(dir => {
            const light = new THREE.DirectionalLight(0xffffff, lightIntensity, distance);
            light.position.set(dir.x * 10, dir.y * 10, dir.z * 10);
            light.target.position.set(0,0,0);
            scene.add(light);
        });



        // const light1 = new THREE.DirectionalLight( 0xffffff, 1 );
        // light1.position.set( 0, 200, 0 );
        // scene.add( light1 );
        //
        // const light2 = new THREE.DirectionalLight( 0xffffff, 1 );
        // light2.position.set( 100, 200, 100 );
        // scene.add( light2 );
        //
        // const light3 = new THREE.DirectionalLight( 0xffffff, 1 );
        // light3.position.set( - 100, - 200, - 100 );
        // scene.add( light3 );



    }

    /**
     *
     * @param clrcsId
     * @param prdctSn
     * @param fileName
     * @param textureFiles
     * @returns {Promise<void>}
     */
    const loadModels = async function(clrcsId, prdctSn, fileName, textureFiles, action){

        tpclrcsId = clrcsId;
        tpprdctSn = prdctSn;
        tpfileName = fileName;
        tptextureFiles = textureFiles;
        tpaction = action;

        if(!action){
            await modelLoader(clrcsId, prdctSn, textureFiles, fileName);
        }else {
            await addModelLoader(clrcsId, prdctSn, textureFiles, fileName);
        }

    }

    const reloadModel = function () {
        modelLoader(tpclrcsId, tpprdctSn, tpfileName, tptextureFiles, tpaction);
    }

    const modelLoader = async function(clrcsId, prdctSn, textureFiles, fileName){

        // 초기 렌더러 설정
        renderer.setPixelRatio(window.devicePixelRatio);
        window.addEventListener('resize', onWindowResize, false);

        // Fullscreen 버튼 추가
        const fullscreenBtn = document.createElement('button');
        fullscreenBtn.id = 'fullscreenBtn';
        fullscreenBtn.innerText = 'Go Fullscreen';
        fullscreenBtn.className = 'btns'; // 클래스 'btns'를 버튼에 할당


        container.appendChild(fullscreenBtn);

        // Fullscreen 토글 함수
        function toggleFullscreen() {
            if (!document.fullscreenElement) {
                renderer.domElement.requestFullscreen().catch(err => {
                    alert(`Error attempting to enable full-screen mode: ${err.message} (${err.name})`);
                });
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                }
            }
        }

        // 버튼 이벤트 리스너 추가
        document.getElementById('fullscreenBtn').addEventListener('click', toggleFullscreen);

        function onWindowResize() {
            const width = container.clientWidth;
            const height = container.clientHeight;

            camera.aspect = width / height;
            camera.updateProjectionMatrix();
            renderer.setSize(width, height);
            renderer.setPixelRatio(window.devicePixelRatio); // 최적의 디스플레이 해상도 유지
            animate();
        }

        document.addEventListener('fullscreenchange', () => {
            renderer.setPixelRatio(window.devicePixelRatio); // 전체 화면 변화 시 해상도 조정
            onWindowResize();
        });



        // 진행율 DIV 추가
        const progressDiv = document.createElement('div');
        progressDiv.id = 'loadingProgress';

        progressDiv.style.width = '100%';
        //progressDiv.style.height = container.clientHeight === 0 ? '600px' : container.clientHeight;
        progressDiv.style.height = '600px';
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


        //로딩 상태
        const loadingTxtDiv = document.createElement('div');
        loadingTxtDiv.style.fontSize = '1.5em';
        loadingTxtDiv.style.fontWeight = 'bold';
        loadingTxtDiv.style.marginBottom = '0,5em';


        //로딩 파일명
        const fileTxtDiv = document.createElement('div');
        fileTxtDiv.style.fontSize = '0.8em';
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

        progressDiv.appendChild(txtContainerDiv);
        progressDiv.appendChild(progressContainerDiv);


        // 'contentsViewer'에 진행율 DIV 추가

        container.appendChild(progressDiv);

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
        let modelProgress = 0;


        let totalLoaded = 0; // 현재까지 로드된 총 크기
        let totalSize = 0; // 전체 파일 크기


        let modelLoadComplate = false;

        const updateProgress = (resourceName) => {
            let overallProgress = ((loadedResources + modelProgress) / totalResources) * 100;
            progressBar.style.width = overallProgress + '%';
            loadingTxtDiv.innerText = '3D 데이터를 로딩중입니다. (' + Math.round(overallProgress) + '%)';
            fileTxtDiv.innerText = resourceName;

            // if ((loadedResources + modelProgress) === totalResources) {
            if (overallProgress === 100 ) {

                if (progressDiv) {
                    progressDiv.style.opacity = '0';
                    progressDiv.style.filter = 'blur(5px)';

                    setTimeout(function () {
                        container.removeChild(progressDiv);
                    }, 3000);
                }
            }
        }


        // fbx모델 Texture 설정
        const textureLoader = new THREE.TextureLoader();
        let baseColorUrl, normalUrl, roughUrl, aoUrl, metaUrl;

        try{
            if(ext === 'fbx' || ext === 'obj' || ext === 'glb' || ext === 'glft'){

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
                        //updateTextureProgress(item.name);
                        updateProgress(item.name)
                    }, (xhr) => {
                        console.log(item.name+ 'loaded ' +(xhr.loaded / xhr.total) * 100);
                    }, (error) => {
                        console.log('Error loading '+ item.name + 'error : '+ error);
                    });
                }
            }


            const fbxUrl = await getModelResource(fileName, clrcsId, prdctSn).then(data=>{
                const blob = new Blob([data]);
                return window.URL.createObjectURL(blob);
            });


            // const metaMaterial = new THREE.MeshLambertMaterial({
            //     color : 0xffffff,
            // });
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
                        scene.add(stlMesh);


                        //loadedResources++;
                        //updateTextureProgress(fileName);

                    }else if(ext === 'ply'){
                        object.computeVertexNormals();
                        var plyMaterial = new THREE.MeshStandardMaterial({ color: 0xffffff });
                        var plyMesh = new THREE.Mesh(object, plyMaterial);
                        scene.add(plyMesh);

                        //loadedResources++;
                        //updateTextureProgress(fileName);

                    }
                    else if(ext === 'glb') {
                        scene.add(object.scene);
                        animate();
                        //loadedResources++;
                        //updateTextureProgress(fileName);
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


                                //폴리곤만 보기
                                // child.material = new THREE.MeshBasicMaterial({
                                //     color: 0x343241, // 와이어프레임 색상 설정
                                //     // color: 0xffffff, // 와이어프레임 색상 설정
                                //     wireframe: true  // 와이어프레임 활성화
                                // });
                            }
                        });

                        scene.add(object);
                        object.rotation.y = Math.PI / 4; // 초기 회전값 설정 (예시)

                        // const tControl = new TransformControls(camera, renderer.domElement);
                        // scene.add(tControl);
                        //
                        // tControl.attach(model);
                        //
                        // tControl.addEventListener('change', function () {
                        //     renderer.render(scene, camera);
                        // });
                        //
                        // tControl.addEventListener('dragging-changed', function (event) {
                        //     controls.enabled = !event.value;
                        // });

                        // 모델의 BoundingBox 계산
                        const box = new THREE.Box3().setFromObject(object);

                        // BoundingBox의 중심을 구함
                        const center = box.getCenter(new THREE.Vector3());

                        // 카메라의 OrbitControls 타겟을 설정
                        controls.target.copy(center);
                        controls.update();

                        //카메라를 조정하여 모델이 잘 보이도록 설정
                        const size = box.getSize(new THREE.Vector3());
                        const maxDim = Math.max(size.x, size.y, size.z);
                        let cameraZ = maxDim * 2; // 카메라와 모델의 거리를 모델의 크기에 따라 조정
                        const cameraY = center.y + maxDim;
                        camera.position.set(center.x, cameraY, cameraZ);
                        camera.lookAt(center); // 카메라가 모델 중심을 바라보도록 설정

                        // 카메라 near/far 클리핑 평면을 조정
                        camera.near = maxDim / 100;
                        camera.far = maxDim * 100;
                        camera.updateProjectionMatrix();

                        //loadedResources++;
                        //updateTextureProgress(fileName);

                        URL.revokeObjectURL(baseColorUrl);
                        URL.revokeObjectURL(normalUrl);
                        URL.revokeObjectURL(roughUrl);
                        URL.revokeObjectURL(metaUrl);
                        URL.revokeObjectURL(aoUrl);
                    }



                },
                (xhr) => {
                    // progressBar.style.width = overallProgress + '%';
                    // loadingTxtDiv.innerText = 'LOADING MODEL (' + overallProgress + '%)';
                    // fileTxtDiv.innerText = resourceName;
                    if (xhr.lengthComputable) {
                        modelProgress = xhr.loaded / xhr.total;
                        if(xhr.loaded === xhr.total){
                            modelLoadComplate = true;
                        }


                        updateProgress(fileName);

                        //updateModelProgress(modelProgress, fileName);
                    }

                }, (error) => {
                    console.log('Error loading '+ fileName + 'error : '+ error);
                }
            );
        }catch (error){
            console.error('An error occurred during model loading:', error);
        }


    }

    const addModelLoader = async function(clrcsId, prdctSn, textureFiles, fileName){


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
        let modelProgress = 0;


        let totalLoaded = 0; // 현재까지 로드된 총 크기
        let totalSize = 0; // 전체 파일 크기


        let modelLoadComplate = false;




        // fbx모델 Texture 설정
        const textureLoader = new THREE.TextureLoader();
        let baseColorUrl, normalUrl, roughUrl, aoUrl, metaUrl;

        try{
            if(ext === 'fbx' || ext === 'obj' || ext === 'glb' || ext === 'glft'){

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

                        //loadedResources++;
                        //updateTextureProgress(item.name);
                        //updateProgress(item.name)
                    }, (xhr) => {
                        console.log(item.name+ 'loaded ' +(xhr.loaded / xhr.total) * 100);
                    }, (error) => {
                        console.log('Error loading '+ item.name + 'error : '+ error);
                    });
                }
            }


            const fbxUrl = await getModelResource(fileName, clrcsId, prdctSn).then(data=>{
                const blob = new Blob([data]);
                return window.URL.createObjectURL(blob);
            });


            // const metaMaterial = new THREE.MeshLambertMaterial({
            //     color : 0xffffff,
            // });
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
                        scene.add(stlMesh);


                        //loadedResources++;
                        //updateTextureProgress(fileName);

                    }else if(ext === 'ply'){
                        object.computeVertexNormals();
                        var plyMaterial = new THREE.MeshStandardMaterial({ color: 0xffffff });
                        var plyMesh = new THREE.Mesh(object, plyMaterial);
                        scene.add(plyMesh);

                        //loadedResources++;
                        //updateTextureProgress(fileName);

                    }
                    else if(ext === 'glb') {
                        scene.add(object.scene);
                        animate();
                        //loadedResources++;
                        //updateTextureProgress(fileName);
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

                        scene.add(object);
                        object.rotation.y = Math.PI / 4; // 초기 회전값 설정 (예시)

                        // const tControl = new TransformControls(camera, renderer.domElement);
                        // scene.add(tControl);
                        //
                        // tControl.attach(model);
                        //
                        // tControl.addEventListener('change', function () {
                        //     renderer.render(scene, camera);
                        // });
                        //
                        // tControl.addEventListener('dragging-changed', function (event) {
                        //     controls.enabled = !event.value;
                        // });

                        // 모델의 BoundingBox 계산
                        const box = new THREE.Box3().setFromObject(object);

                        // BoundingBox의 중심을 구함
                        const center = box.getCenter(new THREE.Vector3());

                        // 카메라의 OrbitControls 타겟을 설정
                        controls.target.copy(center);
                        controls.update();

                        //카메라를 조정하여 모델이 잘 보이도록 설정
                        const size = box.getSize(new THREE.Vector3());
                        const maxDim = Math.max(size.x, size.y, size.z);
                        let cameraZ = maxDim * 2; // 카메라와 모델의 거리를 모델의 크기에 따라 조정
                        const cameraY = center.y + maxDim;
                        camera.position.set(center.x, cameraY, cameraZ);
                        camera.lookAt(center); // 카메라가 모델 중심을 바라보도록 설정

                        // 카메라 near/far 클리핑 평면을 조정
                        camera.near = maxDim / 100;
                        camera.far = maxDim * 100;
                        camera.updateProjectionMatrix();

                        //loadedResources++;
                        //updateTextureProgress(fileName);

                        URL.revokeObjectURL(baseColorUrl);
                        URL.revokeObjectURL(normalUrl);
                        URL.revokeObjectURL(roughUrl);
                        URL.revokeObjectURL(metaUrl);
                        URL.revokeObjectURL(aoUrl);


                    }



                },
                (xhr) => {
                    // progressBar.style.width = overallProgress + '%';
                    // loadingTxtDiv.innerText = 'LOADING MODEL (' + overallProgress + '%)';
                    // fileTxtDiv.innerText = resourceName;
                    if (xhr.lengthComputable) {
                        modelProgress = xhr.loaded / xhr.total;
                        if(xhr.loaded === xhr.total){
                            modelLoadComplate = true;
                        }


                        //updateProgress(fileName);

                        //updateModelProgress(modelProgress, fileName);
                    }

                }, (error) => {
                    console.log('Error loading '+ fileName + 'error : '+ error);
                }
            );
        }catch (error){
            console.error('An error occurred during model loading:', error);
        }


    }



    const getModelResource = await function (fileName, clrcsId, prdctSn){

        return fetch(apiUrl+'/download', {
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

    function rotateModel(model, angle) {
        model.rotation.y += angle; // Y축을 중심으로 모델 회전
    }

    const animate= function () {
        //stats.update();
        controls.update();
        requestAnimationFrame(animate);

        if (scene.children.length > 1) { // 모델이 씬에 추가된 후 회전 시작
            rotateModel(scene.children[1], 0.008); // scene.children[1]는 로드된 모델을 가정
        }

        renderer.render(scene, camera);
    }




    const exportGlb = function (){
        const exporter = new GLTFExporter();
        exporter.parseAsync(scene, glb=> {
            const blob = new Blob([glb], {type: 'model/gltf-binary'});
            const url = URL.createObjectURL(blob);

            // 다운로드 링크 생성 및 실행
            const link = document.createElement('a');
            link.style.display = 'none';
            link.href = url;
            link.download = 'scene.glb';
            document.body.appendChild(link);
            link.click();

            // 정리
            document.body.removeChild(link);
            URL.revokeObjectURL(url);
        }, { binary: true });

    }




    window.viewInit = viewInit;
    window.load3dModels = loadModels;
    window.viewAnimate = animate;
    window.exportGlb = exportGlb;

</script>


<script>
    let viewer;
    let inputFiles = [];
    let fileCount = 0;

    document.addEventListener('DOMContentLoaded', async function() {
        console.log("DOMContentLoaded");

        admin.init();

        //품질검사 탭 조회
        selectPrdctQltInspInfoList();
        var dataTypeCtgryNm = '${dgtlClrcsInfo.dataTypeCtgryNm}';

        if (dataTypeCtgryNm.includes('3D')) {
            document.getElementById('noData').style.display = "none";
            document.getElementById('qltArea').style.display = "";
        } else {
            document.getElementById('noData').style.display = "";
            document.getElementById('qltArea').style.display = "none";
        }

        //리뷰조회
        funRvList();
        //QNA조회
        funQnaList();
        // 전체 파일 사이즈 계산
        renderTotalFileSizeMbAndFlCount();

    });

    const fileDownload = async function (clrcsId, type, prdctSn, fileName,prdctTypeCd
        , imgWdthLng, imgHghtLng, bitLvlCd, vdoStreLng, fileSz,event, action) {
        console.log("fileDownload");

        console.log(prdctTypeCd);

        const dl = document.getElementById('productDetails');
        dl.innerHTML = ''; // 기존 내용을 초기화
        fileSz = (fileSz / (1024 * 1024)).toFixed(2) + ' MB'

        //파일명에서 확장자를 확인하여 이미지인지 아닌지 확인
        var ext = fileName.split('.').pop();
        if(ext === 'jpg' || ext === 'png' || ext === 'gif' || ext === 'bmp' || ext === 'jpeg') {

            //이미지일 경우
            var imgURL =  await cmmn_fileStream(clrcsId, type, prdctSn, 'contentsViewer');

            var container = document.getElementById('contentsViewer');
            while (container.hasChildNodes()) {
                container.removeChild(container.firstChild);
            }
            container.style.display='flex';
            container.style.flexDirection='column';
            container.style.alignItems='center';
            container.style.height='100%';
            var img = document.createElement('img');
            img.src = imgURL;
            container.appendChild(img);

            dl.innerHTML = `
				<dt>파일명</dt>
				<dd>\${fileName}</dd>
				<dt>사진크기</dt>
				<dd>\${imgWdthLng} X \${imgHghtLng}</dd>
				<dt>비트 수준</dt>
				<dd>\${bitLvlCd}</dd>
				<dt>파일 크기</dt>
				<dd>\${fileSz}</dd>
			`;

        }else if (prdctTypeCd === 'D04' && (ext === 'mp3' || ext === 'mp4' ||ext === 'wav' || ext === 'aac' || ext === 'pcm')){

            const contentsViewer = document.getElementById('contentsViewer');

            while (contentsViewer.hasChildNodes()) {
                contentsViewer.removeChild(contentsViewer.firstChild);
            }

            contentsViewer.style.display='flex';
            contentsViewer.style.flexDirection='column';
            contentsViewer.style.alignItems='center';
            contentsViewer.style.height='100%';

            // 오디오 태그 생성
            const audioElement = document.createElement('audio');
            audioElement.id = 'audioPlayer';
            audioElement.controls = true;
            audioElement.controlsList = 'nodownload';
            audioElement.style.width = '100%';

            // 캔버스 태그 생성
            const canvasElement = document.createElement('canvas');
            canvasElement.id = 'audioCanvas';
            canvasElement.width = contentsViewer.offsetWidth; // contentsViewer의 너비에 맞게 설정
            canvasElement.height = 300; // 적당한 높이 설정
            canvasElement.style.backgroundColor = '#333';

            // contentsViewer div에 오디오 및 캔버스 태그 추가

            contentsViewer.appendChild(canvasElement);
            contentsViewer.appendChild(audioElement);

            // 이후 코드는 오디오 및 캔버스 요소를 사용하여 Web Audio API와 연동
            // let audioCtx;
            //
            // if('webkitAudioContext' in window) {
            //     audioCtx = new webkitAudioContext();
            //
            // }else {
            //     audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            // }


            const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            let sourceNode = audioCtx.createMediaElementSource(audioElement);
            let analyser = audioCtx.createAnalyser();
            sourceNode.connect(analyser);
            analyser.connect(audioCtx.destination);

            // Load your audio file
            // audioElement.src = await cmmn_fileStream(clrcsId, type, prdctSn, 'contentsViewer');
            audioElement.crossOrigin = 'anonymous'
            audioElement.src =apiUrl + '/region/'+clrcsId+'/'+prdctSn+'';
            // audioElement.src ='http://14.63.58.81:5005/api/tus/file/region/'+clrcsId+'/'+prdctSn+'';






            function draw() {
                const canvas = document.getElementById('audioCanvas');
                const canvasCtx = canvas.getContext('2d');
                const width = canvas.width;
                const height = canvas.height;
                const bufferLength = analyser.frequencyBinCount; // FFT bins의 개수
                const dataArray = new Uint8Array(bufferLength);
                analyser.fftSize = 256; // FFT 사이즈 설정 (예: 256)


                requestAnimationFrame(draw);
                analyser.getByteFrequencyData(dataArray); // 주파수 데이터 얻기

                canvasCtx.fillStyle = 'rgb(0, 0, 0)';
                canvasCtx.fillRect(0, 0, width, height);

                const barWidth = (width / bufferLength) * 2.5; // 막대의 너비
                //const barWidth = (width / bufferLength) * 5; // 막대의 너비
                let barHeight;
                let x = 0;

                for (let i = 0; i < bufferLength; i++) {
                    barHeight = dataArray[i];
                    //canvasCtx.fillStyle = 'rgb(' + (barHeight+100) + ',50,50)';
                    canvasCtx.fillStyle = 'rgb(' + (barHeight+100) + ',200,100)';
                    canvasCtx.fillRect(x, height - barHeight / 2, barWidth, barHeight / 2);
                    // canvasCtx.fillRect(x, height - barHeight / 2, barWidth, barHeight / 2);
                    x += barWidth + 1; // 막대 사이의 간격
                }

            }
            audioElement.onplay = () => {
                if(audioCtx.state === 'suspended') {
                    audioCtx.resume();
                }
                draw();
            };

            dl.innerHTML = `
				<dt>파일명</dt>
				<dd>\${fileName}</dd>
				<dt>재생길이</dt>
				<dd>\${vdoStreLng}초</dd>
				<dt>파일 크기</dt>
				<dd>\${fileSz}</dd>`;

        }else if(prdctTypeCd === 'D02' && (ext === 'mp4' || ext === 'mov' )){
            var container = document.getElementById('contentsViewer');

            while (container.hasChildNodes()) {
                container.removeChild(container.firstChild);
            }
            container.style.display='flex';
            container.style.flexDirection='column';
            container.style.alignItems='center';
            container.style.height='100%';


            const video = document.createElement('video');
            video.controls= true;
            video.controlsList = 'nodownload';

            const source = document.createElement('source');
            video.src = apiUrl + '/region/'+clrcsId+'/'+prdctSn+'';
            video.type = 'video/mp4';
            video.style.width = '100%';
            video.appendChild(source);

            container.appendChild(video);

            dl.innerHTML = `
				<dt>파일명</dt>
				<dd>\${fileName}</dd>
				<dt>화면크기</dt>
				<dd>\${imgWdthLng} X \${imgHghtLng}</dd>
				<dt>재생길이</dt>
				<dd>\${vdoStreLng}초</dd>
				<dt>파일 크기</dt>
				<dd>\${fileSz}</dd>`;

        }else if(ext === 'fbx' || ext === 'obj' || ext === 'stl' || ext === 'glb' || ext === 'ply' ){
            let targetFiles = [];




            await axios.post("<c:out value='${fileUrl}'/>" + '/txtInfo', {
                clrcsId: clrcsId,
                prdctSn: prdctSn
            }).then(function (response) {
                if (response.data.length > 0) {
                    response.data.forEach(file => {
                        targetFiles.push({name : file.fileNm, prdctSn: file.prdctSn});
                    });
                }
            }).catch(function (error) {
                console.error(error);
            });


            if(action == 'add'){
                await window.load3dModels(clrcsId, prdctSn, fileName, targetFiles, action);
                window.viewAnimate();
            }else {
                var container = document.getElementById('contentsViewer');
                // container.style.width = 600;
                // container.style.height = 500;

                while (container.hasChildNodes()) {
                    container.removeChild(container.firstChild);
                }


                window.viewInit('contentsViewer');
                await window.load3dModels(clrcsId, prdctSn, fileName, targetFiles, action);
                window.viewAnimate();
            }




            dl.innerHTML = `
				<dt>파일명</dt>
				<dd>\${fileName}</dd>
				<dt>파일 크기</dt>
				<dd>\${fileSz}</dd>`;

        }
        else {
            alert('해당파일 지원은 준비중입니다.')
        }



    }

    async function getNewOneResource(url, clrcsId, prdctSn, type) {
        try {
            const response = await fetch("<c:out value='${fileUrl}'/>" + '/region', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    clrcsId: clrcsId,
                    prdctSn: prdctSn,
                    type: type
                }),
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const blob = await response.blob();
            return window.URL.createObjectURL(blob);
        } catch (error) {
            console.error("Download Error:", error);
            return null;
        }
    }

    const modalsShow = function(id) {
        var name_id = document.getElementById(id),
            html = document.documentElement,
            body = document.body,
            htmlScrollTop = window.scrollY || html.scrollTop;

        // 스크롤 방지 및 모달 활성화
        body.style.overflow = 'hidden';
        body.style.position = 'fixed';
        body.style.height = '100%';
        name_id.classList.add('on');

        setTimeout(() => {
            name_id.classList.add('show');
        }, 100);



        const closeBtn = document.getElementById('mdClsBtn');
        // 모달 닫기 버튼 이벤트 리스너
        closeBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();

            // 스타일 및 모달 비활성화
            body.style.overflow = '';
            body.style.position = '';
            body.style.height = '';
            name_id.classList.remove('show');
            document.getElementById('downloadProgress').value = 0;
            document.getElementById('progressText').value = '다운로드 준비중';

            setTimeout(() => {
                name_id.classList.remove('on');
            }, 500);


            // 이전 스크롤 위치로 복귀
            window.scrollTo(0, htmlScrollTop);
        });
    };


    const goModify = function(clrcsId) {
        // location.href = '/admin/dgtlclrcs/modify?clrcsId=' + clrcsId;
        document.getElementById('frmDgtlClrcsSrch').enctype = 'multipart/form-data';

        document.getElementById('srchPageModeVal').value = 'modify';
        document.getElementById('srchSaveModeVal').value = '';

        document.getElementById('clrcsId').value = clrcsId;
        document.getElementById('frmDgtlClrcsSrch').action = contextPath +'/dgtlMgt/dgtlMgtReg.do';
        document.getElementById('frmDgtlClrcsSrch').submit();
    }

    const glbDownload = function (){
        const container = document.getElementById('contentsViewer');
        const canvas = container.querySelector('canvas');

        window.exportGlb(canvas);
    }

    //산출물품질검사정보 조회
    const selectPrdctQltInspInfoList = function (){
        var clrcsId = '${dgtlClrcsInfo.clrcsId}';
        axios.post(contextPath +'/dgtlMgt/selectPrdctQltInspInfoList.do',{
            clrcsId: clrcsId
        }).then(function (response) {

            if (response.status === 200) {
                if(response.data.resultCode == 200){

                    var rowCnt = response.data.resultData.length;
                    document.getElementById('qltList').innerHTML = '';

                    if(rowCnt > 0){
                        //document.getElementById('qltProc').style.display = "none";
                        document.getElementById('rowCnt').innerHTML = rowCnt;
                    }else{
                        document.getElementById('rowCnt').innerHTML = '0';

                        var rowHtml = '<tr><td colspan="7">조회된 데이터가 없습니다.</td></tr>';
                        const tableBody = document.getElementById('qltList');
                        tableBody.innerHTML += rowHtml;
                        return;
                    }

                    let seqNo = 1;
                    for (const item of response.data.resultData) {
                        var rowHtml = '<tr><td>'+seqNo+'</td>' +
                            '<td>' + item.fileNm + '</td>' +
                            '<td>' + item.fileExtn + '</td>' +
                            '<td><span class="tag">'+ item.artclStbltVal1+'</span></td>' +
                            '<td><span class="tag">'+ item.artclStbltVal2+'</span></td>' +
                            '<td><span class="tag">'+ item.artclStbltVal3+'</span></td>' +
                            '<td>' +
                            '<button type="button" class="btn-acctoggle" id="btnToggle_'+seqNo+'" onClick="toggleDetails('+seqNo+')">자세히</button>' +
                            '</td></tr>' +
                            '<tr class="acc-ele" id="dtlView_'+seqNo+'" style="display:none">' +
                            '<td colspan="7">' +
                            '	<table>' +
                            '		<colgroup>' +
                            '			<col width="30%"/><col width="*"/>' +
                            '		</colgroup>' +
                            '		<tr>' +
                            '			<th>측정수치</th>' +
                            '			<td>'+ item.msrmtVal1+'MB</td>' +
                            '			<td>'+ item.msrmtVal2+'개</td>' +
                            '			<td>'+ item.msrmtVal3+'개</td>' +
                            '			<td></td>' +
                            '		</tr>' +
                            '		<tr>' +
                            '			<th>판정기준</th>' +
                            '			<td>'+ item.jgmtCrtrVal1+'MB '+item.jgmtCrtrTypeVal1+'</td>' +
                            '			<td>'+ item.jgmtCrtrVal2+'개 '+item.jgmtCrtrTypeVal2+'</td>' +
                            '			<td>'+ item.jgmtCrtrVal3+'개 '+item.jgmtCrtrTypeVal3+'</td>' +
                            '			<td></td>' +
                            '		</tr>' +
                            '	</table>' +
                            '</td>' +
                            '</tr>';
                        const tableBody = document.getElementById('qltList');
                        tableBody.innerHTML += rowHtml;
                        seqNo++;
                    }
                }else{
                    alert(response.data.resultData);
                }
            }
        }).catch(function (error) {
            console.error(error);
        });
    }

    const toggleDetails = function(seqNo){
        var detailsElement = document.getElementById('dtlView_' + seqNo);
        var buttonElement = document.getElementById('btnToggle_' + seqNo);

        if (detailsElement.style.display == 'none') {
            // 토글: 세부 정보 보이기
            detailsElement.style.display = 'table-row';
            buttonElement.textContent = '닫기';
        } else {
            // 토글: 세부 정보 감추기
            detailsElement.style.display = 'none';
            buttonElement.textContent = '자세히';
        }
    }

    //산출물품질검사정보 등록
    const insertPrdctQltInspInfo = function (){

        if(!confirm('산출물 품질검사를 수행하시겠습니까?')) return;

        var clrcsId = '${dgtlClrcsInfo.clrcsId}';
        axios.post(contextPath +'/dgtlMgt/insertPrdctQltInspInfo.do',{
            clrcsId: clrcsId
        }).then(function (response) {
            if (response.status === 200) {
                if(response.data.resultCode == 200){
                    var regCnt = response.data.resultData;
                    if(regCnt > 0){
                        alert("품질검사 데이터가 생성되었습니다.");
                        //산출물품질검사정보 조회
                        selectPrdctQltInspInfoList();
                    }else{
                        alert("생성될 파일 데이터가 없습니다.");
                    }
                }else{
                    alert(response.data.resultData);
                }
            }
        }).catch(function (error) {
            console.error(error);
        });
    }

    const goBack = function (){
        window.history.back();
    }

    //리뷰 선택한 페이징으로 이동
    function moveRvListPageNo(paramDataInt) {
        let frm = document.frmReview;
        frm.rvPageNo.value = paramDataInt;
        funRvList();
    }

    //리뷰 이전페이지
    function moveRvListPrevPage() {
        let frm = document.frmReview;
        let nowPageNo = parseInt(frm.rvPageNo.value, 10);
        let movePageNo = nowPageNo - 1;
        if (movePageNo <= 0) {
            window.alert("이동할 이전 페이지가 존재하지 않습니다.");
            return false;
        } else {
            moveRvListPageNo(movePageNo);
        }
    }

    //리뷰 다음페이지
    function moveRvListNextPage() {
        let frm = document.frmReview;
        let maxPageNo = parseInt(frm.rvPageMaxNo.value, 10);
        let nowPageNo = parseInt(frm.rvPageNo.value, 10);
        if (nowPageNo == maxPageNo) {
            window.alert("이동할 다음 페이지가 존재하지 않습니다.");
            return false;
        } else {
            let movePageNo = nowPageNo + 1;
            moveRvListPageNo(movePageNo);
        }
    }

    // 리뷰목록 조회
    function funRvList(){
        var clrcsId = '${dgtlClrcsInfo.clrcsId}';
        var paramPageNo = $('#rvPageNo').val();//페이징 - 현재페이지
        var paramSrchSortType = $('#srchRvSortType').val();
        var paramSrchTngScr = $('#srchTngScr').val();

        var queryString = "lnkgContsId=" + clrcsId+
            "&paramPageNo=" + paramPageNo+
            "&paramSrchSortType=" + paramSrchSortType+
            "&paramSrchTngScr=" + paramSrchTngScr;
        //리뷰 탭 조회
        $("#rvList").load("<c:url value='/dgtlMgt/selectDgtlDtlRvList.do'/>" + "?"+queryString);
    }

    //리뷰 상단 세렉트 조건
    function funChgSrchRvItem(){
        $('#rvPageNo').val(1);
        funRvList();
    }

    //QNA 선택한 페이징으로 이동
    function moveQnaListPageNo(paramDataInt) {
        let frm = document.frmQna;
        frm.qnaPageNo.value = paramDataInt;
        funQnaList();
    }

    //QNA 이전페이지
    function moveQnaListPrevPage() {
        let frm = document.frmQna;
        let nowPageNo = parseInt(frm.qnaPageNo.value, 10);
        let movePageNo = nowPageNo - 1;
        if (movePageNo <= 0) {
            window.alert("이동할 이전 페이지가 존재하지 않습니다.");
            return false;
        } else {
            moveQnaListPageNo(movePageNo);
        }
    }

    //QNA 다음페이지
    function moveQnaListNextPage() {
        let frm = document.frmQna;
        let maxPageNo = parseInt(frm.qnaPageMaxNo.value, 10);
        let nowPageNo = parseInt(frm.qnaPageNo.value, 10);
        if (nowPageNo == maxPageNo) {
            window.alert("이동할 다음 페이지가 존재하지 않습니다.");
            return false;
        } else {
            let movePageNo = nowPageNo + 1;
            moveQnaListPageNo(movePageNo);
        }
    }

    //QNA 목록 조회
    function funQnaList(){
        var clrcsId = '${dgtlClrcsInfo.clrcsId}';
        var paramPageNo = $('#qnaPageNo').val();//페이징 - 현재페이지
        var paramSrchSortType = $('#srchQnaSortType').val();

        var queryString = "lnkgContsId=" + clrcsId+
            "&paramPageNo=" + paramPageNo+
            "&paramSrchSortType=" + paramSrchSortType;
        //QNA 탭 조회
        $("#qnaList").load("<c:url value='/dgtlMgt/selectDgtlDtlQnaList.do'/>" + "?"+queryString);
    }

    //QNA 상단 세렉트 조건
    function funChgSrchQnaItem(){
        $('#qnaPageNo').val(1);
        funQnaList();
    }
    const renderTotalFileSizeMbAndFlCount = function(){
        let finalInfoFileSizesMB = [];
        let stepInfoFileSizesMB = [];
        let finalInfoDrCount = 0;
        let stepInfoDrCount = 0;

        <c:forEach var="item" items="${dgtlClrcsPrdFinalInfo}">
        finalInfoFileSizesMB.push(${item.fileSz} / (1024 * 1024));
        <c:if test="${item.fileType eq 'FL'}">
        finalInfoDrCount++;
        </c:if>
        </c:forEach>

        <c:forEach var="item" items="${dgtlClrcsPrdStepInfo}">
        stepInfoFileSizesMB.push(${item.fileSz} / (1024 * 1024));
        <c:if test="${item.fileType eq 'FL'}">
        stepInfoDrCount++;
        </c:if>
        </c:forEach>

        let totalSizeMB = 0;
        let totalDrCount = finalInfoDrCount + stepInfoDrCount;
        totalSizeMB += finalInfoFileSizesMB.reduce((sum, size) => sum + size, 0);
        totalSizeMB += stepInfoFileSizesMB.reduce((sum, size) => sum + size, 0);
        totalSizeMB = totalSizeMB.toFixed(2);

        document.getElementById('totalFileSize').textContent = totalSizeMB + " MB";
        document.getElementById('drTypeCount').textContent = totalDrCount;
    }
</script>