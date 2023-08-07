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

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HULLO
 */
@MultipartConfig
public class CollectionServlet extends HttpServlet
{
    public static final String IMAGES_DIRECTORY = "images";

    private static final String UPLOADS_PATH = "/";
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
        response.setContentType("application/json");
        try
        {

            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");
            ServletContext adminContext = request.getServletContext();
            ServletContext uploadsContext = adminContext.getContext(UPLOADS_PATH);
            String absolutePath = uploadsContext.getRealPath("");

            String collectionName = request.getParameter("collectionName");
            double price = Double.parseDouble(request.getParameter("price"));

            CollectionClass cc = new CollectionClass();
            cc.setCollection_name(collectionName);
            cc.setPrice(price);
            cc.setUsername(user.getUsername());
            int cid = NFTDAO.registerNewCollections(cc);

            request.setAttribute("succMsg", "You have Successfully Uploaded " + collectionName + " Collection");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-arts?upl=1");
            dispatcher.forward(request, response);

        }
        catch(Exception e)
        {
            request.setAttribute("errMsg", "Your Upload was unsuccessful, please try again!!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("collection?upl=0");
            dispatcher.forward(request, response);
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
