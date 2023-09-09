package com.bartmint.arts;

import com.bartmint.dbconfig.DBConfig;
import static com.bartmint.util.Constant.CollectionConstants.*;
import static com.bartmint.util.Constant.NFTConstants.*;
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
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(nft);
            DBconfigem.getTransaction().commit();
        }
    }

    public static int registerNewCollection(Collection cc) throws Exception
    {
        try(DBConfig DBconfig = new DBConfig())
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
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(ca);
            DBconfigem.getTransaction().commit();
        }
    }

//    public static List<NftArt> getArts() throws Exception
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + NFT_TABLE + "  LIMIT 50";
//            Query q = em.createNativeQuery(sql, NftArt.class);
//            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
//            List<NftArt> nftArts = q.getResultList();
//            em.getTransaction().commit();
//            return nftArts;
//        }
//    }
    public static List<NftArt> getArts() throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT 50";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);

            // Use explicit casting to specify the expected type
            List<NftArt> nftArts = (List<NftArt>)q.getResultList();

            em.getTransaction().commit();
            return nftArts;
        }
    }

    public static int getTotalNftArts()
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT COUNT(*) FROM " + NFT_TABLE;
            Query q = em.createNativeQuery(sql);
            // Execute the query and get the result
            Object result = q.getSingleResult();
            em.getTransaction().commit();
            // Cast the result to Integer and return the total count
            return ((Number)result).intValue();
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            return -1;
        }
    }

    public static int getTotalUserNftArts(int userId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();

            String sql = "SELECT COUNT(*) FROM " + NFT_TABLE + " WHERE " + USER_ID + " = ?";
            Query q = em.createNativeQuery(sql);
            q.setParameter(1, userId);

            // Execute the query and get the result
            Object result = q.getSingleResult();

            em.getTransaction().commit(); // Commit the transaction

            // Cast the result to Long (as count result can be large) and return as int
            return ((Number)result).intValue();
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
            throw e; // Rethrow the exception to indicate the error to the caller
        }
    }

//    public static List<NftArt> viewPreviousArts(int lastIndex)
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
//            Query q = em.createNativeQuery(sql, NftArt.class);
//            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
//            q.setParameter(1, 50);
//            q.setParameter(2, lastIndex - 50);
//            List<NftArt> prevArts = q.getResultList();
//            em.getTransaction().commit();
//            return prevArts;
//        }
//        catch(Exception e)
//        {
//            return null;
//        }
//    }
    public static List<NftArt> viewPreviousArts(int lastIndex)
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            q.setParameter(1, 50);
            q.setParameter(2, lastIndex - 50);

            // Use explicit casting to specify the expected type
            List<NftArt> prevArts = (List<NftArt>)q.getResultList();

            em.getTransaction().commit();
            return prevArts;
        }
        catch(Exception e)
        {
            return null;
        }
    }

//    public static List<NftArt> viewMoreNftArts(int lastIndex) throws Exception
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
//            Query q = em.createNativeQuery(sql, NftArt.class);
//            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
//            q.setParameter(1, 50);
//            q.setParameter(2, lastIndex);
//            List<NftArt> moreArts = q.getResultList();
//            em.getTransaction().commit();
//            return moreArts;
//        }
//    }
    public static List<NftArt> viewMoreNftArts(int lastIndex) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " LIMIT ? OFFSET ?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            q.setParameter(1, 50);
            q.setParameter(2, lastIndex);

            // Use explicit casting to specify the expected type
            List<NftArt> moreArts = (List<NftArt>)q.getResultList();

            em.getTransaction().commit();
            return moreArts;
        }
    }

    public static NftArt getNftArtById(int artId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " WHERE " + NFT_ART_ID + " =?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setParameter(1, artId);
            NftArt nftArt = (NftArt)q.getSingleResult();
            em.getTransaction().commit();
            return nftArt;
        }
    }

//    public static List<NftArt> getNftArtByUserId(int userId) throws Exception
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + NFT_TABLE + " WHERE " + USER_ID + " =?";
//            Query q = em.createNativeQuery(sql, NftArt.class);
//            q.setParameter(1, userId);
//            List<NftArt> nftArt = q.getResultList();
//            em.getTransaction().commit();
//            return nftArt;
//        }
//    }
    public static List<NftArt> getNftArtByUserId(int userId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + NFT_TABLE + " WHERE " + USER_ID + " =?";
            Query q = em.createNativeQuery(sql, NftArt.class);
            q.setParameter(1, userId);

            // Use explicit casting to specify the expected type
            List<NftArt> nftArt = (List<NftArt>)q.getResultList();

            em.getTransaction().commit();
            return nftArt;
        }
    }

//    public static List<Collection> getCollectionsByUserId(int userId) throws Exception
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + COLLECTION_TABLE + " WHERE " + USER_ID + " =?";
//            Query q = em.createNativeQuery(sql, Collection.class);
//            q.setParameter(1, userId);
//            List<Collection> collections = q.getResultList();
//            em.getTransaction().commit();
//            return collections;
//        }
//    }
    public static List<Collection> getCollectionsByUserId(int userId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + COLLECTION_TABLE + " WHERE " + USER_ID + " =?";
            Query q = em.createNativeQuery(sql, Collection.class);
            q.setParameter(1, userId);

            // Use explicit casting to specify the expected type
            List<Collection> collections = (List<Collection>)q.getResultList();

            em.getTransaction().commit();
            return collections;
        }
    }

    public static Collection getCollectionById(int id) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + COLLECTION_TABLE + " WHERE " + C_ID + " =?";
            Query q = em.createNativeQuery(sql, Collection.class);
            q.setParameter(1, id);
            Collection collection = (Collection)q.getSingleResult();
            em.getTransaction().commit();
            return collection;
        }
    }

//    public static List<CollectionArt> getCollectionArtsById(int id) throws Exception
//    {
//        try(DBConfig dbconfig = new DBConfig())
//        {
//            EntityManager em = dbconfig.getEntityManager();
//            em.getTransaction().begin();
//            String sql = "SELECT * FROM " + COLLECTION_ART_TABLE + " WHERE " + C_ID + " =?";
//            Query q = em.createNativeQuery(sql, CollectionArt.class);
//            q.setParameter(1, id);
//            List<CollectionArt> collectionArts = q.getResultList();
//            em.getTransaction().commit();
//            return collectionArts;
//        }
//    }
    public static List<CollectionArt> getCollectionArtsById(int id) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + COLLECTION_ART_TABLE + " WHERE " + C_ID + " =?";
            Query q = em.createNativeQuery(sql, CollectionArt.class);
            q.setParameter(1, id);

            // Use explicit casting to specify the expected type
            List<CollectionArt> collectionArts = (List<CollectionArt>)q.getResultList();

            em.getTransaction().commit();
            return collectionArts;
        }
    }

}
