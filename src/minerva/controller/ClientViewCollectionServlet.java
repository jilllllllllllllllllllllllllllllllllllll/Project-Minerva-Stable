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

import minerva.utility.SQLOperations;

import java.sql.*;

@WebServlet("/viewcollection.html")
public class ClientViewCollectionServlet extends HttpServlet {
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
		
		String query = "Select books.accNum, books.class, books.bookTitle, books.author " 
				+ "from books inner join collection_relation on books.accNum = collection_relation.accNum "
				+ "where collection_relation.idNumber = ? and books.isActive and collection_relation.isActive = 1 order by books.accNum";
		
		try {
		
			 PreparedStatement pst = connection.prepareStatement(query);
		      pst.setString(1, id);
		      ResultSet rs = pst.executeQuery();
		      
		      request.setAttribute("collection", rs);
		      getServletContext().getRequestDispatcher("/clientcollection.jsp").forward(request, response);
		    
		} catch (Exception e) {
			
			System.out.println("Message: " + e);
	    }
		
	}

}
