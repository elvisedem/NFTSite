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
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + USER_WALLET_TABLE + " WHERE " + USER_ID + " =?";
            Query q = em.createNativeQuery(sql, UserWallet.class);
            q.setParameter(1, userId);
            UserWallet uw = (UserWallet)q.getSingleResult();
            return uw;
        }
    }

    public static void updateUserBalance(UserWallet uw, double balance) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            UserWallet userWallet = em.find(UserWallet.class, uw.getId());
            userWallet.setBalance(balance);
            em.getTransaction().commit();
        }
    }
}
