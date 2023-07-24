package com.bartmint.users;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nft")
public class NFT implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    private int id;
    private String username;
    private String nftName;
    private String artWorkName;
    private double price;

    public static final String NFT_TABLE = "nft";
    public static final String NFT_ID = "id";
    public static final String NFT_NAME = "nftName";
    public static final String NFT_ART = "artWorkName";
    public static final String NFT_PRICE = "price";

    public NFT()
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

    public String getNftName()
    {
        return nftName;
    }

    public void setNftName(String nftName)
    {
        this.nftName = nftName;
    }

    public String getArtWorkName()
    {
        return artWorkName;
    }

    public void setArtWorkName(String artWorkName)
    {
        this.artWorkName = artWorkName;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

}
