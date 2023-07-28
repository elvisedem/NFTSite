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
import javax.persistence.Entity;
import javax.persistence.Id;
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
    private int id;
    private String track_id;
    private String username;
    private String collection_name;
    private String price;
    private String picture_name;
    private String mini_withdrawal;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getCollection_name()
    {
        return collection_name;
    }

    public void setCollection_name(String collection_name)
    {
        this.collection_name = collection_name;
    }

    public String getPrice()
    {
        return price;
    }

    public void setPrice(String price)
    {
        this.price = price;
    }

    public String getPicture_name()
    {
        return picture_name;
    }

    public void setPicture_name(String picture_name)
    {
        this.picture_name = picture_name;
    }

    public String getMini_withdrawal()
    {
        return mini_withdrawal;
    }

    public void setMini_withdrawal(String mini_withdrawal)
    {
        this.mini_withdrawal = mini_withdrawal;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getTrack_id()
    {
        return track_id;
    }

    public void setTrack_id(String track_id)
    {
        this.track_id = track_id;
    }

}
