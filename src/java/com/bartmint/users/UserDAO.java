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
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author HULLO
 * @since 28-Jun-2023 16:47:45
 */
public class UserDAO
{

    public static void registerNewUsers(NewUserClass users)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(users);
            DBconfigem.getTransaction().commit();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }

    public static NewUserClass getUser(String username) throws Exception
    {
        try(DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            NewUserClass user = em.find(NewUserClass.class, username);
            return user;
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

    public static NewUserClass loginUser(String email, String password) throws Exception
    {
        NewUserClass user = getNewUserClassByEmail(email);
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

    public static boolean emailExists(String email) throws Exception
    {
        try(DBConfig dbConfig = new DBConfig())
        {
            EntityManager em = dbConfig.getEntityManager();
            Query q = em.createNativeQuery("SELECT * FROM `user` WHERE `email` = ?");
            q.setParameter(1, email);
            q.getSingleResult();
            return true;
        }
        catch(NoResultException xcp)
        {
            return false;
        }
    }

    public static void updateNewUser(int userId, String fullname, String address, String phonenumber)
    {
        try(DBConfig dbconfig = new DBConfig())
        {
            EntityManager em = dbconfig.getEntityManager();
            NewUserClass user = em.find(NewUserClass.class, userId);
            em.getTransaction().begin();
            user.setFullname(fullname);
            user.setPhonenumber(phonenumber);
            user.setAddress(address);
            em.getTransaction().commit();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void NewUsersCollection(CollectionClass collection)
    {
        try(DBConfig DBconfig = new DBConfig())
        {
            EntityManager DBconfigem = DBconfig.getEntityManager();
            DBconfigem.getTransaction().begin();
            DBconfigem.persist(collection);
            DBconfigem.getTransaction().commit();
        }
        catch(Exception DBconfig)
        {
            DBconfig.printStackTrace(System.err);
            throw new RuntimeException(DBconfig);
        }
    }
}
