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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HULLO
 * @since 05-Jul-2023 15:39:52
 */
@Entity
@Table(name = "nft_collection")
public class CollectionClass implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    private String username;
    private String collection_name;
    private double price;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "cid")
    private List<CollectionArt> collectionArts;

    public static final String COLECTION_TABLE = "nft_collection";
    public static final String COLECTION_USER = "username";

    public String getCollection_name()
    {
        return collection_name;
    }

    public void setCollection_name(String collection_name)
    {
        this.collection_name = collection_name;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public List<CollectionArt> getCollectionArts()
    {
        return collectionArts;
    }

    public void setCollectionArts(List<CollectionArt> collectionArts)
    {
        this.collectionArts = collectionArts;
    }

    public int getCid()
    {
        return cid;
    }

    public void setCid(int cid)
    {
        this.cid = cid;
    }

}
