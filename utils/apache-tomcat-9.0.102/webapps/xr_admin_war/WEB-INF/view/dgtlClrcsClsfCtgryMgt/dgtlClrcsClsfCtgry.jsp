<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contants">
	<!-- tab area start -->
	<div class="tab-wrap as-tab-wrap">
		<ul class="tab-menu">
			<li data-value="CLRCSCT001"><a href="#">기관별 분류(유형)</a></li>
			<li data-value="CLRCSCT002"><a href="#">데이터 유형</a></li>
			<li data-value="CLRCSCT003"><a href="#">공통분류</a></li>
			<li data-value="CLRCSCT004"><a href="#">서비스 유형</a></li>
			<li data-value="CLRCSCT005"><a href="#">산업 유형</a></li>
			<li data-value="CLRCSCT006"><a href="#">국가지역시대 유형</a></li>
			<li data-value="CLRCSCT007"><a href="#">재질 유형</a></li>
		</ul>
		<%-- 레거시 일때 만 기관조회 세렉트박스 --%>
		<div class="list-option between">
			<form name="frmCateList" id="frmCateList">
				<input type="hidden" id="ctgryTypeCd" name="ctgryTypeCd" value="CLRCSCT001">
				<div class="btn-wrap align-right" id="instArea">
				<div class="fm-focus fm-select">
					<select id="instId" name="instId" onChange="javascirpt:funCtgryList(); return false;">
						<c:if test="${!empty instList}">
							<c:forEach var="instInfo" items="${instList}" varStatus="loopIndex">
								<option value="${instInfo.instId}" <c:if test="${items.loopIndex == 0}">selected</c:if>>${instInfo.instNm}</option>
							</c:forEach>
						</c:if>
					</select> 
				</div>
				</div>	
			</form>
			
			<div class="btn-wrap align-right">
				<button type="button" class="btns color-gray" id="btnReset" onclick="javascript:funCtgryList(); return false;">초기화</button>
				<button type="button" class="btns" id="btnSrch" onclick="javascript:addTopLevel()">+ 추가</button>
				<button type="button" class="btns" id="btnSrch" onclick="javascript:funSave()">저장</button>
			</div>
		</div>
		
		<%-- info detail area end --%>
		<div class="tree-view" id="ctgryList">
		</div>
