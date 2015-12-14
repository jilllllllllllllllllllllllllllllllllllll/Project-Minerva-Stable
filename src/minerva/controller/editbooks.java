package minerva.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minerva.utility.SQLCommands;
import minerva.utility.SQLOperations;


@WebServlet("/editbooks.html")
public class editbooks extends HttpServlet implements SQLCommands {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;
	
//	String EDIT_BOOK = "update books set accNum = ?, class = ?, author = ?, bookTitle = ?, edition = ?,"
//			+ "volume = ?, pages = ?, publisher = ?, year = ?, availability = ?"
//			+ "where accNum = ? and isActive";
//	
//	String EDIT_RELATION = "update relation set genreId = ? where accNum=?";
	
	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
		
		connection = SQLOperations.getConnection();
		
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
		

		long EditBook = Long.parseLong(request.getParameter("accNum"));
		
		
		try{
			
			long accNum = Long.parseLong(request.getParameter("accNum"));
			String Class = request.getParameter("class");
		      String author = request.getParameter("author");
		      String bookTitle = request.getParameter("bookTitle");
		      String edition = request.getParameter("edition");
		      int volume = Integer.parseInt(request.getParameter("volume"));
		      long pages = Long.parseLong(request.getParameter("pages"));
		      String publisher = request.getParameter("publisher");
		      long year = Long.parseLong(request.getParameter("year"));
		      int genre = Integer.parseInt(request.getParameter("genre"));
		      String availability = request.getParameter("availability");
		      
		      System.out.println(Class);
		      
		      PreparedStatement pst = connection.prepareStatement(EDIT_BOOK);
		      pst.setLong(1, accNum);
		      pst.setString(2, Class);
		      pst.setString(3, author);
		      pst.setString(4, bookTitle);
		      pst.setString(5, edition);
		      pst.setInt(6, volume);   
		      pst.setLong(7, pages);
		      pst.setString(8, publisher);
		      pst.setLong(9, year);      
		      pst.setString(10, availability);
		      pst.setLong(11, EditBook);
		      
		      pst.executeUpdate();
		      
		      
		      PreparedStatement pstmt = connection.prepareStatement(EDIT_RELATION);
		           
		      pstmt.setInt(1, genre);
		      pstmt.setLong(2, EditBook);
		      
		      pstmt.executeUpdate();
		      
		    } catch (Exception e){
		    	System.out.println("Message: " + e);
		    }
		response.sendRedirect("adminbrowse.jsp");
	}

}
