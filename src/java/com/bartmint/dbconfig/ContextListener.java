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
package com.bartmint.dbconfig;

import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author HULLO
 * @since 28-Jun-2023 16:35:38
 */
public class ContextListener implements ServletContextListener
{
    public ContextListener()
    {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        this.loadEntityManagerFactory();
    }

    private void loadEntityManagerFactory()
    {
        DBConfig.remoteEntityManagerFactory = Persistence.createEntityManagerFactory("BartMintPU");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {
    }
}
