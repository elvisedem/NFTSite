/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bartmint.dbconfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;

/**
 *
 * @author Jevison7x
 */
public final class DBConfig implements AutoCloseable
{
    public static EntityManagerFactory remoteEntityManagerFactory;

    private EntityManager entityManager;

    public DBConfig()
    {
        this.entityManager = createEntityManager();
    }

    public EntityManager getEntityManager()
    {
        return entityManager;
    }

    public static EntityManager createEntityManager()
    {
        try
        {
            return remoteEntityManagerFactory.createEntityManager();
        }
        catch(PersistenceException xcp)
        {
            throw new RuntimeException(xcp);
        }
    }

    @Override
    public void close() throws Exception
    {
        this.entityManager.close();
    }
}
