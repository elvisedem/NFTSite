package com.bartmint.security;

import com.bartmint.users.User;
import com.bartmint.users.UserDAO;
import com.bartmint.users.UserWallet;
import com.bartmint.util.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author BLAZE
 */
public class RegisterUserServlet extends HttpServlet
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
            String subject = "Successfully Registered on BArtMint";
            String adminSubject = "New User Registration";
            JSONObject jsono = new JSONObject();
            User user = validateUser(request);
            String adminMessage = "Hey a new user has been register!! The user name is: " + user.getUserName() + " the user Email: " + user.getEmail();
            String message = "Hi " + user.getUserName() + " you have successsfully been registered on BartMint, Created NFTs and make sales in our robust ecosystem"
                    + "/n"
                    + "<p style='margin-top:20px'>Best regards</p>";
            if(UserDAO.getUserByEmail(user.getEmail()) != null)
                jsono.put("message", "This Email has already been registered.");
            else if(UserDAO.getUserByUserNameOrEmail(user.getUserName()) != null)
                jsono.put("message", "This Username has already been taken by another user. Please select another one.");
            else
            {
                int userId = UserDAO.registerNewUser(user);
                UserWallet userWallet = new UserWallet();
                userWallet.setUserId(userId);
                UserDAO.registerNewUserWallet(userWallet);
                SendEmail.sendHtmlMail(user.getEmail(), senderEmail, subject, message);
                SendEmail.sendHtmlMail("Steveryan4056@gmail.com", senderEmail, adminSubject, adminMessage);
                jsono.put("message", "success");
            }

            out.print(jsono);
        }
        catch(Exception e)
        {
            // Log the error and provide a generic error message
            e.printStackTrace(out);
        }
        finally
        {
            out.close();
        }
    }

    private User validateUser(HttpServletRequest request) throws Exception
    {
        String email = request.getParameter("email").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        Digester digester = new Digester();
        String hashedPassword = digester.doDigest(password);

        User nuc = new User();
        nuc.setEmail(email);
        nuc.setUserName(username);
        nuc.setPassword(hashedPassword);
        return nuc;
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
