package minerva.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import minerva.model.BookBean;
import minerva.utility.BookFactory;
import minerva.utility.SQLOperations;

@WebServlet("/addbooks.html")
public class AddBookServlet extends HttpServlet {
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
				
				BookBean bb = BookFactory.getInstance(Integer.parseInt(request.getParameter("accNum")),
						request.getParameter("bookClass"),
						request.getParameter("author"),
						request.getParameter("bookTitle"),
						request.getParameter("edition"),
						Integer.parseInt(request.getParameter("volume")),
						Long.parseLong(request.getParameter("pages")),
						request.getParameter("publisher"),
						Long.parseLong(request.getParameter("year")),
						Integer.parseInt(request.getParameter("genre")),
						request.getParameter("availability"));
				
				if (SQLOperations.addBooks(bb, connection)) {
					
					System.out.println("Book Added");
					request.setAttribute("bb", connection);
					getServletContext().getRequestDispatcher("/adminaddbook.jsp").forward(request, response);
					
				} else {
					
					System.out.println("Book Not Added");
					getServletContext().getRequestDispatcher("/adminaddbook.jsp").forward(request, response);
					
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				response.sendRedirect("adminaddbook.jsp");
				
			}
			
		} else {
			
			response.sendRedirect("adminaddbook.jsp");
			
		}
		
	}

}
