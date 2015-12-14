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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iAcademy Library - Minerva</title>
</head>
<body>

	<section class="wrapperFull nav">
		<div class="wrapperMax">
			<nav>
				<div class="logoContainer">
					<a href="adminbrowse.jsp"><img src="assets/img/logo-full.png"></a>
				</div>
<!-- 				<div class="linkContainer"> -->
<!-- 					<ol> -->
<!-- 						<ul class="library"> -->
<!-- 							<a href="#">LIBRARY</a> -->
<!-- 							<ul class="menu arrow_box"> -->
<!-- 								<li><p>Home</p></li> -->
<!-- 								<li><a href="#">Go to Home</a></li> -->
<!-- 								<li><p>Materials</p></li> -->
<!-- 								<li><a href="#">View All</a></li> -->
<!-- 								<li><a href="#">View Recent Acquisitions</a></li> -->
<!-- 								<li><a href="#">View Pending Materials</a></li> -->
<!-- 								<li><a href="#">View Borrowed Materials</a></li> -->
<!-- 								<li><p>Announcements</p></li> -->
<!-- 								<li><a href="#">View All</a></li> -->
<!-- 							</ul> -->
<!-- 						</ul> -->
<!-- 						<ul class="students"> -->
<!-- 							<a href="#">STUDENTS</a> -->
<!-- 							<ul class="menu arrow_box"> -->
<!-- 								<li><p>Students</p></li> -->
<!-- 								<li><a href="#">View All</a></li> -->
<!-- 								<li><p>Account</p></li> -->
<!-- 								<li><a href="#">View Account Status</a></li> -->
<!-- 								<li><a href="#">View Materials Borrowed</a></li> -->
<!-- 								<li><a href="#">Logout</a></li> -->
<!-- 							</ul> -->
<!-- 						</ul> -->
<!-- 						<ul><button><a href="#"><i class="fi-torso"></i></a></button></ul> -->
<!-- 						<ul><button><a href="#"><i class="fi-magnifying-glass"></i></a></button></ul> -->
<!-- 					</ol> -->
<!-- 				</div> -->
			</nav>
		</div>
	</section>

	<main class="body loginPage">
		<div class="formContainer">
			<form method="post" action="loginprocess.html">
				<p>Sign in with your iACADEMY Library account:</p>
				<div class="username">
					<input type="text" placeholder="Username" name="inputStudentId" required="required">
				</div>
				<div class="password">	
					<input type="password" placeholder="Password" name="inputPassword" required="required">
				</div>
				<div class="cookie">
					<input type="checkbox"><label>Remember Me</label>
				</div>
				<button type="submit">Sign In</button>
				<div class="account">
<!-- 					<a href="#">How do I create an account?</a> -->
					<a href="#">Forgot password?</a>
				</div>
			</form>
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
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.css"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>