/** 문자열 함수 시작 *****************************************************************************/
String.prototype.cms_trim=function()
{
    var str=this.replace(/(\s+$)/g,"");
    return str.replace(/(^\s*)/g,"");
}
/** 문자열 함수 종료 *****************************************************************************/


/** 폼 검증 함수 시작 ****************************************************************************/

function cms_search_form_check()
{
    form = document.formSearch;

    if(!cms_radio_is_checked(true, form.search_target)) {alert("검색방법을 설정해주십시오."); return false;}
    if(cms_txt_is_empty(true, form.search_string)) {alert("검색어를 입력하십시오."); return false;}

    form.submit();
}

function cms_is_mb_rrn(cms_focus, cms_element1, cms_element2)   //주민등록번호 체크
{
    var rrn1 = cms_element1.value.cms_trim();
    var rrn2 = cms_element2.value.cms_trim();

    if ((rrn1.length != 6) || (rrn2.length != 7))
    {
        if (cms_focus)
            cms_element1.focus();

        return false;
    }

    var temp_num = new Array(13);
    var last_num,i,j;

    for (i=0 ; i<=5; i++)
        temp_num[i] = rrn1.charAt(i);

    for (j=0 ; j<=7; j++)
    {
        var n = j+6;
        temp_num[n] = rrn2.charAt(j);
    }

    last_num = 11 - ((temp_num[0] *2 +
                      temp_num[1] *3 +
                      temp_num[2] *4 +
                      temp_num[3] *5 +
                      temp_num[4] *6 +
                      temp_num[5] *7 +
                      temp_num[6] *8 +
                      temp_num[7] *9 +
                      temp_num[8] *2 +
                      temp_num[9] *3 +
                      temp_num[10]*4 +
                      temp_num[11]*5) % 11);

    if (last_num > 9)
        last_num = last_num % 10;

    if (last_num != temp_num[12])
    {
        if (cms_focus)
            cms_element1.focus();

        return false;
    }
    else
        return true;
}

function cms_is_bsn(cms_focus, cms_element1, cms_element2, cms_element3)
{
    var tax_no1 = cms_element1.value.cms_trim();
    var tax_no2 = cms_element2.value.cms_trim();
    var tax_no3 = cms_element3.value.cms_trim();

    var tax_no  = tax_no1 + "" + tax_no2 + "" + tax_no3;

	var step1, step2, step3, step4, step5, step6, step7;
    var chkRule = "137137135";

    if ((tax_no1.length != 3) || (tax_no2.length != 2) || (tax_no3.length != 5))
    {
        if (cms_focus)
            cms_element1.focus();

        return false;
    }

	step1 = 0;

	for (i=0; i<7; i++)
        step1 = step1 + (tax_no.substring(i, i+1) *chkRule.substring(i, i+1));

	step2 = step1 % 10;
    step3 = (tax_no.substring(7, 8) * chkRule.substring(7, 8))% 10;
	step4 = tax_no.substring(8, 9) * chkRule.substring(8, 9);
	step5 = Math.round(step4 / 10 - 0.5);
	step6 = step4 - (step5 * 10);
	step7 = (10 - ((step2 + step3 + step5 + step6) % 10)) % 10;

	if (tax_no.substring(9, 10) != step7)
    {
        if (cms_focus)
            cms_element1.focus();

        return false;
    }
    else
        return true;
}

function cms_txt_is_domain(cms_focus, cms_element)
{
    if (cms_element.value.cms_trim().search(/(\S+)\.(\S+)/) == -1 )
    {
        if (cms_focus && !cms_element.readOnly && !cms_element.disabled)
            cms_element.focus();
        return false;
    }
    else
       	return true;
}

function cms_max_length_mobile(cms_element)
{
	if (cms_element.value.length > cms_element.maxLength)
	{
		cms_element.value = cms_element.value.slice(0, cms_element.maxLength);
	}
}

