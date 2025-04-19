<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/cmmnLibrary.js'/>"></script>
	<div class="contants">
				<!-- 콘텐츠 영역 -->
				<div class="btn-wrap align-right" >
				<!-- MNCLSF0001 : 관리자, MNCLSF0002 : 포털  paramMenuClsfCd-->
				<div class="fm-focus fm-select mr10">
				  <select id="menuClsfCd" name="menuClsfCd" title="구분" onChange="javascript:goMenuChange(); return false;">
				    <option value="MNCLSF0001" <c:if test="${paramMenuClsfCd == 'MNCLSF0001' or paramMenuClsfCd  == ''}">selected</c:if>>관리자</option>
				    <%-- <option value="MNCLSF0002" <c:if test="${paramMenuClsfCd == 'MNCLSF0002'}">selected</c:if>>포털</option> --%>
				  </select>
				</div>
					<button type="button" class="btns" onClick="javascript:goMenuRegInfo(); return false;">1Depth 추가</button>
					<button type="button" class="btns" onClick="javascript:goMenuRegProc(); return false;">등록</button>
					<button type="button" class="btns" onClick="javascript:goMenuModiProc(); return false;">수정</button>
					<button type="button" class="btns color-red" onClick="javascript:goMenuDelProc(); return false;">삭제</button>
					<button type="button" class="btns" onClick="javascript:goPopHisory(); return false;">이력조회</button>
				</div>
				<div class="info-wrap menu-info">
					<div class="info">
						<div class="contents-list">
						  <strong>메뉴 상세 조회</strong>
						  <c:if test="${!empty menuInfoList}">
						  	<c:forEach var="menuData" items="${menuInfoList}" varStatus="status">
							  <ul>
								  <c:if test="${empty menuData.upMenuId and menuData.menuDepth == 1}">
								    <li><p class="folder"><a href='#' onClick="javascript:menuInfo('${menuData.menuNm}','${menuData.menuId}','${menuData.menuExpln}','${menuData.useYn}','${menuData.menuTypeCd}','${menuData.lnkgContsId}','${menuData.scrnUriAddr}','${menuData.frstRegDt}','${menuData.frstRgtrId}'
								    																,'${menuData.lastMdfcnDt}','${menuData.lastMdfrId}','${menuData.sortSn}','${menuData.menuDepth}','${menuData.upMenuId}','${menuData.subMenuYn}'); return false;">${menuData.menuNm}</a></p>
								    	<button type="button" class="btns ml10 size-xsmall" onClick="javascript:addRow('${menuData.menuNm}','${menuData.menuId}'); return false;">추가</button>
								    </li>
								  </c:if>
							      <c:if test="${!empty menuData.upMenuId and menuData.menuDepth == 2}">  
								    <li>
								      &nbsp;&nbsp;&nbsp;&nbsp;
								      <p style="padding-left: 30px;"><a href='#' onClick="javascript:menuInfo('${menuData.menuNm}','${menuData.menuId}','${menuData.menuExpln}','${menuData.useYn}','${menuData.menuTypeCd}','${menuData.lnkgContsId}','${menuData.scrnUriAddr}','${menuData.frstRegDt}','${menuData.frstRgtrId}'
								      											  ,'${menuData.lastMdfcnDt}','${menuData.lastMdfrId}','${menuData.sortSn}','${menuData.menuDepth}','${menuData.upMenuId}','${menuData.subMenuYn}'); return false;">${menuData.menuNm}</a></p>
								    </li>
							      </c:if>
							  </ul>
							  </c:forEach>
						  </c:if>
						</div>
					</div>
					<div class="info sticky">
					<form name="frmMenu" id="frmMenu" method="post" action="#">
					<input type="hidden" class="serverValue" id="paramMenuClsfCd" name="paramMenuClsfCd" value="${paramMenuClsfCd}">
					<input type="hidden" class="serverValue" id="paramUpMenuNm" name="paramUpMenuNm" value="">
					<input type="hidden" class="serverValue" id="paramMenuId" name="paramMenuId" value="">
					<input type="hidden" class="serverValue" id="paramDepth" name="paramDepth" value="">
					<input type="hidden" class="serverValue" id="subMenuYn" name="subMenuYn" value="">
					
					<div class="table-wrap write mt0">
						<table class="mt0">
							<tbody>
								<tr id="addMenu">
						            <th data-size="w200">상위 메뉴 명</th>
						            <td>
						            	<div class="fm-focus fm-select" data-size="w450">
						            		<select id="paramUpMenuId" name="paramUpMenuId">
												<c:if test="${!empty upMenuList}">
													<c:forEach var="upMenuInfo" items="${upMenuList}">
														<option value="${upMenuInfo.menuId}">${upMenuInfo.menuNm}</option>
													</c:forEach>
												</c:if>
											</select>
						            	</div>
						            </td>
						        </tr>
								<tr>
						            <th data-size="w200">메뉴 명<span class="required">필수</span></th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramMenuNm" name="paramMenuNm" value="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>메뉴 상세</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramMenuExpln" name="paramMenuExpln" value="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>메뉴 사용 여부<span class="required">필수</span></th>
						            <td>
						            	<div class="fm-focus fm-select" data-size="w450">
						            		<select id="paramUseYn" name="paramUseYn" onChange="javascript:goChangeYn(); return false;">
						            			<option value="Y">사용</option>
						            			<option value="N">미사용</option>
						            		</select>
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>메뉴 타입<span class="required">필수</span></th>
						            <td>	            		
						            	<div class="fm-focus fm-select" data-size="w450">
						            		<select id="paramMenuTypeCd" name="paramMenuTypeCd">
						            			<option value="01">폴더</option>
						            			<option value="02">콘텐츠</option>
						            		</select>
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>연결 화면 명</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramLnkgContsId" name="paramLnkgContsId" value="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>연결 화면 URI</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramScrnUriAddr" name="paramScrnUriAddr" value="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>정렬 순서<span class="required">필수</span></th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramSortSn" name="paramSortSn" value="" onkeypress="cms_input_only_number()" onblur="cms_input_only_remove_char(event)"  onkeydown="cms_input_only_number_check(event)" onkeyup="cms_input_only_remove_char(event)">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>등록자</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramFrstRgtrId" name="paramFrstRgtrId" value="" disabled="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>등록일</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramFrstRegDt" name="paramFrstRegDt" value="" disabled="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>수정자</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramLastMdfrId" name="paramLastMdfrId" value="" disabled="">
						            	</div>
						            </td>
						        </tr>
						        <tr>
						            <th>수정일</th>
						            <td>
						            	<div class="fm-ele" data-size="w450">
						            		<input type="text" id="paramLastMdfcnDt" name="paramLastMdfcnDt" value="" disabled="">
						            	</div>
						            </td>
						        </tr>
							</tbody>
						</table>
					  </div>
					</from>
					
					</div>
				 </div>
				<!-- 콘텐츠 영역 끝  -->
		<div class="modals" id="modals">
            <div class="pop-layer" id="historyPop" style="padding:0;width:60%;">
            </div>
        </div>
   </div>
