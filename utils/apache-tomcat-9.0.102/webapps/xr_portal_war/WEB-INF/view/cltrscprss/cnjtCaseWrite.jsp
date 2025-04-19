<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>활용사례 등록신청</h2>
            <div class="breadcrumbs">
              <a href="<c:url value='/index.do'/>">메인</a>
              <a href="<c:url value='/cltrscprss/cnjtCaseList.do'/>"><span>디지털문화자원 현황과 활용 사례</span></a>
              <span>디지털문화자원 활용 사례</span>
              <span>활용사례 등록신청</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents data-write">
          <div class="inner">
            <div class="cont-bg">
              <form id="form" method="post" enctype="multipart/form-data">  
              <ul class="write-wrap">
                <li>
                  <em class="required">제목</em>
                  <div class="fm-group">
                    <div class="fm-focus">
					  <label for="prTtl" class="blind"></label>
                      <input type="text" name="prTtl" id="prTtl" class="fm-control"  placeholder="제목을 등록해 주세요." />
                    </div>
                  </div>
                </li>
                <li>
                  <em class="required">내용</em>
                  <div class="fm-focus fm-textarea">
                    <label for="bizCn" class="blind"></label>
                    <textarea type="text" id="bizCn" name="bizCn" placeholder="내용은 4,000자 이하로 입력해 주세요."   oninput="countCharacters(this)"></textarea>
               <script type="text/javascript" src="<c:url value="/lib/ckeditor4/ckeditor.js" />"></script>
               <script type="text/javascript">
                  var editor = CKEDITOR.replace('bizCn');
                  CKEDITOR.instances.bizCn.on('key', function(e) {
                     var board_text = this.getData();
                      text = board_text.replace(/(<([^>]+)>)/gi, "");
                     var rbyte = text.length;
                      $("#charCount").text(rbyte+' / 4,000');
                      if(rbyte > "4000"){
                        alert("4,000자 까지 저장이 가능합니다.");
                        CKEDITOR.instances.bizCn.setData(datatext);
                     }
                      else if(rbyte <= "4000"){
                         var svtext = CKEDITOR.instances.bizCn.getData();
                         datatext = svtext.replace(/(<([^>]+)>)/gi, "");
                     }
                  });
               </script>
                    <span id="charCount">0 / 4,000</span>
                  </div>
                </li>
                <li>
                  <em class="required">대표이미지</em>
                  <div class="filebox-wrap">
                    <div>
                      <div class="fm-group fm-filebox">
                      <!--  -->
                         <div class="fm-focus">
                          <input  type="text" class="upload-name" placeholder="선택한 파일 없음" disabled="disabled" />
                          <label for="files">파일선택</label>
                          <input type="file"  id="files" name="files" accept="image/*" multiple="multiple" class="upload-hidden">
                          <input type="hidden" id="atchFileGroupId" name="atchFileGroupId" value="" />
                          <button type="button">삭제</button>
                        </div>
                        <!--  -->
                      </div>
                    </div>
                    <p>※ 확장자(jpg, png), 용량(2MB내)</p>
                  </div>
                </li>
                <li>
                  <em class="required">활용 디지털문화자원</em>
                  <div class="fm-group">
                    <div class="fm-focus">
                      <label for="utztnDataCn" class="blind"></label>
                      <input type="text"  name="utztnDataCn" id ="utztnDataCn"  class="fm-control"   placeholder="활용 디지털문화자원을 입력해 주세요." />
                    </div>
                  </div>
                </li>
                <li>
                  <em class="required">제공기관</em>
                  <div class="fm-focus fm-select">
                  <label for="pvsnInstId" class="blind"></label>
                    <select id="pvsnInstId" name="pvsnInstId">
                      <option value="" disabled="disabled" selected="selected">
                        기관을 선택해 주세요
                      </option>
                        <c:forEach var="item" items="${ComboList}">
                               <option value="<c:out value='${item.pvsnInstId}'/>"><c:out value='${item.pvsnInstNm}'/>
                    </c:forEach>
                    </select>
                  </div>
                </li>
                <li>
                  <em class="required">기업명</em>
                  <div class="fm-group">
                    <div class="fm-focus">
                  	  <label for="entNm" class="blind"></label>
                      <input type="text" name="entNm" id="entNm" class="fm-control" placeholder="입력해 주세요." />
                    </div>
                  </div>
                </li>
                <li>
                  <em>홈페이지</em>
                  <div class="fm-group">
                    <div class="fm-focus">
                  	  <label for="entHmpg" class="blind"></label>
                      <input  type="text" id="entHmpg"   name="entHmpg" class="fm-control" placeholder="입력해 주세요." />
                    </div>
                  </div>
                </li>
                <li>
                  <em>이메일</em>
                  <div class="fm-group">
                    <div class="fm-focus">
                  	  <label for="rgtrEmlAddr" class="blind"></label>
                      <input type="text"  id="rgtrEmlAddr" name="rgtrEmlAddr" class="fm-control" placeholder="입력해 주세요." />
                    </div>
                  </div>
                </li>
              </ul>
              <div class="btn-wrap">
               <button id="confirmCancel" type="button" class="btns size-s brd-color-white02" title='취소'>
                  취소
              </button>
              <button id="fileText" type="button" class="btns size-s color-primary"  title='등록신청'>
                등록신청
            </button>
                </form>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
