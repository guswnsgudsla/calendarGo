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
            <h2 id="qnaTitle">문의하기</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>이용안내</span>
              <span id="qnaSubtitle">문의하기</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents data-write qna">
          <div class="inner">
            <div class="cont-bg">
              <form id="form" method="post" enctype="multipart/form-data">  
              <input type="hidden" id="pstId" name="pstId" value="<c:out value='${qnaDtlList.pstId}'/>">
              <input type="hidden" id="pstOrd" name="pstId" value="<c:out value='${qnaDtlList.pstOrd}'/>">
              <ul class="write-wrap">
                <li>
                  <em class="required">제목</em>
                  <div class="fm-group">
                    <div class="fm-focus">
					  <label for="pstTtl" class="blind"></label>
                      <input type="text" name="pstTtl" id="pstTtl" class="fm-control"  value="<c:out value="${qnaDtlList.pstTtl}"/>" placeholder="제목을 등록해 주세요." />
                    </div>
                  </div>
                </li>
                <li>
                  <em class="required">내용</em>
                  <div class="fm-focus fm-textarea">
                    <label for="pstCn" class="blind"></label>
                    <textarea type="text" id="pstCn" name="pstCn" placeholder="내용은 4,000자 이하로 입력해 주세요."  oninput="countCharacters(this)">
                    <c:out value="${qnaDtlList.pstCn}"/></textarea>
               <script type="text/javascript" src="<c:url value="/lib/ckeditor4/ckeditor.js" />"></script>
               <script type="text/javascript">
                  var editor = CKEDITOR.replace('pstCn');
                  CKEDITOR.instances.pstCn.on('key', function(e) {
                     var board_text = this.getData();
                      text = board_text.replace(/(<([^>]+)>)/gi, "");
                     var rbyte = text.length;
                      $("#charCount").text(rbyte+' / 4,000');
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
                  <em class="required">구분</em>
                  <div class="fm-focus fm-select">
                  
                  <label for="clsfCd" class="blind"></label>
					 <select id="clsfCd" name="clsfCd">
					  <option value="" 
					    <c:if test="${empty qnaDtlList.clsfCd}">selected="selected"</c:if>
					  >주제를 선택해 주세요</option>
					
					  <c:forEach items="${bbsClsfCdList}" var="row">
					    <option value="${row.clsfCd}" 
					      <c:if test="${qnaDtlList.clsfCd eq row.clsfCd}">selected="selected"</c:if>
					    >${row.clsfNm}</option>
					  </c:forEach>
					</select>
                  </div>
                </li>
				<li>
				  <em class="required">비밀글 여부</em>
				  <div class="fm-focus fm-select">
				    <label for="secrYn" class="blind"></label>
				   	 <select id="secrYn" name="secrYn">
					  <option value="" disabled="disabled" 
					    <c:if test="${empty qnaDtlList.secrYn}">selected="selected"</c:if>
					  >비밀글여부를 선택해 주세요</option>
					  <option value="Y" 
					    <c:if test="${qnaDtlList.secrYn eq 'Y'}">selected="selected"</c:if>
					  >예 (Yes)</option>
					  <option value="N" 
					    <c:if test="${qnaDtlList.secrYn eq 'N'}">selected="selected"</c:if>
					  >아니요 (No)</option>
					</select>
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
        var clsfCd = $('#clsfCd option:selected').val().trim();
        var secrYn = $('#secrYn option:selected').val().trim();
        var pstTtl = $('#pstTtl').val().trim();
        var pstCn = CKEDITOR.instances.pstCn.getData();

        if (clsfCd === "" || secrYn === "" || pstCn === "" || pstTtl === "") {
            alert("필수 입력값을 확인해 주세요.");
            return;
        }

        var data = {
            clsfCd: clsfCd,
            pstCn: pstCn,
            pstTtl: pstTtl,
            secrYn: secrYn,
        };

        if (confirm("등록 하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: "<c:url value='/utztngdnc/regQna.do'/>",
                data: data,
                success: function(response) {
                	if (response.resultCode == 200) {
                        alert("등록되었습니다.");
                        window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>";
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
        var clsfCd = $('#clsfCd option:selected').val().trim();
        var secrYn = $('#secrYn option:selected').val().trim();
        var pstTtl = $('#pstTtl').val().trim();
        var pstCn = CKEDITOR.instances.pstCn.getData();
        var pstId = $('#pstId').val().trim();
        var pstOrd = $('#pstOrd').val().trim();

        if (clsfCd === "" || secrYn === "" || pstCn === "" || pstTtl === "") {
            alert("필수 입력값을 확인해 주세요.");
            return;
        }

        var data = {
            clsfCd: clsfCd,
            pstCn: pstCn,
            pstTtl: pstTtl,
            secrYn: secrYn,
            pstId: pstId,
            pstOrd: pstOrd
            
        };

        if (confirm("수정 하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: "<c:url value='/utztngdnc/saveQna.do'/>",
                data: data,
                success: function(response) {
                	if (response.resultCode == 200) {
                        alert("수정되었습니다.");
                        window.location.href = "<c:url value='/utztngdnc/qnaList.do'/>";
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
            $('#qnaTitle').text('문의 수정');
            $('#qnaSubtitle').text('문의 수정'); 
            $('#editText').show();
        } else if (mode === 'register') {
            $('#qnaTitle').text('문의 등록');
            $('#qnaSubtitle').text('문의 등록'); 
            $('#fileText').show();
        } else {
            $('#qnaTitle').text('문의하기');
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