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
package com.bartmint.wallet;

import com.bartmint.users.NewUserClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author HULLO
 */
public class WalletServlet extends HttpServlet
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");

            WalletClass wallet = validateWallet(request, user.getEmail(), user.getId());
            WalletDAO.createWallet(wallet);
            JSONObject jsono = new JSONObject();
            jsono.put("message", "success");
            out.print(jsono);
        }
        catch(JSONException e)
        {
            e.printStackTrace(System.err);
            throw new RuntimeException(e);
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

    private WalletClass validateWallet(HttpServletRequest request, String emailAt, int id)
    {
        try
        {
            double balance = Double.parseDouble(request.getParameter("amount"));
            String email = emailAt;
            String status = "pending...";

            // Get the current timestamp as LocalDateTime
            LocalDateTime now = LocalDateTime.now();

            // Create a Timestamp object from LocalDateTime
            Timestamp datetime = Timestamp.valueOf(now);

            WalletClass wallet = new WalletClass();
            wallet.setEmail(email);
            wallet.setUser_id(id);
            wallet.setBalance(balance);
            wallet.setStatus(status);
            wallet.setDatetime(datetime);

            // Check if status is "pending" and balance is 0
            if("pending...".equals(status) && balance != 0)
                // Do something here if needed
                // For example, print a message
                System.out.println("Your balance is empty till payment is confirmed");
            else
            {

            }

            return wallet;
        }
        catch(NumberFormatException e)
        {
            e.printStackTrace(System.err);
            throw new RuntimeException(e);
        }
    }

}