function cms_txt_is_email(cms_focus, cms_element)
{
    if (cms_element.value.cms_trim().search(/(\S+)@(\S+)\.(\S+)/) == -1 )
    {
        if (cms_focus && !cms_element.readOnly && !cms_element.disabled)
            cms_element.focus();
        return false;
    }
    else
       	return true;
}

function cms_txt_is_equal(cms_remove, cms_element1, cms_element2)
{
    if (cms_element1.value.cms_trim() != cms_element2.value.cms_trim())
    {
        if (cms_remove)
        {
            cms_element1.value = "";
            cms_element2.value = "";

            if (!cms_element1.readOnly && !cms_element1.disabled)
                cms_element1.focus();
        }

        return false;
    }
    else
       	return true;
}

/** 폼 검증 함수 종료 ****************************************************************************/

/** input type=text 관련 스크립트 시작 ***********************************************************/
function cms_txt_is_empty(cms_focus, cms_element) {
    if ((cms_element.value.cms_trim() == "") || (cms_element.value.cms_trim().length <= 0)) {
        cms_element.value = "";

        if (cms_focus && !cms_element.readOnly && !cms_element.disabled) {
        	cms_element.focus();
        }        	

       	return true;
    } else{
    	return false;
    }
}

function cms_txt_is_length(cms_focus, cms_condition, cms_element)
{
    if (eval("cms_element.value.cms_trim().length " + cms_condition))
    {
        if (cms_focus && !cms_element.readOnly && !cms_element.disabled)
            cms_element.focus();

       	return true;
    }
    else
        return false;
}

function cms_txt_is_char_length(cms_element, cms_char) {
	var char_cnt = 0;
	if ((cms_element.value.cms_trim() == "") || (cms_element.value.cms_trim().length <= 0)) {
		char_cnt = 0;
	} else {
		char_length = cms_element.value.cms_trim().length;
		for (i = 0; i < char_length; i++) {
			if (cms_element.value.cms_trim().charAt(i) == cms_char) {
				char_cnt = char_cnt + 1;
			}
		}
	}
	return char_cnt;
}

function cms_txt_last_char_check(cms_element, cms_char) {
	if ((cms_element.value.cms_trim() == "") || (cms_element.value.cms_trim().length <= 0)) {
		return false;
	} else {
		if (cms_element.value.substr(cms_element.value.length-1, 1) == cms_char) {
			return true;
		} else {
			return false;
		}
	}
}
/** input type=text 관련 스크립트 시작 ***********************************************************/

/** input type=radio, checkbox 관련 스크립트 시작 ************************************************/

function cms_radio_is_checked(cms_focus, cms_element)
{
    var is_checked = false;

    if (typeof(cms_element.length) == "undefined")  // 같은 이름의 Radio, Checkbox 가 1개일 경우
    {
        if (cms_element.checked)
            is_checked = true;

        if (cms_focus && !is_checked && !cms_element.readOnly && !cms_element.disabled)
            cms_element.focus();
    }
    else                                            // 같은 이름의 Radio, Checkbox 가 2개 이상일 경우
    {
        for (i=0; i<cms_element.length; i++)
        {
            if (cms_element[i].checked)
                is_checked = true;
        }

        if (cms_focus && !is_checked && !cms_element[0].readOnly && !cms_element.disabled)
            cms_element[0].focus();
    }

    return is_checked;
}

function cms_radio_checked_value(cms_element)
{
    var checked_value = "";

    if (typeof(cms_element.length) == "undefined")  // 같은 이름의 Radio 가 1개일 경우
    {
        if (cms_element.checked)
            checked_value = cms_element.value;
    }
    else                                        // 같은 이름의 Radio 가 2개 이상일 경우
    {
        for (i=0; i<cms_element.length; i++)
        {
            if (cms_element[i].checked)
                checked_value = cms_element[i].value;
        }
    }

    return checked_value;
}

