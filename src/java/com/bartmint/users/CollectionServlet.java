/*
 * Copyright (c) 2018, Xyneex Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact Xyneex Technologies, #1 Orok Orok Street, Calabar, Nigeria.
 * or visit www.xyneex.com if you need additional information or have any
 * questions.
 */
package com.bartmint.users;

import com.bartmint.util.RandomNumberGenerator;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import javax.imageio.ImageIO;
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
 * @author HULLO
 */
@MultipartConfig
public class CollectionServlet extends HttpServlet
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
        response.setContentType("application/json");
        try
        {

            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");
            ServletContext adminContext = request.getServletContext();
            ServletContext uploadsContext = adminContext.getContext(UPLOADS_PATH);
            String absolutePath = uploadsContext.getRealPath("");

            String track_id = RandomNumberGenerator.generateRandomAlphanumericCharacters(10);
            String collectionName = request.getParameter("collectionName");
            double price = Double.parseDouble(request.getParameter("price"));
            Collection<Part> fileParts = request.getParts();
            for(Part filePart : fileParts)
                if(filePart.getContentType() != null && filePart.getContentType().startsWith("image/"))
                {
                    String imageFileName = filePart.getSubmittedFileName();
                    BufferedImage compressedImage = compressImage(filePart.getInputStream());
                    String compressedImageFileName = generateUniqueFileName(imageFileName, user.getFullname());
                    File compressedImageFile = new File(absolutePath + File.separator + IMAGES_DIRECTORY + File.separator + compressedImageFileName);
                    ImageIO.write(compressedImage, "jpeg", compressedImageFile);

                    CollectionClass cc = new CollectionClass();
                    cc.setCollection_name(collectionName);
                    cc.setPicture_name(compressedImageFileName);
                    cc.setPrice(imageFileName);
                    cc.setTrack_id(track_id);
                    cc.setUsername(user.getUsername());
                    NFTDAO.registerNewCollections(cc);
                }

        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            throw new RuntimeException(e);
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
