<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<head></head>
<body>

	<% 
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
		
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM news where isActive order by newsId desc ");
	
	%>
	
	<main class="body browsePage">
		<table class="table table-hover">
        					<thead>
            					<tr>
					                <th>News Date</th>
					                <th>News Title</th>
					                <th>News Message</th>
            					</tr>
        					</thead>
        					
        					<% while(rs.next()){ 
        						String message = rs.getString("newsMessage");
        						
        						if (message.length() > 30) {
        							
        							message = message.substring(0, 30) + "...";
        							
        						}
        					
        					%>
        					
        					<tbody>
					            <tr>
					                <td><a href="newsview.html?id=<%= rs.getInt("newsId") %>"><%= rs.getDate("newsDate") %></a></td>
					                <td><a href="newsview.html?id=<%= rs.getInt("newsId") %>"><%= rs.getString("newsTitle") %></a></td>
					                <td><a href="newsview.html?id=<%= rs.getInt("newsId") %>"><%= message %></a></td>
					                <td>
					                
											<a href="newsprocess.html?id=<%= rs.getString("newsId") %>&action=delete"
											onclick="if(confirm('Do you want to continue deleting this record?')){ return true;} else{return false;}">Delete
											
					                		</a>
					                		
					                </td>
					                <td>
					               
											<a href="admineditnews.jsp?id=<%= rs.getString("newsId") %>">Edit</a>
					               
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