function cms_checkbox_checked_cnt(cms_element)
{
    var checkedNum = 0;

    if (typeof(cms_element.length) == "undefined")  // 같은 이름의 Checkbox 가 1개일 경우
    {
        if (cms_element.checked)
            checkedNum = checkedNum + 1;
    }
    else                                        // 같은 이름의 Checkbox 가 2개 이상일 경우
    {
        for (i=0; i<cms_element.length; i++)
        {
            if (cms_element[i].checked)
                checkedNum = checkedNum + 1;
        }
    }

    return checkedNum;
}

function cms_checkbox_count(cms_element, cms_condition)
{
   /********************************************
    * cms_element   : 같은 name 을 사용하는 체크박스
    * cms_condition : 조건
        - all       : 전체 갯수
        - checked   : 선택한 체크박스 갯수
        - unchecked : 선택하지 않은 체크박스 갯수
    ********************************************/

    if (cms_condition!="all" && cms_condition!="checked" && cms_condition!="unchecked")
    {
        alert("잘못된 접근입니다.")
        return false;
    }

    var countAll       = 0;
    var countChecked   = 0;
    var countUnChecked = 0;

    if (typeof(cms_element.length) == "undefined")   // 같은 이름의 Checkbox 가 1개일 경우
    {
        countAll=1;

        if (cms_element.checked)
            countChecked = 1;
    }
    else                                            // 같은 이름의 Checkbox 가 2개 이상일 경우
    {
        countAll = cms_element.length;

        for (i=0; i<cms_element.length; i++)
        {
            if (cms_element[i].checked)
                countChecked = countChecked + 1;
        }
    }

    countUnChecked = countAll - countChecked;

    switch (cms_condition)
    {
        case "all"       : return countAll;       break;
        case "checked"   : return countChecked;   break;
        case "unchecked" : return countUnChecked; break;
    }
}

function cms_checkbox_check(cms_target, cms_checked)
{
    var cms_status;

    if(cms_checked=="auto")
    {
        if(cms_checkbox_count(cms_target, "unchecked") > 0)
            cms_status=true;     //선택되지 않은게 1개라도 있을 경우 전부 선택
        else
            cms_status=false;    // 모두 선택되었을 경우 전부 해제
    }
    else if(cms_checked===true || cms_checked===false)    // true나 false 일 경우 모두 선택 또는 해제
        cms_status=cms_checked;

    for (i=0; i<cms_target.length; i++)
        cms_target[i].checked=cms_status;

    return cms_status;
}


/** input type=radio, checkbox 관련 스크립트 종료 ************************************************/

/** select 관련 스크립트 시작 ********************************************************************/

function cms_select_is_empty(cms_focus, cms_element)
{
    if ((cms_element.options[cms_element.selectedIndex].value.cms_trim() == "") || (cms_element.options[cms_element.selectedIndex].value.cms_trim().length <= 0))
    {
        if (cms_focus && !cms_element.disabled)
            cms_element.focus();

       	return true;
    }
    else
        return false;
}

function cms_select_selected_value(cms_element)
{
    return cms_element.options[cms_element.selectedIndex].value.cms_trim();
}

function cms_select_selected_text(cms_element)
{
    return cms_element.options[cms_element.selectedIndex].text.cms_trim();
}

function cms_select_option_remove(cms_element)
{
    var len=cms_element.options.length-1;

    for (i=len; i>=1; i--)      // Option를 뒤에서 부터 삭제한다. 앞에서 부터 삭제하면 index값 조정이 힘들다.
        cms_element.options.remove(i);

    cms_element.selectedIndex = 0;
}

function cms_select_option_insert(cms_element, cms_code, cms_text)
{
    var oOption;

    oOption = document.createElement("OPTION");
    oOption.value = cms_code;
    oOption.text  = cms_text;

    cms_element.add(oOption);
}

/** select 관련 스크립트 시작 ********************************************************************/

/** 입력중인 값 관련함수 시작 ************************************************************************/

function cms_input_only_number()              // 오직 숫자만 입력
{
	if ((event.keyCode<48)||(event.keyCode>57))  // 숫자(48-57)만 허용
	{
		event.returnValue=false;
		if (event.preventDefault) 
		{
			event.preventDefault();
		}
	}
	else
	{
		event.returnValue = true;
	}
}

