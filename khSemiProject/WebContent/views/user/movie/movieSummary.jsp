<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.kh.movie.model.vo.*" %>
<%
	Movie mv = (Movie)request.getAttribute("mv");
	ArrayList<Picture> picList = (ArrayList<Picture>)request.getAttribute("picList");
%>

	<!-- 해결해야하는 문제점
1. slide 이미지가 로딩 안되는 것 
2. 포스터와 텍스트가 엇갈리게 나오는것
3. 찜하기에 하트 제대로 넣기 -->

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>영화 요약</title>
		<style>
			#movie-summary-poster>img{
				width:200px;
	height:250px;
	border:1px solid gray;
	padding:0;
	margin:0;
			}
			.carousel-item img{
				width:500px;
				height:300px;
			}
		</style>
	</head>

	<body>
		<!-- movie-summary 전체 감싸는 영역-->
		<div class="movie-summary">

			<!-- 영화 스틸컷 슬라이드 영역 -->
			<div id="demo" class="carousel slide height600" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%= contextPath %><%= picList.get(1).getFilePath()+picList.get(1).getChangeName() %>" alt="">
				</div>
				<% if (picList.size()>0){ %>
					<% for(int i = 2; i<picList.size(); i++){ %>
						<div class="carousel-item">
							<img src="<%= contextPath %><%= picList.get(i).getFilePath()+picList.get(i).getChangeName() %>" alt="">
						</div>
					<% } %>
				<% } %>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>


			<!-- 영화 요약 정보 영역 -->
			<div class="movie-summary">
				<div id="movie-summary-poster">
					<img src="<%= contextPath %><%= picList.get(0).getFilePath()+picList.get(0).getChangeName() %>" alt="">
				</div>
				<div id="movie-summary-text">
					<br>
					<h3><%=mv.getMovieName() %></h3>
					<ul>
						<li>
							<span>관람객 평점</span>
							<span><%= mv.getReviewAvg() %></span>
						</li>
						<li>
							<span>예매율</span>
							<span>30.5% !!!예매테이블 정리되면 수정하기!!!</span>
						</li>
					</ul>
					<hr>
					<ul>
						<li>
							<span>감독</span>
							<span><%= mv.getDirector() %></span>
						</li>
						<li>
							<span>재개봉일</span>
							<span><%= mv.getReleaseDate() %></span>
						</li>
						<li>
							<span>장르</span>
							<span><%= mv.getGenre() %></span>
						</li>
					</ul>

					<!-- 버튼 영역 -->
					<!-- <div class="d-flex justify-content-end"> -->
					<div>
						<a class="btn btn-danger" onclick="movieLike();" id="movieLike">
							<span>
							
								<% if(mv.getMyLike().equals("Y")){ %>
									♥
								<% }else{ %>
									♡
								<% } %>
							</span>
							<b><%= mv.getMovieLike() %></b>
						</a>
						<a href="#예매로이동" class="btn btn-danger">예매하기</a>
					</div>
					<script>
						function movieLike(){
							if($('#movieLike>span').text().trim()=='♥'){
								isLike = "Y";
							}else{
								isLike = "N";
							}
							
							<% if(loginUser != null){ %>
								$.ajax({
									url: 'like.mo',
									data: {
										'mno': <%= mv.getMovieNo() %>,
										'isLike': isLike
									},
									success: function(result){
										if(result>0){
											if(isLike=='Y'){
												$('#movieLike>span').text('♡');
												$('#movieLike>b').text(Number($('#movieLike>b').text())-1);
											}else{
												$('#movieLike>span').text('♥');
												$('#movieLike>b').text(Number($('#movieLike>b').text())+1);
											}
										}else{
											alert('등록 실패');
										}
									},
									error: function(){
										alert('AJAX 실패');
									}
								})
							<% } %>
						}
					</script>
				</div>
			</div>
		</div>
	</body>

	</html>