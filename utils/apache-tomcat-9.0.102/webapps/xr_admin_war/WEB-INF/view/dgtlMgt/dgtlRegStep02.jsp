<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 업로드 시작 전 -->
<div class="uploadbox mt20" id="dropArea">
<c:if test="${empty dgtlClrcsPrdFinalInfo}">
    <strong>디지털문화자원<br />파일이 등록되지 않았습니다.</strong>
    <p>파일을 드래그 및 업로드 버튼을 이용하여 업로드 하여 주시기 바랍니다.</p>
</c:if>
<c:if test="${!empty dgtlClrcsPrdFinalInfo}">
    <strong>디지털문화자원<br />파일이 등록되어있습니다.</strong>
    <p>파일을 다시 업로드 하시려면 파일 선택후 업로드 하여 주시기 바랍니다.</p>
</c:if>
</div>
<!-- //업로드 시작 전 -->
<div class="btn-wrap between">
    <div>
    <c:if test="${!empty dgtlClrcsPrdFinalInfo}">
        <button type="button" class="btns small color-orange" onclick="convertFile();">파일 변환 요청</button>
    </c:if>
        <button type="button" class="btns small color-orange" onclick="">파일 업로드 가이드</button>
    </div>
    <div>
        <label for="file">
            <div class="btns">파일선택</div>
        </label>
        <input type="file" id="file" name="file" style="display: none">
        <button id="uploadFile" type="button" class="btns small">업로드</button>
    </div>
