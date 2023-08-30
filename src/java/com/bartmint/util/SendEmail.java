package com.bartmint.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author BLAZE
 * @since Aug 26, 2023 11:00:44 PM
 */
public class SendEmail
{
    public static void sendHtmlMail(String email, String sendersEmail, String subject, String newMessage)
    {
        // Assuming you are sending email from localhost
        String host = "localhost";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.setProperty("mail.smtp.host", host);

        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);
        try
        {
            // Create a default MimeMessage object.
            MimeMessage mimeMessage = new MimeMessage(session);
            // Set From: header field of the header.
            mimeMessage.setFrom(new InternetAddress(sendersEmail));
            // Set To: header field of the header.
            mimeMessage.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(email));
            // Set Subject: header field
            mimeMessage.setSubject(subject);
            // Now set the actual message
            mimeMessage.setContent(newMessage, "text/html");
            // Send message
            Transport.send(mimeMessage);
        }
        catch(MessagingException e)
        {
            throw new RuntimeException(e);
        }
    }
}
