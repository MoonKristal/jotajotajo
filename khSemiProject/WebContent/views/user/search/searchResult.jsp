<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.search.model.vo.SearchMovie, 
				   com.kh.theater.model.vo.Theater, com.kh.movie.model.vo.Review" %>
<%
	ArrayList<SearchMovie> movieList = (ArrayList<SearchMovie>)request.getAttribute("movieList");
	ArrayList<Theater> theaterList = (ArrayList<Theater>)request.getAttribute("theaterList");
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
	

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="../../../resource/css/00_stylesheet.css">

    <style>
        div {
           /* border: 1px solid black; */
            box-sizing: border-box;
        }
        #wrap{
            width: 1000px;
            height: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        #container>div {
            height: 100%;  
            
        }

        #search1 {
            height: 30%
        }
        #search2 {
            height: 30%
        }
        #search3 {
            height: 30%
        }

	.movie_img{
		width:150px;
		height:200px;
	}
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<br>
	
	
	<div id="container">
            <div>
                <h2>> 검색결과</h2>
                <br><br>
				                

                <div>
	                <h3>영화</h3> 
	                <hr size="4" color="lightgray">
	                <table>
	                	<tr>
		                	 <td><% if(movieList.isEmpty()){ %>
		            			<p>검색된 영화가 없습니다.</p>
		            		 </td>
		            	</tr>
		            	
	            			 <% } else {%>
		                		<% for(SearchMovie sb : movieList) {%>
		                			<tr>
				                   		<td rowspan="6"><a><img class="movie_img" src="<%=contextPath%><%=sb.getFilePath() %><%= sb.getChangeName() %>">
				                   		</a></td>
				                   	 </tr>
				                   	 <tr>
					                   	<td> | <%= sb.getmName() %></td>
					                  	</tr> 	
					                 <tr>  	
					                    <td> | <%= sb.getGenre() %></td>
					                 	</tr>   
					                <tr>    
					                    <td> | <%= sb.getDirector() %></td>
				                   	</tr>
					               
					                <tr>
					                    <td> | <%= sb.getActor() %></td>
					                </tr> 
					                 <tr>   
					                    <td> | <%= sb.getrTime() %></td>
					                </tr>
		                		<% } %>
		                	 <% } %>
		                				 
		                	 
		                <p align="right">더보기 ></p> 
		                <br><br>
	            	</table>    
                </div>
                
                <div >
	                <h3>영화관</h3>
	                <hr size="4"  color="lightgray">
	                <table>
	                	<tr>
	                		<td><% if(theaterList.isEmpty()){ %>
	            				<p>검색된 영화관이 없습니다.</p>
	            			</td>
	            		</tr>
            			 <% } else {%>
	                		<% for(Theater th : theaterList) {%>
				                <tr>
				                    <td><%= th.getTheaterName() %></td>
				                
				                    <td> | <%= th.getAddress() %></td>
				                </tr>
	                		<% } %>
	                	 <% } %>
	                	 
	                <p align="right">더보기 ></p>
	                <br><br>
	                </table>
                </div>
               
                <div>
                <h3>영화 리뷰</h3>
	                <hr size="4"  color="lightgray">
	                <table>
	                	<tr>
	                		<td>
			                	<% if(reviewList.isEmpty()){ %>
			            			<p>검색된 리뷰가 없습니다.</p>
	            			</td>
	            		</tr>
            			 <% } else {%>
	                		<% for(Review r : reviewList) {%>
	                		<tr>
			                    <td><%= r.getReviewNo() %></td>
			                    <td> | <%= r.getReviewContent() %></td>
			                    <td> | <%= r.getMno() %></td>
			                </tr>
	                		<% } %>
	                	 <% } %>
	                	 
	                	<p align="right">더보기 ></p>
	               </table>  
                </div>
            </div>
        </div>




	<%@ include file="../common/footer.jsp" %>


</body>
</html>