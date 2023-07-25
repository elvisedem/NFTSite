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

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HULLO
 */
public class CollectionServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public static final String IMAGES_DIRECTORY = "images";

    private static final String UPLOADS_PATH = "/";

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
//            HttpSession session = request.getSession(false);
//            NewUserClass user = (NewUserClass)session.getAttribute("user");
//
//            CollectionClass collection = validateCollection(request, user.getId());
//            UserDAO.NewUsersCollection(collection);
//            JSONObject jsono = new JSONObject();
//            jsono.put("message", "success");
//            out.print(jsono);

            HttpSession session = request.getSession(false);
            NewUserClass user = (NewUserClass)session.getAttribute("user");
            ServletContext adminContext = request.getServletContext();
            ServletContext uploadsContext = adminContext.getContext(UPLOADS_PATH);
            String absolutePath = uploadsContext.getRealPath("");

            String collectionName = request.getParameter("collection_name").trim();
            double price = Double.parseDouble(request.getParameter("price"));
            Part imagefile = request.getPart("image");
            String imageFileName = imagefile.getSubmittedFileName();
            // Compress the project image

            BufferedImage compressedImage = compressImage(imagefile.getInputStream());

            // Generate a unique file name for the compressed image
            String compressedImageFileName = generateUniqueFileName(imageFileName, user.getFullname());

            // Save the compressed image
            File compressedImageFile = new File(absolutePath + File.separator + IMAGES_DIRECTORY + File.separator + compressedImageFileName);
            ImageIO.write(compressedImage, "jpeg", compressedImageFile);

            CollectionClass collection = new CollectionClass();
            collection.setCollection_name(collectionName);
            collection.setPrice(price);
            collection.setPicture_name(compressedImageFileName);
            UserDAO.NewUsersCollection(collection);

            RequestDispatcher dispatcher = request.getRequestDispatcher("");
            dispatcher.forward(request, response);
        }
        catch(IOException | NumberFormatException | ServletException e)
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

//    private CollectionClass validateCollection(HttpServletRequest request, int id)
//    {
//        try
//        {
//            String collectionName = request.getParameter("collection_name").trim();
//            String price = request.getParameter("price").trim();
//            String pictureName = request.getParameter("picture_name").trim();
//            String miniWithdrawal = request.getParameter("mini_withdrawal").trim();
//            int uid = id;
//
//            CollectionClass collection = new CollectionClass();
//            collection.setCollection_name(collectionName);
//            collection.setPrice(price);
//            collection.setMini_withdrawal(miniWithdrawal);
//            collection.setUserId(uid);
//            collection.setPicture_name(pictureName);
//
//            Part imagePart = request.getPart("image");
//            String uniqueFileName = generateUniqueFileName(imagePart);
//            storeImage(imagePart, uniqueFileName);
//            collection.setPicture_name(uniqueFileName);
//
//            return collection;
//        }
//        catch(IOException | ServletException e)
//        {
//            e.printStackTrace(System.err);
//            throw new RuntimeException(e);
//        }
//    }
//    private String generateUniqueFileName(Part imagePart)
//    {
//        String originalFileName = extractFileName(imagePart);
//        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//        String uniqueFileName = UUID.randomUUID().toString() + extension;
//        return uniqueFileName;
//    }
//
//    private String extractFileName(Part part)
//    {
//        String contentDisposition = part.getHeader("content-disposition");
//        String[] parts = contentDisposition.split(";");
//        for(String partInfo : parts)
//            if(partInfo.trim().startsWith("filename"))
//                return partInfo.substring(partInfo.indexOf('=') + 1).trim().replace("\"", "");
//        return "";
//    }
//
//    private void storeImage(Part imagePart, String pictureName) throws IOException
//    {
//        String uploadDirectory = "/nfts/images"; // Replace with the actual directory path
//        File uploadDir = new File(uploadDirectory);
//        if(!uploadDir.exists())
//            if(!uploadDir.mkdirs())
//                throw new IOException("Failed to create the upload directory.");
//        String filePath = uploadDirectory + File.separator + pictureName;
//        imagePart.write(filePath);
//    }
}
