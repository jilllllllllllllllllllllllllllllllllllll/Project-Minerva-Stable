<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file = "clientheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
</head>
<body>
	<main class="body mainPage">
		<div class="divWrapper">
			<div class="left block">
				<div class="welcome">
					<p>Welcome to the iACADEMY Library</p>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. 
					<br/>
					<br/>Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.</p>
				</div>
				<div class="quickNav">
					<div class="left quick">
						<a href="clientbrowse.jsp">
							<div>
								<i class="fi-book"></i>
								Browse All
							</div>
						</a>
					</div>
					<div class="mid quick">
						<a href="clientrecentacquisitions.jsp">
							<div>
								<i class="fi-book-bookmark"></i>
								Recent Acquisitions
							</div>
						</a>
					</div>
					<div class="right quick">
						<a href="#">
							<div>
								<i class="fi-torso"></i>
								Review Account Status
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>