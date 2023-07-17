package com.bartmint.users;

public class NFT
{
    private int id;
    private String nftName;
    private String artWorkName;
    private String collection;
    private double price;

    public static final String NFT_TABLE = "";
    public static final String NFT_ID = "";
    public static final String NFT_NAME = "";
    public static final String NFT_ART = "";
    public static final String NFT_COLLECTION = "";
    public static final String NFT_PRICE = "";

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

    public String getCollection()
    {
        return collection;
    }

    public void setCollection(String collection)
    {
        this.collection = collection;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

}
