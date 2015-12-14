<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<head></head>
<body class="bodyBG">
<% 
	
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
		
		Statement stmt = connection.createStatement();
		ResultSet browse = stmt.executeQuery("SELECT * FROM Books where isActive");
	
%>
	<main class="body browsePage">
		
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
		
		<div class="table">
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
				<div class="col">
					<a href="#">
						EDIT
					</a>
				</div>
				<div class="col">
					<a href="#">
						DELETE
					</a>
				</div>
			</div>

			<% while(browse.next()){ %>
			<div class="row content">
				<div class="col">
					<p><span class="mobile">Account #: </span><a href="bookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getLong("accNum") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Class: </span><a href="bookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("class") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Title: :</span><a href="bookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("bookTitle") %></a></p>
				</div>
				<div class="col">
					<p><span class="mobile">Author: </span><a href="bookview.html?id=<%= browse.getLong("accNum") %>"><%= browse.getString("author") %></a></p>
				</div>
				<div class="col">
					<%browse.getLong("accNum"); %>
					<a href="maintainance.html?id=<%= browse.getLong("accNum") %>&action=edit">
						[EDIT]
					</a>
				</div>
				<div class="col">
					<%browse.getLong("accNum"); %>
					<a href="maintainance.html?id=<%= browse.getLong("accNum") %>&action=delete"
					onclick="if(confirm('Do you want to continue deleting this record?')){ return true;} else{return false;}">
						[DELETE]
					</a>
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