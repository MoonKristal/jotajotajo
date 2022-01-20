<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="sub_nav" style="float: left;">
		<%@ include file="../common/customerNavigation.jsp"%>
	</div>
	<div class="outer">
		<br>
		<h1 class="title">문의 답변 확인</h1>
		<br>

		<div class="Qform-btn">
			<a href="<%=contextPath%>/enroll-form.qu %>"
				class="btn btn-sm btn-primary">1:1 문의하기</a> <br> <br>
		</div>

		<table class="list-area">
			<tr>
				<th>제목</th>
				<td colspan="5">결제 취소 되나요?</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>2022.01.02</td>
				<th>문의 유형</th>
				<td>일반문의</td>
				<th>답변 상태</th>
				<td>처리 완료</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5" class="Qcontent">결제 취소 해주세요</td>
			</tr>
			<tr>
				<th></th>
				<td colspan="5" class="Qanswer">안녕하세요, 시네마헤븐 고객센터 입니다. ~</td>
			</tr>
		</table>
	</div>
</body>
</html>