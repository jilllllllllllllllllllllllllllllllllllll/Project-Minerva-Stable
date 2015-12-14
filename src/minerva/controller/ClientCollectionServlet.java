package minerva.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import minerva.model.BookBean;
import minerva.utility.SQLOperations;

@WebServlet("/collection.html")
public class ClientCollectionServlet extends HttpServlet {
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
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("username").toString();
		String accNum = request.getParameter("id");
		
		System.out.println(accNum);
		System.out.println(id);
		
		try {
			
			String query = "INSERT INTO collection_relation (idNumber, accNum, isActive) VALUES (?, ?, 1)";
			
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, id);
			pst.setString(2, accNum);
			
			pst.executeUpdate();
			
		} catch (Exception e){
	    	System.out.println("Message: " + e);
	    }
		
		response.sendRedirect("clientbrowse.jsp");
		
	}

}