<script type="text/javascript">
/*1.페이지 렌더링시 작업이 있다면 여기에 기입*/
/*2.전역변수 정의 및 초기화는 여기에 기입 */
/*3.이벤트 핸들링 하는 부분은 여기에 기입*/

//관련 자원 추가를 위한 문화자원 목록 팝업 띄우는 함수
function goPopHisory(){
	
	let paramUrl = contextPath+'/menuMgt/menuHstryList.do';
	let paramMenuId = document.getElementById("paramMenuId").value;
	
	paramUrl += "?paramMenuId=" + paramMenuId;
	$('#historyPop').load(paramUrl);
	admin.modalsShow('modals');
	
}

/* 메뉴 등록 */
function goMenuRegProc(){
	
	let frm = document.frmMenu;
	if (cms_txt_is_empty(true, frm.paramMenuNm)) { alert("메뉴명을 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramUseYn)) { alert("메뉴사용여부를 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramMenuTypeCd)) { alert("메뉴타입을 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramSortSn)) { alert("정렬 번호를 입력해 주십시오"); return false;}
	if (!cms_txt_is_empty(true, frm.paramMenuId)) { alert("이미 등록된 메뉴입니다."); return false;}
	
	if(confirm("메뉴를 등록 하시겠습니까?")){
		frm.action = contextPath+'/menuMgt/menuReg.do';
	    frm.submit();
	}else{
		return false;
	}
	
}

/* 메뉴 수정*/
function goMenuModiProc(){
	let frm = document.frmMenu;
	if (cms_txt_is_empty(true, frm.paramMenuNm)) { alert("메뉴명을 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramUseYn)) { alert("메뉴사용여부를 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramMenuTypeCd)) { alert("메뉴타입을 입력해 주십시오."); return false;}
	if (cms_txt_is_empty(true, frm.paramMenuId)) { alert("등록된 메뉴가 아님니다. 수정 하시려면 좌측 메뉴 명 클릭 후 수정 부탁드립니다."); return false;}
	if (cms_txt_is_empty(true, frm.paramSortSn)) { alert("정렬 번호를 입력해 주십시오"); return false;}
	
	if(confirm("메뉴를 수정 하시겠습니까?")){
		frm.action = contextPath+'/menuMgt/menuModify.do';
	    frm.submit();
	}else{
		return false;
	}
	
}

function goMenuDelProc(){
	let frm = document.frmMenu;
	let subMenuYn = frm.subMenuYn.value;
	
	if(subMenuYn == 'Y'){
		alert("사용 중인 하위 메뉴가 존재 합니다. 하위 메뉴 삭제 후 실행 부탁 드립니다.");
		return false;
	}	
	if (cms_txt_is_empty(true, frm.paramMenuId)) { alert("삭제 메뉴를 선택 하여 주십시오."); return false;}
	
	if(confirm("메뉴를 삭제 하시겠습니까?")){
		frm.action = contextPath+'/menuMgt/menuDel.do';
	    frm.submit();
	}else{
		return false;
	}
}

/*4.동적메서드 선언부분*/
function menuInfo(menuNm,menuId,menuExpln,useYn,menuTypeCd,lnkgContsId,scrnUriAddr,frstRegDt,frstRgtrId,lastMdfcnDt,lastMdfrId,sortSn, menuDepthGbn,upMenuId,subMenuYn){
	
	document.getElementById("paramUpMenuNm").value = "";
	document.getElementById("paramMenuId").value = menuId;
	document.getElementById("paramMenuNm").value = menuNm;
	document.getElementById("paramMenuExpln").value = menuExpln;
	document.getElementById("paramUseYn").value = useYn;
	document.getElementById("paramMenuTypeCd").value = menuTypeCd;
	document.getElementById("paramLnkgContsId").value = lnkgContsId;
	document.getElementById("paramScrnUriAddr").value = scrnUriAddr;
	document.getElementById("paramSortSn").value = sortSn;
	document.getElementById("paramFrstRgtrId").value = frstRgtrId;
	document.getElementById("paramFrstRegDt").value = frstRegDt;	
	document.getElementById("paramLastMdfrId").value = lastMdfrId;
	document.getElementById("paramLastMdfcnDt").value = lastMdfcnDt;
	document.getElementById("subMenuYn").value = subMenuYn;
	
	//1단게 메뉴 일경우 상위 메뉴 변경 불가
	if(menuDepthGbn == 1){
		document.getElementById("paramUpMenuId").disabled = true;
		document.getElementById("paramUpMenuId").value = "";
		document.getElementById("paramDepth").value = "BI";
	}else{
		document.getElementById("paramUpMenuId").disabled = false;
		
		const el = document.getElementById('paramUpMenuId');
		const len = el.options.length;
		const str = upMenuId
		for (let i=0; i<len; i++){ 
			if(el.options[i].value == str){
				el.options[i].selected = true;
		    }
		}
		
		document.getElementById("paramUpMenuId").value = upMenuId;
		document.getElementById("paramDepth").value = "SM";
	}
	
}

//1Depth등록 추가 메뉴 값 set (cms)
function goMenuRegInfo(){
	
	
    document.getElementById("paramUpMenuNm").value = "";
	document.getElementById("paramUpMenuId").value = "";
	document.getElementById("paramMenuNm").value = "";
	document.getElementById("paramMenuId").value = "";
	document.getElementById("paramMenuExpln").value = "";
	document.getElementById("paramUseYn").value = "Y";
	document.getElementById("paramMenuTypeCd").value  = "";
	document.getElementById("paramLnkgContsId").value = "";
	document.getElementById("paramScrnUriAddr").value = "";
	document.getElementById("paramSortSn").value = "";
	document.getElementById("paramFrstRgtrId").value = "";
	document.getElementById("paramFrstRegDt").value = "";	
	document.getElementById("paramLastMdfrId").value = "";
	document.getElementById("paramLastMdfcnDt").value = "";
	document.getElementById("paramDepth").value = "BI";
	//1단계 등록시 상위메뉴 select box 비활성화
	document.getElementById("paramUpMenuId").disabled = true;
	
}

//2Depth 등록 추가 메뉴 값 set
function addRow(upMenuNm , upMenuId){
	
	const el = document.getElementById('paramUpMenuId');
	const len = el.options.length;
	const str = upMenuId
	for (let i=0; i<len; i++){ 
		if(el.options[i].value == str){
			el.options[i].selected = true;
	    }
	}
	
	document.getElementById("paramUpMenuId").disabled = false;
		
	document.getElementById("paramUpMenuNm").value = upMenuNm;
	document.getElementById("paramUpMenuId").value = upMenuId;
	document.getElementById("paramMenuId").value = "";
	document.getElementById("paramMenuNm").value = "";
	document.getElementById("paramMenuExpln").value = "";
	document.getElementById("paramUseYn").value = "Y";
	document.getElementById("paramLnkgContsId").value = "";
	document.getElementById("paramScrnUriAddr").value = "";
	document.getElementById("paramSortSn").value = "";
	document.getElementById("paramFrstRgtrId").value = "";
	document.getElementById("paramFrstRegDt").value = "";	
	document.getElementById("paramLastMdfrId").value = "";
	document.getElementById("paramLastMdfcnDt").value = "";
	document.getElementById("paramDepth").value = "SM";
}

function goChangeYn(){
	
	let changeYn = document.getElementById("subMenuYn").value;
	let useYn = document.getElementById("paramUseYn").value;
	
	let el = document.getElementById('paramUseYn');
	let len = el.options.length;
	
	if(useYn == 'N'){ 
		if(changeYn == 'Y'){
			alert("사용 중인 하위 메뉴가 존재 합니다. 하위 메뉴를  미사용으로 변경 후 수정 부탁 드립니다.");
			str = "Y";
			for (let i=0; i<len; i++){ 
				if(el.options[i].value == str){
					el.options[i].selected = true;
			    }
			}
			return false;
		}
	}
	
}


function goMenuChange(){
	
	document.getElementById("paramMenuClsfCd").value = document.getElementById("menuClsfCd").value;
	
	let frm = document.frmMenu;
    frm.action = contextPath+'/menuMgt/menuList.do';
    frm.submit();
}
</script>