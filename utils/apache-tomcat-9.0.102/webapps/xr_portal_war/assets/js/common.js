//window
$(window).resize(function (){
	// width값을 가져오기
	var width_size = window.outerWidth;
	
	if (width_size < 1000) {
		$("#side_layer_datacounsel").hide();
	}else{
		$("#side_layer_datacounsel").show();
	}
});

$(document).ready(function(){
	commonObj.init();
	commentObj.init();
	commonDataMarketObj.init();
});

function alertPop(options){
	var option = {
		"alertPopMsg" : "" //메세지
		, "per" : "" //가로비율
		, "fn" : "" //사용시 함수
		, "closeX_yn" : "Y" //닫기버튼 노출
	}
	
	if(typeof options != "undefined"){
        $.extend(option, JSON.parse(options));
    }

	var html = "";
	html += '<div class="layer_popup">';
		html += '<div class="w" style="min-height: 40px;">';
			html += '<div class="popup_box pop_data_use_request">';
				html += '<div class="pop_hd_w">';
					html += '<h3>알림</h3>';
					if(option.closeX_yn == 'Y'){
						html += '<a href="javascript:void(0);" class="ico btn_close layerPopupCloseRemove">';
							html += '<span>닫기</span>';
						html += '</a>';	
					}
				html += '</div>';
				html += '<div class="pop_content_w">';
					html += '<div class="pop_content">';
						html += '<div class="w">';
							html += '<div class="">';
								html += option.alertPopMsg;
							html += '</div>';
							html += '<div class="btm_area align_r">';
									if(option.fn != ""){
										html += '<a href="'+option.fn+'" class="btn btn_regist">';	
									}else{
										html += '<a href="javascript:void(0);" class="btn btn_regist layerPopupCloseRemove">';
									}
									html += '<span>확인</span>';
								html += '</a>';
							html += '</div>';
						html += '</div>';
					html += '</div>';
				html += '</div>';
			html += '</div>';
		html += '</div>';
		html += '<!--// 팝업 : 공통 레이어 팝업 -->';
	html += '</div>';
	
	$("body").append(html);
}

