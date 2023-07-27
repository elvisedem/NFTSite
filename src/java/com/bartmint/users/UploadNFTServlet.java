package com.bartmint.users;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author BLAZE
 */
@MultipartConfig
public class UploadNFTServlet extends HttpServlet
{
    public static final String IMAGES_DIRECTORY = "images";

    private static final String UPLOADS_PATH = "/";
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
        response.setContentType("json/application");
        try
        {
            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");
            ServletContext adminContext = request.getServletContext();
            ServletContext uploadsContext = adminContext.getContext(UPLOADS_PATH);
            String absolutePath = uploadsContext.getRealPath("");

            String nftName = request.getParameter("nftName");
            String pricce = request.getParameter("pricce");
            double price = Double.parseDouble(pricce);
            Part imagefile = request.getPart("image");
            String imageFileName = imagefile.getSubmittedFileName();
            // Compress the project image
            BufferedImage compressedImage = compressImage(imagefile.getInputStream());

            // Generate a unique file name for the compressed image
            String compressedImageFileName = generateUniqueFileName(imageFileName, user.getFullname());

            // Save the compressed image
            File compressedImageFile = new File(absolutePath + File.separator + IMAGES_DIRECTORY + File.separator + compressedImageFileName);
            ImageIO.write(compressedImage, "jpeg", compressedImageFile);

            NFT nft = new NFT();
            nft.setArtWorkName(compressedImageFileName);
            nft.setPrice(price);
            nft.setNftName(nftName);
            nft.setUserId(user.getId());
            NFTDAO.registerNewNFTs(nft);

//            JSONObject jsono = new JSONObject();
//            jsono.put("message", "success");
            request.setAttribute("succMsg", "You have Successfully Uploaded " + nftName + " NFT");
            RequestDispatcher dispatcher = request.getRequestDispatcher("nftcollection?upl=1");
            dispatcher.forward(request, response);

        }
        catch(Exception e)
        {

            request.setAttribute("errMsg", "Your Upload was unsuccessful, please try again!!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("create?upl=0");
            dispatcher.forward(request, response);
//            e.printStackTrace(System.err);
//            throw new RuntimeException(e);
        }
    }

    private BufferedImage compressImage(InputStream imageStream) throws IOException
    {
        BufferedImage originalImage = ImageIO.read(imageStream);

        // Perform your image compression logic here
        // You can use libraries like ImageIO or third-party libraries to achieve compression.
        // Below is an example using ImageIO write method with compression quality set to 0.8 (adjust as needed).
        BufferedImage compressedImage = new BufferedImage(originalImage.getWidth(), originalImage.getHeight(),
                BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = compressedImage.createGraphics();
        graphics.drawImage(originalImage, 0, 0, null);
        graphics.dispose();

        return compressedImage;
    }

    private String generateUniqueFileName(String originalFileName, String userName)
    {
        // Generate a unique file name for the compressed image
        String baseName = userName + originalFileName.substring(0, originalFileName.lastIndexOf('.'));
        String extension = originalFileName.substring(originalFileName.lastIndexOf('.') + 1);
        String compressedImageFileName = baseName + extension;

        return compressedImageFileName;
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
