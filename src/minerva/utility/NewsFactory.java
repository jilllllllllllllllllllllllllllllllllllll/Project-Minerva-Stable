package minerva.utility;

import minerva.model.NewsBean;

public class NewsFactory {
	
	public static NewsBean getInstance(String newsTitle, String newsMessage) {
		
		NewsBean nb = new NewsBean();
		nb.setNewsTitle(newsTitle);
		nb.setNewsMessage(newsMessage);
		
		return nb;
		
	}

}
