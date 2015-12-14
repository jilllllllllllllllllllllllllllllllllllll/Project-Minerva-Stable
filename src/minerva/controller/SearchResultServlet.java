package minerva.controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
//import java.util.Collection;

import minerva.utility.SQLOperations;

@WebServlet("/searchresults.html")
public class SearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	public void init(ServletConfig config) throws ServletException {
		
super.init(config);
		
		connection = SQLOperations.getConnection();
		getServletContext().setAttribute("dbConn", connection);
		
		if (connection != null) {
			
			System.out.println("Connection successful");
			
		} else {
			
			System.err.println("Connection is NULL");
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (connection != null) {
			
			String searchInput = (String) request.getParameter("generalSearch");
			String advDropdown = (String) request.getParameter("advsearch");
			String advSearchInput = (String) request.getParameter("advancedSearch");
			String publisher = (String) request.getParameter("published");
			
			String VIEW_RESULTS = "SELECT * FROM books WHERE isActive = 1";
			String[] tagNames;
			String category;
			
			ArrayList<Long> accNumbers = new ArrayList<Long>();
			ArrayList<String> titles = new ArrayList<String>();
			ArrayList<String> authors = new ArrayList<String>();
			ArrayList<String> publishers = new ArrayList<String>();
			
			int x = 1;
			int ctr = 1;
			int ctr2 = 1;
			ResultSet rs;
			
			tagNames = request.getParameterValues("genre");
			category = (String) request.getParameter("category");

			PreparedStatement pstmt;
			
			try {
			
				if (searchInput != null) {
					VIEW_RESULTS = "SELECT * FROM BOOKS WHERE isActive = 1 and bookTitle LIKE ?";	
				}
				
				if (tagNames != null) {
					VIEW_RESULTS = "SELECT books.* FROM books JOIN tags ON books.accNum = tags.accNum WHERE isActive = 1 AND tags.tagTitle = ?";
					for (int i = 1; i < tagNames.length; i++) {
						VIEW_RESULTS = VIEW_RESULTS + " OR tags.tagTitle = ?" ;
					}
				}
				
				if (advSearchInput != null) {
					if (category.equals("author")) {
						VIEW_RESULTS = VIEW_RESULTS + " AND books.author LIKE ?";
					} else if (category.equals("title")) {
						VIEW_RESULTS = VIEW_RESULTS + " AND books.bookTitle LIKE ?";				
					}
				}
				
				if (publisher != null) {
					VIEW_RESULTS = VIEW_RESULTS + " AND publisher LIKE ?";
				}
				
				pstmt = connection.prepareStatement(VIEW_RESULTS);
				
				if (tagNames != null) {
					for (int i = 0; i < tagNames.length; i++) {
						pstmt.setString(i+1, tagNames[i]);
						ctr++;
						ctr2++;
					}
				}
				
				if (advSearchInput != null) {
					pstmt.setString(ctr, "%" + advSearchInput + "%");
					ctr2++;
				}
				
				if (publisher != null) {
					pstmt.setString(ctr2, "%" + publisher + "%");
				}
				
				rs = pstmt.executeQuery();
				System.out.println("//Final statement: " + pstmt.toString());
				
				while (rs.next()) {
					accNumbers.add(rs.getLong(1));
					titles.add(rs.getString(4));
					authors.add(rs.getString(3));
					publishers.add(rs.getString(8));
				}
				
				request.setAttribute("accNums", accNumbers);
				request.setAttribute("titles", titles);
				request.setAttribute("authors", authors);
				request.setAttribute("publishers", publishers);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminsearchresult.jsp");
				dispatcher.forward(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		}
		
	}

}
