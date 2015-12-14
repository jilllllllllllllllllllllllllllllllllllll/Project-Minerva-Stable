<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file = "clientheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
</head>
<body>
<% 

	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
	PreparedStatement pstmt = connection.prepareStatement("select * from news where isActive order by newsId desc");
	ResultSet rs = pstmt.executeQuery();
	
%>
	<main class="body newsPage">
		<p>News and Announcements</p>
		<div class="newsContainer">
			<div class="row">
				<% for(int ctr=1; ctr<4; ctr++) { 
					rs.absolute(ctr);
				%>
				<div class="col">
					<div class="news">
						<img src="assets/img/lawnmower.jpg">
						<div class="information">
							<p><%=rs.getString("newsTitle") %></p>
							<p><%=rs.getString("newsMessage") %></p>
						</div>
						<button>Read more</button>
					</div>
				</div>	
				<% 	}	%>
				
			</div>
			<div class="row">
				<% for(int ctr=4; ctr<7; ctr++) { 
					rs.absolute(ctr);
				%>
				<div class="col">
					<div class="news">
						<img src="assets/img/lawnmower.jpg">
						<div class="information">
							<p><%=rs.getString("newsTitle") %></p>
							<p><%=rs.getString("newsMessage") %></p>
						</div>
						<button>Read more</button>
					</div>
				</div>	
				<% 	}	%>
			</div>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>