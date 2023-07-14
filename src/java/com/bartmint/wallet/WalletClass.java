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

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author HULLO
 * @since 08-Jul-2023 21:17:09
 */
@Entity
@Table(name = "wallet")
public class WalletClass implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    private int wallet_id;
    private int user_id;
    private String email;
    private double balance;

    public int getWallet_id()
    {
        return wallet_id;
    }

    public void setWallet_id(int wallet_id)
    {
        this.wallet_id = wallet_id;
    }

    public int getUser_id()
    {
        return user_id;
    }

    public void setUser_id(int user_id)
    {
        this.user_id = user_id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public double getBalance()
    {
        return balance;
    }

    public void setBalance(double balance)
    {
        this.balance = balance;
    }
}
