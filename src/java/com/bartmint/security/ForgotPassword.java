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

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author BLAZE
 * @since Jul 14, 2023 1:52:14 PM
 */
@Entity
@Table(name = "")
public class ForgotPassword implements Serializable
{
    @Id
    private int id;
    private String email;
    private String token;

    public ForgotPassword()
    {
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public static final class Constraints
    {
        public static final String FORGOT_PASSWORD_TABLE = "";
        public static final String FORGOT_PASSWORD_ID = "";
        public static final String FORGOT_PASSWORD_EMAIL = "";
        public static final String FORGOT_PASSWORD_TOKEN = "";
    }
}
