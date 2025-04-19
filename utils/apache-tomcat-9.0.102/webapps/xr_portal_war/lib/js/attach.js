var file_box = null;
var index_attach = null;
var url_down = null;
var url_delete = null;

var attach_init = function (file_box, idx_attach, url_down, url_delete) { 
	this.file_box = file_box;
	this.index_attach = idx_attach;
	this.url_down = url_down;
	this.url_delete = url_delete;
}

var file_attach = function(object) {
	var _this = $(object);
	_this.siblings(".fileuploadTxt").text(_this.val().replace(/.*(\/|\\)/, ""));
	file_add();
}

var file_add = function() {	
	var $fileClone = $("input[name='fileClone']").clone()
												.attr("id","multiple_attach_"+index_attach)
												.attr("name","multiple_attach")
												.css("display","none");
	var html = '';
		html += '<li class="fix">';
			html += '<a href="javascript:void(0);" class=\"file_tit multiple_attach_'+index_attach+' \">';
				html += '<span class="file_route">'+$(".fileuploadTxt").text()+'</span>';
			html += '</a>';
			html += '<a href="javascript:void(0);" class="ico btn_del" onclick="file_del(this);"><em>삭제</em></a>';
		html += '</li>';	
	file_box.append(html);
	file_box.find(".multiple_attach_"+index_attach).append($fileClone);
	index_attach = index_attach+1;
}

var file_del = function(object) {
	var _this = $(object);
	var li = _this.closest("li");
	li.remove();
	
	if($("input[name='multiple_attach']").length == 0){
		$(".fileuploadTxt").text("선택된 파일이 없습니다.");
	}
}

var file_down = function(json) {
	var params = "?";
	$.each(json, function(key, val){
		params = params + key + "=" + val + "&";
	});

	document.hidden_iframe.location.href = url_down + params;
}

var file_delete = function(object, json) {
	var confirm_text = (file_box.attr("id").indexOf("image") > -1)
		? "정말로 삭제하시겠습니까?\n삭제한 첨부 이미지는 복구가 안됩니다." : "정말로 삭제하시겠습니까?\n삭제한 첨부파일은 복구가 안됩니다.";

	var _this = $(object);
	var li = _this.closest("li");
	if (confirm(confirm_text)) {
		var params = json;

		$.ajax({
			type : "post",
			url : url_delete,
			data : params,
			dataType : "json",
			success : function(data) {
				if (data.status == "OK") {
					li.remove();
				} else {
					alert(data.message);
				}
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
				return false;
			}
		});
	}
}