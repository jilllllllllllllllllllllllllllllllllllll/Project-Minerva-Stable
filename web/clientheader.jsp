<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
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
					<a href="clientmain.jsp"><img src="assets/img/logo-full.png"></a>
				</div>
				<div class="linkContainer">
					<ol class="admin">
						<ul class="search">
							<a>SEARCH</a>
							<ul class="menu arrow_box">
								<li>
									<form action="clientsearch.html" method="post">
										<input name="generalSearch" id="generalSearch" type="text" placeholder="Search"><button><i type="submit" class="fi-magnifying-glass"></i></button>
									</form>
								</li>
							</ul>
						</ul>
						<ul class="students">
							<a>ACCOUNT</a>
							<ul class="menu arrow_box">
								<li><a href="clientnewsdisplay.jsp">News</a></li>
								<li><a href="viewcollection.html">Collection</a></li>
								<li><a href="#">History</a></li>
								<li><a href="login.jsp">Logout</a></li>
							</ul>
						</ul>
						<ul class="library">
							<a href="clientbrowse.jsp">BROWSE</a>
						</ul>
						<ul class="library">
							<a href="clientfeedback.jsp">FEEDBACK</a>
						</ul>
					</ol>
				</div>
			</nav>
		</div>
	</section>
</body>
</html>