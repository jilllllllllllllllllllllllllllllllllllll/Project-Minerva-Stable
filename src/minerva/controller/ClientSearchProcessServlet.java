package minerva.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minerva.utility.SQLOperations;

@WebServlet("/clientsearch.html")
public class ClientSearchProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String TITLE_QUERY = "SELECT * FROM BOOKS WHERE isActive = 1 and bookTitle LIKE ?"; 
	private static final String AUTHOR_QUERY = "SELECT * FROM BOOKS WHERE isActive = 1 and author LIKE ?";
	
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
		String searchInput = request.getParameter("generalSearch");
		String advDropdown = request.getParameter("advsearch");
		String advSearchInput = request.getParameter("advance");
		
		ArrayList<Long> accNumbers = new ArrayList<Long>();
		ArrayList<String> titles = new ArrayList<String>();
		ArrayList<String> authors = new ArrayList<String>();
		ArrayList<String> publishers = new ArrayList<String>();
		ArrayList<String> editions = new ArrayList<String>();
		ArrayList<String> volumes = new ArrayList<String>();
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(TITLE_QUERY);
			pstmt.setString(1, "%" + searchInput + "%");
			ResultSet rs = pstmt.executeQuery();
			
			request.setAttribute("accNums", accNumbers);
			request.setAttribute("titles", titles);
			request.setAttribute("authors", authors);
			request.setAttribute("publishers", publishers);
			request.setAttribute("editions", editions);
			request.setAttribute("volumes", volumes);
			
//			if (advDropdown == "title") {
//				
//				PreparedStatement pst = connection.prepareStatement(TITLE_QUERY);
//				pst.setString(1, "%" + advSearchInput + "%");
//				ResultSet rs = pst.executeQuery();
//				request.setAttribute("search", rs);
//				
//			} else if (advDropdown == "author") {
//				
//				PreparedStatement pst = connection.prepareStatement(AUTHOR_QUERY);
//				pst.setString(1, "%" + advSearchInput + "%");
//				ResultSet rs = pst.executeQuery();
//				request.setAttribute("search", rs);
//				
//			}
			
			while (rs.next()) {
				accNumbers.add(rs.getLong(1));
				titles.add(rs.getString(4));
				authors.add(rs.getString(3));
				publishers.add(rs.getString(8));
				editions.add(rs.getString(5));
				volumes.add(rs.getString(6));
			}
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("clientsearchresult.jsp");
			dispatcher.forward(request, response);
			
		} catch (SQLException sqle) {
			
			System.err.println(sqle.getMessage());
			
		}
		
		
		
	}

}
