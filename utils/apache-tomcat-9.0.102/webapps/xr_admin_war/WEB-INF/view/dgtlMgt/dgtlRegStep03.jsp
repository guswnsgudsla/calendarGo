<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="write-wrap" >
    <div>
        <strong>디지털문화자원 부제목</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlClrcsSbttl" title="디지털문화자원 부제목" placeholder="부제목을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >디지털문화자원 URL</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlClrcsUrlAddr" title="디지털문화자원 URL" placeholder="URL를 입력하세요." />
        </div>
    </div>

    <div>
        <strong>디지털문화자원 영문명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlClrcsEngNm" title="디지털문화자원 영문명칭" placeholder="영문 명칭을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >디지털문화자원 중문명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlClrcsChnNm" title="디지털문화자원 중문명칭" placeholder="중문 명칭을 입력하세요." />
        </div>
    </div>

    <div>
        <strong >디지털문화자원 저자명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlClrcsAutNm" title="디지털문화자원 저자명" placeholder="저자명을 입력하세요." />
        </div>
    </div>

    <div>
        <strong >작가명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlWriNm" title="작가명" placeholder="작가명을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >출토지명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlFdspNm" title="출토지명" placeholder="출토지명을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >전시명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlDspyNm" title="전시명" placeholder="전시명을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >전시장소명</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchDgtlDspyPlcNm" title="전시장소명" placeholder="전시장소명을 입력하세요." />
        </div>
    </div>
    <div>
        <strong >문화자원 크기</strong>
        <div class="fm-ele" style="display: inline" >
            <input type="text" id="srchClrcsSzCn" title="문화자원 크기" placeholder="문화자원 크기를 입력하세요." />
        </div>
    </div>
    <div>
        <strong>디지털문화자원 부가설명</strong>
        <div class="fm-textarea">
            <textarea id="srchDgtlClrcsAnxtExpln" row="5" col="10" title="디지털문화자원 부가설명" placeholder="부가설명 입력하세요."></textarea>
        </div>
    </div>
</div>
<div class="btn-wrap">
    <button type="button" class="btns color-gray" onclick="goBack()">취소</button>
    <button type="button" class="btns" onclick="saveData();">저장</button>
</div>
