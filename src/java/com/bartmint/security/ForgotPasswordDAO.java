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
package com.bartmint.security;

import com.bartmint.dbconfig.DBConfig;
import com.bartmint.security.ForgotPassword.Constraints;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author BLAZE
 * @since Jul 14, 2023 2:04:16 PM
 */
public class ForgotPasswordDAO
{
    public static void registerNewRecord(ForgotPassword forgetPassword) throws Exception, EntityExistsException
    {
        try(DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(forgetPassword);
            em.getTransaction().commit();
        }
    }

    public static ForgotPassword getUserDetails(String token) throws Exception
    {

        try(DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            String sql = "SELECT * FROM " + Constraints.FORGOT_PASSWORD_TABLE + " WHERE " + Constraints.FORGOT_PASSWORD_TOKEN + " = ?";
            Query q = em.createNativeQuery(sql, ForgotPassword.class);
            q.setParameter(1, token);
            ForgotPassword forgetPassword = (ForgotPassword)q.getSingleResult();
            return forgetPassword;
        }
        catch(NoResultException nre)
        {
            return null;
        }
    }
}
