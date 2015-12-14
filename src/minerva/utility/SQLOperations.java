package minerva.utility;

import java.sql.*;

import javax.sql.*;
import javax.naming.InitialContext;

import minerva.model.BookBean;
import minerva.model.NewsBean;

public class SQLOperations implements SQLCommands {

	private static Connection connection;
	
	private static Connection getDBConnection() {
		
		try {
			
			DataSource dataSource = (DataSource) InitialContext.doLookup("java:comp/env/jdbc/opac");
			
			if (dataSource != null) {
				
				connection = dataSource.getConnection();
				
			} else {
				
				throw new NullPointerException("DataSource is null");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	
		return connection;
		
	}
	
	public static Connection getConnection() {
		
		return (connection != null) ? connection : getDBConnection();
		
	}
	
	//--------ADD BOOKS-------
	
	public static boolean addBooks(BookBean bb, Connection connection) {
		
		try {
			
			connection.setAutoCommit(true);
			
			PreparedStatement pst = connection.prepareStatement(ADD_BOOK);
			
			pst.setInt(1, bb.getAccNum());
			pst.setString(2, bb.getBookClass());
			pst.setString(3, bb.getAuthor());
			pst.setString(4, bb.getBookTitle());
			pst.setString(5, bb.getEdition());
			pst.setInt(6, bb.getVolume());
			pst.setLong(7, bb.getPages());
			pst.setString(8, bb.getPublisher());
			pst.setLong(9, bb.getYear());
			pst.setString(10, bb.getAvailability());
			
			pst.executeUpdate();
			
			PreparedStatement pstmt = connection.prepareStatement(ADD_RELATION);
			
			pstmt.setLong(1, bb.getAccNum());
			pstmt.setLong(2, bb.getGenre());
			
			pstmt.executeUpdate();
			
		} catch (SQLException sqle) {
			
			System.out.println("SQLException - addBooks: " + sqle.getMessage());
			
			return false;
			
		}
		
		return true;
		
	}
	
	//--------UPDATE BOOKS-------
	
	public static int updateBooks(BookBean bb, int id, Connection connection) {
		
		int updated = 0;
		
		try {
			
			connection.setAutoCommit(false);
			
			PreparedStatement pst = connection.prepareStatement(DELETE_BOOKS);

			pst.setInt(1, id);
			updated = pst.executeUpdate();
			
			connection.commit();
			
		} catch (SQLException sqle) {
			
			System.out.println("SQLWxception - updateBooks: " + sqle.getMessage());
			
			try {
				
				connection.rollback();
				
			} catch (SQLException sqlex) {
				
				System.err.println("Error on Update Connection Rollback " + sqlex.getMessage());
				
			}
			
			return updated;
			
		}
		
		return updated;
		
	}
	
	//--------BROWSE BOOKS-------
	
	public static ResultSet browseBooks(Connection connection) {
		
		ResultSet rs = null;
		
		try {
			
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(BROWSE_BOOKS);
			
		} catch (SQLException sqle) {
			
			System.out.println("SQLException - browseBooks: " + sqle.getMessage());
			
			return rs;
			
		}
		
		return rs;
		
	}
	
	//--------DELETE BOOKS-------
	
	public static synchronized int deleteBooks(int id, Connection connection) {
		
		int updated = 0;
		
		try {
			
			connection.setAutoCommit(false);
			PreparedStatement pst = connection.prepareStatement(DELETE_BOOKS);
			
			pst.setInt(1, id);
			updated = pst.executeUpdate();
					
			connection.commit();
			
		} catch (SQLException sqle) { 
			
			System.out.println("SQLException - deleteBooks: " + sqle.getMessage());
			
			try {
				
				connection.rollback();
				
			} catch (SQLException sql) {
				
				System.err.println("Error on Delete Connection rollback " + sql.getMessage());
				
			}
			
			return updated;
			
		}
		
		return updated;
		
	}
	
	//--------SEARCH BOOKS-------
	
	public static BookBean searchBook(int id, Connection connection) {
		
		BookBean bb = new BookBean();
		
		try {
			
			PreparedStatement pst = connection.prepareStatement(SEARCH_BOOKS);
			
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				
				bb.setAccNum(rs.getInt("accNum"));
				bb.setBookClass(rs.getString("class"));
				bb.setAuthor(rs.getString("author"));
				bb.setBookTitle(rs.getString("bookTitle"));
				bb.setEdition(rs.getString("edition"));
				bb.setVolume(rs.getInt("volume"));
				bb.setPages(rs.getLong("pages"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setYear(rs.getLong("year"));
				bb.setAvailability(rs.getString("availability"));
				
			}
			
		} catch (SQLException sqle) {
			
			System.out.println("SQLException - searchBooks: " + sqle.getMessage());
			
			return bb;
			
		}
		
		return bb;
		
	}
	
	
	
	//-------------------------NEWS OPERATIONS-------------------------
	
	//-------------------------ADD NEWS-------------------------
	
	public static boolean addNews(NewsBean nb, Connection connection) {
		
		try {
			
			connection.setAutoCommit(true);
			
			PreparedStatement pst = connection.prepareStatement(ADD_NEWS);
			
			pst.setString(1, nb.getNewsTitle());
			pst.setString(2, nb.getNewsMessage());
			
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			
			pst.setDate(3, sqlDate);
			
			pst.executeUpdate();
			
		} catch (SQLException sqle) {
			
			System.out.println("SQLException - addNews: " + sqle.getMessage());
			
			return false;
			
		}
		
		return true;
		
	}
	
	
	//--------LIST NEWS-------
	
		public static ResultSet browseNews(Connection connection) {
			
			ResultSet rs = null;
			
			try {
				
				Statement stmt = connection.createStatement();
				rs = stmt.executeQuery(LIST_NEWS);
				
			} catch (SQLException sqle) {
				
				System.out.println("SQLException - browseNews: " + sqle.getMessage());
				
				return rs;
				
			}
			
			return rs;
			
		}
		
	//--------DELETE NEWS-------
		
		public static synchronized int deleteNews(int id, Connection connection) {
			
			int updated = 0;
			
			try {
				
				connection.setAutoCommit(false);
				PreparedStatement pst = connection.prepareStatement(DELETE_NEWS);
				
				pst.setInt(1, id);
				updated = pst.executeUpdate();
						
				connection.commit();
				
			} catch (SQLException sqle) { 
				
				System.out.println("SQLException - deleteBooks: " + sqle.getMessage());
				
				try {
					
					connection.rollback();
					
				} catch (SQLException sql) {
					
					System.err.println("Error on Delete Connection rollback " + sql.getMessage());
					
				}
				
				return updated;
				
			}
			
			return updated;
			
		}
		
		
		//------CLIENT------
		//------DELETE COLLECTION-------
		
		public static synchronized int deleteColletionBooks(int id, Connection connection) {
			
			int updated = 0;
			
			try {
				
				connection.setAutoCommit(false);
				PreparedStatement pst = connection.prepareStatement(DELETE_BOOKS);
				
				pst.setInt(1, id);
				updated = pst.executeUpdate();
						
				connection.commit();
				
			} catch (SQLException sqle) { 
				
				System.out.println("SQLException - deleteBooks: " + sqle.getMessage());
				
				try {
					
					connection.rollback();
					
				} catch (SQLException sql) {
					
					System.err.println("Error on Delete Connection rollback " + sql.getMessage());
					
				}
				
				return updated;
				
			}
			
			return updated;
			
		}
		
		//------SearchResults-------
//		public static ResultSet viewResults(Connection connection) {
//			
//			ResultSet rs = null;
//			
//			try {
//				
//				Statement stmt = connection.createStatement();
//				rs = stmt.executeQuery(VIEW_RESULTS);
//				
//			} catch (SQLException sqle) {
//				
//				System.out.println("SQLException - viewResults: " + sqle.getMessage());
//				
//				return rs;
//				
//			}
//			
//			return rs;
//			
//		}
}
