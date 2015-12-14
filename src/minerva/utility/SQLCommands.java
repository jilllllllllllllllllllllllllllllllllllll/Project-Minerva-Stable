package minerva.utility;

public interface SQLCommands {
	
	//---BOOKS QUERY---
	
	String ADD_BOOK = "insert into books(accNum, class, author, bookTitle, edition, volume,"
			+ "pages, publisher, year, availability, isActive) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
	
	String ADD_RELATION = "insert into relation(accNum, genreId) values (?, ?)";
	
	String EDIT_BOOK = "update books set class = ?, author = ?, bookTitle = ?, edition = ?, "
			+ "volume = ?, pages = ?, publisher = ?, year = ?, availability = ? "
			+ "where accNum = ?";
	
	String EDIT_RELATION = "update relation set genreId = ? where accNum=?";
	
	String BROWSE_BOOKS = "select * from books where isActive";
	
	String DELETE_BOOKS = "UPDATE books SET isActive = 0 where accNum=?";
	
	String SEARCH_BOOKS = "select * from books where accNum=? and isActive";
	
	
	//---NEWS QUERY---
	
	String ADD_NEWS = "insert into news(newsTitle, newsMessage, newsDate, isActive) values (?, ?, ?, 1)";
	
	String EDIT_NEWS = "update news set newsTitle = ?, newsMessage = ?, newsDate = ? where newsId = ?";
	
	String DELETE_NEWS = "UPDATE news SET isActive = 0 where newsId=?";
			
	String LIST_NEWS = "select * from news where isActive";
	
	String SEARCH_NEWS = "select * from news where newsId = ? and isActive";
	
	String DELETE_FEEDBACK = "UPDATE feedbacks SET isActive = 0 where feedbackMessages=?";

	
	//CLIENT SQL COMMANDS
	
	String CLIENT_SEND_FEEDBACK = "INSERT INTO feedbacks (idNumber, feedbackMessages, feedbackDate, isActive) VALUES (?, ?, ?, 1)";
	
	
}
