<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>회원 정보 수정 및 탈퇴</h2>
            <div class="breadcrumbs">
              <a href="<c:url value="/index.do"/>">메인</a>
              <span>마이페이지</span>
              <span>개인정보 관리</span>
            </div>
          </div>
        </header>
        <section id="contents" class="contents myinfo">
          <div class="inner">
            <p>
              디지털문화자원공동활용플랫폼은 문화 포털을 통해 회원가입을
              진행하므로,<br />
              정보의 수정 및 탈퇴는 문화 포털에서 진행되며,<br />
              수정 및 탈퇴시 문화 포털 사이트에도 동일하게 적용됩니다.
            </p>
            <label for="editBtn" class="blind"></label>
            <button type="button" id="editBtn" class="btns color-primary" onclick="location.href='https://www.culture.go.kr/mypage/mypage.do'">
              회원 정보 수정 및 탈퇴
            </button>
          </div>
        </section>
      </section>
      <!-- //container(E) -->
