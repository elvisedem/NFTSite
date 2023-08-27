package com.bartmint.transactions;

import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.WITHDRAWAL;
import static com.bartmint.util.Constant.UserDepositConstants.PENDING;
import com.bartmint.util.DateTimeUtil;
import com.bartmint.util.SendEmail;
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

            String senderEmail = "contact@bartmint.com";
            String subject = "Withdrawal Request";
            String userMessage = "You have Successfully placed a Withdrawal request please wait as we process your payment! Thanks";

            HttpSession session = request.getSession(false);
            User user = (User)session.getAttribute("user");
            UserWallet uw = UserWalletDAO.getUserWalletById(user.getUserId());
            String adminMessage = "Hey a new user has been register!! The user name is: " + user.getUserName() + " the user Email: " + user.getEmail();
            if(uw.getBalance() <= 0.000000000001)
            {
                JSONObject jsono = new JSONObject();
                jsono.put("message", "Insufficient Funds, Make a Deposit or Sale an NFT");
                out.println(jsono);
                SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, "Sorry yo don't have tthe mininmum withdrawal amont to make this request, try again when you balance has reached 0.000001! Thanks");
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
                SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, userMessage);
                SendEmail.sendHtmlMail("Steveryan4056@gmail.com", senderEmail, subject, adminMessage);
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
