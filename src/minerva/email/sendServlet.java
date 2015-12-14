package minerva.email;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;


import minerva.email.*;

import java.sql.*;
import java.util.Properties;

@WebServlet("/mail.html")
public class sendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private Connection connection;


	public void init(ServletConfig config) throws ServletException {
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp-opac-db" , "root", "");
			
		}catch (ClassNotFoundException cnfe) {
			
			System.out.println("Where is your MySQL JDBC Driver?");
			cnfe.printStackTrace();
			
			return;
			
		}catch (SQLException sqle) {
			
			System.err.println("SQLE - " + sqle.getMessage());
			sqle.printStackTrace();
			
		}
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		if(request.getParameter("inputStudentId" )!= null){
				String userInput = request.getParameter("inputStudentId");
		
		
if (connection != null) {
			
			try {
				
			//	Statement stmt = connection.createStatement();

		        PreparedStatement pstmt = 
		        	connection.prepareStatement("SELECT email, password FROM opacusers where idNumber=?");

		        pstmt.setString(1, userInput);
		        ResultSet rs = pstmt.executeQuery();

		        if(rs.absolute(1)){
		        	String email = rs.getString("email");
		        	String password = rs.getString("password");

		        	sendmail mail = new sendmail();
		        	mail.sent(email,password);

		        	RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
		        	dispatcher.forward(request, response);
		        }
				
				  
			  //    String query = "select * from news where newsId=?";
			      
	//		      PreparedStatement pst = connection.prepareStatement(query);
			//      pst.setString(1, news);
		//	      ResultSet rs = pst.executeQuery();
	//		      request.setAttribute("view", rs);
	//		      RequestDispatcher dispatcher = request.getRequestDispatcher("adminnewsview.jsp");
	//		      dispatcher.forward(request, response);
			} catch (SQLException sqle) {
				
				System.err.println(sqle.getMessage());
				
			}
			
		} else {
			
			System.out.println("Failed to make connection");
			
		}
		}else {
			//redirect error, no input
		}
		
		
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	//	String userInput = request.getParameter("inputStudentId");
	//	sendmail mail = new sendmail();
	//	mail.sent(email,password);

	
}
