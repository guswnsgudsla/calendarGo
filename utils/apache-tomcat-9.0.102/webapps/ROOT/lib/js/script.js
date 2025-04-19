/**
 * 좌측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 * console.log(lpad("01", 5, "0")); // 00001
 * console.log(lpad("01", 5, "01")); // 01010
 */
function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}


/**
 * 우측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 * console.log(rpad("01", 5, "AB")); // 01ABA
 * console.log(rpad("01", 5, "ABCDEF")); // 01 : 채우고자 하는 문자열이 요청 길이보다 큽니다
 */
function rpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str + "";
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str += padStr;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}

// cookies
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
} 

function getCookie(name) {
	var nameOfCookie = name + "=";
	var x = 0;
	while(x <= document.cookie.length) {
		var y = (x + nameOfCookie.length);
		if(document.cookie.substring(x, y) == nameOfCookie) {
			if ((endOfCookie=document.cookie.indexOf(";", y)) == -1) {
				endOfCookie = document.cookie.length;
			}
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if(x == 0) {
			break;
		}
	}
	return "";
}

function delCookie(name,domain) {
	var today = new Date() ;
	var value = getCookie(name);			

	today.setTime(today.getTime() - 1);											

	if (value != "") {
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + "; domain=" + domain + ";";
	}
}



// 우편번호 찾기
function Winzip() {
	window.open('/member/zipcode.php', '_zipcode', 'width=417, height=400, scrollbars=1,toolbars=0,statusbar=0');
}

// 우편번호 찾기(새주소)
function Winzip2() {
	window.open('/lib/new_zipcode/road.php', '_zipcode', 'width=420, height=700, scrollbars=1,toolbars=0,statusbar=0');
}


// 로그인 체크
function notLogin(url){
	if (confirm("회원전용 페이지입니다. 로그인 하시겠습니까?")) {
		window.location.href="/member/login.php?q_path_ec="+url
	}
}

function cmtnotLogin(url){
	//this.blur();
	if (confirm("회원전용 페이지입니다. 로그인 하시겠습니까?")) {
		parent.window.location.href="/member/login.php?q_path_ec="+url
	}
}		



// strip
String.prototype.strip =  function() {
    return this.replace(/^\s+/, '').replace(/\s+$/, '');
 }

// text 타입의 element strip
function form_strip(f) {
	var elList = f.getElementsByTagName("input");
	for (i=0;i<elList.length;i++ ){
		if (elList[i].type.toLowerCase() == "text" || elList[i].type.toLowerCase() == "textarea"){
			elList[i].value = elList[i].value.strip();
		}
	}
}



/* -------------------------- 필수 입력 필드의 입력값 체크 함수 START ----------------------------------*/
/*
chk_field 함수 이외에 chk_range, chk_radio를 함께 사용한다.

chk_field에서의 체크 종류
 - null    : 값이 없으면 false
 - email   : email 형식에 맞지 않으면 false
 - checked : checkbox가 체크되어있지 않으면 false
 - number  : 값이 숫자로만 되어있으면 true
 - alpha   : 값이 알파벳으로만 되어있으면 true
 - alnum   : 값이 알파벳, 숫자, 언더바로만 되어있으면 true


* 사용예 )
function chk_f(f) {
	return (chk_field ($("#usr_id")  , "null"     , "아이디")
		&&  chk_range ($("#usr_id")  , 4, 10      , "아이디")
		&&  chk_field ($("#usr_id")  , "email"    , "이메일")
		&&  chk_field ($("#usr_pass"), "null"     , "비밀번호")
		&&  chk_field ($("#chkbox")  , "checked"  , "체크박스")
		&&  chk_field ($("#sel")     , "null"     , "선택")
		&&  chk_radio (f.radioName   , "radio체크")
	);
}
*/
function chk_field(field, check, msg) {
	var v = field.val();
	if (v != undefined) {

		switch (check) {
			case "null" : // null 체크
				if (v == "") {
					alert (msg+" : 필수 입력 사항입니다.");
					field.select();
					field.focus();
					return false;
				}
			break;

			case "editor" : // null 체크
				if (v == '<br _moz_editor_bogus_node="TRUE" />' || v == '<br />' || v == '') {
					alert (msg+" : 필수 입력 사항입니다.");
					field.select();
					field.focus();
					return false;
				}
			break;

			case "hidden" : // null 체크
				if (v == "") {
					alert (msg+" : 필수 입력 사항입니다.");
					return false;
				}
			break;

			case "checked" : // 체크박스
				if(field.is(":checked")!=true) {
					alert (msg+" : 필수 체크 사항입니다.");
					field.focus();
					return false;
				}
			break;

			case "email" : // 이메일
				if (!chk_mail(v)) {
					alert ("올바른 메일주소가 아닙니다.");
					field.select();
					field.focus();
					return false;
				}
			break;

			case "date" : // 날짜
				if (v != "") {
					if (!chk_date(v)) {
						alert ("올바른 날짜가 아닙니다.");
						field.val('');
						field.focus();
						return false;
					}
				} else {
					return true;
				}
			break;

			case "number" : // 숫자만 입력.
				if (!chk_num1(v)) {
					alert (msg+" : 숫자만 입력 가능합니다..");
					field.select();
					field.focus();
					return false;
				}
			break;

			case "alpha" : // 영문
				if (!chk_alpha(v)) {
					alert (msg+" : 영문만 입력 가능합니다..");
					field.select();
					field.focus();
					return false;
				}
			break;

			case "alnum" : // 영문, 숫자, 언더바(_)
				if (!chk_hangul2(v)) {
					alert (msg+" : 영문, 숫자, 언더바(_)만 입력 가능합니다..");
					field.select();
					field.focus();
					return false;
				}
			break;
		}
	}

	return true;
}

// 체크박스나 라디오버튼 선택시 특정 텍스트 필드 필수 입력 체크
function chk_options(field1, field2, mode, msg) {
	if(mode == 0) {
		if(field1.checked!=true) {
			return chk_field(field2, "null", msg);
		}
	} else {
		if(field1.checked==true) {
			return chk_field(field2, "null", msg);
		}
	}
	return true;
}

// 체크박스나 라디오버튼 선택시 특정 라디오/체크박스 필드 필수 입력 체크
function chk_options2(field1, field2, mode, msg) {
	if(mode == 0) {
		if(field1.checked!=true) {
			return chk_radio(field2, msg);
		}
	} else {
		if(field1.checked==true) {
			return chk_radio(field2, msg);
		}
	}
	return true;
}


// 텍스트 필드 입력시 특정 텍스트 필드 필수 입력 체크
function chk_options3(field1, field2, msg) {
	val1 = field1.val();
	val2 = field2.val();

	if(field1.val()) {					// 필드1에 입력값이 있는 경우
		if(field2.val()) {				// 필드2에 입력값이 있는 경우
			return true;
		} else {							// 필드2에 입력값이 없는 경우
			alert(msg + " : 필수 입력 사항입니다.");
			field2.focus();
			return false;
		}
	} else {								// 필드1에 입력값이 없는 경우
		return true;
	}
}


// 셀렉트 박스 선택시 특정 텍스트 필드 필수 입력 체크
function select_options(field1, optionVal, field2, msg) {
	var v = field1.val();

	if(v == optionVal) {
		return (chk_field(field2, "null", msg));
	} else {
		return true;
	}
}


// radio checked
function chk_radio(field, msg) {
	var TF = false;
	var val = "";

	// 라디오버튼이 1개뿐인 경우
	if(field.length == undefined) {
		if(field.checked)
			TF = true;
	// 라디오버튼이 2개 이상인 경우
	} else {
		for(i=0; i<field.length; i++) {
			if (field[i].checked) {
				TF = true;
				break;
			}
		}
	}

	if(!TF) alert (msg+" : 필수 선택 사항입니다.");

	return TF;
}

// 라디오버튼이나 체크박스 중 하나라도 체크된것이 있는지 판단하는 함수
function chk_checked(fieldName, msg) {
	TF = ($('input[name="'+fieldName+'"]:checked').length) ? true : false;
	if(!TF) alert (msg+" : 필수 선택 사항입니다.");
	return TF;
}

function chk_checkbox(field_name, msg) {
	var TF = false;
	var field = document.getElementsByName(field_name);
	for(i=0; i<field.length; i++) {
		if(field[i].checked == true) {
			TF = true;
			break;
		}
	}

	if(!TF) {
		alert(msg + " : 필수 입력사항입니다");
		return false;
	} else {
		return true;
	}
}

// 글자 수 체크.
//min: 최소글자수, max: 최대글자수
function chk_range(field, min, max, msg) {
	var v = field.val();
	if (v != undefined) {
		if (v.length >= min && v.length <= max) return true;
		else {
			alert (msg+" : "+min+"글자 이상, "+max+"글자 이하로 입력하세요.");
			field.select();
			field.focus();
			return false;
		}
	}
}

// 두개 필드의 값이 같은지 비교
function chk_same(field1, field2, msg) {
	var v1 = field1.val();
	var v2 = field2.val();

	if(v1 != undefined && v2 != undefined) {
		if(v1 != v2) {
			alert(msg + " : 값이 일치하지 않습니다.");
			field1.val('');
			field2.val('');
			field1.focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

// 아이디/이메일 중복체크 후 아이디가 변경되었는지 판단하는 함수
function chk_same2(field1, field2, msg) {
	var v1 = field1.val();
	var v2 = field2.val();

	if(v1 != undefined && v2 != undefined) {
		if(v1 != v2) {
			alert(msg+" 중복체크 후 "+msg+"을(를) 변경하시면 안됩니다.\n"+msg+" 중복체크를 다시해 주세요.");
			field1.val('');
			field2.val('');
			field1.focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

// 이메일 체크2
function chk_mail2(email1, email2) {
	var v1 = email1.val();
	var v2 = email2.val();

	if(v1 != undefined && v2 != undefined) {
		var email = v1+"@"+v2;

		if (!chk_mail(email)) {
			alert ("올바른 메일주소가 아닙니다.");
			email1.val('');
			email2.val('');
			email1.focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

// 이메일 체크3
function chk_mail3(email) {
	var email = email.val();

	if(email != undefined) {
		if (!chk_mail(email)) {
			alert ("올바른 메일주소가 아닙니다.");
			email.val('');
			email.focus();
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

// 아이디 유효성 검사
function chk_id(field, min, max) {
	min = parseInt(min, 10);
	max = parseInt(max, 10);
	var field_val = field.val();

	if(field_val != "") {
		if(field_val.length < min || field_val.length > max) {
			TF = false;
		} else {
			
			res1 = (/^[a-z]/i).test(field_val); //영문이 있는지
			res2 = (/^[0-9a-z_]*$/i).test(field_val); //영문, 숫자, _ 이외엔 없는지
			TF = (res1 && res2);	//영문이 있고, 영문과 숫자 이외엔 없으면 'true'
		}

		if(!TF) {
			alert("아이디는 영문자로 시작하는 " + min + "~" + max + "자리 이어야 합니다.");
			field.val('');
			field.focus();
		}
		return TF;
	} else {
		return true;
	}
}

// 비밀번호 유효성 검사(영문,숫자,특수문자 조합 8~20자 제한)
// field : 비밀번호 입력 필드, 
// msg : 메시지 출력 필드
// mode : 필수 입력 여부(1:필수, 2:선택)
function chk_pwd(field, msg, mode) {
	var usr_pw = field.val();

	if(usr_pw != undefined && usr_pw != "") {
		TF = (/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/).test(usr_pw);

		if(!TF) {
			alert(msg + " : 8~20자의 영문자,숫자,특수문자(!@#$%^&*()+=) 조합이어야 합니다.");
			field.val('');
			field.focus();
			return false;
		} else {
			return true;
		}
	} else {
		if(mode == 1) {
			alert(msg + " : 필수 정보입니다.");
			field.focus();
			return false;
		} else if(mode == 2) {
			return true;
		}
	}
}

// 비밀번호 유효성 검사
function chk_password(field1, field2, mode, min, max) {
	min = parseInt(min, 10);
	max = parseInt(max, 10);
	var pwd = field1.val();

	if(pwd != "") {
		if(pwd.length < min || pwd.length > max) {
			TF = false;
		} else {
			res1 = (/[a-z]/i).test(pwd); //영문이 있는지
			res2 = (/[0-9]/).test(pwd); //숫자가 있는지
			res3 = (/^[0-9a-z_]*$/i).test(pwd); //영문, 숫자, _ 이외엔 없는지
			TF = (res1 && res2 && res3);	//영문이 있고, 숫자가 있으며, 영문과 숫자 이외엔 없으면 'true'
		}

		if(!TF) {
			if(mode == "id") txt = "아이디는"
			else if(mode == "pwd") txt = "비밀번호는"
			alert(txt+" 영문,숫자 조합 " + min + "~" + max + "자리 이어야 합니다.");
			field1.val('');
			if(mode == "pwd")	field2.val('');
			field1.focus();
		}
		return TF;
	} else {
		return true;
	}
}

// 비밀번호와 비밀번호 확인 값이 일치하는지 비교
// field1: 비밀번호 필드
// field2: 비밀번호 확인 필드
function chk_same_pwd(field1, field2) {
	var v1 = field1.val();
	var v2 = field2.val();

	if(v1 != "" && v2 != "") {
		if(v1 != v2) {
			alert("비밀번호가 일치하지 않습니다.");
			field1.val('');
			field2.val('');
			field1.focus();
			return false;
		} else {
			return true;
		}
	} else {
		return true;
	}
}


// 전화번호 유효성 검사 - 필드 blur시
function chk_tel(field, mode) {
	tel_no = field.val();

	if(tel_no != "") {
		switch(mode) {
			case 1:																									// 일반 전화번호인 경우
//				TF = (/^0\d{1,2}-\d{3,4}-\d{4}$/).test(tel_no);
				TF1 = (/^02-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);								// 서울
				TF2 = (/^03([1-3]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 경기,인천,강원
				TF3 = (/^04([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 충남,대전,충북,세종
				TF4 = (/^05([1-5]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 부산,울산,대구,경북,경남
				TF5 = (/^06([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 전남,광주,전북,제주
				TF6 = (/^070-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 전화
				TF7 = (/^0505-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF8 = (/^0303-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF = TF1 || TF2 || TF3 || TF4 || TF5 || TF6 || TF7 || TF8;
				tel_msg = "전화번호";
				break;
			case 2:																									// 핸드폰 번호인 경우
				TF = (/^01([0|1|6|7|8|9]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);
				tel_msg = "휴대폰번호";
				break;
			case 3:																									// 팩스번호인 경우
//				TF = (/^0\d{1,2}-\d{3,4}-\d{4}$/).test(tel_no);
				TF1 = (/^02-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);								// 서울
				TF2 = (/^03([1-3]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 경기,인천,강원
				TF3 = (/^04([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 충남,대전,충북,세종
				TF4 = (/^05([1-5]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 부산,울산,대구,경북,경남
				TF5 = (/^06([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 전남,광주,전북,제주
				TF6 = (/^070-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 전화
				TF7 = (/^0505-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF8 = (/^0303-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF = TF1 || TF2 || TF3 || TF4 || TF5 || TF6 || TF7 || TF8;
				tel_msg = "팩스번호";
				break;
			case 4:																									// 일반 전화번호 + 핸드폰인 경우
				TF1 = (/^02-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);								// 서울
				TF2 = (/^03([1-3]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 경기,인천,강원
				TF3 = (/^04([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 충남,대전,충북,세종
				TF4 = (/^05([1-5]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 부산,울산,대구,경북,경남
				TF5 = (/^06([1-4]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);				// 전남,광주,전북,제주
				TF6 = (/^070-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 전화
				TF7 = (/^0505-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF8 = (/^0303-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);							// 인터넷 팩스
				TF9 = (/^01([0|1|6|7|8|9]{1})-?([0-9]{3,4})-?([0-9]{4})$/).test(tel_no);	// 핸드폰 번호
				TF = TF1 || TF2 || TF3 || TF4 || TF5 || TF6 || TF7 || TF8 || TF9;
				tel_msg = "전화번호";
				break;
			case 5:																									// 팩스번호인 경우
				TF = (/^01([0|1|6|7|8|9]{1})?([0-9]{7,8})$/).test(tel_no);
				tel_msg = "휴대폰번호";
				break;
		}

		if(!TF) {
			alert_msg = "잘못된 "+tel_msg+"번호입니다. 숫자, - 을 포함한 형식으로 입력하세요";
		} else {
			alert_msg = "validate";
		}
	} else {
		switch(mode) {
			case 1:	case 4:			tel_msg = "전화번호";		break;
			case 2: case 5:			tel_msg = "휴대폰번호";		break;
			case 3:					tel_msg = "팩스번호";		break;
		}
		alert_msg = tel_msg + " : 필수 정보입니다.";
	}

	return alert_msg;
}

// 전화번호 유효성 검사 - 폼 전송시
function chk_tel2(field, mode) {
	if(field.val()) {								// 입력값이 있는 경우 유효성 체크
		alert_msg = chk_tel(field, mode);

		if(alert_msg != "validate") {
			alert(alert_msg);
			field.val('');
			field.focus();
			return false;
		} else {
			return true;
		}
	} else {										// 입력값이 없는 경우 return
		return true;
	}
}


/* -------------------------- 필수 입력 필드의 입력값 체크 함수 END ---------------------------------- */




 
// number_format()
function number_format(num) {
	var num_str = num.toString()
	var result = ''

	for(var i=0; i<num_str.length; i++) {
		var tmp = num_str.length-(i+1)
		if(i%3==0 && i!=0) result = ',' + result
		result = num_str.charAt(tmp) + result
	}

	return result
}
 

// 숫자 check
function chk_num1(toCheck) {
   for (j = 0; j < toCheck.length ; j++)
   {
      if ( (toCheck.substring(j,j+1) < "0") || (toCheck.substring(j,j+1) > "9") ) return false;
   }
   return true;
}


// 숫자, ".", "-" 만 존재하면 true
function chk_num2(toCheck) {
   for (j = 0; j < toCheck.length ; j++) 
   {
      if ( (toCheck.substring(j,j+1) < "0") || (toCheck.substring(j,j+1) > "9") ) 
      {
         if ( (toCheck.substring(j,j+1) == ".") || (toCheck.substring(j,j+1) == "-") ) continue;
         return false;
      }
   }
   
   return true;
}

// 숫자, "-" 만 존재하면 true

function chk_num3(toCheck) {
   for (j = 0; j < toCheck.length ; j++) 
   {
      if ( (toCheck.substring(j,j+1) < "0") || (toCheck.substring(j,j+1) > "9") ) 
      {
         if (toCheck.substring(j,j+1) == "-") continue;
         return false;
      }
   }
   
   return true;
}

// 한글 check. 한글이 존재하면 false
function chk_hangul(toCheck) {
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890`!@#$%^&*()-=_+~[]\{}|,./<>?";
    
    for (i=0; i< toCheck.length; i++)
    {
        idcheck = toCheck.charAt(i);
        
        for ( j = 0 ;  j < str.length ; j++)
        {
        
            if (idcheck == str.charAt(j)) break;
                
            if (j+1 == str.length)
            {
                return false;
            }
        }
    }
    return true;
}

//영어,숫자, _ 만 가능
function chk_hangul2(toCheck) {
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_";
    
    for (i=0; i< toCheck.length; i++)
    {
        idcheck = toCheck.charAt(i);
        
        for ( j = 0 ;  j < str.length ; j++)
        {
        
            if (idcheck == str.charAt(j)) break;
                
            if (j+1 == str.length)
            {
                return false;
            }
        }
    }
    return true;
}

//영어만 가능
function chk_alpha(toCheck) {
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    
    for (i=0; i< toCheck.length; i++)
    {
        idcheck = toCheck.charAt(i);
        
        for ( j = 0 ;  j < str.length ; j++)
        {
        
            if (idcheck == str.charAt(j)) break;
                
            if (j+1 == str.length)
            {
                return false;
            }
        }
    }
    return true;
}


// 유효한 날짜인지 판단하는 함수
function chk_date(toCheck) { 
	var pt = /^\d{4}-\d{2}-\d{2}$/;
	TF = pt.test(toCheck);

	if(!TF) {
		return false;
	} else {
		var y = parseInt(toCheck.substr(0,4), 10);
		var m = parseInt(toCheck.substr(5,2), 10) - 1; 
		var d = parseInt(toCheck.substr(8,2), 10);

		var dt = new Date(y, m, d);

		if (dt.getFullYear() == y && dt.getMonth() == m && dt.getDate() == d) {
			return true; 
		} else {
			return false; 
		} 
	}
}


// Email check
function chk_mail(toCheck) {
    // @표시 확인
    if (toCheck.indexOf('@') == -1 ) 
    { 
        return false; 
    }

    // .표시 확인
    if (toCheck.indexOf('.') == -1 ) 
    { 
        return false; 
    }
    
    // 한글 확인
    if ( chk_hangul(toCheck) == false ) 
    { 
        return false; 
    }
	
	// 정규식 확인
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!regExp.test(toCheck)){
		return false;
	}
    
    return true;
}


// 주민번호 check
function chk_juminno(field1, field2)  {
	j1 = field1.val();
	j2 = field2.val();

	obj = j1 + "-" + j2;
	if (obj.length == 14) {
        var calStr1 = "2345670892345", biVal = 0, tmpCal, restCal;

        for (i=0; i <= 12; i++) {
            if (obj.substring(i,i+1) == "-") tmpCal = 1;
            else biVal = biVal + (parseFloat(obj.substring(i,i+1)) * parseFloat(calStr1.substring(i,i+1)));
        }
        restCal = 11 - (biVal % 11);
        if (restCal == 11) restCal = 1;
        if (restCal == 10) restCal = 0;
        if (restCal == parseFloat(obj.substring(13,14))) TF = true;
        else TF = false;
	}
	else TF = false;

	if(!TF) {
		alert("주민등록번호가 잘못되었습니다.");
		field1.val('');
		field2.val('');
		field1.focus();
	}

	return TF;
}

// 사업자등록번호 check
function chk_workno(field1, field2, field3) {
	bizID1 = field1.val();
	bizID2 = field2.val();
	bizID3 = field3.val();
	var bizID = String(bizID1 + bizID2 + bizID3);
	if(bizID.length != 10) {
		alert("사업자등록번호가 잘못되었습니다.");
		field1.val('');
		field2.val('');
		field3.val('');
		field1.focus();
		return false;
	}

	var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
	var i, Sum=0, c2, remander;

	for (i=0; i<=7; i++)
		Sum += checkID[i] * bizID.charAt(i);

	c2 = "0" + (checkID[8] * bizID.charAt(8));
	c2 = c2.substring(c2.length - 2, c2.length);

	Sum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));

	remander = (10 - (Sum % 10)) % 10 ;

	if (Math.floor(bizID.charAt(9)) != remander) {
		alert ("정확한 사업자 등록번호를 입력하세요");
		field1.val('');
		field2.val('');
		field3.val('');
		field1.focus();
		return false;
	}else{
		return true;
	}
}


// window 띄우기
function open_win(URL, name, width, height) 
{
    msgWindow=window.open(URL,name,'location=0,toolbar=no,width='+width+',height='+height+',directories=no,status=no,scrollbars=Yes,resizable=no,menubar=no,border=0');
    msgWindow.focus()
}

// window 띄우기, no scroll
function open_win1(URL, name, width, height) 
{
    msgWindow=window.open(URL,name,'location=0,toolbar=no,width='+width+',height='+height+',directories=no,status=no,scrollbars=No,resizable=no,menubar=no,border=0');
    msgWindow.focus()
}

// window 띄우기
function open_win_XY(URL, name, width, height) 
{
    msgWindow=window.open(URL,name,'location=0,toolbar=no,width='+width+',height='+height+',directories=no,status=no,scrollbars=Yes,resizable=Yes,menubar=no,border=0,screenX=0,screenY=0');
    msgWindow.focus()
}

// 기본 팝업창
function view_open(url,name,features) { 
    window.open(url,name,features);
}


// 파일 첨부시 파일첨부 됐는지 체크
function att_field_isNotnull() {
	var rtn = true;
	var iframe_att = document.getElementById("attach_iframe");
	if (iframe_att) {
		fDoc = iframe_att.contentWindow || iframe_att.contentDocument;
		if (fDoc.document.getElementById("pfile") && fDoc.document.getElementById("pfile").value) {
			alert("먼저 첨부하기 버튼을 클릭하여 파일첨부를 완료해 주세요.");
			rtn = false;
		}
	}
	return rtn;
}

// SNS 공유
function snsLinker(sns) {
	var url = "";
	var title = $("#sns_title").val();
	var link  = document.location;
	
	switch(sns) {
		case "facebook" :
			url = "http://www.facebook.com/sharer.php?u="+encodeURIComponent(link)+"&t="+encodeURIComponent(title);
			layout = "width=645px, height=370px";
			break;
		case "twitter" :
			url = "http://twitter.com/home?status="+encodeURIComponent(title)+" : "+encodeURIComponent(link);
			layout = "width=750px, height=250px";
			break;
		case "me2day" :
			url = "http://me2day.net/posts/new?new_post[body]='" + encodeURIComponent(title)+"' : "+ link +"&new_post[tags]="+encodeURIComponent("sns달기 테스트"); 
			layout = "width=1000px, height=600px";
			break; 
		case "yozm" :
			url = "http://yozm.daum.net/api/popup/prePost?prefix=" + encodeURIComponent(title)+"&link="+encodeURIComponent(link);
			layout = "width=1000px, height=600px";
			break; 
		case "c_log" :
			url = "http://csp.cyworld.com/bi/bi_recommend_pop.php?url="+encodeURIComponent(link);
			layout = "width=400px, height=364px";
			break; 
		case "google_plus" :
			url = "https://plus.google.com/share?url="+encodeURIComponent(link)+"&t="+encodeURIComponent(title);
			layout = "width=1000px, height=450px";
			break;
		case "band":
			url = "http://www.band.us/plugin/share?body="+encodeURIComponent(title)+encodeURIComponent("\n")+encodeURIComponent(link);
			layout = "width=550px, height=580px, location=no, resizable=yes, status=no, scrollbars=no, personalbar=no, toolbar=no, menubar=no";
			break;
		case "blog":
		    url = "https://share.naver.com/web/shareView.nhn?url=" + encodeURIComponent(link) + "&title=" + encodeURIComponent(title);
		    layout = "width=700px,height=500px,location=no,scrollbars=auto,resizable=yes"; 
		    break;
		case "kakaostory":
			url = "https://story.kakao.com/share?url="+encodeURIComponent(link);
			layout = "width=600px, height=460px, location=no, resizable=yes, status=no, scrollbars=no, personalbar=no, toolbar=no, menubar=no";
			break;

	}

	var retPop = window.open(url, 'sns', layout);
	if(retPop == null){
		alert("팝업 차단을 사용안함으로 설정해주시기 바랍니다." );
	}
}

// 관리자 메모 닫기
function close_memo() {
	$("#admin_memo").hide()
}

// SMS 주소록 등록/수정시 입력레이어 비활성화
function close_address_write() {
	$("#address_write").hide()

	$("#TP").val('');
	$("#sq").val('');
}

// SMS 주소록 그룹 등록/수정시 입력레이어 비활성화
function close_group_write() {
	$("#group_write").hide()

	$("#TP").val('');
	$("#sq").val('');
}

// SMS 주소록 그룹 삭제
function sms_group_del(sq, name, page) {
	if(confirm("["+name+"] 그룹을 삭제하시겠습니까?")) {

		$("#D_TP").val('sms_address_group_del');
		$("#d_sq").val(sq);
		$("#d_page").val(page);

		document.list_form.submit();
	}
}

// SMS 주소록 삭제
function sms_address_del(sq, name, page) {
	if(confirm("["+name+"] 회원을 삭제하시겠습니까?")) {

		$("#D_TP").val('sms_address_del');
		$("#d_sq").val(sq);
		$("#d_page").val(page);

		document.list_form.submit();
	}
}

// SMS 주소록 주소 가져오기
function requestaddr(name,phone){
	var str = document.forms.form.rcv_number.value.split('\n');
	var len = str.length;
	var init = 0;
	for(var i = 0;i < len;i++) {
		//2021-11-23 시큐어코딩 조치
		if((new Function ('return '+str[i]))() == (new Function ('return '+phone))()) {
			init++;
			break;
		}
	}
	if(init == 0) document.forms.form.rcv_number.value = phone + '\n' + document.forms.form.rcv_number.value;
}

// SMS 주소록 그룹 미 생성시 에러
function group_error() {
	alert('주소록 그룹이 설정되어 있지 않습니다.\n주소록 그룹을 먼저 설정하세요');
}

// 파일첨부시 확장자 유효성 검사
function chk_extension(obj, mode, obj_name) {
	if(obj.value == "") return;
	// 이미지 파일 유효 확장자
	var img_allow_extension = new Array("jpg", "jpeg", "gif", "png");
	// 문서 파일 유효 확장자
	var txt_allow_extension = new Array("doc", "docx", "hwp", "txt", "xls", "xlsx", "ppt", "pptx", "pdf");
	// 자료 파일 유효 확장자
	var data_allow_extension = new Array("doc", "docx", "hwp", "txt", "xls", "xlsx", "ppt", "pptx", "pdf", "zip");
	// 엑셀 txt 유효 확장자
	var excel_txt_allow_extension = new Array("txt");
	// 엑셀 csv 유효 확장자
	var excel_csv_allow_extension = new Array("csv");
	
	//2021-11-23 시큐어코딩 조치
	allow_extension = (new Function ('return '+mode+'_allow_extension'))();

	var file = obj.value.split("\\");
	var file_name = file[file.length-1];
	var file_info = file_name.split(".");

	var extension = file_info[file_info.length-1].toLowerCase();

	var allow_flag = false;
	for(i=0; i<allow_extension.length; i++) {
		if(extension == allow_extension[i]) {
			allow_flag = true;
			break;
		}
	}

	if(!allow_flag) {
		alert("유효하지 않은 확장자입니다.");

		var browser = navigator.userAgent;
		var ie_flag;

		if(browser.indexOf("MSIE") != -1 || browser.indexOf("chrome") != -1) {		// IE, Chrome 브라우져인 경우
			ie_flag = true;
		} else if(browser.indexOf("firefox") != -1)	 {			// Firefox 브라우져인 경우
			ie_flag = false;
		}

		// 선택한 파일값 초기화(오페라는 안됨)
		if(ie_flag) {		// IE, 크롬
			file_obj = document.getElementById(obj_name);
			file_obj.select();
			document.selection.clear(); 
		} else {				// 파폭
			obj.value = "";
		}
	}
}


// 달력
// 특정날짜들 배열
var disabledDays = ["2013-7-9","2013-7-24","2013-7-26"];
 
// 주말(토, 일요일) 선택 막기
function noWeekendsOrHolidays(date) {
    var noWeekend = jQuery.datepicker.noWeekends(date);
    return noWeekend[0] ? [true] : noWeekend;
}
 
// 일요일만 선택 막기
function noSundays(date) {
  return [date.getDay() != 0, ''];
}
 
// 이전 날짜들은 선택막기
function noBefore3(date){
	var noBeforeDate = new Date(); 
	noBeforeDate.setDate(noBeforeDate.getDate()+3);
	
    if (date < noBeforeDate){
		return [false];
	}else{
		//주말 제외 추가
		var noWeekend = jQuery.datepicker.noWeekends(date);
	    return noWeekend[0] ? [true] : noWeekend;		
	}
}
 
// 특정일 선택막기
function disableAllTheseDays(date) {
    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    for (i = 0; i < disabledDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
            return [false];
        }
    }
    return [true];
}
$(document).ready(function() {
	// 일반적인 입력 달력
	$(".datepicker").datepicker({
		dateFormat  : 'yy-mm-dd',
		changeMonth : false,
		changeYear  : false,
		yearRange : '-50: +50',
		showAnum: "slide",
		prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear : true,				// 년도 뒤에 월 선택 나오도록
		showOtherMonths : true,					// 1개월내에 다른달 날짜도 출력 여부
		firstDay : 0,									// 0이면 일요일부터 출력, 1:이면 월요일부터 출력
		duration :"fast",								// 달력이 나타나는 속도( slow / normal / fast)
		buttonImageOnly: true
	});

	// 기간 제한 달력(시작일/종료일 선택시 자동 범위 설정)
	var dates = $(".period_datepicker").datepicker({
		dateFormat  : 'yy-mm-dd',
		changeMonth : false,
		changeYear  : false,
		yearRange : '-50: +50',
		showAnum: "slide",
		prevText : "이전달",
		nextText : "다음달",
		monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin:["일","월","화","수","목","금","토"],
		showMonthAfterYear : true,				// 년도 뒤에 월 선택 나오도록
		showOtherMonths : true,					// 1개월내에 다른달 날짜도 출력 여부
		firstDay : 0,									// 0이면 일요일부터 출력, 1:이면 월요일부터 출력
		duration :"fast",								// 달력이 나타나는 속도( slow / normal / fast)
		buttonImageOnly: true,
		onSelect: function(selectedDate) {
			var option = (this.id == "st_date") ? 'minDate' : 'maxDate',
			instance = $(this).data('datepicker'),
			date = $.datepicker.parseDate(
				instance.settings.dateFormat || 
				$.datepicker._defaults.dateFormat,
				selectedDate, instance.settings
			);
			dates.not(this).datepicker('option', option, date);
		}
	});
	
	//현재일부터 3일이전 선택불가 입력 달력
	$(".datepicker_noBefore3").datepicker({
		dateFormat  : 'yy-mm-dd',
		changeMonth : false,
		changeYear  : false,
		yearRange : '-50: +50',
		showAnum: "slide",
		prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear : true,				// 년도 뒤에 월 선택 나오도록
		showOtherMonths : true,					// 1개월내에 다른달 날짜도 출력 여부
		firstDay : 0,									// 0이면 일요일부터 출력, 1:이면 월요일부터 출력
		duration :"fast",								// 달력이 나타나는 속도( slow / normal / fast)
		buttonImageOnly: true,
		beforeShowDay: noBefore3 
	});
});

var changeLimitStDate = function(object_class, target_class) {
    if (object_class==null) {
        object_class = "st";
    }
    if (target_class==null) {
        target_class = "ed";
    }
    
    var _this = $("." +object_class);
    var _target = $("." +target_class);

    if (_this.val()!=null && _this.length>0) {
        _target.datepicker( "option", "minDate", _this.val() );
    }
}

var changeLimitEdDate = function(object_class, target_class) {
    if (object_class==null) {
        object_class = "ed";
    }
    if (target_class==null) {
        target_class = "st";
    }
    
    var _this = $("." +object_class);
    var _target = $("." +target_class);

    if (_this.val()!=null && _this.length>0) {
        _target.datepicker( "option", "maxDate", _this.val() );
    }
}
// 자동으로 다음 입력칸으로 넘어가는 함수
// obj : 입력받고 있는 객체
// len : 입력제한 글자수
// next : obj에 len글자만큼 입력됐을 경우 넘어갈 객체명을 가진 변수(문자열)
function auto_tab(obj, len, next) {
	// 다음번으로 이동될 객체명을 가진변수에 폼까지의 문자열을 결합하여 객체화
	//2021-11-23 시큐어 코딩 조치
	next_obj = (new Function ('return obj.form.'+next))();

	if(obj.value.length == len)
		next_obj.focus();
}

// 숫자만 입력하게 하는 함수
function only_number(Ev){
	var evCode = ( window.netscape ) ? Ev.which : event.keyCode ;
	/* FF일 경우 Ev.which 값을,
	IE을 경우 event.keyCode 값을 evCode에 대입 */
	if ( ! ( evCode == 0 || evCode == 8 || ( evCode > 47 && evCode < 58 ) ) ) {
		/* 눌러진 키 코드가 숫자가 아닌 경우
		( '0'은 FF에서 Tab 키,
		'8'은 FF에서 BackSpace가 먹히지 않아 삽입) */
		if ( Ev.preventDefault ) { // FF일 경우
			Ev.preventDefault() ; // 이벤트 무효화
		} else { // IE일 경우
			event.returnValue=false; // 이벤트 무효화
		}
	}
}

// 전화번호/우편번호 등 숫자와 - 만 입력하게 하는 함수
function only_tel( Ev ){
	var evCode = ( window.netscape ) ? Ev.which : event.keyCode ;
	/* FF일 경우 Ev.which 값을,
	IE을 경우 event.keyCode 값을 evCode에 대입 */
	if ( ! ( evCode == 0 || evCode == 8 || evCode == 45 || ( evCode > 47 && evCode < 58 ) ) ) {
		/* 눌러진 키 코드가 숫자가 아닌 경우
		( '0'은 FF에서 Tab 키,
		'8'은 FF에서 BackSpace가 먹히지 않아 삽입) */
		if ( Ev.preventDefault ) { // FF일 경우
			Ev.preventDefault() ; // 이벤트 무효화
		} else { // IE일 경우
			event.returnValue=false; // 이벤트 무효화
		}
	}
}

// 숫자와 . 만 입력하게 하는 함수
function only_num_dot( Ev ){
	var evCode = ( window.netscape ) ? Ev.which : event.keyCode ;
	/* FF일 경우 Ev.which 값을,
	IE을 경우 event.keyCode 값을 evCode에 대입 */
	if ( ! ( evCode == 0 || evCode == 8 || evCode == 46 || ( evCode > 47 && evCode < 58 ) ) ) {
		/* 눌러진 키 코드가 숫자가 아닌 경우
		( '0'은 FF에서 Tab 키,
		'8'은 FF에서 BackSpace가 먹히지 않아 삽입) */
		if ( Ev.preventDefault ) { // FF일 경우
			Ev.preventDefault() ; // 이벤트 무효화
		} else { // IE일 경우
			event.returnValue=false; // 이벤트 무효화
		}
	}
}


function total_days(yy, mm, dd) {
	// yy-1년까지의 날 수 구하기 : (yy-1)*365 + 윤년이었던 햇수
	total = (yy-1)*365 + Math.floor((yy-1)/4) - Math.floor((yy-1)/100) + Math.floor((yy-1)/400);

	// yy년도의 mm-1월까지의 날 수 더하기
	for(i=1; i<mm; i++)
		total += lastday(yy, i);

	// dd일 더하기
	total += dd;

	return total;
}

// 마지막 날짜 구하는 함수
function lastday(yy, mm) {
	last = (mm==2)?((yy%4==0 && yy%100!=0 || yy%400==0)?29:28):(((mm-1)%7%2)?30:31);

	// 구해진 마지막 날짜 반환하기
	return last;
}

// 특정날짜의 요일값 구하는 함수
function weekday(yy, mm, dd) {
	// 지정한 날짜까지의 날 수 구하기
	total = total_days(yy, mm, dd);

	// 구해진 날 수를 7로 나눈 나머지가 요일값이다.
	w = total % 7;

	// 구해진 요일값 반환하기
	return w;
}


// 기간 설정시 시작일과 종료일 날짜 비교하여 시작일이 종료일보다 클 경우 false
function date_compare(field1, field2, msg) {
	date1 = field1.val();
	date2 = field2.val();
	var TF=false;
	if(date1 > date2) {
		alert (msg+"(시작일)이 "+msg+"(종료일) 보다 클 수 없습니다..");
		field1.val('');
		field2.val('');
		field1.focus();
		return false;
	} else {
		return true;
	}
}


// 시간 설정시 시작시간과 종료시간 날짜 비교하여 시작시간이 종료시간보다 클 경우 false
function time_compare(field1, field2, msg) {
	time1 = field1.val();
	time2 = field2.val();

	var TF=false;
	if(time1 > time2) {
		alert (msg+"(시작시간)이 "+msg+"(종료시간) 보다 클 수 없습니다..");
		field1.focus();
		return false;
	} else {
		return true;
	}
}

// IE 이미지 미리보기
function fileUploadPreview(thisObj, preViewer) {
	if(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value)) {
		alert("이미지 형식의 파일을 선택하십시오");
		return;
	}

	preViewer = (typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
	document.getElementById(preViewer).innerHTML = "";
	var ua = window.navigator.userAgent;

	if (ua.indexOf("MSIE") > -1) {
		var img_path = "";
		if (thisObj.value.indexOf("\\fakepath\\") < 0) {
			img_path = thisObj.value;
		} else {
			thisObj.select();
			var selectionRange = document.selection.createRange();
			img_path = selectionRange.text.toString();
			thisObj.blur();
		}
		preViewer.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi" + "le://" + img_path + "', sizingMethod='scale')";
	}
}

// FF 미리보기
function handleFiles(files, preViewer) {
	preViewer = document.getElementById(preViewer);
	for(var i=0; i<files.length; i++) { // 파일 리스트에서 파일 갯수 만큼 루프
		var file = files[i];	// 파일 리스트에서 파일을 분리
		var imageType = /image.*/;	// 이미지 타입 체크

		if(!file.type.match(imageType)) {		// 파일이 이미지가 아닐경우
			continue;
		} else {
			var img = document.createElement("img");		// <img>생성
			img.setAttribute("id", "preViewImg");				// <img>의 id 설정
			img.setAttribute("width", preViewer.getAttribute("width"));						// <img>의 width 설정
			img.setAttribute("height", preViewer.getAttribute("height"));						// <img>의 height 설정
			preViewer.innerHTML = "";
			preViewer.appendChild(img);					// 웹 페이지에 자식으로 생성

			var reader = new FileReader();						// FileReader 생성
			// reader가 olnload되었을때 위 <img> 객체의 src에 file 정보를 넣어줌 .target.result는 base64 data형
			reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result;};})(img);
			// file load시작
			reader.readAsDataURL(file);
		}
	}
}

// php에서 urlencode한 문자열을 urldecode 처리해주는 함수
function urldecode(str) {
   return decodeURIComponent((str+'').replace(/\+/g, '%20'));
}

// 다음 주소 API 호출 함수
// zip_field1				:	첫번째 주소영역 우편번호 필드 ID
// basic_addr_field1	:	첫번째 주소영역 기본주소 필드 ID
// detail_addr_field1	:	첫번째 주소영역 상세주소 필드 ID
// zip_field2				:	두번째 주소영역 우편번호 필드 ID
// basic_addr_field2	:	두번째 주소영역 기본주소 필드 ID
// detail_addr_field2	:	두번째 주소영역 상세주소 필드 ID
// guide_field				:	주소 사용안함 선택시 안내할 예상주소 정보가 들어갈 영역 ID
// addr_type				:	사용할 주소 형식(1:도로명 주소만, 2:지번 주소만, 3:도로명 주소 + 지번 주소)
// useLang				:	사용할 언어(ko:국문, en:영문) - 생략시 국문
function openDaumPostcode(zip_field1, basic_addr_field1, detail_addr_field1, addr_type, useLang, zip_field2, basic_addr_field2, detail_addr_field2, guide_field) {
	if(useLang == undefined)		useLang	=	"ko";				// 사용할 언어 생략시 기본 국문으로
	if(addr_type == undefined)	addr_type	=	1;					// 사용할 주소형식 생략시 기본 도로명 주소만으로

	daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr			=	data.roadAddress;					// 국문 도로명 주소 변수
				var fullRoadAddrEng	=	data.roadAddressEnglish;		// 영문 도로명 주소 변수
				var fullJibunAddr			=	data.jibunAddress;					// 국문 지번 주소 변수
				var fullJibunAddrEng	=	data.jibunAddressEnglish;		// 영문 지번 주소 변수
				var extraRoadAddr		=	'';											// 도로명 조합형 주소 변수
	
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddr !== ''){
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if(fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
	
				//----------------------------------------------------------------
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//----------------------------------------------------------------
	
				if(useLang == "ko") {													// 국문 주소정보를 요청한 경우
					switch(addr_type) {
						case 1:																// 도로명 주소만 요청한 경우
							$("#"+zip_field1).val(data.zonecode);					// 도로명 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field1).val(fullRoadAddr);			// 도로명 주소파트 기본주소 정보 할당
	
							if(detail_addr_field1 == "") {								// 도로명 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field1).focus();					// 도로명 주소파트 기본주소 필드에 포커스
							} else {															// 도로명 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field1).focus();					// 도로명 주소파트 상세주소 필드에 포커스
							}
							break;
						case 2:																// 지번 주소만 요청한 경우
							$("#"+zip_field1).val(data.zonecode);					// 지번 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field1).val(fullJibunAddr);			// 지번 주소파트 기본주소 정보 할당
	
							if(detail_addr_field1 == "") {								// 지번 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field1).focus();					// 지번 주소파트 기본주소 필드에 포커스
							} else {															// 지번 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field1).focus();					// 지번 주소파트 상세주소 필드에 포커스
							}
						case 3:																// 도로명 주소 + 지번 주소를 요청한 경우
							$("#"+zip_field1).val(data.zonecode);					// 도로명 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field1).val(fullRoadAddr);			// 도로명 주소파트 기본주소 정보 할당
							$("#"+zip_field2).val(data.zonecode);					// 지번 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field2).val(fullJibunAddr);			// 지번 주소파트 기본주소 정보 할당
	
							if(detail_addr_field1 == "") {								// 도로명 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field1).focus();					// 도로명 주소파트 기본주소 필드에 포커스
							} else {															// 도로명 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field1).focus();					// 도로명 주소파트 상세주소 필드에 포커스
							}
							break;
					}
	
					if(guide_field != "") {
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if(data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
							$("#"+guide_field).html('(예상 도로명 주소 : ' + expRoadAddr + ')');				// 예상되는 도로명 주소에 조합형 주소를 추가한다.
						} else if(data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							$("#"+guide_field).html('(예상 지번 주소 : ' + expJibunAddr + ')');					// 예상되는 지번 주소에 조합형 주소를 추가한다.
						} else {
							$("#"+guide_field).html('');
						}
					}
				} else {																				// 영문 주소정보를 요청한 경우
					switch(addr_type) {
						case 1:																		// 도로명 주소만 요청한 경우
							$("#"+zip_field1).val(data.zonecode);					// 도로명 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field1).val(fullRoadAddrEng);				// 도로명 주소파트 기본주소 정보 할당
	
							if(detail_addr_field1 == "") {										// 도로명 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field1).focus();							// 도로명 주소파트 기본주소 필드에 포커스
							} else {																	// 도로명 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field1).focus();							// 도로명 주소파트 상세주소 필드에 포커스
							}
							break;
						case 2:																		// 지번 주소만 요청한 경우
							$("#"+zip_field2).val(data.zonecode);					// 지번 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field2).val(fullJibunAddrEng);			// 지번 주소파트 기본주소 정보 할당
	
							if(detail_addr_field2 == "") {										// 지번 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field2).focus();							// 지번 주소파트 기본주소 필드에 포커스
							} else {																	// 지번 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field2).focus();							// 지번 주소파트 상세주소 필드에 포커스
							}
						case 3:																		// 도로명 주소 + 지번 주소를 요청한 경우
							$("#"+zip_field1).val(data.zonecode);					// 도로명 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field1).val(fullRoadAddrEng);				// 도로명 주소파트 기본주소 정보 할당
							$("#"+zip_field2).val(data.zonecode);					// 지번 주소파트 우편번호 정보 할당
							$("#"+basic_addr_field2).val(fullJibunAddrEng);			// 지번 주소파트 기본주소 정보 할당
	
							if(detail_addr_field1 == "") {										// 도로명 주소파트 상세주소 필드가 없는 경우
								$("#"+basic_addr_field1).focus();							// 도로명 주소파트 기본주소 필드에 포커스
							} else {																	// 도로명 주소파트 상세주소 필드가 있는 경우
								$("#"+detail_addr_field1).focus();							// 도로명 주소파트 상세주소 필드에 포커스
							}
							break;
					}
	
					if(guide_field != "") {
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if(data.autoRoadAddressEnglish) {
							$("#"+guide_field).html('(Estimated street name address: ' + data.autoRoadAddressEnglish + ')');				// 예상되는 도로명 주소에 조합형 주소를 추가한다.
						} else if(data.autoJibunAddressEnglish) {
							$("#"+guide_field).html('(Estimated jibun address: ' + data.autoJibunAddressEnglish + ')');							// 예상되는 지번 주소에 조합형 주소를 추가한다.
						} else {
							$("#"+guide_field).html('');
						}
					}
				}
			}
		}).open();
	});
}

/*QNA*/

 $(document).ready(function () {
	var article = $('.faq .article');
	article.find('.a').slideUp(100);
	
	$('.faq .article .trigger').click(function(){  
	var myArticle = $(this).parents('.article'); 
	
	if(myArticle.hasClass('hide')){   
	    article.find('.a').slideUp(100);
		article.removeClass('show').addClass('hide'); 
	    myArticle.removeClass('hide').addClass('show');  
	    myArticle.find('.a').slideDown(100);  
	 } else {  
	   myArticle.removeClass('show').addClass('hide');  
	   myArticle.find('.a').slideUp(100);  
	}  
  });    
	
	$('.all').toggle(function(){ 
	    article.find('.a').slideDown(100);
	    article.removeClass('hide').addClass('show');
	},function(){ 
	    article.find('.a').slideUp(100);
	    article.removeClass('show').addClass('hide');
	});
	
});  

function copyValueMapToForm(form, mapKVs) {
	form.find("input, select, textarea").each(function(index, obj) {
		$.each(mapKVs, function(key, value) {
			if (obj.name == key) {
				obj.value = value;
			}
		});
	});
}

//Javascript Data Format
Date.prototype.format = function(f) {
	if (!this.valueOf()) return " ";

	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	switch ($1) {
		case "yyyy": return d.getFullYear();
		case "yy": return (d.getFullYear() % 1000).zf(2);
		case "MM": return (d.getMonth() + 1).zf(2);
		case "dd": return d.getDate().zf(2);
		case "E": return weekName[d.getDay()];
		case "HH": return d.getHours().zf(2);
		case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
		case "mm": return d.getMinutes().zf(2);
		case "ss": return d.getSeconds().zf(2);
		case "a/p": return d.getHours() < 12 ? "오전" : "오후";
		default: return $1;
	}
	});
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

//CK에디터 필수 입력 체크
function ckeditor_chk(field, msg) {
	if(CKEDITOR.instances[field].getData() == "") {
		alert (msg+" : 필수 입력 사항입니다.");
		CKEDITOR.instances[field].focus();
		return false;
	} else {
		$("#"+field).val(CKEDITOR.instances[field].getData());
	}
}
//통화 천단위 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

