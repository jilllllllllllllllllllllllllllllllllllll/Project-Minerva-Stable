package minerva.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/loginprocess.html")
public class LoginProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private Connection connection;
    private static final String LOGIN_QUERY = "select * from opacusers where idNumber=? and password=?";
	
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
		String userInput = request.getParameter("inputStudentId");
		String passInput = request.getParameter("inputPassword");
		HttpSession session = request.getSession();
		int isValid = 2;
		
		try{
			isValid = authLogin(userInput, passInput);
			if(isValid < 2){
				session.setAttribute("username", userInput);
				session.setAttribute("password", passInput);
			}else{
				System.out.println("Invalid Credentials");
			}
		}catch(Exception e){
			System.out.println("Unable to Validate");
		}
		
		if(isValid == 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminbrowse.jsp");
			dispatcher.forward(request, response);
		}else if(isValid == 0){
			response.sendRedirect("clientmain.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}
	
	private int authLogin(String userInput, String passInput) throws Exception{
		int isValid = 2;
		
		try{
			PreparedStatement prepStmt = connection.prepareStatement(LOGIN_QUERY);
			prepStmt.setString(1, userInput);
			prepStmt.setString(2, passInput);
			ResultSet rs = prepStmt.executeQuery();
			if(rs.next()){
				System.out.println("User login validated.");
				if(rs.getInt("isAdmin") == 1){
					isValid = 1;
				}else if(rs.getInt("isAdmin") == 0){
					isValid = 0;
				}
			}		
		}catch(Exception e) {
		    System.out.println("validateLogon: Error while validating password: "+e.getMessage());
		    throw e;
		}finally {
			closeConnection(connection);
		}
		
		return isValid;
	}

	private void closeConnection(Connection connection2) {
		
	}

}

