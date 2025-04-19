<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
      <!-- container(S) -->
      <section class="container">
        <header>
          <div class="inner">
            <h2>회원가입 / 로그인</h2>
          </div>
        </header>
        <section id="contents" class="contents login">
          <div class="inner">
            <h3><span class="blind">문화포털</span></h3>
            <p>
              디지털문화자원 공동활용플랫폼 사이트는<br />
              <b>문화포털 사이트</b>를 통해 회원가입 및 로그인이 가능합니다.
            </p>
            <!--  <button type="button" class="btns color-primary" onclick="window.open('https://www.culture.go.kr/sso/login.do?agentId=7')">-->
            <button type="button" class="btns color-primary" onclick="location.href='<c:url value="/login.do"/>'">
              문화포털 아이디 로그인
            </button>
            <button type="button" class="btns brd-color-white02" onclick="window.open('https://www.culture.go.kr/member/register.do')">
              문화포털 회원가입
            </button>
            <!-- 
            <div class="links">
              <a href="#">아이디 찾기</a>
              <a href="#">비밀번호 초기화</a>
            </div>
             -->
          </div>
        </section>
      </section>
      <!-- //container(E) -->
