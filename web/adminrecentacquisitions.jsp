<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "adminheader.jsp" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<head></head>
<body class="bodyBG">

	<% 

		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", ""); 
		
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Books where isActive order by accNum desc limit 10");
	
	%>
	<main class="body browsePage">
		
		<div class="browseList">
		
		<div class="control">
			<div class="header">
				<p>Browse All Materials</p>
			</div>
			<div class="sort">
				<label> Sort by: </label>
				<select>
					<option>Title</option>
					<option>Author</option>
					<option>Published</option>
					<option>Date Acquired</option>
				</select>
			</div>
		</div>
		
		<table class="table table-hover">
        					<thead>
            					<tr>
					                <th>Acc No.</th>
					                <th>Class</th>
					                <th>Book Title</th>
					                <th>Author</th>
					                <th>Edition</th>
					                <th>Publisher</th>
					                <th>Availability</th>
            					</tr>
        					</thead>
        					
        					<% while(rs.next()){ %>
        					
        					<tbody>
					            <tr>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getLong("accNum") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("class") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("bookTitle") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("author") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("edition") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("publisher") %></a></td>
					                <td><a href="bookview.html?id=<%= rs.getLong("accNum") %>"><%= rs.getString("availability") %></a></td>
					                <td>
					                
					                	<%rs.getLong("accNum"); %>
					
											<a href="deletebook.html?id=<%= rs.getLong("accNum") %>"
											onclick="if(confirm('Do you want to continue deleting this record?')){ return true;} else{return false;}">Delete
											
					                		</a>
					                		
					                </td>
					                <td>
					               
					               		<%rs.getLong("accNum"); %>
					
											<a href="admineditbook.jsp?id=<%= rs.getLong("accNum") %>">Edit</a>
					               
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