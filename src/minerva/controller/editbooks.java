package minerva.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
		
		int accNum = Integer.parseInt(request.getParameter("accountNum"));
		
		try{
			
			
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
		      
		      PreparedStatement pst = connection.prepareStatement(EDIT_BOOK);
		      pst.setString(1, Class);
		      pst.setString(2, author);
		      pst.setString(3, bookTitle);
		      pst.setString(4, edition);
		      pst.setInt(5, volume);   
		      pst.setLong(6, pages);
		      pst.setString(7, publisher);
		      pst.setLong(8, year);      
		      pst.setString(9, availability);
		      pst.setInt(10, accNum);
		      
		      pst.executeUpdate();
		      
		      
		      PreparedStatement pstmt = connection.prepareStatement(EDIT_RELATION);
		           
		      pstmt.setInt(1, genre);
		      pstmt.setInt(2, accNum);
		      
		      pstmt.executeUpdate();
		      
		    } catch (Exception e){
		    	System.out.println("Message: " + e);
		    }
		response.sendRedirect("adminbrowse.jsp");
	}

}
