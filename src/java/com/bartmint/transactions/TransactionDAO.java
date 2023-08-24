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
package com.bartmint.transactions;

import com.bartmint.dbconfig.DBConfig;
import static com.bartmint.util.Constant.TransactionsConstants.TRANSACTON_TABLE;
import static com.bartmint.util.Constant.TransactionsConstants.USER_ID;
import java.util.List;
import javax.persistence.CacheStoreMode;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author BLAZE
 * @since Aug 24, 2023 1:00:02 AM
 */
public class TransactionDAO
{
    public static void registerNewUserDeposit(Deposit dep) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(dep);
            em.getTransaction().commit();
        }
    }

    public static void registerNewTransactionSlip(Transaction dep) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(dep);
            em.getTransaction().commit();
        }
    }

    public static void registerNewWithdrawalSlip(Withdrawal withdrawal) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(withdrawal);
            em.getTransaction().commit();
        }
    }

    public static List<Transaction> getAllTransactionOfUser(int userId) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT * FROM " + TRANSACTON_TABLE + " WHERE " + USER_ID + " =?";
            Query q = em.createNativeQuery(sql, Transaction.class);
            q.setHint("javax.persistence.cache.storeMode", CacheStoreMode.REFRESH);
            q.setParameter(1, userId);
            List<Transaction> transactions = q.getResultList();
            return transactions;
        }
    }
}