package com.bartmint.users;

import com.bartmint.dbconfig.DBConfig;
import static com.bartmint.util.Constant.UserWalletConstants.USER_ID;
import static com.bartmint.util.Constant.UserWalletConstants.USER_WALLET_TABLE;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author BLAZE
 * @since Aug 21, 2023 7:56:26 PM
 */
public class UserWalletDAO
{

    public static UserWallet getUserWalletById(int userId) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + USER_WALLET_TABLE + " WHERE " + USER_ID + " =?";
            Query q = em.createNativeQuery(sql, UserWallet.class);
            q.setParameter(1, userId);
            UserWallet uw = (UserWallet)q.getSingleResult();
            em.getTransaction().commit();
            return uw;
        }
    }

    public static void updateUserBalance(UserWallet uw, double balance) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            UserWallet userWallet = em.find(UserWallet.class, uw.getId());
            userWallet.setBalance(balance);
            em.getTransaction().commit();
        }
    }
}
