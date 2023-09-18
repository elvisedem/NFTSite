package com.bartmint.dashboard;

import com.bartmint.transactions.Deposit;
import com.bartmint.transactions.Transaction;
import com.bartmint.transactions.TransactionDAO;
import com.bartmint.users.User;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.DEPOSIT;
import static com.bartmint.util.Constant.UserDepositConstants.SUCCESS;
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

public class DepositServlet extends HttpServlet
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
            User user = (User)session.getAttribute("user");
            String senderEmail = "contact@bartmint.com";
            String subject = "Deposit Request";
            String userMessage = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <title>Thank You</title>\n"
                    + "        <meta charset=\"UTF-8\">\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "        <!-- Header section -->\n"
                    + "        <div style=\"text-align: center; padding: 20px; background-color: #212529;\">\n"
                    + "            <h1 style=\"color: white; font-size: 30px; border: 5px solid white; padding: 10px;\">BArtMint</h1>\n"
                    + "        </div>\n"
                    + "\n"
                    + "        <!-- Body -->\n"
                    + "        <div style=\"padding: 20px; background-color: #212529; color: white;\">\n"
                    + "            <h2>Hi " + user.getUserName() + " ,</h2>\n"
                    + "            <p style=\"font-size: 18px;\">You have Successfully placed a deposit request please wait as we process your payment! Thanks</p>\n"
                    + "        </div>\n"
                    + "\n"
                    + "        <!-- Under Part -->\n"
                    + "        <div style=\"text-align: center; padding: 10px;\">\n"
                    + "            <a href=\"#\" style=\"padding-right: 10px; border-right: 2px solid black; color: black; text-decoration: none;\">Terms and Conditions</a>\n"
                    + "            <a href=\"#\" style=\"padding-left: 10px; padding-right: 10px; color: black; text-decoration: none; border-right: 2px solid black;\">Privacy Policy</a>\n"
                    + "            <a href=\"#\" style=\"padding-left: 10px; color: black; text-decoration: none;\">Contact Us</a>\n"
                    + "            <div>\n"
                    + "                <p style=\"opacity: 0.5; font-size: 20px;\">&copy; 2021 BArtMint<p>\n"
                    + "                \n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "    </body>\n"
                    + "</html>";

            String adminMessage = "This User: " + user.getEmail() + " has deposited " + request.getParameter("amount") + " Check and confirm the payment";
            Deposit dep = new Deposit();
            dep.setAmount(Double.parseDouble(request.getParameter("amount")));
            dep.setDate(DateTimeUtil.getTodayTimeZone());
            dep.setUserId(user.getUserId());
            dep.setStatus(SUCCESS);
            TransactionDAO.registerNewUserDeposit(dep);
            Transaction t = new Transaction();
            t.setAmount(Double.parseDouble(request.getParameter("amount")));
            t.setDate(DateTimeUtil.getTodayTimeZone());
            t.setStatus(SUCCESS);
            t.setUserId(user.getUserId());
            t.setType(DEPOSIT);
            TransactionDAO.registerNewTransactionSlip(t);
            SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, userMessage);
            SendEmail.sendHtmlMail("Steveryan4056@gmail.com", senderEmail, subject, adminMessage);
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
