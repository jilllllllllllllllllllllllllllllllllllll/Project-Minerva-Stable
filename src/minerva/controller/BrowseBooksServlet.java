package minerva.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import minerva.utility.SQLOperations;

@WebServlet("/browse.html")
public class BrowseBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;

	public void init(ServletConfig config) throws ServletException {
		
		connection = SQLOperations.getConnection();
		getServletContext().setAttribute("dbConn", connection);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (connection != null) {
			
			try {
				
				ResultSet rs = SQLOperations.browseBooks(connection);
				request.setAttribute("browse", rs);
				getServletContext().getRequestDispatcher("/adminbrowse.jsp").forward(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		}
		
	}

}
