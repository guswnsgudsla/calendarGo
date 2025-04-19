const baseUrl = 'http://14.63.58.81:5005/api/tus/file/';

const  reqFileInfo = function (clrcsId) {
    return new Promise((resolve, reject) => {
        const fileInfoUrl = baseUrl + 'info';
        $.ajax({
            url: fileInfoUrl,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                clrcsId : clrcsId
            }),
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            }
        });
    });
}
const  reqFileDownload = function(fileName, clrcsId, prdctSn, inputFiles){
    const fileDownloadUrl = baseUrl + 'download';
    getResource(fileDownloadUrl, fileName, clrcsId, prdctSn).then(data => {
        if(!data){
            fileCount--;
            console.error('file download failed');
            return;
        }
        const blob = new Blob([data]);
        const file = new File([blob], fileName);
        inputFiles.push(new OV.InputFile(file.name, 2, file));
        fileCount--;
        if(fileCount === 0){
            viewer.LoadModelFromInputFiles(inputFiles);
        }
    });
}


const filterObjFileInfo = function(fileList) {
    return fileList.filter(file => {
        return file.orgDirNm.includes('/Fbx') && (file.prdctNm.includes('.fbx'));

        //return file.orgDirNm === '3DAsset/Fbx' && (file.prdctNm.includes('.fbx'));
        // return file.orgDirNm === '3D_Conversion/Obj' && (file.prdctNm.includes('.obj') || file.prdctNm.includes('.mtl'));
    });
}
const filterTextureFileInfo = function(fileList) {
    return fileList.filter(file => {

        return file.orgDirNm.includes('/Texture') && file.fileSz > 0;
        //return file.orgDirNm === '3DAsset/Fbx/Texture' && file.fileSz > 0;
        // return file.orgDirNm === '3D_Conversion/Texture' && file.fileSz > 0;
    });
}


const getResource = function (url, fileName, clrcsId, prdctSn){

    return fetch(url, {
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
//
// // <script type="importmap">
// //     {
// //         "imports": {
// //         "three" : "/js/lib/three.module.min.js",
// //         "three/addons/" : "/js/lib/jsm/"
// //
// //     }
// //     }
// //
// // </script>
// import  * as THREE from 'three';
// import {OrbitControls} from "/js/lib/jsm/controls/OrbitControls.js";
// import {FBXLoader} from "three/addons/loaders/FBXLoader.js";
// import {OBJLoader} from "three/addons/loaders/OBJLoader.js";
// import {GLTFLoader} from "three/addons/loaders/GLTFLoader.js";
// import {RGBMLoader} from "three/addons/loaders/RGBMLoader.js";
//
// let container, stats;
// let camera, scene, renderer, controls;
//
// const apiUrl = 'http://14.63.58.81:5005/api/tus/file/download';
//
//
// export const viewInit = function (elementId){
//     //3D 생성할 DIV
//     container = document.getElementById(elementId);
//
//     //Scene 설정
//     scene = new THREE.Scene();
//
//     //카메라 설정
//     camera =new THREE.PerspectiveCamera(27, container.width / container.height, 5, 3500);
//     camera.position.set(0,0,5);
//
//     //렌더러 설정
//     renderer = new THREE.WebGL1Renderer(container.width, container.height);
//     container.appendChild(renderer.domElement);
//
//     //컨트롤 설정
//     controls = new OrbitControls(camera, renderer.domElement);
//     controls.rotateSpeed = 1.0;
//     controls.zoomSpeed = 1.2;
//     controls.panSpeed = 0.8;
//     controls.minDistance = 10;
//     controls.maxDistance = 1000;
//     controls.update();
// }
//
// /**
//  *
//  * @param clrcsId
//  * @param prdctSn
//  * @param fileName
//  * @param textureFiles
//  * @returns {Promise<void>}
//  */
// export const loadModels = async function(clrcsId, prdctSn, fileName, textureFiles){
//     //파일의 산출물 정보를 조회한다.
//     var ext = fileName.split('.').pop();
//
//     //파일 포멧에 따른 Loader 호출
//     if(ext === 'fbx'){
//         //FBX일 경우 FBX LOADER 호출
//         fbxModelLoader(clrcsId, prdctSn, textureFiles);
//
//     }else if(ext === 'obj'){
//         //OBJ일 경우 OBJ LOADER 호출
//
//     }
//
// }
//
//
// //FBX 로더
// const fbxModelLoader = async function(clrcsId, prdctSn, textureFiles){
//     // fbx모델 Texture 설정
//     const textureLoader = new THREE.TextureLoader();
//     const loader = new FBXLoader();
//
//     let baseColor, normal, rough, ao, meta;
//
//     try{
//         textureFiles.forEach( item => {
//             if(item.name.contains('BC')){
//                 baseColor = textureLoader.load(getModelResource(clrcsId, item.prdctSn));
//             }else if(item.name.contains('NM')){
//                 normal = textureLoader.load(getModelResource(clrcsId, item.prdctSn));
//             }else if(item.name.contains('RN')){
//                 rough = textureLoader.load(getModelResource(clrcsId, item.prdctSn));
//             }else if(item.name.contains('AO')){
//                 ao = textureLoader.load(getModelResource(clrcsId, item.prdctSn));
//             }else {
//                 meta = textureLoader.load(getModelResource(clrcsId, item.prdctSn));
//             }
//         });
//
//         const fbxUrl = await getModelResource(clrcsId, prdctSn);
//         const fbxModel = await new Promise((resolve, reject) => {
//             loader.load(fbxUrl, object => resolve(fbxUrl), null, reject);
//         });
//
//         fbxModel.traverse(function (child){
//             if(child.isMesh){
//                 child.material.map = baseColor;
//                 child.material.normalMap = normal;
//                 child.material.aoMap = ao;
//                 child.material.roughness = rough;
//             }
//         });
//
//         scene.add(fbxModel);
//     }catch (error){
//         console.error('An error occurred during model loading:', error);
//     }
// }
//
// //OBJ 로더
// const objModelLoader = async function(clrcsId){
//
// }
//
// //GLTF 로더
// const gltfModelLoader = async  function(clrcsId){
//
// }
//
//
// const getModelResource = async function(clrcsId, prdctSn){
//     const response = await fetch(apiUrl, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify({
//             clrcsId : clrcsId,
//             prdctSn : prdctSn,
//             type: 'selectOne'
//         })
//     });
//     if(!response.ok){
//         throw new Error(`HTTP error! status: ${response.status}`);
//     }
//     return window.URL.createObjectURL(await response.blob());
// }
//