//공통
var commonObj = {
	_contextPath : "" 
	, _iFrameCnt : 0
	, _intervalLogoTime : 5
	, interval : {
		_logo : ""
	}
	, init : function(){
		//on
		$(document).on("click",".dataMarcetDetail",function(){ //데이터마켓 상세
			var detailOption = {
				"id": $(this).data("id")
			}
			commonObj.link.dataMarcetDetail(JSON.stringify(detailOption));
		});
		
		$(document).on("click",".layerPopupClose",function(){ //레이어팝업 닫기
			$(this).closest("div.layer_popup").hide();
		});
		
		$(document).on("click",".layerPopupCloseRemove",function(){ //레이어팝업 닫고 지우기
			$(this).closest("div.layer_popup").remove();
		});
		
		$(document).on("mouseenter",".hoverMouse",function(){ //마우스 오버
		    $(this).addClass('mouse_on');
		});
		$(document).on("mouseleave",".hoverMouse",function(){ //마우스 오버
		    $(this).removeClass('mouse_on');
		});
  		
		$(document).on("click",".favorite", function() { // 관심데이터 등록
			var elem = $(this);
			
			if(confirm(elem.hasClass("ac") ? "관심상품 해지하시겠습니까?" : "관심상품 등록하시겠습니까?")){
				var option = {
					"TP" : typeof $(this).data("tp") != "undefined" ? $(this).data("tp") : "favorite_add_list" //필수
					, "id" : $(this).data("id") //필수
					, "type" : $(this).data("type") //필수
					, "organ_id" : typeof $(this).data("organ_id") != "undefined" ? $(this).data("organ_id") : ""
				}
				
				//로딩바 시작
				fnLoading_show();

				$.ajax({
					type : "post",
					url : commonObj._contextPath+"/user/data_market/process.ajax.do",
					data : option,
					dataType : "json",
					async : false,
					success : function(data) {
						if (data.viewName == '/common/message') {
							alert(data.model.MESSAGE);
							location.href = data.model.SCRIPT_SOURCE;
						}else{
							if (data.model.myCount == 0) {
								elem.removeClass("ac");		
								alert("관심 데이터에 저장이 해제 되었습니다.");					
							} else {
								elem.addClass("ac");
								alert("관심 데이터에 저장 되었습니다.");
							}
							
							if($(".like_count").length > 0){
								$(".like_count").text(data.model.favoriteCount);
							}	
						}
						
						//로딩바 종료
						fnLoading_hide();
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
						return false;
					}
				});				
			}
		});
		
		//인기검색어
		$(document).on("click","button.btn_popular", function(e){
			e.preventDefault();
			
			if($("#header").find("div.hd_sch_w").hasClass("ac")){
				$("#header").find("div.hd_sch_w").removeClass("ac");
			}else{
				$("#header").find("div.hd_sch_w").addClass("ac");
			}
		});
		
		//ready
		$(document).ready(function(){
			commonObj._contextPath = $("#contextPath").val();
			commonObj.ajax.call.popularSearch(); //인기검색어
			//setTimeout(commonObj.interval.logo, 1000 * commonObj._intervalLogoTime); //로고변경
		});
	}
	, ajax : {
		call : {
			popularSearch : function(options){ //인기데이터
				var option = {
	                "TP" : "popularSearch"
	            }
	            if(typeof options != "undefined"){
	                $.extend(option, JSON.parse(options));
	            }
	        	
				$.ajax({
					type : "post",
					url : commonObj._contextPath+'/user/process.json.do',
					data : option,
					dataType : "json",
					success : function(data) {
						var html = '';
						if(typeof data.resultList != 'undefined' && data.resultList.length > 0 ){
							for(var i=0; i<data.resultList.length; i++){
								html += '<li>';
									html += '<p class="txt_w">';
										html += '<span class="num">'+(i+1)+'</span>';
										html += '<a href="javascript:void(0);" class="txt dataMarcetDetail" data-id="'+data.resultList[i].resource_id+'" class="txt">';
											html += '<span>'+data.resultList[i].title+'</span>';
										html += '</a>';
									html += '</p>';
									if(data.resultList[i].rank_type == '-'){
										html += '<spn class="etc"><em class="s"><i>-</i></em></spn>';
									}else if(data.resultList[i].rank_type == 'NEW'){
										html += '<spn class="etc"><em class="n"><i>NEW</i></em></spn>';
									}else {
										html += '<spn class="etc"><em class="'+data.resultList[i].rank_type+'"><i>'+data.resultList[i].rank_type_num+'</i></em></spn>';
									}
								html += '</li>';
							}
						}
						$("#sch_popular").empty();
						$("#sch_popular").append(html);
						
						//롤링
						//commonObj.display.mainSch_popular(); 
						//setInterval(commonObj.display.mainSch_popular, 2000);
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
					}
				});
			}
			, getApiEncrypt : function(options){
				var str = "";
				var option = {
	                "TP" : "encrypt"
					, "encryptStr" : ""
					, "encryptType" : "enc"
	            }

	            if(typeof options != "undefined"){
	                $.extend(option, JSON.parse(options));
	            }
	        	
				$.ajax({
					type : "post",
					url : commonObj._contextPath+'/user/api/encrypt/process.ajax.do',
					data : option,
					dataType : "json",
					async : false,
					success : function(data) {
						str = data.str;	
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
					}
				});
				
				return str;
			}
		}
	}
	, link : {
		dataMarcetDetail : function(options){
			var option = {
                "id" : ""
            }
            if(typeof options != "undefined"){
                $.extend(option, JSON.parse(options));
            }
			
			location.href = commonObj._contextPath+'/user/data_market/detail.do?id='+option.id;
		}
	}
	, display : {
		mainSiteMapClose : function(){ //메뉴 열리고 닫을때
			$("body").removeClass("smap");
		}
		, mainRollingCnt : function(displayId, num){ //비주얼 영역 리소스 수
			var memberCountConTxt= Number(num);

			$({ val : 0 }).animate({ val : memberCountConTxt }, {
				duration: 2000,
				step: function() {
					var num = numberWithCommas(Math.floor(this.val));
					$(displayId).text(num);
				},
				complete: function() {
					var num = numberWithCommas(Math.floor(this.val));
					$(displayId).text(num);
				}
			});
			
			function numberWithCommas(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		}
		, mainSch_popular : function(){ //인기검색어 롤링
			$("ul#sch_popular li:first").slideUp(function(){ 
			    $(this).appendTo($("ul#sch_popular")).slideDown();
			});
		}
	}
	, download : {
		createIframe : function (name){
			var frm = $('<iframe name="hidden_download_iframe_' + name + '" style="display: none;"></iframe>');
			frm.appendTo("body");
		}
		, sleep : function (delay){
			var start = new Date().getTime();
			while (start + delay > new Date().getTime());
		}
		, multiType : function(url, delay){
			commonObj.download.createIframe(commonObj._iFrameCnt); // 보이지 않는 iframe 생성, name는 숫자로
			$("iframe[name=hidden_download_iframe_" + commonObj._iFrameCnt + "]").attr("src", encodeURI(url));
			commonObj._iFrameCnt++;
			commonObj.download.sleep(delay); //각 파일별 시간 텀을 준다
		}
	}
	, interval : {
		logo : function(){
			if(commonObj.interval._logo != null){
				clearInterval(commonObj.interval._logo);
			}
			//로고 변경
			$("img.logo").hide();
			if($("img.logo").eq(0).attr("src") == (commonObj._contextPath+"/images/hd_logo.png")){
				$("img.logo").attr("src", commonObj._contextPath+"/images/common/logo.png");
			}else{
				$("img.logo").attr("src", commonObj._contextPath+"/images/hd_logo.png");
			}	
			//$("img.logo").fadeIn('speed');
			$("img.logo").show();			
			commonObj.interval._logo = setInterval(commonObj.interval.logo, (1000 * commonObj._intervalLogoTime) );
		}
		
	}
	, localStorage : {
		saveMember : function(options){ //로그인한 정보를 로컬스토리지 저장 //call footer
			var option = {
				"bigdataLoginI" : "" 
				, "localStorageStr" : ""
			}
			if(typeof options != "undefined"){
                $.extend(option, JSON.parse(options));
            }

			//값체크
			if(option.bigdataLoginI == null || option.bigdataLoginI == ""){
				return;
			}
			
			if(getCookie('bigdataLogin') == ''){//초기 없을시
				//암호화 전체
				commonObj.localStorage.saveAjaxMember(JSON.stringify(option));
				
			}else{
				if(option.bigdataLoginI != localStorage.getItem('bigdataLoginI')){
					commonObj.localStorage.saveAjaxMember(JSON.stringify(option));
				}
			}
		}
		, saveAjaxMember : function(options){
			var option = {};
			if(typeof options != "undefined"){
                $.extend(option, JSON.parse(options));
            }
			
			//저장
			localStorage.setItem('bigdataLogin', encodeURIComponent(option.localStorageStr));	
			localStorage.setItem('bigdataLoginI', option.bigdataLoginI);
			
			setCookie("bigdataLogin", localStorage.getItem('bigdataLogin'),1);
			setCookie("bigdataLoginI", localStorage.getItem('bigdataLoginI'),1);
		}
	}
}

//코멘트
var commentObj = {
	_$formList_comment : null
	, _$commentDisplay : null
	, _islogin : ""
	, init : function(){
		//on
		$(document).on("keyup","#comment_content",function(){
			commentObj.fnChkByte($("#comment_content"), 1000);
		});
		
		//ready
		$(document).ready(function(){
			commentObj._islogin = $("#islogin").val();
			
			if($("#commentDisplay").length > 0){
				commentObj._$commentDisplay = $("#commentDisplay");
				commentObj.ajax.call.fnFormContentList();	
			}
		});
	}
	, display : {
		make : {
			secretbtn : function(){
				if($(".btn_secret.comment").hasClass("ac")){
					$("input[name='password']").show();
				}else{
					$("input[name='password']").hide();
				}
			}
		}
	}
	, ajax : {
		call : {
			fnInput : function(){ //코멘트 등록
				$.ajax({
					type : "post",
					url : commonObj._contextPath+"/comment/saveApi/process.do",
					data : $("#formList_comment").serialize(),
					dataType : "json",
					success : function(data) {
						if (typeof data.MESSAGE != "undefined") {
							alert(data.MESSAGE);
							location.href = data.SCRIPT_SOURCE;
						} else {
							alert("처리되었습니다");
							commentObj.ajax.call.fnFormContentList();
						}
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
						return false;
					}
				});
				
			}
			, fnFormContent : function(table_name, table_pk, sq) { //코멘트 수정
				params = {
						"TP" : "modify"
					,	"table_name" : table_name
					,	"table_pk" : table_pk
					,	"sq" : sq
				}
			
				$.ajax({
					type : "post",
					url : commonObj._contextPath+"/comment/process.json.do",
					data : params,
					dataType : "json",
					success : function(data) {
						if (data.status == "OK") {
							commentObj.fnFormSet({'sq' : sq, 'saveTP' : 'modify', 'content' : data.result });
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
			, fnFormDelete : function(action, mapKVs) { //코멘트 삭제
				if (confirm('정말로 댓글을 삭제하시겠습니까?')) {
					
					copyValueMapToForm(commentObj._$formList_comment, mapKVs);
			
					$.ajax({
						type : "post",
						url : commonObj._contextPath+"/comment/deleteApi/process.do",
						data : $("#formList_comment").serialize(),
						dataType : "json",
						success : function(data) {
							if (typeof data.MESSAGE != "undefined") {
								alert(data.MESSAGE);
								location.href = data.SCRIPT_SOURCE;
							} else {
								alert("처리되었습니다");
								commentObj.ajax.call.fnFormContentList();
							}
						},
						error : function(data) {
							alert("잠시 후 다시 시도해주세요.");
							return false;
						}
					});
				}
			}				
			, fnFormContentPaing : function(action, mapKVs){ //코멘트 페이징
				var option = {
					"currentPage" : mapKVs.currentPage
				}
				commentObj.ajax.call.fnFormContentList(JSON.stringify(option));
			}
			, fnFormContentList : function(options){ //코멘트 리스트
				var option = {
	                "table_name" : typeof commentObj._$commentDisplay.data("comment_tablename") != "undefined" ? commentObj._$commentDisplay.data("comment_tablename") : ""
					, "data_id" : typeof commentObj._$commentDisplay.data("data_id") != "undefined" ? commentObj._$commentDisplay.data("data_id") : ""
					, "table_pk" : typeof commentObj._$commentDisplay.data("table_pk") != "undefined" ? commentObj._$commentDisplay.data("table_pk") : ""
					, "orderby" : typeof commentObj._$commentDisplay.data("orderby") != "undefined" ? commentObj._$commentDisplay.data("orderby") : ""
					, "maxRows" : typeof commentObj._$commentDisplay.data("maxRows") != "undefined" ? commentObj._$commentDisplay.data("maxRows") : ""
	            }
	            if(typeof options != "undefined"){
	                $.extend(option, JSON.parse(options));
	            }

				$.ajax({
					type : "post",
					url : commonObj._contextPath+"/comment/list.do",
					data : option,
					//dataType : "json",
					success : function(data) {
						$("#commentDisplay").empty();
						$("#commentDisplay").append(data);
						
						commentObj._$formList_comment = $("#formList_comment");
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
						return false;
					}
				});
			}
		}
	}
	, fnFormSet : function(mapKVs) {
		copyValueMapToForm(commentObj._$formList_comment, mapKVs);
		$("#content").focus();
	}
	, fnChkByte : function($obj, maxByte){
		var str = $obj.val();
		var str_len = str.length;
	
		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";
	
		for(var i=0; i<str_len; i++){
			one_char = str.charAt(i);
			if(escape(one_char).length > 4){
				rbyte += 2;                                         //한글2Byte
			}else{
				rbyte++;                                            //영문 등 나머지 1Byte
			}
	
			if(rbyte <= maxByte){
				rlen = i+1;                                          //return할 문자열 갯수
			}
		}
	
		if(rbyte > maxByte){
			alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			str2 = str.substr(0,rlen);                                  //문자열 자르기
			$obj.val(str2);
			commentObj.fnChkByte(obj, maxByte);
		}else{
			document.getElementById('byteInfo').innerText = rbyte;
		}
	}
}

//전체검색
var commonDataMarketObj = {
	_makeOption : {}
	, init : function(){
		//on
		$(document).on("click", ".dataMarketSearch" , function(e){ //공통 필터 검색 링크
			e.preventDefault();
			
			var li = $(this).data("li");
			var val = $(this).data("val");
			
			if(li == ""){
				alert("카테고리id값 필수입니다.");
				return;
			}else if(val == ""){
				alert("카테고리 val값 필수입니다.");
				return;
			}
			
			commonDataMarketObj.make.addArray(li,val); //set _makeOption data 
			commonDataMarketObj.ajax.setOption.dataMarketMakeOption(JSON.stringify(commonDataMarketObj._makeOption));
		});
		
		//ready
		$(document).ready(function(){
			
		});
	}
	, make : {
		addArray : function(key, val){ //검색 조건 param set
			if(typeof commonDataMarketObj._makeOption[key] == "undefined"){
				commonDataMarketObj._makeOption[key] = new Array();
			}
			array = commonDataMarketObj._makeOption[key];
			var pushbln = true;
			for(var arrValue in array){
				if(val == array[arrValue]){ //중복제거
					pushbln = false;
				}
			}
			if(pushbln){
				array.push(val);	
			}
			commonDataMarketObj._makeOption[key] = array;		
		}
		, dataMarketSearch : function(){ //전체검색페이지에서 검색어 셋팅
			//검색 조건값 초기화
			commonDataMarketObj._makeOption = {};
			
			//필터 조건 1~6
			for(var i=1; i<7; i++){
				var li = lpad(i, 2, "0");
				var array = dataMarketObj.ajax.setOption.filterList(null, li);
				for(var arrValue in array){
					commonDataMarketObj.make.addArray("li"+li, array[arrValue]);
				}
			}
			
			//정렬조건 
			commonDataMarketObj.make.addArray("orderbyCondition", $("#orderbyCondition li > a.ac").data("value"));
			
			//페이징
			for(var i=1; i<4; i++){
				var li = lpad(i, 2, "0");
				commonDataMarketObj.make.addArray("data_box"+li+"_currentPage", $("#data_box"+li+"_currentPage").val());
			}
			
			//검색어
			commonDataMarketObj.make.addArray("srchValue", dataMarketObj._$formList.find("#srchValue").val());
			
			//cookie set
			commonDataMarketObj.cookie.setDataMarketSearch();
		}
	}
	, ajax : {
		setOption : {
			dataMarketMakeOption : function(options){ //전체검색 페이지 이동
				
	            if(typeof options != "undefined"){
	                $.extend(commonDataMarketObj._makeOption, JSON.parse(options));
	            }

				var html = '';
				html += '<form id="dataMarketForm" action="'+commonObj._contextPath+'/user/data_market/list.do" style="display:none;" method="post">';
					//추가
					html += '<textarea id="dataMarketMakeObjTextArea" name="dataMarketMakeObjTextArea"></textarea>';
					html += '<input type="text" name="dataCookieYn" value="N"/>'; //쿠키삭제 이전쿠키 삭제처리
				html += '</form>';
				
				//초기화
				if($("#dataMarketForm").length > 0){
					$("#dataMarketForm").remove();	
				}
				
				$('body').append(html);
												
				$("#dataMarketMakeObjTextArea").text(JSON.stringify(commonDataMarketObj._makeOption));
				$("#dataMarketForm").submit();
			}
			, reportDataMarketMakeOption : function(options){ //리포트 페이지 이동 //아직 사용안함
				
	            if(typeof options != "undefined"){
	                $.extend(commonDataMarketObj._makeOption, JSON.parse(options));
	            }

				var html = '';
				html += '<form id="dataMarketForm" action="'+commonObj._contextPath+'/user/data_market/report/list.do" style="display:none;" method="post">';
					//추가
					html += '<textarea id="dataMarketMakeObjTextArea" name="dataMarketMakeObjTextArea"></textarea>';
				html += '</form>';
				
				//초기화
				if($("#dataMarketForm").length > 0){
					$("#dataMarketForm").remove();	
				}
				
				$('body').append(html);
								
				$("#dataMarketMakeObjTextArea").text(JSON.stringify(commonDataMarketObj._makeOption));
				$("#dataMarketForm").submit();
			}
		}
	}
	, cookie : {
		setDataMarketSearch : function(){
			setCookie("dataMarketSearch", JSON.stringify(commonDataMarketObj._makeOption),1);
		}
	}
}


//파일 다운로드
/**
 *
 * @param clrcsId : 문화자원ID
 * @param type : 파일타입
 * @param prdctSn : 단일파일 ID
 * @param path : 해당경로
 * @param progressId : 진행율ElementID
 * @param progressId : 진행율표시Element ID
 * @param fileName : fileName
 */
const cmmn_fileDownload = function (clrcsId, type, prdctSn, path, progressId, progressTextId, fileName) {


	const apiUrl = "http://14.63.58.81:5005/api/tus/file/download";
	//const apiUrl = "http://localhost:8080/api/tus/file/download";

	fetch(apiUrl, {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({
			clrcsId: clrcsId,
			type: type,
			prdctSn: prdctSn,
			path: path,
		}),
	})
		.then(response => {
			const contentLength = response.headers.get("content-length");
			if (!contentLength) {
				throw new Error('Content-Length header is missing');
			}

			const total = parseInt(contentLength, 10);
			let loaded = 0;

			debugger;
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
								if(progressId != null && progressTextId != null) {
									updateProgress(loaded, total);
								}
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
		.then((response) => response.blob())
		.then(blob => {
			debugger;
			const url = window.URL.createObjectURL(blob);
			const a = document.createElement('a');
			a.style.display = 'none';
			a.href = url;
			a.download = fileName;
			document.body.appendChild(a);
			a.click();
			//init(url);
			//animate();
			window.URL.revokeObjectURL(url);
		})
		.catch((error) => {
			console.error("Download Error:", error);
		});
}

function updateProgress(loaded, total) {
	const progress = Math.round((loaded / total) * 100);
	console.log(`Downloaded ${progress}%`);

	document.getElementById('downloadProgress').value = progress;
	document.getElementById('progressText').innerText = `Downloaded ${progress}%`;
}