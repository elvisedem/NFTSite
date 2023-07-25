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

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HULLO
 * @since 30-Jun-2023 13:30:34
 */
@Entity
@Table(name = "user")
public class NewUserClass implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    private int id;
    private String username;
    private String fullname;
    private String address;
    private String email;
    private String phonenumber;
    private String password;
    private String wallet_id;
    private double balance;

    @OneToMany
    @JoinColumn(name = "username")
    private List<NFT> nfts;
    @OneToMany
    @JoinColumn(name = "username")
    private List<CollectionClass> collections;
    

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getFullname()
    {
        return fullname;
    }

    public void setFullname(String fullname)
    {
        this.fullname = fullname;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPhonenumber()
    {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public double getBalance()
    {
        return balance;
    }

    public void setBalance(double balance)
    {
        this.balance = balance;
    }

    public String getWallet_id()
    {
        return wallet_id;
    }

    public void setWallet_id(String wallet_id)
    {
        this.wallet_id = wallet_id;
    }

    public List<NFT> getNfts()
    {
        return nfts;
    }

    public void setNfts(List<NFT> nfts)
    {
        this.nfts = nfts;
    }

    public List<CollectionClass> getCollections()
    {
        return collections;
    }

    public void setCollections(List<CollectionClass> collections)
    {
        this.collections = collections;
    }

}
