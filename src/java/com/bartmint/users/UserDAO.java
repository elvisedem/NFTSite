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
import com.bartmint.security.DigestMatcher;
import static com.bartmint.util.Constant.UserConstants.*;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author BLAZE
 * @since Aug 21, 2023 7:55:56 PM
 */
public class UserDAO
{
    public static int registerNewUser(User user) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(user);
            em.flush();
            em.getTransaction().commit();
            return user.getUserId();
        }
    }

    public static void registerNewUserWallet(UserWallet uw) throws Exception
    {
        try( DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            em.getTransaction().begin();
            em.persist(uw);
            em.getTransaction().commit();
        }
    }

    public static User getUserByUserNameOrEmail(String userNameOrEmail) throws Exception
    {
        try( DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            String sql = "SELECT * FROM " + USER_TABLE + " WHERE " + EMAIL + " = ? OR " + USER_NAME + " = ?";
            Query q = em.createNativeQuery(sql, User.class);
            q.setParameter(1, userNameOrEmail);
            q.setParameter(2, userNameOrEmail);
            User user = (User)q.getSingleResult();
            return user;
        }
        catch(NoResultException nre)
        {
            return null;
        }
    }

    public static User loginUser(String userName, String password) throws Exception
    {
        User user = getUserByUserNameOrEmail(userName);
        if(user != null)
        {
            DigestMatcher matcher = new DigestMatcher();
            String salt = matcher.getSalt(user.getPassword());
            boolean matched = matcher.doMatch(password, salt);
            if(matched)
            {
                user.setPassword(null);
                return user;
            }
            else
                return null;
        }
        else
            return null;
    }

    public static User getUserByEmail(String email) throws Exception
    {
        try( DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            String sql = "SELECT * FROM " + USER_TABLE + " WHERE " + EMAIL + " = ?";
            Query q = em.createNativeQuery(sql, User.class);
            q.setParameter(1, email);
            User user = (User)q.getSingleResult();
            return user;
        }
        catch(NoResultException nre)
        {
            return null;
        }
    }

    public static User getUserByUserName(String email) throws Exception
    {
        try( DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            String sql = "SELECT * FROM " + USER_TABLE + " WHERE " + USER_NAME + " = ?";
            Query q = em.createNativeQuery(sql, User.class);
            q.setParameter(1, email);
            User user = (User)q.getSingleResult();
            return user;
        }
        catch(NoResultException nre)
        {
            return null;
        }
    }
}
