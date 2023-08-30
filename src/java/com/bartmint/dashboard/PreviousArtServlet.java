package com.bartmint.dashboard;

import com.bartmint.arts.NftArt;
import com.bartmint.arts.NftDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BLAZE
 */
public class PreviousArtServlet extends HttpServlet
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
        PrintWriter out = response.getWriter();
        try
        {
            int itemsPerPage = 50;
            // Get the requested page number from the client request
            String pageNumberParam = request.getParameter("page");
            if(pageNumberParam != null)
            {
                int pageNumber = Integer.parseInt(pageNumberParam);
                int page = pageNumber;
                // Calculate the offset for the database query based on the page number and items per page
                int offset = (pageNumber) * itemsPerPage;
                List<NftArt> nftArts = NftDAO.viewPreviousArts(offset);

// Calculate the total number of pages based on the total number of items and the number of items per page
                int totalItems = NftDAO.getTotalNftArts(); // Get the total number of items (courses) from your data source

                int totalPages = (int)Math.ceil((double)totalItems / itemsPerPage);

                request.setAttribute("totalPages", totalPages);
                request.setAttribute("nftArts", nftArts);
                request.setAttribute("page", page);
                request.getRequestDispatcher("explore.jsp").forward(request, response);
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
