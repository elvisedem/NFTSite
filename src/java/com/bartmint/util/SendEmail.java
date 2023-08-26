/*
 * Copyright (c) 2018, Xyneex Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact Xyneex Technologies, #1 Orok Orok Street, Calabar, Nigeria.
 * or visit www.xyneex.com if you need additional information or have any
 * questions.
 */
package com.bartmint.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
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
    private static final String USER_NAME = "contact@bartmint.com";
    private static final String PASSWORD = "Pr0j3ct@BArtMint";
    private static final String LOCAL_HOST = "localhost";

    public static String sendHtmlMail(String recipientEmail, String sendersEmail, String messageSubject, String htmlMessage)
    {
        // Recipient's email ID needs to be mentioned.
        String to = recipientEmail;

        // Sender's email ID needs to be mentioned
        String from = sendersEmail;
        final String username = USER_NAME;//change accordingly
        final String password = PASSWORD;//change accordingly

        // Assuming you are sending email through relay.jangosmtp.net
        String host = LOCAL_HOST;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.bartmint.com", host);
        props.put("mail.smtp.port", "465");

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator()
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(username, password);
            }
        });

        try
        {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject(messageSubject);

            // Now set the actual message
            message.setText(htmlMessage);

            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
            String success = "sendingSuccess";
            return success;
        }
        catch(MessagingException e)
        {
            throw new RuntimeException(e);
        }
    }

}
