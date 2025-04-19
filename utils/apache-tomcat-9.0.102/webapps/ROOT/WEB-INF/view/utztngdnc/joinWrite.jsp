<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- container(S) -->
      <section class="container">
        <header>
         <c:if test="${not empty accessDeniedMessage}">
		    <script>
		        alert("${accessDeniedMessage}");
		        window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>"; // 접근 거부시 리다이렉트될 경로
		    </script>
		 </c:if>
          <div class="inner">
            <h2 id="joinTitle">관리자 승인 요청</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span id="joinSubtitle">관리자 승인 요청</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents data-write qna">
          <div class="inner">
            <div class="cont-bg">
              <form id="form" method="post" enctype="multipart/form-data">  
              <input type="hidden" id="pstId" name="pstId" value="<c:out value='${joinDtlList.pstId}'/>">
              <input type="hidden" id="pstOrd" name="pstId" value="<c:out value='${joinDtlList.pstOrd}'/>">
              <ul class="write-wrap">
                <li>
                  <em class="required">제목</em>
                  <div class="fm-group">
                    <div class="fm-focus">
					  <label for="pstTtl" class="blind"></label>
                      <input type="text" name="pstTtl" id="pstTtl" class="fm-control" placeholder="제목을 등록해 주세요."  value="<c:if test="${not empty  joinDtlList}"><c:out value='${joinDtlList.pstTtl}'/></c:if>" />
                    </div>
                  </div>
                </li>
                <li>
                  <em class="required">내용</em>
                  <div class="fm-focus fm-textarea">
                    <label for="pstCn" class="blind"></label>
                    <textarea type="text" id="pstCn" name="pstCn" placeholder="내용은 4,000자 이하로 입력해 주세요."  oninput="countCharacters(this)">
	                    <c:if test="${not empty  joinDtlList}">
		                    <c:out value="${joinDtlList.pstCn}"/>
	                    </c:if>
                    </textarea>
               <script type="text/javascript" src="<c:url value="/lib/ckeditor4/ckeditor.js" />"></script>
				<script type="text/javascript">
				  // CKEditor를 'pstCn' 텍스트 영역에 적용
				  var editor = CKEDITOR.replace('pstCn');
					  <c:if test="${ empty  joinDtlList}">
						  editor.on('instanceReady', function() {
						    // CKEditor 준비가 완료되면 기본 내용을 설정
						    var defaultData = '사용자명(필수):<br>' +
						                      '사용자별칭:<br>' +
						                      '기관명(필수):<br>' +
						                      '전화번호:<br>' +
						                      '이메일주소(필수):<br>' +
						                      '휴대폰번호:';
						    this.setData(defaultData);
						  });
					  </c:if>
				  // 키보드 입력 이벤트를 사용하여 글자 수를 계산하고 제한
				  CKEDITOR.instances.pstCn.on('key', function(e) {
				    var board_text = this.getData();
				    var text = board_text.replace(/(<([^>]+)>)/gi, "");
				    var rbyte = text.length;
				    $("#charCount").text(rbyte + ' / 4,000');
                      if(rbyte > "4000"){
                        alert("4,000자 까지 저장이 가능합니다.");
                        CKEDITOR.instances.pstCn.setData(datatext);
                     }
                      else if(rbyte <= "4000"){
                         var svtext = CKEDITOR.instances.pstCn.getData();
                         datatext = svtext.replace(/(<([^>]+)>)/gi, "");
                     }
                  });
               </script>
                    <span id="charCount">0 / 4,000</span>
                  </div>
                </li>
                <li>
                  <em>작성자</em>
                  <div>
                      <span><c:out value="${userId}"/></span>
                  </div>
                </li>
              </ul>
               <div class="btn-wrap">
                <button id="confirmCancel" type="button" class="btns size-s brd-color-white02" title='취소'>
                  취소
                </button>
                <button id="fileText" type="button" class="btns size-s color-primary"  title='등록' style="display:none;">
                  등록
                </button>
                <button id="editText" type="button" class="btns size-s color-primary"  title='수정' style="display:none;">
                  수정
                </button>
                </form>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
<script>
    // 글자수 표시 함수
    function countCharacters(textarea) {
        var maxLength = 4000;
        var currentLength = textarea.value.length;
        $('#charCount').text(currentLength + ' / ' + maxLength);
        if (currentLength > maxLength) {
            alert("입력 가능한 글자 수를 초과하였습니다.");
            textarea.value = textarea.value.substring(0, maxLength);
            $('#charCount').text(maxLength + ' / ' + maxLength);
        }
    }

    // 등록 기능을 처리하는 함수
    function register() {
        var pstTtl = $('#pstTtl').val().trim();
        var pstCn = CKEDITOR.instances.pstCn.getData();

        if (pstCn === "" || pstTtl === "") {
            alert("필수 입력값을 확인해 주세요.");
            return;
        }

        var data = {
            pstCn: pstCn,
            pstTtl: pstTtl,
        };

        if (confirm("등록 하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: "<c:url value='/utztngdnc/regJoin.do'/>",
                data: data,
                success: function(response) {
                	if (response.resultCode == 200) {
                        alert("등록되었습니다.");
                        window.location.href = "<c:url value='/utztngdnc/joinList.do'/>";
                	} else {
                        alert("등록에 실패하였습니다.");
                	}
                },
                error: function() {
                    alert("등록에 실패하였습니다.");
                }
            });
        }
    }

    // 수정 기능을 처리하는 함수
    function update() {
        var pstTtl = $('#pstTtl').val().trim();
        var pstCn = CKEDITOR.instances.pstCn.getData();
        var pstId = $('#pstId').val().trim();
        var pstOrd = $('#pstOrd').val().trim();

        if (pstCn === "" || pstTtl === "") {
            alert("필수 입력값을 확인해 주세요.");
            return;
        }

        var data = {
            pstCn: pstCn,
            pstTtl: pstTtl,
            pstId: pstId,
            pstOrd: pstOrd
            
        };

        if (confirm("수정 하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: "<c:url value='/utztngdnc/saveJoin.do'/>",
                data: data,
                success: function(response) {
                	if (response.resultCode == 200) {
                        alert("수정되었습니다.");
                        window.location.href = "<c:url value='/utztngdnc/joinList.do'/>";
                	} else {
                        alert("수정에 실패하였습니다.");
                	}
                },
                error: function() {
                    alert("수정에 실패하였습니다.");
                }
            });
        }
    }

    $(document).ready(function () {
        var mode = new URLSearchParams(window.location.search).get('mode');

        if (mode === 'edit') {
            $('#editText').show();
        } else {
            $('#fileText').show();
        }

        if (mode === 'edit') {
            $('#joinTitle').text('승인 요청 수정');
            $('#joinSubtitle').text('승인 요청 수정'); 
            $('#editText').show();
        } else if (mode === 'register') {
            $('#joinTitle').text('승인 요청 등록');
            $('#joinSubtitle').text('승인 요청 등록'); 
            $('#fileText').show();
        } else {
            $('#joinTitle').text('승인 요청');
        }
        
        $('#confirmCancel').click(function () {
            if (confirm("취소하시겠습니까?")) {
                history.back();
            }
        });

        $('#fileText').click(function (event) {
            event.preventDefault();
            register();
        });

        $('#editText').click(function (event) {
            event.preventDefault();
            update();
        });
    });
</script>