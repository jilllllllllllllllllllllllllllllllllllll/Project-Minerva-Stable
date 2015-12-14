<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<body>
	<main class="body addBookPage">
		<div class="banner">
			<img src="assets/img/hp_lib2.png">
		</div>
		<div class="divWrapper">
			<div class="left block">
				<div class="formContainer">
					<p>Please type in material information:</p>
					<form method="post" action="editbooks.html">
						<input type="text" placeholder="Account Number" name="accNum" value="${book.accNum}">
						<input type="text" placeholder="Title" name="bookTitle" value="${book.bookTitle}">
						<div class="author">
							<input type="text" placeholder="Author" name="author" value="${book.author}">
							<input type="text" placeholder="Class" name="class" value="${book.bookClass}"> 
						</div>
						<div class="edition">
							<input type="text" placeholder="Edition" name="edition" value="${book.edition}">
							<input type="text" placeholder="Volume" name="volume" value="${book.volume}">
							<input type="text" placeholder="Pages" name="pages" value="${book.pages}">
						</div>
						<div class="edition">
							<input type="text" placeholder="Publisher" name="publisher" value="${book.publisher}">
							<input type="text" placeholder="Year" name="year" value="${book.year}">
						<select name = "genre">
							<option value="1">Arts and Animation</option>
							<option value="2">Business and Marketing</option>
							<option value="3">Science and Technology</option>
							<option value="4">Hobbies and Recreation</option>
						</select>
						</div>
						<select name = "availability" value="${book.availability}">
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