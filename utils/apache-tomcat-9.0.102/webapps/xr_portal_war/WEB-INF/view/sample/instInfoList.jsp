<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>참여기관보기</h2>
            <div class="breadcrumbs">
              <a href="#" onclick="fncDwnldExecPopup('DCM000000000000999');">다운로드 팝업</a>
              <a href="#" onclick="fncDwnldNotePopup('DCM000000000000999');">
              <span>다운로드 유의사항 팝업</span>
              </a>
              <a href="#" onclick="fncClctPreviewPopup('EI00000001');">
              <span>컬렉션 미리보기 팝업</span>
              </a>
              <a href="#" onclick="fnClrcs3DPreview('DCM000000000000999');">
              <span>3D뷰어로 보기</span>
              </a>
            </div>
          </div>
        </header>
        <section id="contents" class="contents institution">
          <div class="inner">
            <div class="list cont-bg">
              <div class="list-option between">
                <p>총 <strong>7</strong>개</p>
                <div>
                  <div class="fm-focus fm-select selectmenu" data-size="s">
                    <select id="area" name="area">
                      <option value="" disabled="disabled" selected="selected">
                        지역을 선택해주세요.
                      </option>
                      <option>서울</option>
                      <option>경기도</option>
                    </select>
                  </div>
                  <div class="fm-focus fm-select selectmenu" data-size="s">
                    <select id="" name="">
                      <option value="" disabled="disabled" selected="selected">
                        기관 구분을 선택해주세요.
                      </option>
                      <option>서울</option>
                      <option>경기도</option>
                    </select>
                  </div>
                  <div class="fm-group fm-focus fm-search">
                    <input
                      type="text"
                      class="fm-control"
                      id=""
                      placeholder="검색어를 입력해 주세요."
                    />
                    <button type="button">
                      <span class="blind">검색</span>
                    </button>
                  </div>
                </div>
              </div>
              <ul class="list-institution">
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst01.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립중앙박물관</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst02.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국악원</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst03.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국어원</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst01.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립중앙박물관</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst02.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국악원</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst03.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국어원</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst01.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립중앙박물관</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst02.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국악원</strong>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="img">
                      <img src="<c:url value='/assets/images/temp/list_inst03.png'/>" alt="" />
                    </div>
                    <p>
                      <strong>국립국어원</strong>
                    </p>
                  </a>
                </li>
              </ul>
              <div class="pagination">
                <span class=""><a href="#">1</a></span>
                <span class="active"><a href="#">2</a></span>
                <span class=""><a href="#">3</a></span>
                <span class=""><a href="#">4</a></span>
                <span class=""><a href="#">5</a></span>
                <span class="navi next"><a href="#">다음 페이지</a></span>
                <span class="navi last"><a href="#">마지막</a></span>
                <!-- pagination 모바일용 -->
                <button type="button" class="btns color-gray btn-more">
                  더보기
                </button>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
      
<script>
	front.selectmenu("area");
</script>
      