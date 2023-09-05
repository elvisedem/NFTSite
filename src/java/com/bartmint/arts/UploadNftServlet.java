package com.bartmint.arts;

import com.bartmint.transactions.Transaction;
import com.bartmint.transactions.TransactionDAO;
import com.bartmint.users.User;
import com.bartmint.users.UserWallet;
import com.bartmint.users.UserWalletDAO;
import static com.bartmint.util.Constant.TransactionsConstants.StatusConstant.SUCCESS;
import static com.bartmint.util.Constant.TransactionsConstants.TransType.MINT;
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
public class UploadNftServlet extends HttpServlet
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
            UserWallet uw = UserWalletDAO.getUserWalletById(user.getUserId());
            if(uw.getBalance() >= 0.1492)
            {
                double newBalance = uw.getBalance() - 0.1492;
                NftArt nft = new NftArt();
                nft.setArtName(request.getParameter("nftName"));
                nft.setImageName(request.getParameter("imageName"));
                nft.setPrice(Double.parseDouble(request.getParameter("price")));
                nft.setUserId(user.getUserId());
                NftDAO.registerNewNFTs(nft);
                UserWalletDAO.updateUserBalance(uw, newBalance);
                Transaction t = new Transaction();
                t.setAmount(-0.1492);
                t.setDate(DateTimeUtil.getTodayTimeZone());
                t.setStatus(SUCCESS);
                t.setUserId(user.getUserId());
                t.setType(MINT);
                TransactionDAO.registerNewTransactionSlip(t);
                JSONObject jsono = new JSONObject();
                jsono.put("message", "success");
                out.println(jsono);
            }
            else
            {
                JSONObject jsono = new JSONObject();
                jsono.put("message", "Insufficient Funds, Make a Deposit or Sale an NFT");
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
