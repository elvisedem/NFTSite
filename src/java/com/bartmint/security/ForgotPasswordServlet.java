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
package com.bartmint.security;

import com.bartmint.users.UserDAO;
import com.bartmint.util.RandomNumberGenerator;
import com.bartmint.util.SendMail;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BLAZE
 */
public class ForgotPasswordServlet extends HttpServlet
{
    private static final String SENDER_EMAIL = "";//the sender email

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
        try
        {
            String errMsg = validateRequest(request);
            if(errMsg == null)
            {
                String email = request.getParameter("email");
                String token = RandomNumberGenerator.generateRandomAlphanumericCharacters(60);

                ForgotPassword forgetPassword = new ForgotPassword();
                forgetPassword.setEmail(email);
                forgetPassword.setToken(token);
                ForgotPasswordDAO.registerNewRecord(forgetPassword);
                String messageSubject = "Reset of " + email + " Password";
                String message = "Click the link below to reset your password,if this wasn't triggered by you please ignore this message /n"
                        + "https://bartmint.com/reset-password?token=" + token;
                SendMail.sendHtmlMail(email, SENDER_EMAIL, messageSubject, message);

                RequestDispatcher dispatch = request.getRequestDispatcher("");//input the page for the notification to check email
                dispatch.forward(request, response);
            }
            else
            {
                request.setAttribute("errMsg", errMsg);
                RequestDispatcher dispatch = request.getRequestDispatcher("login");
                dispatch.forward(request, response);
            }

        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            throw new RuntimeException(e);
        }
    }

    private static String validateRequest(HttpServletRequest request) throws Exception
    {
        String errMsg = null;
        try
        {
            if(request.getParameter("email").isEmpty() || request.getParameter("email") == null)
                errMsg = "Please Input a valid Email Address";
            else if(UserDAO.getNewUserClassByEmail(request.getParameter("email")) == null)
                errMsg = "This Email have not been Registered!";
            return errMsg;
        }
        catch(Exception e)
        {
            errMsg = e.getMessage();
            return errMsg;
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

}
