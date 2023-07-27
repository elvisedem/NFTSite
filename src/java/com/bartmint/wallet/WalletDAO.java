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
package com.bartmint.wallet;

import com.bartmint.dbconfig.DBConfig;
import com.bartmint.users.NewUserClass;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author HULLO
 * @since 08-Jul-2023 21:24:43
 */
public class WalletDAO
{

    public static void createWallet(WalletClass wallet)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(wallet);
            DBconfigem.getTransaction().commit();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }

    public static NewUserClass getNewUserClassByEmail(String email) throws Exception
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            String sql = "SELECT * FROM `user` WHERE `email` = ?";
            Query q = em.createNativeQuery(sql, NewUserClass.class);
            q.setParameter(1, email);
            NewUserClass nuc = (NewUserClass)q.getSingleResult();
            return nuc;
        }
        catch(NoResultException getNewUserClassByEmail)
        {
            return null;
        }
    }

    public static List<WalletClass> getAllTransactionList() throws Exception
    {
        try(DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            Query q = em.createNativeQuery("SELECT * FROM  user", WalletClass.class);
            List<WalletClass> TransactionList = q.getResultList();
            return TransactionList;
        }

    }
}
