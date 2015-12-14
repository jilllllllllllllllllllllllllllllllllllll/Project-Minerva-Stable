<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

</head>
<body>

<section class="wrapperFull nav">
		<div class="wrapperMax">
			<nav>
				<div class="logoContainer">
					<a href="adminbrowse.jsp"><img src="assets/img/logo-full.png"></a>
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

	<main class="body addUserPage">
		<div class="banner">
			<img src="assets/img/hp_lib2.png">
		</div>
		<div class="divWrapper">
			<div class="left block">
				<div class="formContainer">
					<p>Please type in student information:</p>
					<form>
						<div class="name">
							<input type="text" placeholder="Last Name" required="required">
							<input type="text" placeholder="First Name" required="required">
							<input type="text" placeholder="Student Number" required="required">
						</div>
<!-- 						<div class="class"> -->
<!-- 							<input type="text" placeholder="Student Number"> -->
<!-- 							<select> -->
<!-- 								<option>Select Program</option> -->
<!-- 								<option>Bachelor of Science in Animation</option> -->
<!-- 								<option>Bachelor of Science in Game Development</option> -->
<!-- 								<option>Bachelor of Science in Computer Science - Major in Software Engineering</option> -->
<!-- 								<option>Bachelor of Science in Information Technology - Major in Web Development</option> -->
<!-- 								<option>Bachelor of Science in Information Technology - Major in Digital Arts</option> -->
<!-- 								<option>Bachelor of Science in Business Administration - Major in Marketing and Advertising</option> -->
<!-- 								<option>Bachelor of Science in Business Administration - Major in Financial Management</option> -->
<!-- 								<option>Bachelor of Arts in Multimedia Arts and Design</option> -->
<!-- 								<option>Bachelor of Arts in Fashion Design</option> -->
<!-- 							</select> -->
<!-- 						</div> -->
						<button>Submit</button>
					</form>
				</div>
			</div>
			<div class="right block"></div>
		</div>
	</main>

	<section class="wrapperFull footer">
		<div class="wrapperMax">
			<footer class="footer">
				<div class="linkContainer">
					<div class="left block">
						<ol>
							<li>iACADEMY</li>
							<li><a href="#">Official Website</a></li>
							<li><a href="#">Library</a></li>
							<li><a href="#">Student Portal</a></li>
						</ol>
					</div>
					<div class="mid block">
						<ol>
							<li>iACADEMY Library</li>
						</ol>
						<div class="social">
							<a href="#"><i class="fi-social-blogger"></i></a>
							<a href="#"><i class="fi-social-facebook"></i></a>
							<a href="#"><i class="fi-social-twitter"></i></a>
						</div>
					</div>
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
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.css"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>