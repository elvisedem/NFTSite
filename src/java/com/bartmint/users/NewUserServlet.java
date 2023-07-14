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
package com.bartmint.users;

import com.bartmint.security.Digester;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author HULLO
 */
public class NewUserServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("json/application");
        PrintWriter out = response.getWriter();
        try
        {
            NewUserClass users = validateUser(request);
            System.out.println("Validated Admin User");
            UserDAO.registerNewUsers(users);
            System.out.println("Registered Admin User");

//            sendEmail(users.getEmail()); // Send email notification to the user
// Forward the request to the SendEmailServlet to send the email
//            request.setAttribute("email", users.getEmail());
//            request.getRequestDispatcher("/registeremailservlet").forward(request, response);
            JSONObject jsono = new JSONObject();
            jsono.put("message", "success");
            out.print(jsono);
        }
        catch(JSONException newUser)
        {
            newUser.printStackTrace(System.err);
            throw new RuntimeException(newUser);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

    private NewUserClass validateUser(HttpServletRequest request)
    {
        try
        {
            String email = request.getParameter("email").trim();
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();

            Digester digester = new Digester();
            String hashedPassword = digester.doDigest(password);

            NewUserClass nuc = new NewUserClass();
            nuc.setEmail(email);
            nuc.setUsername(username);
            nuc.setPassword(hashedPassword);
            return nuc;
//
        }
        catch(Exception registernewuserservlet)
        {
            registernewuserservlet.printStackTrace(System.err);
            throw new RuntimeException(registernewuserservlet);
        }
    }

//    private void sendEmail(String recipientEmail)
//    {
//
//        final String username = "contact@bartmint.com"; // Your email address
//        final String password = "Pr0j3ct@BArtMint"; // Your email password
//
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", "mail.bartmint.com"); // Your SMTP server host
//        props.put("mail.smtp.port", "465"); // Your SMTP server port
//
//        Session session = Session.getInstance(props, new javax.mail.Authenticator()
//        {
//            protected PasswordAuthentication getPasswordAuthentication()
//            {
//                return new PasswordAuthentication(username, password);
//            }
//        });
//
//        try
//        {
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(username));
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
//            message.setSubject("Account Created");
//            message.setText("Dear User,\n\nYour account has been created on our website.\n\nThank you!");
//
//            Transport.send(message);
//            System.out.println("Email sent successfully");
//        }
//
//        catch(MessagingException e)
//        {
//            e.printStackTrace(System.err);
//            throw new RuntimeException(e);
//        }
//    }
}
