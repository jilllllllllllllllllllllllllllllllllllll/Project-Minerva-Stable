<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file = "clientheader.jsp" %>
<head></head>
<body>
<%@ page import = "java.util.ArrayList"%>
<%        					
ArrayList<Long> accNums = (ArrayList<Long>) request.getAttribute("accNums");
ArrayList<String> titles = (ArrayList<String>) request.getAttribute("titles");
ArrayList<String> authors = (ArrayList<String>) request.getAttribute("authors");
ArrayList<String> publishers = (ArrayList<String>) request.getAttribute("publishers");
ArrayList<String> editions = (ArrayList<String>) request.getAttribute("editions");
ArrayList<String> volumes = (ArrayList<String>) request.getAttribute("volumes");
%>
<main class="body advancedSearchPage">
		<div class="control">
			<div class="search">
				<form method="post" action="clientsearchresults.html">
					<div class="query">
						<input type="text" name="advancedSearch">
						<button type="submit">Submit</button>
					</div>
					<div class="filters">
						<div class="left block">
							<p>Search by</p>
							<div><input type="radio" name="category" value="title" checked="checked"><label>Title</label></div>
							<div><input type="radio" name="category" value="author"><label>Author</label></div>
						</div>
						<!--<div class="mid block">
							<p>Type of Material</p>
							<div><input type="checkbox"><label>Digital Media</label></div>
							<div><input type="checkbox"><label>Book</label></div>
							<div><input type="checkbox"><label>Thesis</label></div>
							<div><input type="checkbox"><label>Periodical</label></div>
						</div>-->
						<div class="right block">
							<p>Genre</p>
							<div class="divider">
								<div><input type="checkbox" name="genre" value="animation"><label>Arts & Animation</label></div>
								<div><input type="checkbox" name="genre" value="business"><label>Business and Marketing</label></div>
								<div><input type="checkbox" name="genre" value="math"><label>General Mathematics</label></div>
								<div><input type="checkbox" name="genre" value="language"><label>English and Other Languages</label></div>
								<div><input type="checkbox" name="genre" value="programming"><label>Programming</label></div>
								<div><input type="checkbox" name="genre" value="fun"><label>Hobbies & Recreation</label></div>
								<div><input type="checkbox" name="genre" value="science"><label>Science & Technology</label></div>
							</div>
							<div class="divider">
								<div><input type="checkbox" name="genre" value="psychology"><label>General Psychology</label></div>
								<div><input type="checkbox" name="genre" value="literature"><label>Classical and General Literature</label></div>
								<div><input type="checkbox" name="genre" value="fiction"><label>Fiction</label></div>
								<div><input type="checkbox" name="genre" value="history"><label>Historical and Non-Fiction</label></div>
								<div><input type="checkbox" name="genre" value="kids"><label>Kids and Games</label></div>
							</div>
						</div>
						<div class="last block">
							<p>Other</p>
							<div class="year">
								<label>Publisher:</label>
								<input type="text" placeholder="Publisher" name="published">
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="header">
				<p>Advanced Search</p>
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
		<div class="browseList">
        	<div class="table client">
				<div class="itemRow head">
					<div class="col">
						<p>Title</p>
					</div>
					<div class="col">
						<p>Author</p>
					</div>
					<div class="col">
						<p>Publisher</p>
					</div>
					<div class="col">
						<p>Edition</p>
					</div>
					<div class="col">
						<p>Vol</p>
					</div>
				</div>		
				
				<% for (int x = 0; x < accNums.size(); x++){ %>
				<div class="itemRow">
			        <div class="col"><a href="bookview.html?id=<%= accNums.get(x) %>"><%= titles.get(x) %></a></div>
			        <div class="col"><a href="bookview.html?id=<%= accNums.get(x) %>"><%= authors.get(x) %></a></div>
			        <div class="col"><a href="bookview.html?id=<%= accNums.get(x) %>"><%= publishers.get(x) %></a></div>
			        <div class="col"><a href="bookview.html?id=<%= accNums.get(x) %>"><%= editions.get(x) %></a></div>
			        <div class="col"><a href="bookview.html?id=<%= accNums.get(x) %>"><%= volumes.get(x) %></a></div>
				</div>
    			<% } %>	
    		</div>
		</div>
	</main>
<%@ include file = "footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.css"></script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</html>