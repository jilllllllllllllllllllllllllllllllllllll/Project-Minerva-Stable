package minerva.email;

import java.util.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

public class sendmail {
	

	public void sent(String emailreceiver,String accntpass){
		
		System.out.println(emailreceiver);
		mailbean newbean = new mailbean();
	     newbean.setTo(emailreceiver);// TO
	    newbean.setFrom("javatargab@gmail.com");//change accordingly from
	  
	  String password = "bagratavaj";//password ng gmail
    String host = "localhost";//or IP address  

   //Get the session object  
    Properties properties = System.getProperties();  
    properties.setProperty("mail.smtp.auth", "true");
    properties.setProperty("mail.smtp.starttls.enable", "true");  
    properties.setProperty("mail.smtp.host", "smtp.gmail.com");  
    properties.setProperty("mail.smtp.port", "25");
    Session session = Session.getInstance(properties,
    		new javax.mail.Authenticator(){
    	protected PasswordAuthentication getPasswordAuthentication(){
    		return new PasswordAuthentication(newbean.getFrom(), password);
    	}
    });
    	
    

   //compose the message  
    try{  
       MimeMessage message = new MimeMessage(session);  
       message.setFrom(new InternetAddress(newbean.getFrom()));  
       message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(newbean.getTo()));
       message.setSubject("Minerva Forgot Password Authentication");  
       message.setText("your Password is '" + accntpass+"'."); 

       // Send message  
       Transport.send(message);  
       System.out.println("message sent successfully....");  

    }catch (MessagingException mex) {mex.printStackTrace();}  
    }
}
