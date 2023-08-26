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
package com.bartmint.transactions;

import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.WITHDRAWAL;
import static com.bartmint.util.Constant.UserDepositConstants.PENDING;
import com.bartmint.util.DateTimeUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author BLAZE
 */
public class WithdrawalServlet extends HttpServlet
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
            User user = (User)session.getAttribute("user");
            UserWallet uw = UserWalletDAO.getUserWalletById(user.getUserId());
            if(uw.getBalance() >= 0.000000000001)
            {
                JSONObject jsono = new JSONObject();
                jsono.put("message", "Insufficient Funds, Make a Deposit or Sale an NFT");
                out.println(jsono);
//                request.getRequestDispatcher("home-page").forward(request, response);
            }
            else
            {
                double amount = Double.parseDouble(request.getParameter("amount"));
                Withdrawal w = new Withdrawal();
                w.setAmount(Double.parseDouble(request.getParameter("amount")));
                w.setStatus(PENDING);
                w.setWalletAddress(request.getParameter("address"));
                w.setDate(DateTimeUtil.getTodayTimeZone());
                w.setUserId(user.getUserId());
                TransactionDAO.registerNewWithdrawalSlip(w);
                Transaction t = new Transaction();
                t.setAmount(-amount);
                t.setDate(DateTimeUtil.getTodayTimeZone());
                t.setStatus(PENDING);
                t.setUserId(user.getUserId());
                t.setType(WITHDRAWAL);
                TransactionDAO.registerNewTransactionSlip(t);
                JSONObject jsono = new JSONObject();
                jsono.put("message", "success");
                out.print(jsono);
            }
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
