// Java program to send email 
  
import java.util.*; 
import javax.mail.*; 
import javax.mail.internet.*; 
import javax.activation.*; 
import javax.mail.Session; 
import javax.mail.Transport; 
  
  
public class SendEmail  
{ 
  
   public static void main(String [] args)  
   {     
      // email ID of Recipient. 
      String recipient = "jatanchoudhary441@outlook.com"; 
  
      // email ID of  Sender. 
      String sender = "jatanchoudhary441@gmail.com"; 
  
      // using host as localhost 
      String host = "192.168.43.184"; 
  
      // Getting system properties 
      Properties properties = System.getProperties(); 
  
      // Setting up mail server 
      properties.setProperty("mail.smtp.host", host); 
  
      // creating session object to get properties 
      Session session = Session.getDefaultInstance(properties); 
  
      try 
      { 
         // MimeMessage object. 
         MimeMessage message = new MimeMessage(session); 
  
         // Set From Field: adding senders email to from field. 
         message.setFrom(new InternetAddress(sender)); 
  
         // Set To Field: adding recipient's email to from field. 
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
  
         // Set Subject: subject of the email 
         message.setSubject("This is Suject"); 
  
         // set body of the email. 
         message.setText("This is a test mail"); 
  
         // Send email. 
         Transport.send(message); 
         System.out.println("Mail successfully sent"); 
      } 
      catch (MessagingException mex)  
      { 
         mex.printStackTrace(); 
      } 
   } 
} 
