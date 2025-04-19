<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="noti">디지털문화자원 파일 품질 정보는<br />최종산출물 기준으로 품질정보를 관리합니다.</div>
<div class="write-wrap" id="qltProc">
	<div>
		<strong>품질기준 유형 선택</strong>
		<div class="fm-focus fm-select" data-size="w300">
			<select id="prdctUsgCd" name="prdctUsgCd">
			</select>
		</div>
		<button type="button" class="btns size-small" onClick="insertPrdctQltInspInfo()">품질관리 수행</button>
	</div>
</div>
<div class="quality-control">
	<div id="noData" class="no-data">이미지/영상/텍스트는 품질관리 정보가 없습니다.</div>
	<div id="noFile" class="no-data">디지털문화자원 파일이 등록되지 않았습니다.</div>
	<div id="qltArea">
	<h3>품질관리 판정정보</h3>
	<dl>
		<dt>최종산출물 :</dt>
		<dd id="rowCnt"></dd>
	</dl>
	<table class="table-accordion">
		<colgroup>
			<col width="10%"/><col width="10%"/><col width="10%"/><col width="*"/>
		</colgroup>
		<thead>
		<tr>
			<th>순번</th>
			<th>파일명</th>
			<th>유형</th>
			<th>파일 크기</th>
			<th>텍스처 개수</th>
			<th>폴리곤 개수</th>
			<th>&nbsp;</th>
		</tr>
		</thead>
		<tbody id="qltList">
		</tbody>
	</table>
    </div>
</div>	