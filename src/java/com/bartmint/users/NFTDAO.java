package com.bartmint.users;

import com.bartmint.dbconfig.DBConfig;
import javax.persistence.EntityManager;

public class NFTDAO
{
    public static void registerNewUsers(NFT nft)
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
}
