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
            String message = "<!DOCTYPE html>\n"
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
                    + "            <p style=\"font-size: 18px;\">Congratulations and welcome to BArtMint! We're thrilled to have you join our platform and embark on your journey into the world of NFTs.</p>\n"
                    + "\n"
                    + "			<h3>Your registration details:</h3>\n"
                    + "			\n"
                    + "			<p style=\"font-size: 18px; font-style: none;\">Username: " + user.getUserName() + ", Email: " + user.getEmail() + "</p>\n"
                    + "			<p style=\"font-size: 18px;\">As an artist and creator, you're now part of a vibrant community that empowers individuals to showcase their creativity through unique NFTs. \n"
                    + "			Get ready to mint, share, and discover digital art like never before.</p>\n"
                    + "			<p>To get started, simply <a style=\"font-size: 18px; color: blue\" href=\"https://bartmint.com/login\">Login</a> with the credentials you provided during registration. If you have any trouble, please don't hesitate to reach out to our support team.</p>\n"
                    + "			\n"
                    + "			<h3>Here's what you can do now:</h3>\n"
                    + "			<li style=\"font-size: 18px; margin-left: 20px;\"><a style=\"font-size: 18px; color: blue\" href=\"https://bartmint.com/login\">Login</a></li>\n"
                    + "			<li style=\"font-size: 18px; margin-left: 20px;\">Explore BArtMint features and services.</li>\n"
                    + "			<li style=\"font-size: 18px; margin-left: 20px;\">Connect with our vibrant community and discover new opportunities.</li>\n"
                    + "			\n"
                    + "			<p style=\"font-size: 18px;\">If you ever have any questions, feedback, or suggestions, feel free to contact us. We're here to help!</p>\n"
                    + "			<p style=\"font-size: 18px;\"> We're thrilled to have you on board and look forward to providing you with a great experience.</p>\n"
                    + "			\n"
                    + "            <h3 style=\"font-size: 20px;\"><span style=\"font-size: 18px;\">Best regards,</span> <br> Admin BArtMint</h3>\n"
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