<script>
// 글자수 표시
function countCharacters(textarea) {
    var maxLength = 2000;
    var currentLength = textarea.value.length;

    // 현재 글자 수 표시 업데이트
    $('#charCount').text(currentLength + ' / ' + maxLength);

    // 4000자를 초과하는 경우 알림
    if (currentLength > maxLength) {
        alert("입력 가능한 글자 수를 초과하였습니다.");
        // 초과한 부분 제거
        textarea.value = textarea.value.substring(0, maxLength);
        // 업데이트된 글자 수 다시 표시
        $('#charCount').text(maxLength + ' / ' + maxLength);
    }
}

$(document).ready(function () {
    // 등록 취소 버튼 클릭 이벤트 처리
    $('#confirmCancel').click(function () {
        // 확인 메시지 표시
        var result = confirm("등록을 취소하시겠습니까?");
        // YES를 눌렀을 경우
        if (result) {
            history.back();
        } 
    });

    // 파일 선택이 변경될 때 이벤트 처리
    $('#files').change(function () {
        var fileInput = this.files[0];

        // 파일이 선택되지 않았을 때는 무시
        if (!fileInput) {
            return;
        }

        // 허용되는 확장자 목록
        var allowedExtensions = ['jpg', 'png'];

        // 선택된 파일의 확장자 확인
        var fileExtension = fileInput.name.split('.').pop().toLowerCase();

        // 허용된 확장자인지 확인
        if (allowedExtensions.indexOf(fileExtension) === -1) {
            // 알림 표시
            alert("대표이미지 확장자명이 올바르지 않습니다. jpg나 png 파일을 선택해 주세요.");
            // 파일 선택 초기화
            $('#files').val('');
            // 선택된 파일 이름 표시 초기화
            $('.upload-name').val('선택한 파일 없음');
        }
    });

    // 등록 신청 버튼 클릭 이벤트 처리
    $('#fileText').click(function (event) {
        // 폼 제출 방지
        event.preventDefault();

        // 입력값 가져오기
        var fileInput = $('#files')[0].files[0];
        var entNm = $('#entNm').val().trim();
        var pvsnInstId = $('#pvsnInstId option:selected').val().trim();
        var utztnDataCn = $('#utztnDataCn').val().trim();
        var prTtl = $('#prTtl').val().trim();
        //var bizCn = $('#bizCn').val().trim();
        //에디터에서 값 가져오기
        var bizCn = CKEDITOR.instances.bizCn.getData();
        var entHmpg = $('#entHmpg').val().trim();
        var rgtrEmlAddr = $('#rgtrEmlAddr').val().trim();
        var formData = new FormData($('#form')[0]);
        
        // 입력값이 하나라도 비어있으면 알림 창 띄우기
        if (entNm === "" || pvsnInstId === "" || utztnDataCn === "" || prTtl === "" || bizCn === "") {
            alert("필수 입력값을 확인해 주세요.");
            return;
        }
        
        // 대표 이미지가 선택되지 않았을 경우
        if (!fileInput) {
            alert("대표 이미지를 등록해 주세요.");
            return;
        }

        // 확인 메시지 표시
        var result = confirm("등록 하시겠습니까?");

        // YES를 눌렀을 경우
        if (result) {
            // FormData 객체 생성
            var formData = new FormData($('#form')[0]);

            // 데이터 삽입
            $.ajax({
                type: 'POST',
                url: "<c:url value='/cltrscprss/cnjtCaseNewWrite.do'/>",
                data: {
                    entNm: entNm,
                    pvsnInstId: pvsnInstId,
                    utztnDataCn: utztnDataCn,
                    prTtl: prTtl,
                    bizCn: bizCn,
                    entHmpg: entHmpg,
                    rgtrEmlAddr: rgtrEmlAddr
                },
                success: function () {
                    // 파일 업로드
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
                           alert("활용 사례 신청이 완료되었습니다.");
                            window.location.href = "<c:url value='/mypage/cnjtCasePrss.do'/>";
                        },
                        error: function (e) {
                            alert("활용 사례 신청에 실패했습니다. 내용을 확인해주세요.");
                        }
                    });
                },
                error: function (status) {
                   alert("활용 사례 신청에 실패했습니다. 내용을 확인해주세요.");
                }
            });
        }
    });
});
</script>