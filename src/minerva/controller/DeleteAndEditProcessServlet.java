package minerva.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import minerva.model.BookBean;
import minerva.utility.SQLOperations;

@WebServlet("/maintainance.html")
public class DeleteAndEditProcessServlet extends HttpServlet {
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
		
		try {
			
			RequestDispatcher dispatcher = null;
			
			if (request.getParameter("action").equals("edit")) {
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				BookBean bb = SQLOperations.searchBook(id, connection);
				request.setAttribute("book", bb);
				
				dispatcher = getServletContext().getRequestDispatcher("/adminupdatebook.jsp");
				
			} else if (request.getParameter("action").equals("delete")) {
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				SQLOperations.deleteBooks(id, connection);
				
				dispatcher = getServletContext().getRequestDispatcher("/adminbrowse.jsp");
				
			}
			
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			
			System.err.println("Exception e: " + e.getMessage());
			e.printStackTrace();
			
		}
		
	}

}