</div>
<!-- 업로드 완료 후 노출 -->
<c:if test="${!empty dgtlClrcsPrdFinalInfo}">
    <div class="write-wrap" id="file-info-display">
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
                            <li><c:forEach begin="2" end="${finalPrdctRow.lvl}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                                <p class="folder"><c:out value='${finalPrdctRow.prdctNm}'/></p>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><c:forEach begin="2" end="${finalPrdctRow.lvl}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                                <p onClick="fileDownload('<c:out value='${finalPrdctRow.clrcsId}'/>', 'selectOne', '<c:out value='${finalPrdctRow.prdctSn}'/>', '<c:out value='${finalPrdctRow.prdctNm}'/>','<c:out value='${finalPrdctRow.prdctTypeCd}'/>'
                                        ,'<c:out value='${finalPrdctRow.imgWdthLng}'/>','<c:out value='${finalPrdctRow.imgHghtLng}'/>','<c:out value='${finalPrdctRow.bitLvlCd}'/>','<c:out value='${finalPrdctRow.vdoStreLng}'/>','<c:out value='${finalPrdctRow.fileSz}'/>', this)" data-value="${finalPrdctRow.prdctSn}"><c:out value='${finalPrdctRow.prdctNm}'/></p>
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
                            <li><c:forEach begin="2" end="${stepPrdctRow.lvl}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                                <p class="folder"><c:out value='${stepPrdctRow.prdctNm}'/></p>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><c:forEach begin="2" end="${stepPrdctRow.lvl}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                                <p onClick="fileDownload('<c:out value='${stepPrdctRow.clrcsId}'/>', 'selectOne', '<c:out value='${stepPrdctRow.prdctSn}'/>', '<c:out value='${stepPrdctRow.prdctNm}'/>', '<c:out value='${stepPrdctRow.prdctTypeCd}'/>',this)" data-value="${stepPrdctRow.prdctSn}"><c:out value='${stepPrdctRow.prdctNm}'/></p>
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
</c:if>

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
    import {FBXLoader} from "three/addons/loaders/FBXLoader.js";
    import {OBJLoader} from "three/addons/loaders/OBJLoader.js";
    import {GLTFLoader} from "three/addons/loaders/GLTFLoader.js";
    import {GLTFExporter} from 'three/addons/exporters/GLTFExporter.js';
    import {STLLoader} from "three/addons/loaders/STLLoader.js";
    import {PLYLoader} from "three/addons/loaders/PLYLoader.js";



    let container, stats;
    let camera, scene, renderer, controls, light;




    const viewInit = function (elementId){





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

        const light1 = new THREE.DirectionalLight( 0xffffff, 1 );
        light1.position.set( 0, 200, 0 );
        scene.add( light1 );

        const light2 = new THREE.DirectionalLight( 0xffffff, 1 );
        light2.position.set( 100, 200, 100 );
        scene.add( light2 );

        const light3 = new THREE.DirectionalLight( 0xffffff, 1 );
        light3.position.set( - 100, - 200, - 100 );
        scene.add( light3 );



    }

    /**
     *
     * @param clrcsId
     * @param prdctSn
     * @param fileName
     * @param textureFiles
     * @returns {Promise<void>}
     */
    const loadModels = async function(clrcsId, prdctSn, fileName, textureFiles){
        await modelLoader(clrcsId, prdctSn, textureFiles, fileName);
    }

    const modelLoader = async function(clrcsId, prdctSn, textureFiles, fileName){
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
                        updateProgress(item.name);
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

                        }else if(ext === 'glb') {
                            scene.add(object.scene);
                            animate();
                        }
                        else {
                            object.traverse(child => {
                                if (child.isMesh) {
                                    if(textureFiles.length > 0){
                                        child.material = metaMaterial;
                                        //child.frustumCulled = false;
                                        child.material.needsUpdate = true;
                                        console.log(child.geometry.attributes.position.count);
                                    }

                                }
                            });

                            scene.add(object);

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

    const getModelResource = await function (fileName, clrcsId, prdctSn){

        return fetch(apiUrl + '/download', {
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

    const animate= function () {
        //stats.update();
        controls.update();
        requestAnimationFrame(animate);
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
    const fileDownload = async function (clrcsId, type, prdctSn, fileName,prdctTypeCd
        , imgWdthLng, imgHghtLng, bitLvlCd, vdoStreLng, fileSz,event) {
        console.log("fileDownload");

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
            const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            let sourceNode = audioCtx.createMediaElementSource(audioElement);
            let analyser = audioCtx.createAnalyser();
            sourceNode.connect(analyser);
            analyser.connect(audioCtx.destination);

            // Load your audio file
            audioElement.src = await cmmn_fileStream(clrcsId, type, prdctSn, 'contentsViewer');


            function draw() {
                const canvas = document.getElementById('audioCanvas');
                const canvasCtx = canvas.getContext('2d');
                const width = canvas.width;
                const height = canvas.height;
                const bufferLength = analyser.frequencyBinCount; // FFT bins의 개수
                const dataArray = new Uint8Array(bufferLength);

                // analyser.fftSize = 256; // FFT 사이즈 설정 (예: 256)
                analyser.fftSize = 256; // FFT 사이즈 설정 (예: 256)

                function draw() {
                    requestAnimationFrame(draw);

                    analyser.getByteFrequencyData(dataArray); // 주파수 데이터 얻기

                    canvasCtx.fillStyle = 'rgb(0, 0, 0)';
                    canvasCtx.fillRect(0, 0, width, height);

                    // const barWidth = (width / bufferLength) * 2.5; // 막대의 너비
                    const barWidth = (width / bufferLength) * 5; // 막대의 너비
                    let barHeight;
                    let x = 100;

                    for (let i = 0; i < bufferLength; i++) {
                        barHeight = dataArray[i];

                        canvasCtx.fillStyle = 'rgb(' + (barHeight+100) + ',50,50)';
                        canvasCtx.fillRect(x, height - barHeight / 2, barWidth, barHeight / 2);

                        x += barWidth + 1; // 막대 사이의 간격
                    }
                }

                draw();

            }

            // Start drawing when the audio starts playing
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



            await axios.post(apiUrl + '/txtInfo', {
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



            var container = document.getElementById('contentsViewer');
            // container.style.width = 600;
            // container.style.height = 500;

            while (container.hasChildNodes()) {
                container.removeChild(container.firstChild);
            }


            window.viewInit('contentsViewer');
            await window.load3dModels(clrcsId, prdctSn, fileName, targetFiles);
            window.viewAnimate();

            dl.innerHTML = `
				<dt>파일명</dt>
				<dd>\${fileName}</dd>
				<dt>파일 크기</dt>
				<dd>\${fileSz}</dd>`;

        }
        else {
            alert('해당파일 지원은 준비중입니다.');
        }
    }
</script>