function cms_input_only_number_check(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
		return;
	} else {
		return false;
	}
}

function cms_input_only_remove_char(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
		return;
	} else {
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
}

function cms_input_only_bank_number(cms_element)      // 은행계좌번호 형식 입력 (ex '111-22-33333')
{
	if (((event.keyCode<48)||(event.keyCode>57)) && (event.keyCode!=45))						// 숫자(48-57)와 - (45) 만 입력 허용
	{
		event.returnValue=false;
		if (event.preventDefault) 
		{
			event.preventDefault();
		}
	}
	else
	{
		if ((cms_element.value.length == 0) && (event.keyCode==45))                                 // 처음입력시 - (45) 문자 차단
		{
			event.returnValue = false;
			if (event.preventDefault) 
			{
				event.preventDefault();
			}
		}
		else if ((cms_element.value.substr(cms_element.value.length-1, 1) == "-") && (event.keyCode==45))		// - (45) 문자 2번 반복 차단
		{
			event.returnValue = false;
			if (event.preventDefault) 
			{
				event.preventDefault();
			}
		}
		else
		{
			event.returnValue = true;
		}
	}
}


function cms_input_only_percent(cms_element)      // 퍼센트 형식 입력 (ex '11.25')
{
	if (((event.keyCode<48)||(event.keyCode>57)) && (event.keyCode!=46))						// 숫자(48-57)와 . (46) 만 입력 허용
	{
		event.returnValue=false;
		if (event.preventDefault) 
		{
			event.preventDefault();
		}
	}
	else
	{
		if ((cms_element.value.length == 0) && (event.keyCode==46)) // 처음입력시 . (46) 문자 차단
		{
			event.returnValue = false;
			if (event.preventDefault) 
			{
				event.preventDefault();
			}
		}
		else if ((cms_element.value.substr(cms_element.value.length-1, 1) == ".") && (event.keyCode==46))		// . (46) 문자 2번 반복 차단
		{
			event.returnValue = false;
			if (event.preventDefault) 
			{
				event.preventDefault();
			}
		}
		else if ((cms_element.value.indexOf(".") >-1) && (event.keyCode==46))		// . (46) 문자 2번 입력 차단
		{
			event.returnValue = false;
			if (event.preventDefault) 
			{
				event.preventDefault();
			}
		}
		else
		{
			event.returnValue = true;
		}
	}
}

function cms_input_only_bank_number_check(cms_element)  //은행계좌번호가 '-'로 끝날 경우 제거 (ex '123-45-678-' => '123-45-678')
{
	if (cms_element.value.cms_trim().substr(cms_element.value.cms_trim().length-1,1) == "-")
	{
		cms_element.value=cms_element.value.cms_trim().substr(0,cms_element.value.cms_trim().length-1);
	}
}

function cms_move_focus(cms_length, cms_element1, cms_element2)   // Focus 이동
{
    var len = cms_element1.value.cms_trim().length;

    if(cms_length == len)
        cms_element2.focus();
}

function cms_input_number_format_on(cms_element)
{
	var num=cms_element.value;

	num=new String(num);
	num=num.replace(/,/gi,"");

	var sign="";
	if(isNaN(num)) {
		alert("숫자만 입력할 수 있습니다.");
		return 0;
	}

	if(num==0) {
		return num;
	}

	if(num<0){
		num=num*(-1);
		sign="-";
	}
	else{
		num=num*1;
	}
	num = new String(num)
	var temp="";
	var pos=3;
	num_len=num.length;
	while (num_len>0){
		num_len=num_len-pos;
		if(num_len<0) {
			pos=num_len+pos;
			num_len=0;
		}
		temp=","+num.substr(num_len,pos)+temp;
	}

	cms_element.value=sign+temp.substr(1);
}

