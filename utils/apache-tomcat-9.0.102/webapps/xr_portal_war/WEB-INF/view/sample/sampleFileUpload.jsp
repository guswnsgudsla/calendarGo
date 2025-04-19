<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
</head>
<body>
    <form id="form" name="form" method="post" enctype="multipart/form-data">
        <input type="text"   id="content"   name="content"   value="Content" />
        <input type="file"   id="files"     name="files"     multiple="multiple" /> 
        <input type="button" id="btnSubmit" name="btnSubmit" value="업로드" />
        <input type="hidden" id="atchFileGroupId" name="atchFileGroupId" value="" />
    </form>
</body>
<script>
$(document).ready(function () {
	$('#btnSubmit').click(function (event) {
        event.preventDefault();
        
        var form = $('#form')[0];
        var formData = new FormData(form);
        $('#btnSubmit').prop('disabled', true);

        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: "<c:url value='/cmmn/uploadFile.do'/>",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                //$('#result').text(data);
                console.log('SUCCESS : ', data);
                $('#btnSubmit').prop('disabled', false);
                $('#files').val("");
                $('#atchFileGroupId').val("");
            },
            error: function (e) {
                //$('#result').text(e.responseText);
                console.log('ERROR : ', e);
                $('#btnSubmit').prop('disabled', false);
            }
        });
        
    });
});
</script>
</html>