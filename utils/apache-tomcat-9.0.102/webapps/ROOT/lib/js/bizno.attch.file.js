// 사업자등록증 관리
var BizNo_Attach_File = BizNo_Attach_File || {};  

(function (_BizNo_Attach_File)
{
	let biznoStatus = false;
	
	// 사업자등록증 관리 시작
	_BizNo_Attach_File.readyBizNoAttachFile = function (sq , file_origin, bizNoAttchFileKey) {
		 
		// 사업자등록증 저장버튼 클릭 이벤트
		$('#btn_save_biznoattachfile').on("click", function(){ 
 
			// 사업자등록번호, 세금계산서발행용 이메일, 사업자등록증 필수 입력 체크
			if(!BizNo_Attach_File.checkValidateBizNo($('#txt_biz_no').val()))
			{ 
				$('#txt_biz_no').focus()
				return; 
			}

			if(!BizNo_Attach_File.biznoStatus)
			{
				alert("사업자등록번호가 확인되지 않았습니다.확인버튼을 클릭하여 사업자등록번호의 유효성을 체크하세요!");
				$('#txt_biz_no').focus()
				return; 
			}

			if(!$('#txt_taxbill_email_addr').val().trim())
			{
				alert("세금계산서 이메일을 입력하세요.");
				$('#txt_taxbill_email_addr').focus()
				return; 
			}
			
			if(!chk_mail($('#txt_taxbill_email_addr').val()))
			{
				alert("세금계산서 이메일이 유효하지 않습니다.");
				$('#txt_taxbill_email_addr').focus()
				return; 
			}
			
			let bsnsDoc = $('#span_bsns_doc').text().replace("선택된 파일이 없습니다.","");
			if(!$('#file_bsns_doc').val().trim() && !bsnsDoc)
			{		
				alert("선택된 사업자등록증 파일이 없습니다.");
				return; 
			}

			BizNo_Attach_File.saveBizNoAttchFile("B");					
		});	 
		
		// 사업자등록증 닫기버튼 클릭 이벤트
		$('#btn_close_biznoattachfile').on("click", function(){

        	$('#popup_bizno_attach_file').hide();		// 사업자등록증 첨부파일 등록 팝업 숨김
			
		});	 

		// 사업자등록증 파일첨부의 값이 변경되면...
		$('#file_bsns_doc').on("change", function(){ 
			
			let totalFileSz = 0;
			let maxMB = 1;	// 첨부 파일 최대 사이즈
			let maxSize  = maxMB * 1024 * 1024;   
			let atchFile = $(this)[0];		
			
			if (atchFile.files[0].size > maxSize)
			{
				alert("파일 용량은 " + maxMB + "MB를 넘길수 없습니다.");
				
				if(window.navigator.userAgent.toLowerCase().indexOf("msie") >= 0)	//ie체크
				{	
					$(this).replaceWith($(this).clone(true));
				} 
				else 
				{
					$(this).val("");
				}
		
				$('#span_bsns_doc').text("선택된 파일이 없습니다.");
			}
			else
			{
				let tFilename;
				if(window.FileReader){ // modern browser
					//image 파일만
					tFilename = atchFile.files[0].name;
				} else { // old IE
					tFilename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출
				}
			
				// 추출한 파일명 삽입
	//	 		let fileSize = setByteCalc(atchFile.files[0].size);
	//	 		$('#span_bsns_doc').text(tFilename + " ( " + fileSize + " )");
				$('#span_bsns_doc').text(tFilename);
			}
	
			_BizNo_Attach_File.setDispModeBizNoBtn();	// 사업자등록증 삭제버튼 보임/숨김 처리
		});	
		
		_BizNo_Attach_File.initBizNoAttchFileInfo(sq , file_origin, bizNoAttchFileKey);	// 사업자등록증 첨부파일 초기 셋팅
	},
	
	_BizNo_Attach_File.setByteCalc = function (sbytes) {
		
		let bytes = parseInt(sbytes);
		let s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
		let e = Math.floor(Math.log(bytes)/Math.log(1024));
	
	    if(e == "-Infinity") {
	    	return "0 "+s[0];
	    } else {
	    	return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];	
	    } 
	},

	// 사업자등록증 삭제
	_BizNo_Attach_File.deleteBizNoFile = function (){
		// 신규로 등록하는 경우
	// 	if(window.BrowserInfo.isIE)
		if(window.navigator.userAgent.toLowerCase().indexOf("msie") >= 0)
		{	//ie체크
			$('#file_bsns_doc').replaceWith($('#file_bsns_doc').clone(true));
		} 
		else 
		{
			$('#file_bsns_doc').val("");
		}
		$('#span_bsns_doc').text("선택된 파일이 없습니다.");
		
		// 기등록된 경우는 컨펌후에 db 삭제 처리
	
		_BizNo_Attach_File.setDispModeBizNoBtn();	// 사업자등록증 삭제버튼 보임/숨김 처리
	},

	// 사업자등록증 삭제버튼, 다운로드버튼 보임/숨김 처리
	_BizNo_Attach_File.setDispModeBizNoBtn = function (){
		
		if($('#span_bsns_doc').text() == "선택된 파일이 없습니다.")
		{
			$('#href_bizno_attch_file_del').hide();	// 파일삭제버튼 숨김 처리
		}
		else
		{
			$('#href_bizno_attch_file_del').show();	// 파일삭제버튼 보임 처리
		}
	
		if($('#span_bizno_file_sq').text() == "")
		{
			$('#div_file_bsns_doc').show();				// 파일첨부 보임 처리
			$('#href_bizno_attch_file_sel').show();		// 파일선택버튼 보임 처리
			$('#href_bizno_attch_file_down').hide();	// 다운로드버튼 숨김 처리
//			$('#div_save_biznoattachfile').show();		// 파일 저장버튼 보임 처리
		}
		else
		{
			$('#div_file_bsns_doc').hide();				// 파일첨부 숨김 처리
			$('#href_bizno_attch_file_down').show();	// 다운로드버튼 보임 처리
			$('#href_bizno_attch_file_sel').hide();		// 파일선택버튼 숨김 처리
//			$('#div_save_biznoattachfile').hide();		// 파일 저장버튼 숨김 처리
		}
	},

	// 2023.07.31 : 사업자등록증 저장
	_BizNo_Attach_File.saveBizNoAttchFile = function (saveType){
		
		let reqData = new FormData();
		reqData.append("file_bsns_doc"		,  $('#file_bsns_doc')[0].files[0]);	// 사업자등록증파일
		reqData.append("biz_no"				,  $('#txt_biz_no').val());				// 사업자등록번호
		reqData.append("taxbill_email_addr"	,  $('#txt_taxbill_email_addr').val());	// 세금계산서발행용 이메일주소
		
		$.ajax({
			type : "post",
			url : "processBizNoAttchFile.do",
			data : reqData,
			dataType : "json",
	//         enctype: 'multipart/form-data',
		    processData: false,
		    contentType: false,
			success : function(respData) {
				
				//처리 완료 되었습니다.
				if(respData.MESSAGE == "회원정보 수정이 완료되었습니다.") 
				{
					if(saveType == "B")	// 사업자등록증 저장버튼
					{
						alert("사업자 정보가 저장되었습니다.");
//						_BizNo_Attach_File.initBizNoAttchFileInfo(respData.bizNoAttchFileSq , respData.bizNoAttchFileOrigin, respData.bizNoAttchFileKey);	// 사업자등록증 첨부파일 초기 셋팅
						$('#popup_bizno_attach_file').hide();	// 사업자등록증 관리 팝업 숨김
					}
					else
					{
						$("#chk5").show();
					}
				}
				else 
				{
					$("#chk5").hide();
					alert(respData.MESSAGE);
				}
				
				fnLoading_hide();
			},
			error : function(respData) {
				
				console.log("[error]respData ==>", respData);
				
				alert("잠시 후 다시 시도해주세요.");
				fnLoading_hide();
				return false;
			}
		});
	},

	// 사업자등록증 첨부파일 초기 셋팅
	_BizNo_Attach_File.initBizNoAttchFileInfo = function (sq, file_origin, bizNoAttchFileKey)
	{
		if(file_origin != "")	// 기등록된 데이터가 존재하는 경우
		{
			$('#span_bsns_doc'      ).text(file_origin);
			$('#span_bizno_file_sq' ).text(sq);
			$('#span_bizno_file_key').text(bizNoAttchFileKey);		// 사업자등록증 파일 key(등록일자 hash key)
		}
	
		_BizNo_Attach_File.setDispModeBizNoBtn();	// 파일삭제,다운로드 버튼 보임 처리
	},

	//사업자등록증 첨부파일 삭제
	_BizNo_Attach_File.deleteBizNoAttchFileInfo = function (deleteUrl, bizNoAttchFileKey){
		if($('#span_bizno_file_sq').text() != "")	// 기등록된 데이터가 존재하는 경우
		{
			// db 데이터 삭제
			let confirmMessage = "정말로 삭제하시겠습니까?\n삭제한 첨부파일은 복구가 안됩니다.";
//		 	let url_delete = "/other/file_delete2.do";
			let params = "?sq=" + $('#span_bizno_file_sq').text() + "&key=" + bizNoAttchFileKey;
	
			if (confirm(confirmMessage)) 
			{
				$.ajax({
					type : "post",
					url : deleteUrl + params,
					data : "",
					dataType : "json",
					success : function(data) {
						if (data.status == "OK") 
						{
							alert("사업자등록증 첨부파일이 삭제되었습니다.");
							$('#span_bizno_file_sq').text("");	// 사업자등록증 첨부파일 key 삭제
							_BizNo_Attach_File.initBizNoAttchFileEvent();
							_BizNo_Attach_File.setDispModeBizNoBtn();	// 파일삭제,다운로드 버튼 보임 처리
						} 
						else 
						{
							alert(data.message);
						}
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
						return false;
					}
				});
			}	// end of if (confirm(confirmMessage))
		}
		else
		{
			// 화면 데이터 삭제
			_BizNo_Attach_File.initBizNoAttchFileEvent();
			_BizNo_Attach_File.setDispModeBizNoBtn();	// 파일삭제,다운로드 버튼 보임 처리
		}
	},

	// 사업자등록증 첨부파일 다운로드
	_BizNo_Attach_File.downloadBizNoAttchFileInfo = function (downloadUrl, bizNoAttchFileKey){
		let params = "?sq=" + $('#span_bizno_file_sq').text() + "&key=" + bizNoAttchFileKey;
		document.hidden_iframe.location.href = downloadUrl + params;
	},
	
	
	// 첨부파일 기본 설정 셋팅
	_BizNo_Attach_File.initBizNoAttchFileEvent = function () {
		// 첨부파일 초기화
		let attchFileHtml = '<input type=\"file\" id=\"file_bsns_doc\" class=\"btn\" name=\"bsns_doc\">';
	    $('#div_file_bsns_doc').html(attchFileHtml);
		$('#span_bsns_doc').text("선택된 파일이 없습니다.");
	
		//사업자등록증 파일첨부의 값이 변경되면...
		$('#file_bsns_doc').on("change", function(){ 
		
			let totalFileSz = 0;
			let maxMB = 1;	// 첨부 파일 최대 사이즈
			let maxSize  = maxMB * 1024 * 1024;   
			let atchFile = $(this)[0];		
		
			if (atchFile.files[0].size > maxSize)
			{
				alert("파일 용량은 " + maxMB + "MB를 넘길수 없습니다.");
			
				if(window.navigator.userAgent.toLowerCase().indexOf("msie") >= 0)	//ie체크
				{	
					$(this).replaceWith($(this).clone(true));
				} 
				else 
				{
					$(this).val("");
				}
	
				$('#span_bsns_doc').text("선택된 파일이 없습니다.");
			}
			else
			{
				let tFilename;
				if(window.FileReader)	// modern browser
				{	 
					//image 파일만
					tFilename = atchFile.files[0].name;
				} 
				else					// old IE 
				{ 
					tFilename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출
				}
		
				// 추출한 파일명 삽입
	//	 		let fileSize = setByteCalc(atchFile.files[0].size);
	//	 		$('#span_bsns_doc').text(tFilename + " ( " + fileSize + " )");
				$('#span_bsns_doc').text(tFilename);
			}
	
			_BizNo_Attach_File.setDispModeBizNoBtn();	// 사업자등록증 삭제버튼 보임/숨김 처리
		});	
	},
	
	// 2023.07.31 : 사업자등록증 조회
	_BizNo_Attach_File.searcheBizNoAttchFile = function (){
		
		$.ajax({
			type : "post",
			url : "/bigdata/user/mypage/mydata/searchBizNoAttchFile.do",
//			data : reqData,
			dataType : "json",
			success : function(respData) {

				_BizNo_Attach_File.initBizNoAttchFileInfo(respData.bizNoAttchFileSq , respData.bizNoAttchFileOrigin, respData.bizNoAttchFileKey);	// 사업자등록증 첨부파일 초기 셋팅

			},
			error : function(respData) {

				alert("잠시 후 다시 시도해주세요.");
				$('#popup_bizno_attach_file').hide();	// 사업자등록증 관리 팝업 숨김
				return false;

			}
		});
	},


	// 2023.08.24 : 사업자등록번호 유효성 조회(공공데이터 포털의 국세청 API 호출)
	_BizNo_Attach_File.checkBizNoStatus = function (bizno, fnCallBack){
		
		let reqData = {"bizno" : bizno};
		let rslt = false;
				
		$.ajax({
			type : "post",
			url : "/bigdata/user/mypage/mydata/biznostatus.do",
			data : reqData,
			dataType : "json",
			success : function(respData) {

//				console.log("respData ==>", respData);
				
				if(respData.statusCd == "S")	// 정상
				{
					alert(respData.statusMsg)
					rslt = true;	
				}
				else							// 오류	
				{
					alert(respData.statusMsg);
					rslt = false;	
				}

				fnCallBack(rslt);
			},
			error : function(respData) {

				alert("잠시 후 다시 시도해주세요.");
				// $('#popup_bizno_attach_file').hide();	// 사업자등록증 관리 팝업 숨김
				rslt = false;
				fnCallBack(rslt);
			}
		});
		
	},
	
	// 2023.08.24 : 사업자등록번호 유효성 체크
	_BizNo_Attach_File.checkValidateBizNo = function (bizno){
		
		let biznopattern = /^[0-9]{10}$/;
		let rslt = true;
		
		if ( !biznopattern.test( bizno ) ) 
		{
			alert("사업자번호가 유효하지 않습니다.(10자리 숫자로 입력하세요)");
			rslt = false;
		}
		
		return rslt;
	}
}

)(BizNo_Attach_File)
;