function cms_input_number_comma(cms_element)
{
	var num = cms_element;
	num = new String(num)
	var temp = "";
	var pos = 3;
	num_len = num.length;

	while (num_len>0){
		num_len=num_len-pos;
		if (num_len<0) {
			pos=num_len+pos;
			num_len=0;
		}
		temp = ","+num.substr(num_len,pos)+temp;
	}

	temp = temp.substr(1);

	return temp;

}

function cms_file_img_check(cms_element) {
	var file_name = cms_element1.value.cms_trim();
	var file_parts = file_name.split('.');
	var file_ext = file_parts[file_parts.length - 1];
	switch (file_ext.toLowerCase()) {
		case 'jpg' : return true; break;
		case 'gif' : return true; break;
		case 'png' : return true; break;
		case 'jpeg' : return true; break;
		default : return false;
	}
}

function onlyDecimal(element, event) {
    event = event || window.event;    
    var code = (event.which) ? event.which : event.keyCode; // Firefox는 event.which 사용
    if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105) || code == 8 || code == 9 || code == 46 || code == 37 || code == 39 || code == 110 || code == 116 || code == 190) {
    	if ((element.value.length == 0) && (code == 110 || code == 190)) { // 처음입력시 . (190) 문자 차단
    		event.returnValue = false;
    		if (event.preventDefault) {
    			event.preventDefault();
    		}
    	} else if ((element.value.substr(element.value.length - 1, 1) == ".") && (code == 110 || code == 190)) { // . (190) 문자 2번 반복 차단
    		event.returnValue = false;
    		if (event.preventDefault) {
    			event.preventDefault();
    		}			
		} else if ((element.value.indexOf(".") > -1) && (code == 110 || code == 190)) { // . (190) 문자 2번 입력 차단
			event.returnValue = false;
    		if (event.preventDefault) {
    			event.preventDefault();
    		}
		} else {
			event.returnValue = true;
		}        
    } else {
    	event.returnValue = false;
    }
}

function removeChar(event) {
    event = event || window.event;

    var code = (event.which) ? event.which : event.keyCode;
    if (code == 8 || code == 46 || code == 37 || code == 39) {
        return;
    } else {
        event.target.value = event.target.value.replace(/[^\.0-9]/g, "");
    }
}

/** 입력중인 값 관련함수 종료 ************************************************************************/

/** blink 관련함수 ************************************************************************/

/**━━ Blink 관련함수 시작 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

function cms_blink()
{
    setInterval( "cms_blink_sub()", 500 ); //속도
}

function cms_blink_sub()
{
    var blinkArr = document.getElementsByTagName("BLINK");
    var blinkCnt = blinkArr.length;
    for( var i=0; i<blinkCnt; i++ )
    {
        blinkArr[i].style.visibility = (blinkArr[i].style.visibility == "hidden") ? "" : "hidden";
    }
}

/**━━ Blink 관련함수 종료 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

/**━━ Cookie 관련함수 시작 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/

function cms_cookie_set_expire_date(year,day,hour,minute,second)
{
    var today = new Date();
    var exprs = new Date();
    exprs.setTime( today.getTime()
                  +1000*60*60*24*365*year
                  +1000*60*60*24    *day
                  +1000*60*60       *hour
                  +1000*60          *minute
                  +1000             *second );
    return exprs;
}

function cms_cookie_set(name,value,expires,path,domain,secure)
{
    document.cookie =   name + '=' + escape(value)         + ';'       +
         ((expires) ? ' expires='  + expires.toGMTString() + ';' : '') +
         ((path)    ? ' path='     + path                  + ';' : '') +
         ((domain)  ? ' domain='   + domain                + ';' : '') +
         ((secure)  ? ' secure'                            + ';' : '');
}

// Returns a string or false
function cms_cookie_get(name)
{
    var srch = name + '=';
    if (document.cookie.length > 0)
    {
        offset = document.cookie.indexOf(srch);
        if (offset != -1)
        {
            offset += srch.length;
            end = document.cookie.indexOf(';', offset);
            if (end == -1)
                end = document.cookie.length;

            return unescape(document.cookie.substring(offset, end));
        }
        else
            return '';
    }
    else
        return '';
}

// Optional: path,domain
function cms_cookie_delete(name,path,domain)
{
    if (cms_cookie_get(name))
    {
        document.cookie = name                + '=;'             +
                        ' expires=Thu, 01-Jan-70 00:00:01 GMT;'  +
            ((path)   ? ' path='    + path    + ';' : '')        +
            ((domain) ? ' domain='  + domain  + ';' : '');
    }
}

/**━━ Cookie 관련함수 종료 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**/


