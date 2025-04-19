<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>tus-js-client demo - File Upload</title>
	<link
			href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css"
			rel="stylesheet"
	/>
	<link href="../../css/demo.css" rel="stylesheet" media="screen" />


<%--	<script src="../../js/demo.js"></script>--%>


</head>
<body>
<div class="container">
	<h1>tus-js-client demo - File Upload ${pageContext.request.contextPath}</h1>

	<p>
		This demo shows the basic functionality of the tus protocol. You can select a file using the
		controls below and start/pause the upload as you wish.
	</p>

	<p>
		For a prettier demo please go to the
		<a href="http://tus.io/demo.html">tus.io</a> website. This demo is just here to aid
		developers.
	</p>

	<p>
		A demo where a video is recorded from your webcam while being simultaneously uploaded, can
		be found <a href="./video.html">here</a>.
	</p>

	<div class="alert alert-warining hidden" id="support-alert">
		<b>Warning!</b> Your browser does not seem to support the features necessary to run
		tus-js-client. The buttons below may work but probably will fail silently.
	</div>

	<br />

	<table>
		<tr>
			<td>
				<label for="endpoint"> Upload endpoint: </label>
			</td>
			<td>
				<input
						type="text"
						id="endpoint"
						name="endpoint"
<%--						value="http://localhost:3000/uploads"--%>
						value="http://localhost:1080/files"
				/>
			</td>
		</tr>
		<tr>
			<td>
				<label for="chunksize"> Chunk size (bytes): </label>
			</td>
			<td>
				<input type="number" id="chunksize" name="chunksize" />
			</td>
		</tr>
		<tr>
			<td>
				<label for="paralleluploads"> Parallel upload requests: </label>
			</td>
			<td>
				<input type="number" id="paralleluploads" name="paralleluploads" value="1" />
			</td>
		</tr>
	</table>

	<br />

	<input type="file" />

	<br />
	<br />

	<div class="row">
		<div class="span8">
			<div class="progress progress-striped progress-success">
				<div class="bar" style="width: 0%"></div>
			</div>
		</div>
		<div class="span4">
			<button class="btn stop" id="toggle-btn">start upload</button>
		</div>
	</div>

	<hr />
	<h3>Uploads</h3>
	<p id="upload-list">Succesful uploads will be listed here. Try one!</p>
</div>
</body>

<%--<script src="../../dist/tus.js"></script>--%>

<%--<script src="demo.js"></script>--%>
<script src="../../js/lib/tus.js"></script>
<script type="text/javascript">


    let upload = null
    let uploadIsRunning = false
    const toggleBtn = document.querySelector('#toggle-btn')
    const input = document.querySelector('input[type=file]')
    const progress = document.querySelector('.progress')
    const progressBar = document.querySelector('.bar')
    const alertBox = document.querySelector('#support-alert')
    const uploadList = document.querySelector('#upload-list')
    const chunkInput = document.querySelector('#chunksize')
    const parallelInput = document.querySelector('#paralleluploads')
    const endpointInput = document.querySelector('#endpoint')

    function reset() {
        input.value = ''
        toggleBtn.textContent = 'start upload'
        upload = null
        uploadIsRunning = false
    }

    function askToResumeUpload(previousUploads, currentUpload) {
        if (previousUploads.length === 0) return

        let text = 'You tried to upload this file previously at these times:\n\n'
        previousUploads.forEach((previousUpload, index) => {
            text += `[${index}] ${previousUpload.creationTime}\n`
        })
        text +=
            '\nEnter the corresponding number to resume an upload or press Cancel to start a new upload'

        const answer = prompt(text)
        const index = parseInt(answer, 10)

        if (!Number.isNaN(index) && previousUploads[index]) {
            currentUpload.resumeFromPreviousUpload(previousUploads[index])
        }
    }

    function startUpload() {
        const file = input.files[0]
        // Only continue if a file has actually been selected.
        // IE will trigger a change event even if we reset the input element
        // using reset() and we do not want to blow up later.
        if (!file) {
            return
        }

        const endpoint = endpointInput.value
        let chunkSize = parseInt(chunkInput.value, 10)
        if (Number.isNaN(chunkSize)) {
            chunkSize = Infinity
        }

        let parallelUploads = parseInt(parallelInput.value, 10)
        if (Number.isNaN(parallelUploads)) {
            parallelUploads = 1
        }

        toggleBtn.textContent = 'pause upload'

        const options = {
            endpoint,
            chunkSize,
            retryDelays: [0, 1000, 3000, 5000],
            parallelUploads,
            metadata: {
                filename: file.name,
                filetype: file.type,
            },
            onError(error) {
                if (error.originalRequest) {
                    if (window.confirm(`Failed because: ${error}\nDo you want to retry?`)) {
                        upload.start()
                        uploadIsRunning = true
                        return
                    }
                } else {
                    window.alert(`Failed because: ${error}`)
                }

                reset()
            },
            onProgress(bytesUploaded, bytesTotal) {
                const percentage = ((bytesUploaded / bytesTotal) * 100).toFixed(2)
                progressBar.style.width = `${percentage}%`
                console.log(bytesUploaded, bytesTotal, `${percentage}%`)
            },
            onSuccess() {
                const anchor = document.createElement('a')
                anchor.textContent = `Download ${upload.file.name} (${upload.file.size} bytes)`
                anchor.href = upload.url
                anchor.className = 'btn btn-success'
                uploadList.appendChild(anchor)

                reset()
            },
        }

        upload = new tus.Upload(file, options)
        upload.findPreviousUploads().then((previousUploads) => {
            askToResumeUpload(previousUploads, upload)

            upload.start()
            uploadIsRunning = true
        })
    }

    if (!tus.isSupported) {
        alertBox.classList.remove('hidden')
    }

    if (!toggleBtn) {
        console.log('Toggle button not found on this page. Aborting upload-demo. ');
        throw new Error('Toggle button not found on this page. Aborting upload-demo. ')
    }

    toggleBtn.addEventListener('click', (e) => {
        e.preventDefault()

        if (upload) {
            if (uploadIsRunning) {
                upload.abort()
                toggleBtn.textContent = 'resume upload'
                uploadIsRunning = false
            } else {
                upload.start()
                toggleBtn.textContent = 'pause upload'
                uploadIsRunning = true
            }
        } else if (input.files.length > 0) {
            startUpload()
        } else {
            input.click()
        }
    })

    input.addEventListener('change', startUpload)
</script>

</html>