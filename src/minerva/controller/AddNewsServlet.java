package minerva.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import minerva.model.NewsBean;
import minerva.utility.NewsFactory;
import minerva.utility.SQLOperations;

@WebServlet("/addnews.html")
public class AddNewsServlet extends HttpServlet {
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
		
		if (connection != null) {
			
			try {
				
				NewsBean nb = NewsFactory.getInstance(request.getParameter("newsTitle"), 
						request.getParameter("newsMessage"));
				
				if (SQLOperations.addNews(nb, connection)) {
					
					System.out.println("News Added");
					request.setAttribute("nb", connection);
					getServletContext().getRequestDispatcher("/adminaddnews.jsp").forward(request, response);
					
				} else {
					
					System.out.println("News Not Added");
					getServletContext().getRequestDispatcher("/adminaddnews.jsp").forward(request, response);
					
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				response.sendRedirect("adminaddnews.jsp");
				
			}
			
		} else {
			
			response.sendRedirect("adminaddbook.jsp");
			
		}
		
	}

}
