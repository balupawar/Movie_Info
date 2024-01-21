<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Info</title>
<style>
body{
	background-color: #2b2a27;
}
.card-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	padding: 2px;
}

.card img {
	height: 180px;
	width: 100px;
	
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card {
	margin: 2px;
	border: 1px solid white;
	background-color: black;
	color: white;
	border-radius: 10px;
}

.container {
	padding: 4px;
}

.main .app{
	color: white;
	background-color: black;
	padding: 10px 10px;
	text-align: center;
	position: -webkit-sticky; /* Safari */
  	position: sticky;
  	top: 0;
}
</style>
</head>
<body>
<div class="main">
	<div class="app">
		<h1>Movie-Info</h1>
	</div>
	<div class="card-container">
		<%
		try {
			Connection con = ConnectDatabase.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from movie_info");
			while (rs.next()) {
		%>
		<%-- <h3>Id: <%=rs.getString(1)%> </h3>
	<h4> Title:<%=rs.getString(2) %></h4>
	<br> --%>

		<div class="card">
			<a href="movieDetails.jsp?id=<%=rs.getString(1)%>"><img
				src=<%=rs.getString(13)%> alt="Avatar" style="width: 100%"></a>
			<div class="container">
				<b> <%=rs.getString(2)%>
				</b>

				<hr>
				<p>
					Year :
					<%=rs.getString(3)%></p>
			</div>
		</div>
		<br>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>
	</div>
	</div>
</body>
</html>