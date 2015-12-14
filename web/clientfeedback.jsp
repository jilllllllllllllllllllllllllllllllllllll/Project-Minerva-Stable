<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file = "clientheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
</head>
<body>
	<main class="body addNewsPage">
		<div class="banner">
			<img src="assets/img/hp_lib2.png">
		</div>
		<div class="divWrapper">
			<div class="left block">
				<div class="formContainer">
					<p>Feedback/Suggestions:</p>
					<form action='sendfeedback.html' method="post">
						<textarea placeholder="Feedback/Suggestions" id='feedbackMessages' name="feedbackMessages"></textarea>
						<button>Submit</button>
					</form>
				</div>
			</div>
			<div class="right block"></div>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>