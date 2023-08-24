package com.bartmint.dashboard;

import com.bartmint.transactions.Deposit;
import com.bartmint.transactions.Transaction;
import com.bartmint.transactions.TransactionDAO;
import com.bartmint.users.User;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.DEPOSIT;
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

public class DepositServlet extends HttpServlet
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
            Deposit dep = new Deposit();
            dep.setAmount(Double.parseDouble(request.getParameter("amount")));
            dep.setDate(DateTimeUtil.getTodayTimeZone());
            dep.setUserId(user.getUserId());
            dep.setStatus(PENDING);
            TransactionDAO.registerNewUserDeposit(dep);
            Transaction t = new Transaction();
            t.setAmount(Double.parseDouble(request.getParameter("amount")));
            t.setDate(DateTimeUtil.getTodayTimeZone());
            t.setStatus(PENDING);
            t.setUserId(user.getUserId());
            t.setType(DEPOSIT);
            TransactionDAO.registerNewTransactionSlip(t);
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
