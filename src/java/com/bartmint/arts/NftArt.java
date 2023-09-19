package com.bartmint.arts;

import static com.bartmint.util.Constant.NFTConstants.NFT_TABLE;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author BLAZE
 * @since Aug 24, 2023 3:03:24 AM
 */
@Entity
@Table(name = NFT_TABLE)
public class NftArt implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int artId;
    private int userId;
    private double price;
    private String artName;
    private String imageName;
    private String status;

    public NftArt()
    {
    }

    public int getArtId()
    {
        return artId;
    }

    public void setArtId(int artId)
    {
        this.artId = artId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public String getArtName()
    {
        return artName;
    }

    public void setArtName(String artName)
    {
        this.artName = artName;
    }

    public String getImageName()
    {
        return imageName;
    }

    public void setImageName(String imageName)
    {
        this.imageName = imageName;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}
