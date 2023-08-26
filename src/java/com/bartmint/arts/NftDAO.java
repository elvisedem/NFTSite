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
package com.bartmint.arts;

import com.bartmint.dbconfig.DBConfig;
import static com.bartmint.util.Constant.NFTConstants.NFT_ART_ID;
import static com.bartmint.util.Constant.NFTConstants.NFT_TABLE;
import java.util.List;
import javax.persistence.CacheStoreMode;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author BLAZE
 * @since Aug 24, 2023 3:21:59 AM
 */
public class NftDAO
{
    public static void registerNewNFTs(NftArt nft) throws Exception
    {
        try( DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(nft);
            DBconfigem.getTransaction().commit();
        }
    }

    public static int registerNewCollection(Collection cc) throws Exception
    {
        try( DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(cc);
            DBconfigem.flush();
            DBconfigem.getTransaction().commit();
            return cc.getcId();
        }
    }

    public static void registerNewCollectionArt(CollectionArt ca) throws Exception
    {
        try( DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(ca);
            DBconfigem.getTransaction().commit();
        }
    }

    public static List<NftArt> getArts() throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + "  LIMIT 50";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            List<NftArt> nftArts = q.getResultList();
            return nftArts;
        }
    }

    public static int getTotalNftArts()
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT COUNT(*) FROM " + NFT_TABLE;
            Query q = em.createNativeQuery(sql);
            // Execute the query and get the result
            Object result = q.getSingleResult();

            // Cast the result to Integer and return the total count
            return ((Number)result).intValue();
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            return -1;
        }
    }

    public static List<NftArt> viewPreviousArts(int lastIndex)
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            q.setParameter(1, 50);
            q.setParameter(2, lastIndex - 50);
            List<NftArt> prevArts = q.getResultList();
            return prevArts;
        }
        catch(Exception e)
        {
            return null;
        }
    }

    public static List<NftArt> viewMoreNftArts(int lastIndex) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            q.setParameter(1, 50);
            q.setParameter(2, lastIndex);
            List<NftArt> moreArts = q.getResultList();
            return moreArts;
        }
    }

    public static NftArt getNftArtById(int artId) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + "WHERE " + NFT_ART_ID + " =?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setParameter(1, artId);
            NftArt nftArt = (NftArt)q.getSingleResult();
            return nftArt;
        }
    }
}
