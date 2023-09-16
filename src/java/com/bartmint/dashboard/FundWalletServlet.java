package com.bartmint.dashboard;

import com.bartmint.transactions.Transaction;
import com.bartmint.transactions.TransactionDAO;
import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BLAZE
 */
public class FundWalletServlet extends HttpServlet
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
        response.setContentType("text/html;charset=UTF-8");
        try
        {
            HttpSession session = request.getSession(false);
            User user = (User)session.getAttribute("user");
            if(request.getParameter("amount") != null)
            {
                List<Transaction> transactions = TransactionDAO.getAllTransactionOfUser(user.getUserId());
                request.setAttribute("transactions", transactions);
                request.setAttribute("amount", request.getParameter("amount"));
                request.getRequestDispatcher("invoice").forward(request, response);
            }
            else
            {
                UserWallet uw = UserWalletDAO.getUserWalletById(user.getUserId());
                request.setAttribute("uw", uw);
                request.getRequestDispatcher("deposit").forward(request, response);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            throw new RuntimeException(e);
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
