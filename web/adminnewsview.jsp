<jsp:useBean id="view" type="java.sql.ResultSet" scope="request"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<head></head>
<body>
	<main class="body browsePage">

		<div class="browseList">
		
        					<% while(view.next()){ %>
        					
        					<ul class="list-group">
        						<li class="list-group-item"><h4>Date: </h4><%= view.getDate("newsDate") %> </li>
        						<li class="list-group-item"><h4>Title: </h4><%= view.getString("newsTitle") %> </li>
        						<li class="list-group-item"><h4>Message: </h4><%= view.getString("newsMessage") %> </li>
        					</ul>
        					
					        
					        <% } %>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>