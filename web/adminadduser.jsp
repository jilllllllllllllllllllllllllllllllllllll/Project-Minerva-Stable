<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<head></head>
<body>
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
							<input type="text" placeholder="Last Name">
							<input type="text" placeholder="First Name">
							<input type="text" placeholder="Student Number">
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
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.css"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>