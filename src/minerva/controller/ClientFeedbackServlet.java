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
import javax.servlet.http.HttpSession;

@WebServlet("/sendfeedback.html")
public class ClientFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;

	public void init(ServletConfig config) throws ServletException {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db", "root", "");
			
		} catch (ClassNotFoundException cnfe) {
			
			System.out.println("DB NOT FOUND");
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
		
		HttpSession session = request.getSession();
		
		String feedbackMessage = request.getParameter("feedbackMessages");
		String id = session.getAttribute("username").toString();
		
		try{
		      
		      String query = "INSERT INTO feedbacks (idNumber, feedbackMessages, feedbackDate, isActive) VALUES (?, ?, ?, 1)";
		      
		      PreparedStatement pst = connection.prepareStatement(query);
		      pst.setString(1, id);
		      pst.setString(2, feedbackMessage);
		      java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		      pst.setDate(3, sqlDate);
		 
		      
		      pst.executeUpdate();
		           
		      
		    } catch (Exception e){
		    	System.out.println("Message: " + e);
		    }
		
		response.sendRedirect("clientfeedback.jsp");
		
		
	}

}
