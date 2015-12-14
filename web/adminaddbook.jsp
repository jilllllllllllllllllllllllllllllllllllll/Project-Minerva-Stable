<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<head></head>
<body>
	<main class="body addBookPage">
		<div class="banner">
			<img src="assets/img/hp_lib2.png">
		</div>
		<div class="divWrapper">
			<div class="left block">
				<div class="formContainer">
					<p>Please type in material information:</p>
					<form method="post" action="addbooks.html" enctype="multipart/form-data">
						<input type="text" placeholder="Account Number" name="accNum">
						<input type="text" placeholder="Title" name="bookTitle">
						<div class="author">
							<input type="text" placeholder="Author" name="author">
							<input type="text" placeholder="Class" name="bookClass">
						</div>
						<div class="edition">
							<input type="text" placeholder="Edition" name="edition">
							<input type="text" placeholder="Volume" name="volume">
							<input type="text" placeholder="Pages" name="pages">
						</div>
						<div class="edition">
							<input type="text" placeholder="Publisher" name="publisher">
							<input type="text" placeholder="Year" name="year">
							<select name = "genre">
								<option value="animation">Arts & Animation</option>
								<option value="business">Business & Marketing</option>
								<option value="math">General Mathematics</option>
								<option value="language">English & Other Languages</option>
								<option value="programming">Programming</option>
								<option value="fun">Hobbies & Recreation</option>
								<option value="science">Science & Technology</option>
								<option value="psychology">General sychology</option>
								<option value="literature">Classical and General Literature</option>
								<option value="fiction">Fiction</option>
								<option value="history">Historical & Non-Fiction</option>
								<option value="kids">Fun and Games</option>
							</select>
						</div>
						<select name = "availability">
							<option value="1">Available</option>
							<option value="0">Unavailable</option>
						</select>
						<button type="submit">Submit</button>
					</form>
				</div>
			</div>
			<div class="right block"></div>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.css"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>