/** 날짜관련 함수 : 시작 ***************************************************************************************************/

function cms_date_text2time(timeString)          //Time 스트링을 자바스크립트 Date 객체로 변환
{                                               //Parameter time: Time 형식의 String (고정폭 년월일시분초)
    var chkPattern = /-/g;                      //ex) 2005-01-02 또는 20050102 : '-' 사용은 편한대로
    var chkString  = timeString.replace(chkPattern, "")

    var chkYear  = chkString.substr(0,4);
    var chkMonth = chkString.substr(4,2) - 1;   // 1월=0,12월=11
    var chkDay   = chkString.substr(6,2);

    return new Date(chkYear, chkMonth, chkDay);
}

function cms_date_time2text(chkDate)             //Date 객체를 TimeString(ex 2005-01-02)로 변경
{
    var chkYear  = chkDate.getFullYear();
    var chkMonth = chkDate.getMonth() + 1;      //1월=0,12월=11이므로 1 더함
    var chkDay   = chkDate.getDate();

    if (("" + chkMonth).length == 1) { chkMonth = "0" + chkMonth; }
    if (("" + chkDay).length   == 1) { chkDay   = "0" + chkDay;   }

    return (chkYear + "-" + chkMonth + "-" + chkDay)
}

function cms_date_time3text(chkDate)             //Date 객체를 TimeString(ex 20050102)로 변경
{
    var chkYear  = chkDate.getFullYear();
    var chkMonth = chkDate.getMonth() + 1;      //1월=0,12월=11이므로 1 더함
    var chkDay   = chkDate.getDate();

    if (("" + chkMonth).length == 1) { chkMonth = "0" + chkMonth; }
    if (("" + chkDay).length   == 1) { chkDay   = "0" + chkDay;   }

    return (chkYear + "" + chkMonth + "" + chkDay)
}

function cms_date_add(chkString, yy, mo, dd)     //문자열 받아서 문자열로 반환
{                                               //ex) 2007-01-01 + 2개월 => 2007-03-01
    if (typeof(yy) == "undefined") yy=0;
    if (typeof(mo) == "undefined") mo=0;
    if (typeof(dd) == "undefined") dd=0;

    var date = cms_date_text2time(chkString);

    date.setFullYear(date.getFullYear() + yy);  //yy년을 더함
    date.setMonth(date.getMonth()       + mo);  //mo월을 더함
    date.setDate(date.getDate()         + dd);  //dd일을 더함

    return cms_date_time2text(date);
}

function cms_date_term_month(time1, time2)       //measureMonthInterval(time1,time2)
{                                               //두 Time이 몇 개월 차이나는지 구함
    var date1 = cms_date_text2time(time1);
    var date2 = cms_date_text2time(time2);

    var years  = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days   = date2.getDate() - date1.getDate();

    return (years * 12 + months + (days >= 0 ? 0 : -1) );
}

