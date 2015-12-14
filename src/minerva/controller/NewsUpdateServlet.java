package minerva.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import java.sql.*;

import minerva.model.NewsBean;
import minerva.utility.NewsFactory;
import minerva.utility.SQLOperations;

@WebServlet("/editnews.html")
public class NewsUpdateServlet extends HttpServlet {
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
		
		String query = "update news set newsTitle = ?, newsMessage = ?, newsDate = ?, isActive = 1 where newsId = ?";
		
		String id = request.getParameter("id");
		String title = request.getParameter("newsTitle");
		String message = request.getParameter("messageInput");
		
		System.out.println(message);
		
		try {
			
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, title);
			pst.setString(2, message);
			
			
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			
			pst.setDate(3, sqlDate);
			pst.setString(4, id);
			
			pst.executeUpdate();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		response.sendRedirect("adminnewsedit.jsp");
		
	}

}
