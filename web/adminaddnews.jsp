<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<head></head>
<body>
	<main class="body addNewsPage">
		<div class="banner">
			<img src="assets/img/hp_lib2.png">
		</div>
		<div class="divWrapper">
			<div class="left block">
				<div class="formContainer">
					<p>Please type in news/announcement information:</p>
					<form action='addnews.html' method="post">
						<input type="text" placeholder="Title" name='newsTitle'>
						<textarea placeholder="News/Announcement" name='newsMessage'></textarea>
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