/** 생년월일 유효성 체크 */
function cms_isValidDate_birth(iDate) {
  if( iDate.length != 8 ) {
    return false;
  }
  
  oDate = new Date();

  if( parseInt(cms_date_time3text(oDate)) < parseInt(iDate) ) {	/*현재 년도와 비교 */    
    return false;
  }

  if(!cms_isValidDate(iDate)) {	/* 날짜 형식 유효성 */
    return false;
  }
   
  return true;
}
/**yyyymmdd 형식의 날짜값을 입력받아서 유효한 날짜인지 체크한다. ex) isValidDate("20070415"); */
function cms_isValidDate(iDate) {
  if( iDate.length != 8 ) {
    return false;
  }

  month_int = parseInt(iDate.substring(4, 6), 10);
  month_value = month_int - 1; 
  oDate = new Date();
  oDate.setFullYear( iDate.substring(0, 4));
  oDate.setMonth(month_value);
  oDate.setDate(parseInt(iDate.substring(6), 10));
  oDate_getYear = oDate.getFullYear();
  oDate_getDate = oDate.getDate(); 
  if (oDate.getMonth() == 2 || oDate.getMonth() == 4 || oDate.getMonth() == 6 || oDate.getMonth() == 9 || oDate.getMonth() == 11 )
  {
	  if (month_value == 2 || month_value == 4 || month_value == 6 || month_value == 9 || month_value == 11 )
	  {
		  oDate_getMonth = oDate.getMonth() + 1;
	  }
	  else
	  {
		  oDate_getMonth = oDate.getMonth();
	  }
  }
  else
  {
	  oDate_getMonth = oDate.getMonth() + 1;
  }

  if( oDate_getYear     != iDate.substring(0, 4)
      || oDate_getMonth != parseInt(iDate.substring(4, 6), 10)
      || oDate_getDate      != parseInt(iDate.substring(6), 10) ) {
	 
    
    return false;
  }
   
  return true;
}


/** 날짜관련 함수 : 종료 ***************************************************************************************************/

function cms_window_open_center(popUrl, popName, popWidth, popHeight, popAddFeatures)
{
    var popTop  = (screen.availHeight - popHeight) / 2;
    var popLeft = (screen.availWidth  - popWidth)  / 2;

    if (popAddFeatures)
        var popFeatures = "top="+popTop+", left="+popLeft+", width="+popWidth+", height="+popHeight+", "+popAddFeatures;
    else
        var popFeatures = "top="+popTop+", left="+popLeft+", width="+popWidth+", height="+popHeight;

    window.open(popUrl, popName, popFeatures);
}

function setCookie( name, value, expiredays )
{
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookie(name)
{
	 var nameOfCookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie )
        {
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                    endOfCookie = document.cookie.length;
            return unescape( document.cookie.substring( y, endOfCookie ));
        }
        x = document.cookie.indexOf( " ", x ) + 1;
        if ( x == 0 )
            break;
    }
    return "";
}

function bookmarksite(title,url) { 
   // Internet Explorer
 
   if(document.all)
   {
       window.external.AddFavorite(url, title); 
   }
   // Google Chrome
   else if(window.chrome){
      alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
   }
   // Firefox
   else if (window.sidebar) // firefox 
   {
       window.sidebar.addPanel(title, url, ""); 
   }
   // Opera
   else if(window.opera && window.print)
   { // opera 
      var elem = document.createElement('a'); 
      elem.setAttribute('href',url); 
      elem.setAttribute('title',title); 
      elem.setAttribute('rel','sidebar'); 
      elem.click(); 
   }
} 

function isEmpty(value){
	if(value.length == 0 || value == null){
		return true;
	}else{
		return false;
	}
}

function isNumeric(value){
	var regExp = /^[0-9]+$/g;
	return regExp.test(value);
}

function currencyFormatter(amount){
	return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}

function numberBlur(el){
	var val = $(el).val();
	if(!isEmpty(val) && isNumeric(val)){
		val = currencyFormatter(val);
		$(el).val(val);
	}
}

function numberFocus(el){
	var val = $(el).val();
	if(!isEmpty(val)){
		val = val.replace(/,/g,'');
		$(el).val(val);
	}
}
function inputNumberAutoComma(obj) {
    
    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = obj.value.replace(/\,/g, "");

    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if(isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = "";
        return false;
    }
    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}

// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {

    str = String(str);
    return str.replace(/[^\d]+/g, "");
}

function hangul(){ //한글 입력(onkeyPress)
	if((event.keyCode < 12592) || (event.keyCode > 12687)){
		event.returnValue = false;
	}
}

