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
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author HULLO
 */
@MultipartConfig
public class CollectionServlet extends HttpServlet
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {

            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");

            String collectionName = request.getParameter("collectionName");
            double price = Double.parseDouble(request.getParameter("price"));
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String image4 = request.getParameter("image4");
            String image5 = request.getParameter("image5");

            CollectionClass cc = new CollectionClass();
            cc.setCollection_name(collectionName);
            cc.setPrice(price);
            cc.setUserId(user.getId());
            int cid = NFTDAO.registerNewCollections(cc);

            CollectionArt collectionArt1 = new CollectionArt();
            collectionArt1.setCid(cid);
            collectionArt1.setImageName(request.getParameter("image1"));
            NFTDAO.registerNewCollectionArt(collectionArt1);

            CollectionArt collectionArt2 = new CollectionArt();
            collectionArt2.setCid(cid);
            collectionArt2.setImageName(image2);
            NFTDAO.registerNewCollectionArt(collectionArt2);

            CollectionArt collectionArt3 = new CollectionArt();
            collectionArt3.setCid(cid);
            collectionArt3.setImageName(image3);
            NFTDAO.registerNewCollectionArt(collectionArt3);

            CollectionArt collectionArt4 = new CollectionArt();
            collectionArt4.setCid(cid);
            collectionArt4.setImageName(image4);
            NFTDAO.registerNewCollectionArt(collectionArt4);

            CollectionArt collectionArt5 = new CollectionArt();
            collectionArt5.setCid(cid);
            collectionArt5.setImageName(image5);
            NFTDAO.registerNewCollectionArt(collectionArt5);

            JSONObject jsono = new JSONObject();
            jsono.put("message", "success");
            out.print(jsono);
        }
        catch(Exception e)
        {
            e.printStackTrace(out);
        }
        finally
        {
            out.close();
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
