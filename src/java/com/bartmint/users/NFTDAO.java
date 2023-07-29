package com.bartmint.users;

import com.bartmint.dbconfig.DBConfig;
import static com.bartmint.users.CollectionClass.COLECTION_TABLE;
import static com.bartmint.users.CollectionClass.COLECTION_USER;
import static com.bartmint.users.NFT.NFT_TABLE;
import static com.bartmint.users.NFT.NFT_USER_ID;
import java.util.List;
import javax.persistence.CacheStoreMode;
import javax.persistence.EntityManager;
import javax.persistence.Query;

public class NFTDAO
{
    public static void registerNewNFTs(NFT nft)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(nft);
            DBconfigem.getTransaction().commit();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }

    public static int registerNewCollections(CollectionClass cc)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(cc);
            DBconfigem.flush();
            DBconfigem.getTransaction().commit();
            return cc.getCid();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }

    public static List<CollectionClass> getAllUserCollection(String username) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            String sql = "SELECT * FROM " + COLECTION_TABLE + " WHERE " + COLECTION_USER + " =? LIMIT 50";
            Query q = em.createNativeQuery(sql, CollectionClass.class);
            q.setParameter(1, username);
            List<CollectionClass> userCollection = q.getResultList();
            return userCollection;
        }
    }

    public static List<NFT> getAllUserNfts(int userId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            String sql = "SELECT * FROM " + NFT_TABLE + " WHERE " + NFT_USER_ID + " =? LIMIT 50";
            Query q = em.createNativeQuery(sql, NFT.class);
            q.setParameter(1, userId);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            List<NFT> userCollection = q.getResultList();
            return userCollection;
        }
    }

    public static void registerNewCollectionArt(CollectionArt ca)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(ca);
            DBconfigem.getTransaction().commit();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }
}
