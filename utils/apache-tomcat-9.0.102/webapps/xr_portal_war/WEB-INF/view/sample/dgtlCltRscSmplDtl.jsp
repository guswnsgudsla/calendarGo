<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>디지털 문화자원</h2>
            <div class="breadcrumbs">
              <a href="#" onclick="fncShowConts('DCM00000000000000561', '', 'rscConts');">문화자원실행</a>
              <span>디지털 문화자원</span>
              <span>자원별 보기</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents resource">
          <div class="inner">
            <div class="switch-radio">
              <span>
                <input type="radio" id="switch1" name="switch" checked />
                <label for="switch1">전체보기</label>
              </span>
              <span>
                <input type="radio" id="switch2" name="switch" />
                <label for="switch2">3D 데이터 에셋</label>
              </span>
              <span>
                <input type="radio" id="switch3" name="switch" />
                <label for="switch3">동영상</label>
              </span>
              <span>
                <input type="radio" id="switch4" name="switch" />
                <label for="switch4">이미지</label>
              </span>
              <span>
                <input type="radio" id="switch5" name="switch" />
                <label for="switch5">오디오</label>
              </span>
              <span>
                <input type="radio" id="switch6" name="switch" />
                <label for="switch6">텍스트</label>
              </span>
            </div>
            <!-- 상세조건 모바일용 -->
            <div class="controlbox-mobile">
              <div class="selectmenu">
                <select name="resource" id="resource">
                  <option value="" disabled selected>자원별 검색</option>
                  <option value="">국립국악원</option>
                </select>
              </div>
            </div>
            <div class="detail-wrap">
              <div class="detail-cont cont-bg">
                <div class="item-box">
                  <div class="item" id="rscConts">
                    <img src="<c:url value='/assets/images/temp/main_video.png'/>" alt="" />
                  </div>
                  <!-- like 클릭시 active 추가 -->
                  <div class="count">
                    <span class="view">123</span>
                    <span class="download">24,128</span>
                    <span class="like active">123,456</span>
                  </div>
                </div>
                <div class="info">
                  <div class="title">
                    <div class="tag-wrap">
                      <span class="tag color-green">동영상</span>
                      <span class="tag brd-color-blue">국립국악원</span>
                    </div>
                    <strong>서초동 청사 30주년 기념 민속악단 공연</strong>
                    <button
                      type="button"
                      class="btns size-s color-skyblue btn-like"
                    >
                      좋아요
                    </button>
                    <button
                      type="button"
                      class="btns size-s color-primary btn-download"
                      onclick="front.layerOpen($(this),'layerDownload')"
                    >
                      다운로드
                    </button>
                  </div>
                  <div class="box">
                    <div class="tag-wrap">
                      <span class="tag color-gray">#순천</span>
                      <span class="tag color-gray">#송광사</span>
                      <span class="tag color-gray">#광양</span>
                      <span class="tag color-gray">#여수</span>
                      <span class="tag color-gray">#전주</span>
                      <span class="tag color-gray">#해인사</span>
                      <span class="tag color-gray">#백담사</span>
                      <span class="tag color-gray">#신흥사</span>
                      <span class="tag color-gray">#마천사</span>
                      <span class="tag color-gray">#송광사</span>
                      <span class="tag color-gray">#송광사</span>
                      <span class="tag color-gray">#송광사</span>
                      <span class="tag color-gray">#송광사</span>
                      <span class="tag color-gray">#송광사</span>
                    </div>
                    <div class="subsection">
                      <dl>
                        <dt>데이터 유형</dt>
                        <dd>오디오-음악</dd>
                        <dt>콘텐츠 유형</dt>
                        <dd>체육-체육 콘텐츠</dd>
                        <dt>서비스 유형</dt>
                        <dd>보존</dd>
                        <dt>산업 유형</dt>
                        <dd>시각 예술</dd>
                      </dl>
                      <dl>
                        <dt>분류</dt>
                        <dd>전통과학-판류 판류-농화판</dd>
                        <dt>국가/시대</dt>
                        <dd>한국</dd>
                        <dt>재질</dt>
                        <dd>나무</dd>
                        <dt>최신 등록일</dt>
                        <dd>2023-10-29</dd>
                      </dl>
                    </div>
                  </div>
                </div>
                <div class="tab-wrap type02 as-tab-wrap">
                  <ul class="tab-menu flexible">
                    <li><a href="#">개요</a></li>
                    <li><a href="#">패키지 콘텐츠</a></li>
                    <li><a href="#">출처표기</a></li>
                    <li><a href="#">리뷰</a></li>
                    <li><a href="#">Q&A</a></li>
                    <li><a href="#">유의사항</a></li>
                  </ul>
                  <div class="inner-depth">
                    <!-- 개요 -->
                    <div class="tab-inner">
                      <ul class="summary">
                        <li>
                          <em>소장기관 : </em>
                          <p>국립국악원</p>
                        </li>
                        <li>
                          <em>명칭 : </em>
                          <p>타종</p>
                        </li>
                        <li>
                          <em>설명 : </em>
                          <p class="normal">
                            편종은 16개의 종(鍾)을 두 단으로 나누어 엮어 놓은
                            타악기이다. 각 종의 크기와 모양은 같으나 두께에 따라
                            음높이가 다르며, 두꺼울수록 높은 음을 낸다. 편종은
                            윗단의 좌우에는 푸른색 용머리를 장식하고 색사유소를
                            늘어트리며 받침대 위에는 푸른색 목사자로 장식한다.
                            연주는 각퇴(角槌, 쇠뿔로 만든 망치 모양의 채)로
                            whd의 아랫부분을 쳐서 소리낸다. 편경과 더불어 최고
                            통치자의 위상과 권위를 상징하는 악기였으므로
                            국가적인 의례에서 함께 연주되었다.
                          </p>
                        </li>
                      </ul>
                    </div>
                    <!-- //개요 -->
                    <!-- 패키지 콘텐츠 -->
                    <div class="tab-inner">
                      <div class="contents-wrap">
                        <div class="contents-list">
                          <strong>최종 산출물 (4)</strong>
                          <ul>
                            <li><p class="folder">파일1_basecolor.mp4</p></li>
                            <li>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <p>파일1_basecolor.mp4</p>
                            </li>
                            <li><p>파일1_basecolor.mp4</p></li>
                            <li><p>파일1_basecolor.mp4</p></li>
                          </ul>
                          <strong>단계 산출물 (5)</strong>
                          <ul>
                            <li><p>파일1_basecolor.mp4</p></li>
                            <li><p>파일1_basecolor.mp4</p></li>
                            <li><p>파일1_basecolor.mp4</p></li>
                            <li><p>파일1_basecolor.mp4</p></li>
                          </ul>
                        </div>
                        <div class="contents-view">
                          <img
                            src="<c:url value='/assets/images/temp/main_video.png'/>"
                            alt=""
                          />
                        </div>
                      </div>
                    </div>
                    <!-- //패키지 콘텐츠 -->
                    <!-- 출처표기 -->
                    <div class="tab-inner">
                      <div class="source-info">
                        <h3>
                          공공누리의 제 1유형
                          <img
                            src="<c:url value='/assets/images/logo_open.png'/>"
                            alt="공공누리 OPEN로고"
                          />
                        </h3>
                        <p>
                          제 1유형: 출처표시<br />상업적, 비상업적 이용가능<br />변형
                          등 2차적 저작물 작성 가능
                        </p>
                        <span class="noti"
                          >※ 주의 : 기관사용자는 공공누리 유형마크를 내려받기 후
                          사용시 지정된 유형마크 파일명 변경을 금지</span
                        >
                        <strong class="title"
                          >공공누리의 제 1유형 개별조건</strong
                        >
                        <div class="source-indicator">
                          <i
                            ><img
                              src="<c:url value='/assets/images/mask_source.png'/>"
                              alt="출처표시 로고"
                          /></i>
                          <strong>출처표시</strong>
                          <p>저작물의 출처를 표시해야 됩니다.</p>
                          <div>
                            이용자는 공공저작물을 이용할 경우, 다음과 같이 출처
                            또는 저작권자를 표시해야 합니다. ex) "본 저작물은
                            'OOO(기관명)'에서 'OO년' 작성하여 공공누리
                            제O유형으로 개방한 '저작물명(작성자:OOO)'을
                            이용하였으며, 해당 저작물은 'OOO(기관명), OOO(누리집
                            주소)'에서 무료로 내려받으실 수 있습니다.”
                          </div>
                        </div>
                        <span class="noti"
                          >* 위 내용은 예시이므로 작성연도 및 해당 기관명과
                          누리집 주소, 작성자명 기입 온라인에서 출처 웹사이트에
                          대한 하이퍼링크를 제공하는 것이 가능한 경우에는 링크를
                          제공하여야 합니다. 이용자는 공공기관이 이용자를
                          후원한다거나 공공기관과 이용자가 특수한 관계에 있는
                          것처럼 제3자가 오인하게 하는 표시를 해서는
                          안됩니다.</span
                        >
                      </div>
                    </div>
                    <!-- //출처표기 -->
                    <!-- 리뷰 -->
                    <div class="tab-inner">
                      <div class="comment-write">
                        <strong
                          ><u>로그인한 아이디</u>별점과 댓글을
                          남겨주세요.</strong
                        >
                        <div class="write">
                          <form id="" name="">
                            <fieldset>
                              <input
                                type="radio"
                                name="reviewStar"
                                value=""
                                id="rate1"
                              /><label for="rate1">★</label>
                              <input
                                type="radio"
                                name="reviewStar"
                                value=""
                                id="rate2"
                              /><label for="rate2">★</label>
                              <input
                                type="radio"
                                name="reviewStar"
                                value=""
                                id="rate3"
                              /><label for="rate3">★</label>
                              <input
                                type="radio"
                                name="reviewStar"
                                value=""
                                id="rate4"
                              /><label for="rate4">★</label>
                              <input
                                type="radio"
                                name="reviewStar"
                                value=""
                                id="rate5"
                              /><label for="rate5">★</label>
                            </fieldset>
                            <div class="fm-focus fm-textarea">
                              <textarea
                                type="text"
                                id=""
                                placeholder="댓글을 남겨주세요."
                              ></textarea>
                            </div>
                            <button type="button" class="btns color-primary">
                              등록
                            </button>
                          </form>
                        </div>
                      </div>
                      <div class="review-list">
                        <ul>
                          <li>
                            <div>
                              <div>
                                <strong>홍길동123</strong>
                                <em class="tag brd-color-blue">작성자</em>
                                <span>2023-04-23 14:25</span>
                                <button type="button" class="btn-delete">
                                  삭제
                                </button>
                              </div>
                              <!-- 
                                0개 : defult
                                1개 : star1 ~ 5개 : star5 
                              -->
                              <p class="star1">
                                <span></span><span></span><span></span
                                ><span></span><span></span>
                              </p>
                            </div>
                            <p>
                              자원 공유 감사합니다. 너무 필요한 아이템이었는데
                              혹시나 하고 검색해보니 자료가 있어서 너무
                              다행이에요. 정말 좋았습니다!
                            </p>
                          </li>
                          <li>
                            <div>
                              <div>
                                <strong>홍길동123</strong>
                                <span>2023-04-23 14:25</span>
                              </div>
                              <!-- 
                                0개 : defult
                                1개 : star1 ~ 5개 : star5 
                              -->
                              <p class="star3">
                                <span></span><span></span><span></span
                                ><span></span><span></span>
                              </p>
                            </div>
                            <p>
                              자원 공유 감사합니다. 너무 필요한 아이템이었는데
                              혹시나 하고 검색해보니 자료가 있어서 너무
                              다행이에요. 정말 좋았습니다!
                            </p>
                          </li>
                          <li>
                            <div>
                              <div>
                                <strong>홍길동123</strong>
                                <em class="tag brd-color-blue">작성자</em>
                                <span>2023-04-23 14:25</span>
                                <button type="button" class="btn-delete">
                                  삭제
                                </button>
                              </div>
                              <!-- 
                                0개 : defult
                                1개 : star1 ~ 5개 : star5 
                              -->
                              <p class="star5">
                                <span></span><span></span><span></span
                                ><span></span><span></span>
                              </p>
                            </div>
                            <p>
                              자원 공유 감사합니다. 너무 필요한 아이템이었는데
                              혹시나 하고 검색해보니 자료가 있어서 너무
                              다행이에요. 정말 좋았습니다!
                            </p>
                          </li>
                        </ul>
                        <div class="pagination">
                          <span class=""><a href="#">1</a></span>
                          <span class="active"><a href="#">2</a></span>
                          <span class=""><a href="#">3</a></span>
                          <span class=""><a href="#">4</a></span>
                          <span class=""><a href="#">5</a></span>
                          <span class="navi next"
                            ><a href="#">다음 페이지</a></span
                          >
                          <span class="navi last"><a href="#">마지막</a></span>
                          <!-- pagination 모바일용 -->
                          <button
                            type="button"
                            class="btns color-gray btn-more"
                          >
                            더보기
                          </button>
                        </div>
                      </div>
                    </div>
                    <!-- //리뷰 -->
                    <!-- Q&A -->
                    <div class="tab-inner">
                      <div class="comment-write">
                        <strong><u>로그인한 아이디</u></strong>
                        <div class="write">
                          <form id="" name="">
                            <div class="fm-focus fm-textarea">
                              <textarea
                                type="text"
                                id=""
                                placeholder="질문을 등록해주세요."
                              ></textarea>
                            </div>
                            <button type="button" class="btns color-primary">
                              등록
                            </button>
                          </form>
                        </div>
                      </div>
                      <div class="qna-list">
                        <ul>
                          <li>
                            <div>
                              <div>
                                <strong>홍길동123</strong>
                                <em class="tag brd-color-blue">작성자</em>
                                <span>2023-04-23 14:25</span>
                                <button type="button" class="btn-delete">
                                  삭제
                                </button>
                              </div>
                            </div>
                            <p>
                              자원 공유 감사합니다. 너무 필요한 아이템이었는데
                              혹시나 하고 검색해보니 자료가 있어서 너무
                              다행이에요. 정말 좋았습니다!
                            </p>
                            <div class="answer">
                              <strong
                                ><em>[관리자]</em
                                ><span>2023-04-23 14:25</span></strong
                              >
                              <p>
                                [홍길동123] 네 동영상 카테고리에서 검색하시면
                                확인이 가능합니다.
                              </p>
                            </div>
                          </li>
                        </ul>
                        <div class="pagination">
                          <span class=""><a href="#">1</a></span>
                          <span class="active"><a href="#">2</a></span>
                          <span class=""><a href="#">3</a></span>
                          <span class=""><a href="#">4</a></span>
                          <span class=""><a href="#">5</a></span>
                          <span class="navi next"
                            ><a href="#">다음 페이지</a></span
                          >
                          <span class="navi last"><a href="#">마지막</a></span>
                          <!-- pagination 모바일용 -->
                          <button
                            type="button"
                            class="btns color-gray btn-more"
                          >
                            더보기
                          </button>
                        </div>
                      </div>
                    </div>
                    <!-- //Q&A -->
                    <!-- 유의사항 -->
                    <div class="tab-inner">
                      <ul class="note">
                        <li>
                          <strong>이용자가 가지는 권리</strong>
                          <ul>
                            <li>
                              1. 온·오프라인 상에 공유 및 이용 : 온·오프라인을
                              통하여 공유 및 이용 가능
                            </li>
                            <li>
                              2. 저작물 변경 : 2차적 저작물로 변경하여 이용 가능
                            </li>
                            <li>
                              3. 이 저작물은 영리 목적으로 이용할 수 있습니다.
                            </li>
                          </ul>
                          <strong>저작물 사용 조건</strong>
                          <p>
                            - 출처 표시 : 저작물의 출처를 표시하셔야 합니다.<br />❖
                            공공기관이 후원 한다고 하거나 공공기관과 특수한
                            관계에 있는 것처럼 제 3자가 오인하게 하는 표시를
                            해서는 안됩니다.
                          </p>
                          <strong>알아야 할 사항</strong>
                          <ul>
                            <li>
                              I. 이용조건의 표시 및 변경
                              <ul>
                                <li>
                                  1. 이용자가 공공누리 저작물 활용 시 출처표시를
                                  꼭 해 주셔야 합니다.
                                </li>
                                <li>
                                  2. 공공누리 저작물의 이용조건은 변경될 수
                                  있습니다.<br />다만 이용자가 이용조건 변경 전
                                  사용하셨다면 해당저작물 한해 용도변경 없이
                                  계속 이용할 수 있습니다.
                                </li>
                              </ul>
                            </li>
                            <li>
                              II. 이용조건의 위반
                              <ul>
                                <li>
                                  1. 이용자가 공공누리 이용조건을 위반할 경우 그
                                  즉시 이용허락이 종료됩니다.
                                </li>
                                <li>
                                  2. 이용자가 이용조건 위반 후 지속적으로
                                  공공저작물을 이용할 경우 저작권 침해가
                                  성립되므로 형사상, 민사상 책임을 부담 하실 수
                                  있습니다.
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <!-- //유의사항 -->
                  </div>
                </div>
              </div>
              <div class="detail-list cont-bg">
                <div>
                  <h3>관련 컬렉션 보기</h3>
                  <ul class="list-collection">
                    <li>
                      <div class="img">
                        <img src="<c:url value='/assets/images/temp/list_item01.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item02.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item03.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item04.png'/>" alt="" />
                      </div>
                      <p>
                        <strong
                          >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문</strong
                        >
                      </p>
                      <div class="dim">
                        <button
                          type="button"
                          class="btns color-primary btn-preview"
                          onclick="front.layerOpen($(this),'layerPreview')"
                        >
                          미리보기
                        </button>
                        <button
                          type="button"
                          class="btns color-white btn-detail"
                        >
                          상세보기
                        </button>
                      </div>
                    </li>
                    <li>
                      <div class="img">
                        <img src="<c:url value='/assets/images/temp/list_item05.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item04.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item03.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item02.png'/>" alt="" />
                      </div>
                      <p>
                        <strong
                          >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문</strong
                        >
                      </p>
                      <div class="dim">
                        <button
                          type="button"
                          class="btns color-primary btn-preview"
                          onclick="front.layerOpen($(this),'layerPreview')"
                        >
                          미리보기
                        </button>
                        <button
                          type="button"
                          class="btns color-white btn-detail"
                        >
                          상세보기
                        </button>
                      </div>
                    </li>
                    <li>
                      <div class="img">
                        <img src="<c:url value='/assets/images/temp/list_item01.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item02.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item03.png'/>" alt="" />
                        <img src="<c:url value='/assets/images/temp/list_item04.png'/>" alt="" />
                      </div>
                      <p>
                        <strong
                          >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                          미륵사 중원 중문</strong
                        >
                      </p>
                      <div class="dim">
                        <button
                          type="button"
                          class="btns color-primary btn-preview"
                          onclick="front.layerOpen($(this),'layerPreview')"
                        >
                          미리보기
                        </button>
                        <button
                          type="button"
                          class="btns color-white btn-detail"
                        >
                          상세보기
                        </button>
                      </div>
                    </li>
                  </ul>
                </div>
                <div>
                  <h3><u>#국립중앙박물관</u>의 다른 자원 보기</h3>
                  <ul class="list-resource">
                    <li>
                      <a href="#">
                        <div class="img">
                          <img
                            src="<c:url value='/assets/images/temp/list_item03.png'/>"
                            alt=""
                          />
                        </div>
                        <div class="tag-wrap">
                          <span class="tag size-small color-green">동영상</span>
                          <span class="tag size-small brd-color-blue"
                            >국립국악원</span
                          >
                        </div>
                        <p>
                          <strong
                            >미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                            미륵사 중원 중문 미륵사 중원 중문 미륵사 중원 중문
                            미륵사 중원 중문</strong
                          >
                        </p>
                      </a>
                      <!-- like 클릭시 active 추가 -->
                      <div class="btn-wrap">
                        <button type="button" class="view">123</button>
                        <button type="button" class="download">24,128</button>
                        <button type="button" class="like">123,456</button>
                      </div>
                    </li>
                    <li>
                      <a href="#">
                        <div class="img">
                          <img
                            src="<c:url value='/assets/images/temp/list_item04.png'/>"
                            alt=""
                          />
                        </div>
                        <div class="tag-wrap">
                          <span class="tag size-small color-green">동영상</span>
                          <span class="tag size-small brd-color-blue"
                            >국립국악원</span
                          >
                        </div>
                        <p><strong>미륵사 중원 중문</strong></p>
                      </a>
                      <div class="btn-wrap">
                        <button type="button" class="view">123</button>
                        <button type="button" class="download">24,128</button>
                        <button type="button" class="like">123,456</button>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
 