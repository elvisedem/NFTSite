package com.bartmint.transactions;

import com.bartmint.arts.NftArt;
import com.bartmint.arts.NftDAO;
import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import static com.bartmint.util.Constant.TransactionsConstants.StatusConstant.SUCCESS;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.SOLD;
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
public class BuyNftArtServlet extends HttpServlet
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
            JSONObject jsono = new JSONObject();
            HttpSession session = request.getSession(false);
            User user = (User)session.getAttribute("user");
            String senderEmail = "contact@bartmint.com";
            String subject = "NFT Purchase";
            String userMessage = "You have Successfully bought an NFT, Please wait as we process your payment! Thanks";
            String adminMessage = "This User: " + user.getEmail() + " has successfully purchased an NFT, check and confirm the payment";

            UserWallet uw = UserWalletDAO.getUserWalletById(user.getUserId());
            NftArt nft = NftDAO.getNftArtById(Integer.parseInt(request.getParameter("id")));
            if(uw.getBalance() >= nft.getPrice())
            {
                double userNewBalance = uw.getBalance() - nft.getPrice();
                UserWalletDAO.updateUserBalance(uw, userNewBalance);
                UserWallet recipWallet = UserWalletDAO.getUserWalletById(nft.getUserId());
                double newRecipWallet = recipWallet.getBalance() + nft.getPrice();
                UserWalletDAO.updateUserBalance(recipWallet, newRecipWallet);
                Transaction t = new Transaction();
                t.setAmount(-nft.getPrice());
                t.setDate(DateTimeUtil.getTodayTimeZone());
                t.setStatus(SUCCESS);
                t.setType("Bought");
                t.setUserId(user.getUserId());
                TransactionDAO.registerNewTransactionSlip(t);
                Transaction t1 = new Transaction();
                t1.setAmount(nft.getPrice());
                t1.setDate(DateTimeUtil.getTodayTimeZone());
                t1.setStatus(SUCCESS);
                t1.setType(SOLD);
                t1.setUserId(nft.getUserId());
                TransactionDAO.registerNewTransactionSlip(t1);
                NftDAO.updateNftStatusById(nft.getArtId());
                SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, userMessage);
                SendEmail.sendHtmlMail("Steveryan4056@gmail.com", senderEmail, subject, adminMessage);
                jsono.put("message", "success");
                out.print(jsono);
            }
            else if(uw.getBalance() < nft.getPrice())
            {
                jsono.put("message", "Oops, You don't have enough funds to purchase this art,  Make a deposit and try again!");
                SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, "Sorry you don't have the mininmum amount to make this request, try again when you balance has reached 0.000001! Thanks");
                out.print(jsono);
            }
            else if("sold".equals(nft.getStatus()))
            {
                jsono.put("message", "Oops, Has been Purchased!");
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
