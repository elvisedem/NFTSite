package com.bartmint.users;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BLAZE
 */
@MultipartConfig
public class UploadNFTServlet extends HttpServlet
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
        response.setContentType("text/html");
        try
        {
            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");

            String nftName = request.getParameter("nftName");
            String pricce = request.getParameter("pricce");
            double price = Double.parseDouble(pricce);
            String imageFileName = request.getParameter("art");

            NFT nft = new NFT();
            nft.setArtWorkName(imageFileName);
            nft.setPrice(price);
            nft.setNftName(nftName);
            nft.setUserId(user.getId());
            NFTDAO.registerNewNFTs(nft);

//            JSONObject jsono = new JSONObject();
//            jsono.put("message", "success");
            request.setAttribute("succMsg", "You have Successfully Uploaded " + nftName + " NFT");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-arts?upl=1");
            dispatcher.forward(request, response);

        }
        catch(Exception e)
        {
            request.setAttribute("errMsg", "Your Upload was unsuccessful, please try again!!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("create?upl=0");
            dispatcher.forward(request, response);

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
