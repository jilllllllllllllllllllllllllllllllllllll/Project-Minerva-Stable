package minerva.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minerva.utility.SQLCommands;


@WebServlet("/deletefeedback.html")
public class deletefeedback extends HttpServlet implements SQLCommands {
	private static final long serialVersionUID = 1L;

	private Connection connection;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", "");
			
		} catch (ClassNotFoundException cnfe) {
			
			System.out.println("Where is your MySQL JDBC Driver?");
			cnfe.printStackTrace();
			return;
			
		} catch (SQLException sqle) {
			
			System.err.println("SQLE" + sqle.getMessage());
			sqle.printStackTrace();
			
		}
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String DeleteFeedback = request.getParameter("id");
		
			try {
				
				PreparedStatement pstmt = connection.prepareStatement(DELETE_FEEDBACK);
				pstmt.setString(1, DeleteFeedback);
				pstmt.executeUpdate();
				
			} catch (SQLException sqle) {
				
				System.out.println("SQLException - deleteFeedback: " + sqle.getMessage());
				
				
				}
				
			response.sendRedirect("adminfeedback.jsp");
		
		return;
		
	}

}
