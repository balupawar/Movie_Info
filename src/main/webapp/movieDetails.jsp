<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Details</title>
<style>
body {
	background-color: #2b2a27;
}
.m_details-container {
	display: flex;
	flex-direction: row;
	gap: 50px;
	flex-wrap: wrap;
	background-color: black;
}

.m_details-info1 {
	color: white;
}

.m_details-container-main {
	display: flex;
	flex-direction: column;
	flex-wrap : wrap;
	border: 1px solid white;
	padding: 10px;
	margin-top: 4px;
}

.movie_name {
	color: white;
}

.movie-details {
	color: white;
}


.main .app {
	color: white;
	background-color: black;
	padding: 10px 10px;
	text-align: center;
	position: -webkit-sticky; /* Safari */
	position: sticky;
	top: 0;
}
p{
	color: white;
}

span{
	color: red;
}
</style>
</head>

<body>
	<div class="main">
		<div class="app">
			<h1>Movie-Info</h1>
		</div>
		<div class="m_details-container-main">

			<%
			try {
				String imdbId = request.getParameter("id");
				String sqlQuery = "select * from movie_info where imdbID='" + imdbId + "'";
				Connection con = ConnectDatabase.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sqlQuery);

				while (rs.next()) {
			%>
			<h1 class="movie_name"><%=rs.getString(2)%></h1>
			<div class="m_details-container">
				<div class="m_details-card">
					<img alt="" src="<%=rs.getString(13)%>">

				</div>
				<div class="m_details-info1">
					<h5>
						<span>IMDB ID:</span>
						<%=rs.getString(1)%></h5>
					<h5>
						<span>Year:</span>
						<%=rs.getString(3)%></h5>
					<h5>
						<span>Type:</span>
						<%=rs.getString(4)%></h5>
					<h5>
						<span>Released:</span>
						<%=rs.getString(5)%></h5>
					<h5>
						<span>Genre:</span>
						<%=rs.getString(6)%></h5>
					<h5>
						<span>Director:</span>
						<%=rs.getString(7)%></h5>
					<h5>
						<span>Writer:</span>
						<%=rs.getString(8)%></h5>
					<h5>
						<span>Actors:</span>
						<%=rs.getString(9)%></h5>
					<h5>
						<span>Language:</span>
						<%=rs.getString(11)%></h5>
					<h5>
						<span>Country:</span>
						<%=rs.getString(12)%></h5>
				</div>
			</div>
			<div class="movie-details">
				<p>
					<span>Plot:</span>
					<%=rs.getString(10)%></p>
			</div>


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