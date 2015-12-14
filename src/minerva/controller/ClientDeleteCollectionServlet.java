package minerva.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import minerva.model.BookBean;
import minerva.utility.SQLOperations;

@WebServlet("/clientmaintainance.html")
public class ClientDeleteCollectionServlet extends HttpServlet {
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
		
		
		
		try {
			
			String query = "Update collection_relation set isActive = 0 where idNumber = ? and accNum = ?";
			
			RequestDispatcher dispatcher = null;
			
			if (request.getParameter("action").equals("delete")) {
				
				String idNum = session.getAttribute("username").toString();
				int id = Integer.parseInt(request.getParameter("id"));
				
				PreparedStatement pst = connection.prepareStatement(query);
				
				pst.setString(1, idNum);
				pst.setInt(2, id);
				
				pst.executeUpdate();
				
				dispatcher = getServletContext().getRequestDispatcher("/clientcollection.jsp");
				
			} 
			
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			
			System.err.println("Exception e: " + e.getMessage());
			e.printStackTrace();
			
		}
		
	}

}
