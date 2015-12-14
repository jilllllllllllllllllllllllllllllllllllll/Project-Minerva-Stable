<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<head></head>
<body>

<% 
	
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
	
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM feedbacks");
	
%>
	
	<main class="body browsePage">
		<div class="recentAcquisitions">
			<div class="header">
				<p>Feedback Messages:</p>
			</div>
		<div class="browseList">
		
		<table class="table table-bordered">
				    <thead>
				        <tr>
				            
				            <th>Date</th>
				            <th>Message</th>
				            <th></th>
				        </tr>
				    </thead>
				    
				    <% while(rs.next()){ 
				    
				    	String message = rs.getString("feedbackMessages");
						
						if (message.length() > 30) {
							
							message = message.substring(0, 30) + "...";
							
						}
				    
				    %>
				    
				    <tbody>
					     <tr>
				            <td class="col-md-3"><a href="feedbackview.html?id=<%= rs.getDate("feedbackDate") %>"><%= rs.getDate("feedbackDate") %></a></td>
				            <td class="col-md-7"><a href="feedbackview.html?id=<%= rs.getString("feedbackMessages") %>"><%= message %></a></td>
				            <td class="col-md-1" align="center">
				        	
				        		<%rs.getString("feedbackMessages"); %>
					
											<a href="deletefeedback.html?id=<%= rs.getString("feedbackMessages") %>"
											onclick="if(confirm('Do you want to continue deleting this record?')){ return true;} else{return false;}">Delete
											
					                		</a>
				        	
				        	</td>
				        </tr>
				    </tbody>
				    
				    <% } %>
				    
				</table>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>