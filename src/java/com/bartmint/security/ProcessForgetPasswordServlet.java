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
public class ProcessForgetPasswordServlet extends HttpServlet
{

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
                String token = request.getParameter("token");
                ForgotPassword fg = ForgotPasswordDAO.getUserDetails(token);
                if(fg == null)
                {
                    RequestDispatcher dispatch = request.getRequestDispatcher("home");
                    dispatch.forward(request, response);
                }
                else
                {
                    String email = fg.getEmail();
                    request.setAttribute("email", email);
                    RequestDispatcher dispatch = request.getRequestDispatcher("");//page to resset password
                    dispatch.forward(request, response);
                }
            }
            else
            {
                RequestDispatcher dispatch = request.getRequestDispatcher("home");
                dispatch.forward(request, response);
            }
        }
        catch(Exception e)
        {
        }
    }

    private static String validateRequest(HttpServletRequest request) throws Exception
    {
        String errMsg = null;
        try
        {
            if(request.getParameter("token").isEmpty() || request.getParameter("token") == null)
                errMsg = "Invalid Request";
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
