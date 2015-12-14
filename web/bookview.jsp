<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<jsp:useBean id="view" type="java.sql.ResultSet" scope="request"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="True" />
<meta name=apple-mobile-web-app-capable content=yes>
<meta name=apple-mobile-web-app-status-bar-style content=black>
<meta name="viewport" content="initial-scale=1, maximum-scale=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=9" />

<link rel="stylesheet" type="text/css" href="assets/vendor/foundation-icons/foundation-icons.css">
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/import.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>iAcademy Library - Minerva</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<section class="wrapperFull nav">
		<div class="wrapperMax">
			<nav>
				<div class="logoContainer">
					<a href="adminmain.jsp"><img src="assets/img/logo-full.png"></a>
				</div>
				<div class="linkContainer">
					<ol class="admin">
						<ul class="search">
							<a>SEARCH</a>
							<ul class="menu arrow_box">
								<li>
									<form action="adminsearch.html" method="post">
										<input name="generalSearch" id="generalSearch" type="text" placeholder="Search"><button><i type="submit" class="fi-magnifying-glass"></i></button>
									</form>
								</li>
							</ul>
						</ul>
						<ul class="students">
							<a>ACCOUNT</a>
							<ul class="menu arrow_box">
								<li><a href="adminfeedback.jsp">Inbox</a></li>
								<li><a href="adminnewsedit.jsp">News</a></li>
								<li><a href="#">History</a></li>
								<li><a href="#">Change Password</a></li>
								<li><a href="login.jsp">Logout</a></li>
							</ul>
						</ul>
						<ul class="add">
							<a>ADD</a>
							<ul class="menu arrow_box">
								<li><a href="adminaddbook.jsp">Add Book</a></li>
								<li><a href="adminaddnews.jsp">Add News</a></li>
								<li><a href="adminadduser.jsp">Add User</a></li>
							</ul>
						</ul>
						<ul class="library">
							<a href="adminbrowse.jsp">BROWSE</a>
						</ul>
					</ol>
				</div>
			</nav>
		</div>
	</section>




<main class="body materialPage">
		<div class="blockWrapper">
		
		<div class="left block">
				<div class="wrapper">
					<div class="messageContainer">
						<p>Recently Viewed:</p>
					</div>
					<div class="viewedContainer">
						<div class="row">
							<a href="#">
								<img src="assets/img/no_image.jpg">
								<p>Book Title</p>
								<p>Author, Year Published</p>
								<p>Summary</p>
							</a>
						</div>
						<div class="row">
							<a href="#">
								<img src="assets/img/no_image.jpg">
								<p>Book Title</p>
								<p>Author, Year Published</p>
								<p>Summary</p>
							</a>
						</div>
						<div class="row">
							<a href="#">
								<img src="assets/img/no_image.jpg">
								<p>Book Title</p>
								<p>Author, Year Published</p>
								<p>Summary</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		
<div class="mid block">
				<div class="container">
<!-- 					<a href="#" data-toggle="modal" data-target="#editMaterial">[Edit]</a><a href="#">[Delete]</a> -->
<!-- 					<a href="lendMaterial.html" class="lend">[Lend]</a> -->
					<img src="assets/img/no_image.jpg">
					
					<%
						
						Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", "");
						String genreNames = "";
					
					%>
					
					<% 
					
						if (view.absolute(1)) {
							
							PreparedStatement pst = connection.prepareStatement
									("select genre.genreName, relation.genreId from books "
									+ "inner join relation on books.accNum = relation.accNum "
									+ "inner join genre on genre.genreId = relation.genreId "
									+ "where relation.accNum = ?");
							
							pst.setLong(1, view.getLong("accNum"));
							ResultSet rs = pst.executeQuery();
							
					while(rs.next()){ 
				
						genreNames = genreNames.concat(rs.getString("genreName") + ",");
						
					}
					
					%>
					
					<div class="information">
						<div class="row">
							<div class="col">
								<label>Account Number:</label>
							</div>
							<div class="col">
								<p><%=view.getLong("accNum") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Title:</label>
							</div>
							<div class="col">
								<p><%= view.getString("bookTitle") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Author:</label>
							</div>
							<div class="col">
								<p><%= view.getString("author") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Class:</label>
							</div>
							<div class="col">
								<p><%= view.getString("class") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Edition:</label>
							</div>
							<div class="col">
								<p><%= view.getString("edition") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Volume:</label>
							</div>
							<div class="col">
								<p><%= view.getInt("volume") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Pages:</label>
							</div>
							<div class="col">
								<p><%= view.getLong("pages") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Publisher:</label>
							</div>
							<div class="col">
								<p><%= view.getString("publisher") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Year:</label>
							</div>
							<div class="col">
								<p><%= view.getLong("year") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Genre:</label>
							</div>
							<div class="col">
								<p><%= genreNames%></p>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Availability:</label>
							</div>
							<div class="col">
								<p><%= view.getString("availability") %></p>
							</div>
						</div>
					</div>
					
					<% } %>
					
				</div>
			</div>
		</div>
	</main>


<section class="wrapperFull footer">
		<div class="wrapperMax">
			<footer class="footer">
				<div class="linkContainer">
					<div class="left block">
						<ol>
							<li>iACADEMY</li>
							<li><a href="http://www.iacademy.edu.ph/site/home/">Official Website</a></li>
							<li><a href="#">Library</a></li>
							<li><a href="http://isims.iacademy.edu.ph/iacademy/students/">Student Portal</a></li>
						</ol>
					</div>
					<div class="mid block">
						<ol>
							<li>iACADEMY Library</li>
						</ol>
						<div class="social">
							<a href="https://iacademylibrary.wordpress.com/"><i class="fi-social-blogger"></i></a>
							<a href="https://www.facebook.com/iacademylibrary/"><i class="fi-social-facebook"></i></a>
							<a href="https://twitter.com/iacademylibrary"><i class="fi-social-twitter"></i></a>
						</div>
					</div>
					<!-- <div class="mid block">
					</div>
					<div class="right block">
						<div class="info container">
							<p>6th flr., iACADEMY Plaza, 324 Sen. Gil Puyat Avenue, Bel-air, Makati City, Philippines 1209</p>
						</div>
					</div> -->
				</div>
				<div class="copyright block">
					<div class="messageContainer">
						<p>&copy; 2015 iACADEMY</p>
						<p>6th flr., iACADEMY Plaza, 324 Sen. Gil Puyat Avenue, Bel-air, Makati City, Philippines 1209</p>
					</div>
				</div>
			</footer>
		</div>
	</section>	


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>