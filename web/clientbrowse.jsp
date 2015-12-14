<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
        
<%--     <jsp:useBean id="browse" type="java.sql.ResultSet" scope="request"/> --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file = "clientheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
</head>
<body class="bodyBG">

<% 
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
		
		Statement stmt = connection.createStatement();
		ResultSet browse = stmt.executeQuery("SELECT * FROM Books where isActive");
	
	%>

	<main class="body browsePage client">
		
		<!-- <div class="browseList"> -->
		
		<div class="control">
			<div class="header">
				<p>Browse All Materials</p>
			</div>
			<div class="sort">
				<label> Sort by: </label>
				<select>
					<option>Title</option>
					<option>Author</option>
					<option>Published</option>
					<option>Date Acquired</option>
				</select>
			</div>
		</div>
		
		<div class="table client">
			<div class="row head">
				<div class="col">
					<p>ACC NO.</p>
				</div>
				<div class="col">
					<p>CLASS</p>
				</div>
				<div class="col">
					<p>TITLE</p>
				</div>
				<div class="col">
					<p>AUTHOR</p>
				</div>
			</div>

			<% while(browse.next()){ %>
			<div class="row content">
				<div class="col">
					<p><span class="mobile">Account #: </span><a href="clientbookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getLong("accNum") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Class: </span><a href="clientbookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("class") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Title: </span><a href="clientbookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("bookTitle") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Author: </span><a href="clientbookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("author") %></a></p>
				</div>
			</div>
			<% } %>

		</div>
	</main>

<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>