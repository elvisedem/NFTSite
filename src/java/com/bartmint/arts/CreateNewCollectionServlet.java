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
package com.bartmint.arts;

import com.bartmint.transactions.Transaction;
import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.MINT;
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
public class CreateNewCollectionServlet extends HttpServlet
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
            if(uw.getBalance() >= 0.1592)
            {
                double newBalance = uw.getBalance() - 0.1592;
                String collectionName = request.getParameter("collectionName");
                double price = Double.parseDouble(request.getParameter("price"));
                String image2 = request.getParameter("image2");
                String image3 = request.getParameter("image3");
                String image4 = request.getParameter("image4");
                String image5 = request.getParameter("image5");

                Collection cc = new Collection();
                cc.setCollectionName(collectionName);
                cc.setPrice(price);
                cc.setUserId(user.getUserId());
                int cid = NftDAO.registerNewCollection(cc);

                CollectionArt collectionArt1 = new CollectionArt();
                collectionArt1.setcId(cid);
                collectionArt1.setImageName(request.getParameter("image1"));
                NftDAO.registerNewCollectionArt(collectionArt1);

                CollectionArt collectionArt2 = new CollectionArt();
                collectionArt2.setcId(cid);
                collectionArt2.setImageName(image2);
                NftDAO.registerNewCollectionArt(collectionArt2);

                CollectionArt collectionArt3 = new CollectionArt();
                collectionArt3.setcId(cid);
                collectionArt3.setImageName(image3);
                NftDAO.registerNewCollectionArt(collectionArt3);

                CollectionArt collectionArt4 = new CollectionArt();
                collectionArt4.setcId(cid);
                collectionArt4.setImageName(image4);
                NftDAO.registerNewCollectionArt(collectionArt4);

                CollectionArt collectionArt5 = new CollectionArt();
                collectionArt5.setcId(cid);
                collectionArt5.setImageName(image5);
                NftDAO.registerNewCollectionArt(collectionArt5);
                UserWalletDAO.updateUserBalance(uw, newBalance);
                Transaction t = new Transaction();
                t.setAmount(-0.1592);
                t.setDate(DateTimeUtil.getTodayTimeZone());
                t.setStatus(PENDING);
                t.setUserId(user.getUserId());
                t.setType(MINT);
                JSONObject jsono = new JSONObject();
                jsono.put("message", "success");
                out.print(jsono);
            }
            else
            {
                JSONObject jsono = new JSONObject();
                jsono.put("message", "Insufficient Funds, Make a Deposit or Sale a NFT");
                out.println(jsono);
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
