package minerva.utility;

import minerva.model.BookBean;

public class BookFactory {
	
	public static BookBean getInstance(int accNum, String bookClass, String author, String bookTitle,
			String edition, int volume, long pages, String publisher,
			long year, int genre, String availability) {
		
		BookBean bb = new BookBean();
		bb.setAccNum(accNum);
		bb.setBookClass(bookClass);
		bb.setAuthor(author);
		bb.setBookTitle(bookTitle);
		bb.setEdition(edition);
		bb.setVolume(volume);
		bb.setPages(pages);
		bb.setPublisher(publisher);
		bb.setYear(year);
		bb.setGenre(genre);
		bb.setAvailability(availability);
		
		return bb;
		
	}

}