</div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
	
	 funCtgryList();//목록조회
	 //상단 유형탭
	 $('.tab-menu li').click(function() {
	     $(this).addClass('on').siblings().removeClass('on');	  
	  var ctgryTypeCd = $(this).data('value');
	  $('#ctgryTypeCd').val(ctgryTypeCd); 
	  //기관세렉트박스 - 레거시만 
	  if(ctgryTypeCd == 'CLRCSCT001'){
		  $('#instArea').show();
	  }else{
		  $('#instArea').hide();
	  }
	  funCtgryList();//목록조회
	 });
	 
	 //분류명 체인지
	 $(document).on('change', 'input[name="ctgryNm"]', function() {
		var orgCtgryNm = $(this).closest('ul').find('input[name="orgCtgryNm"]').val();
	    if($(this).val() != orgCtgryNm){
	    	var ctgryId = $(this).attr('id').replace('ctgryNm_', '');
		    var level = $(this).closest('ul').data('value');
	    	var modId = 'mod' + level + '_' + ctgryId;
		    if ($('#' + modId).val() != 'I') $('#' + modId).val('U2');	
	    }else{
	    	return;
	    }
	 });
	  
  });
	
	//목록조회
	function funCtgryList() {
		//목록 초기화
		$('#ctgryList').empty();
    	//상단 유형탭
		var ctgryTypeCd = $('#ctgryTypeCd').val();
    	//기관 아이디
    	var instId = $('#instId').val();
    	//레거시 아니면 기관아이디 초기화
    	if(ctgryTypeCd != "CLRCSCT001") instId = "";

    	axios.post(contextPath +'/dgtlClrcsClsfCtgryMgt/selectDgtlClrcsClsfCtgryList.do',{
    		ctgryTypeCd: ctgryTypeCd,
        	instId : instId
		}).then(function (response) {
			
			if (response.status == 200) {
				if(response.data.resultCode == 200){
					//목록 초기화
					$('#ctgryList').empty();
					var rowCnt = response.data.resultData.length;
					if(rowCnt == 0){
						var rowHtml    =  '<div class="noti align-center">';
					        rowHtml   +=  '<p>조회된 데이터가 없습니다.</p>';
					        rowHtml   +=  '</div>';
					        $('#ctgryList').append(rowHtml);
					        return;
					}
					
					var items = response.data.resultData;
					var totalItems = items.length;

					for(var i = 0; i < totalItems; i++){
						    var item = items[i];
						    var rowHtml = "";
						    var childHtml = "";
						    var befLevel = i > 0 ? items[i - 1].level : 0;
						    var curLevel = item.level;
						    
						    if(i == 0 || curLevel == 0){
						    	var strUl = $('<ul class="topGroup" data-value="' + (item.level + 1) + '">');
							    var strLi = $('<li data-value="' + (item.level + 1) + '" id="li_'+item.ctgryId+'">');
							    rowHtml += '<div class="item" id="div_'+i+'">';
							    rowHtml += '    <button type="button" class="btn-toggle" onclick="javascript:toggle(this);" title="열기"></button>';
							    rowHtml += '    <div class="fm-ele" data-size="w300"><input type="text" name="ctgryNm" id="ctgryNm_'+item.ctgryId+'" value="'+item.ctgryNm+'"></div>';
							    rowHtml += '    <div class="btn-wrap">';
							    rowHtml += '        <input type="hidden" name="orgCtgryNm" id="orgCtgryNm_'+item.ctgryId+'" value="'+item.ctgryNm+'">';
							    rowHtml += '        <input type="hidden" id="mod1_'+item.ctgryId+'" value="">';
							    rowHtml += '        <input type="hidden" id="order1_'+item.ctgryId+'" value="'+item.sortSn+'">';
							    rowHtml += '        <button type="button" id="btnUp_" name="btnUp" class="btn-up" onclick="javascript:moveRowUp(this); return false;" title="위로"></button>';
							    rowHtml += '        <button type="button" id="btnDown_" name="btnDown" class="btn-down" onclick="javascript:moveRowDown(this); return false;" title="아래로"></button>';
							    rowHtml += '        <button type="button" id="btnAdd_" name="btnAdd" class="btn-add" onclick="javascript:addInfo(this); return false;" title="추가"></button>';
							    rowHtml += '    </div>';
							    rowHtml += '</div>';
							    strLi.append(rowHtml);
							    strUl.append(strLi);
							    $('#ctgryList').append(strUl);
						    }else{
						    	var strUl = $('<ul class="subGroup'+(item.level + 1)+'" data-value="' + (item.level + 1) + '">');
							    var strLi = $('<li data-value="' + (item.level + 1) + '" id="li_'+item.ctgryId+'">');
							    rowHtml += '<div class="item" id="div_'+item.ctgryId+'">';
							    rowHtml += '    <button type="button" class="btn-toggle" onclick="javascript:toggle(this);" title="열기"></button>';
							    rowHtml += '    <div class="fm-ele" data-size="w300"><input type="text" name="ctgryNm" id="ctgryNm_'+item.ctgryId+'" value="'+ item.ctgryNm+'"></div>';
							    rowHtml += '    <div class="btn-wrap">';
							    rowHtml += '        <input type="hidden" name="orgCtgryNm" id="orgCtgryNm_'+item.ctgryId+'" value="'+item.ctgryNm+'">';
							    rowHtml += '        <input type="hidden" id="mod'+(item.level + 1)+'_'+item.ctgryId+'" value="">';
							    rowHtml += '        <input type="hidden" id="order'+(item.level + 1)+'_'+item.ctgryId+'" value="'+item.sortSn+'">';
							    rowHtml += '        <input type="hidden" id="upCtgryId'+(item.level + 1)+'_'+item.ctgryId+'" value="'+item.upCtgryId+'">';
							    rowHtml += '        <button type="button" id="btnUp_" name="btnUp" class="btn-up" onclick="javascript:moveRowUp(this); return false;" title="위로"></button>';
							    rowHtml += '        <button type="button" id="btnDown_" name="btnDown" class="btn-down" onclick="javascript:moveRowDown(this); return false;" title="아래로"></button>';
							    rowHtml += '        <button type="button" id="btnAdd_" name="btnAdd" class="btn-add" onclick="javascript:addInfo(this); return false;" title="추가"></button>';
							    rowHtml += '    </div>';
							    rowHtml += '</div>';
							    strLi.append(rowHtml);
							    strUl.append(strLi);
							    $('#li_'+item.upCtgryId).append(strUl);
						    }
					}  
					
					//자식이 없으면 회색화살표
					$('li').each(function() {
					    var $li = $(this);
					    if ($li.find('ul').length == 0) {
					        $li.children('.item').addClass('child-none');
					    }
					});
					
					//위, 아래 버튼 갱신
					topBtnRefresh();
					midBtnRefresh();
					
				}else{
					alert(response.data.resultData);
				} 
	        }
        }).catch(function (error) {
            console.error(error);
        });
	}
	
	//상단 추가 버튼 - 최상위 row 추가
	function addTopLevel() {
		
		var lastOrder = $('#ctgryList .topGroup input[type="hidden"][id^="order1_"]').last();
		var newOrderNo = lastOrder.length ? parseInt(lastOrder.val()) + 1 : 1;
		var randomId = generateRandomId(8);
		
		var rowHtml  = '<ul class="topGroup" data-value="1">';
			rowHtml += '<li data-value="1">';
		    rowHtml += '<div class="item child-none">';
		    rowHtml += '    <button type="button" class="btn-toggle" onclick="javascript:toggle(this);" title="열기"></button>';
		    rowHtml += '    <div class="fm-ele" data-size="w300"><input type="text" id="ctgryNm_'+randomId+'" value=""></div>';
		    rowHtml += '    <div class="btn-wrap">';
		    rowHtml += '        <input type="hidden" id="mod1_'+randomId+'" value="I">';
		    rowHtml += '        <input type="hidden" id="order1_'+randomId+'" value="'+newOrderNo+'">';
		    rowHtml += '        <button type="button" id="btnUp_" name="btnUp" class="btn-up" onclick="javascript:moveRowUp(this); return false;" title="위로"></button>';
		    rowHtml += '        <button type="button" id="btnDown_" name="btnDown" class="btn-down" onclick="javascript:moveRowDown(this); return false;" title="아래로"></button>';
		    rowHtml += '        <button type="button" class="btn-del" onclick="javascript:delInfo(this);" title="삭제"></button>';
		    rowHtml += '    </div>';
		    rowHtml += '</div>';
		    rowHtml += '</li>';
		    rowHtml += '</ul>';

	    $('#ctgryList').append(rowHtml);
	    $('#ctgryNm_'+randomId).focus();
	    topBtnRefresh();
	}
	
	//row의 추가 버튼
	function addInfo(ctrl) {
        var _this = $(ctrl);
		var upCtgryId = _this.closest('li').attr('ID');
		var dataValue = _this.closest('li').data('value');
		_this.closest('.item').removeClass('child-none');
		if(!_this.closest('.item').hasClass("active")) {
			_this.closest('.item').addClass("active");
        }
		
	    var lastOrder = $('#'+upCtgryId).find('.subGroup'+(dataValue + 1)+' input[type="hidden"][id^="order'+(dataValue + 1)+'_"]').last();
	    var newOrderNo = lastOrder.length ? parseInt(lastOrder.val()) + 1 : 1;
	    var randomId = generateRandomId(8);
    	
		var rowHtml  = '<ul class="subGroup'+(dataValue + 1)+'" data-value="' + (dataValue + 1) + '">';
			rowHtml += '<li data-value="'+(dataValue + 1)+'">';
		    rowHtml += '<div class="item child-none">';
		    rowHtml += '    <button type="button" class="btn-toggle" onclick="javascript:toggle(this);" title="열기"></button>';
		    rowHtml += '    <div class="fm-ele" data-size="w300"><input type="text" id="ctgryNm_'+randomId+'" value=""></div>';
		    rowHtml += '    <div class="btn-wrap">';
		    rowHtml += '        <input type="hidden" id="mod'+(dataValue + 1)+'_'+randomId+'" value="I">';
		    rowHtml += '        <input type="hidden" id="order'+(dataValue + 1)+'_'+randomId+'" value="'+newOrderNo+'">';
		    rowHtml += '        <input type="hidden" id="upCtgryId'+(dataValue + 1)+'_'+randomId+'" value="'+upCtgryId+'">';
		    rowHtml += '        <button type="button" id="btnUp_" name="btnUp" class="btn-up" onclick="javascript:moveRowUp(this); return false;" title="위로"></button>';
		    rowHtml += '        <button type="button" id="btnDown_" name="btnDown" class="btn-down" onclick="javascript:moveRowDown(this); return false;" title="아래로"></button>';
		    rowHtml += '        <button type="button" class="btn-del" onclick="javascript:delInfo(this);" title="삭제"></button>';
		    rowHtml += '    </div>';
		    rowHtml += '</div>';
		    rowHtml += '</li>';
		    rowHtml += '</ul>';
		    
	    $('#'+upCtgryId).append(rowHtml);
	    $('#ctgryNm_'+randomId).focus();
	    midBtnRefresh();
	}
	
	//row의 삭제 버튼
	function delInfo(ctrl){
		var currentRow = $(ctrl).closest('ul');
		currentRow.remove();
		topBtnRefresh();
		midBtnRefresh();
	}
	
	//토글 화살표
	function toggle(ctrl){
		var _this = $(ctrl);
		
        if(_this.closest('.item').hasClass('child-none')){
            return;
        }

        if(_this.closest('.item').hasClass("active")) {
            _this.closest('.item').removeClass("active");
        } else {
            _this.closest('.item').addClass("active");
        }
	}
	
	// 위로 버튼
	function moveRowUp(ctrl) {
	    
		var curUl = $(ctrl).closest('ul');
		var curVal = curUl.data('value');
		var curOrdInput = curUl.find('input[type="hidden"][id^="order'+curVal+'_"]');
	    var curModInput = curUl.find('input[type="hidden"][id^="mod'+curVal+'_"]');
	    
	    if (curVal > 0) {
	        var prevUl = curUl.prev('ul');
	        var prevVal = prevUl.data('value');
	        var prevOrdInput = prevUl.find('input[type="hidden"][id^="order'+prevVal+'_"]');
	        var prevModInput = prevUl.find('input[type="hidden"][id^="mod'+prevVal+'_"]');
	        
	        if (curVal == prevVal) {
	            curUl.insertBefore(prevUl);
	            swapValues(curOrdInput, prevOrdInput);
	            markUpdated(curModInput);
	            markUpdated(prevModInput);
	        }
	    }
	    
	    topBtnRefresh();
		midBtnRefresh();
	}

	// 아래로 버튼
	function moveRowDown(ctrl) {
	    var curUl = $(ctrl).closest('ul');
	    var curVal = curUl.data('value');
	    var curOrdInput = curUl.find('input[type="hidden"][id^="order'+curVal+'_"]');
	    var curModInput = curUl.find('input[type="hidden"][id^="mod'+curVal+'_"]');
	
	    if(curVal > 0) {
	        var nextUl = curUl.next('ul');
	        var nextVal = nextUl.data('value');
	        var nextOrdInput = nextUl.find('input[type="hidden"][id^="order'+nextVal+'_"]');
	        var nextModInput = nextUl.find('input[type="hidden"][id^="mod'+nextVal+'_"]');
	        
	        if(curVal == nextVal) {
	            curUl.insertAfter(nextUl);
	            swapValues(curOrdInput, nextOrdInput);
	            markUpdated(curModInput);
	            markUpdated(nextModInput);
	        }
	    }
	    
	    topBtnRefresh();
		midBtnRefresh();
	}

	//위치 소트값 교환
	function swapValues(input1, input2) {
	    var tempValue = input1.val();
	    input1.val(input2.val());
	    input2.val(tempValue);
	}

	//등록, 업데이트 구분자 세팅
	function markUpdated(input) {
		if(input.val() != "I" && input.val() != "U2" ) input.val("U");
	}
	
    //난수 발생 
	function generateRandomId(length) {
	    var result = '';
	    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	    var charactersLength = characters.length;
	    for (var i = 0; i < length; i++) {
	        result += characters.charAt(Math.floor(Math.random() * charactersLength));
	    }
	    return result;
	}
    
    //추가 변경사항 저장
    function funSave() {
    	
    	var stopflag = false;
    	//분류명 빈값 체크
    	$('.topGroup, [class^="subGroup"]').each(function() {
        	var ctgryId = $(this).find('[id^="ctgryNm_"]').attr('id').replace('ctgryNm_', '');
            var curVal = $(this).data('value');
            var modVal = $('#mod'+curVal+'_' + ctgryId).val();

            if (modVal == "I" || modVal == "U" || modVal == "U2") {
                var ctgryNmVal = $('#ctgryNm_' + ctgryId).val();
                if (!ctgryNmVal.trim()) {
                	stopflag = true;
                	alert("분류명을 입력하세요.");
                    $('#ctgryNm_' + ctgryId).focus();
                    return false;
                }
            }
        });
    	
    	if(stopflag) return;
    	
    	var arrParam = [];
    	
    	$('.topGroup, [class^="subGroup"]').each(function() {
        	var ctgryId = $(this).find('[id^="ctgryNm_"]').attr('id').replace('ctgryNm_', '');
            var curVal = $(this).data('value');
            
            var modVal = $('#mod'+curVal+'_' + ctgryId).val();
            var orderVal = $('#order'+curVal+'_' + ctgryId).val();

            if (modVal == "I" || modVal == "U" || modVal == "U2") {
                var ctgryNmVal = $('#ctgryNm_' + ctgryId).val();
                var ctgryTypeCd = $('#ctgryTypeCd').val();
                var instId = $('#instId').val(); 
                
                if(curVal == 1){
                	arrParam.push(modVal+"|"+ctgryTypeCd+"|"+curVal+"|empty|"+ctgryNmVal+"|"+orderVal+"|"+instId+"|"+ctgryId);
                }else{
                	var upCtgryId = $('#upCtgryId'+curVal+'_' + ctgryId).val().replace('li_', '');
                	arrParam.push(modVal+"|"+ctgryTypeCd+"|"+curVal+"|"+upCtgryId+"|"+ctgryNmVal+"|"+orderVal+"|"+instId+"|"+ctgryId);
                }
            }
        });
    	
    	if(arrParam.length == 0){
    		alert("수정내역이 없습니다.");
    		return;
    	}
    	
    	axios.post(contextPath +'/dgtlClrcsClsfCtgryMgt/saveDgtlClrcsClsfCtgryList.do',{
    		arrParam: arrParam
		}).then(function (response) {
			if (response.status == 200) {
				if(response.data.resultCode == 200){
					var saveCnt = response.data.resultData;
					if(saveCnt > 0){
						alert("분류코드가 저장되었습니다.");
						funCtgryList();//목록조회
					}else{
						alert("분류코드 저장에 실패하였습니다.[0건]");
					}
				}else{
					alert("분류코드 저장에 실패하였습니다.");
			    } 
			}
	    }).catch(function (error) {
            console.error(error);
        });
    }
    
    //최상위 위,아래 버튼들 갱신
    function topBtnRefresh(){
    	$('.topGroup').each(function() {
    	    var $currentGroup = $(this);
    	    var $siblings = $currentGroup.siblings();
    	    var isFirst = $siblings.length == 0 || $currentGroup.is(':first-child');
    	    var isLast = $siblings.length == 0 || $currentGroup.is(':last-child');
    	    $currentGroup.find('.btn-up').toggle(!isFirst && $siblings.length > 0);
    	    $currentGroup.find('.btn-down').toggle(!isLast && $siblings.length > 0);
    	});
    }
    
    //부모있는 자식들의 위,아래 버튼들 갱신
    function midBtnRefresh(){
	   	$('[class^="subGroup"]').each(function() {
	   	    var $currentGroup = $(this);
	   		var $siblings = $currentGroup.siblings();
	   		var parentRow = $currentGroup.closest('li');
	   		var isFirst = $currentGroup.index() == 1;
	   		var isLast = $currentGroup.index() == $siblings.length;
	   		$currentGroup.find('.btn-up').toggle($siblings.length > 0 && !isFirst);
	   		$currentGroup.find('.btn-down').toggle($siblings.length > 0 && !isLast);
	   	});
    }

</script>