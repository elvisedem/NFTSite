package com.bartmint.transactions;

import static com.bartmint.util.Constant.UserWithdrawalConstants.USER_WITHDRAWAL_TABLE;
import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author BLAZE
 * @since Aug 24, 2023 2:08:44 AM
 */
@Entity
@Table(name = USER_WITHDRAWAL_TABLE)
public class Withdrawal implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int tId;
    private int userId;
    private double amount;
    private String walletAddress;
    private String status;
    private Timestamp date;

    public Withdrawal()
    {
    }

    public int gettId()
    {
        return tId;
    }

    public void settId(int tId)
    {
        this.tId = tId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public double getAmount()
    {
        return amount;
    }

    public void setAmount(double amount)
    {
        this.amount = amount;
    }

    public String getWalletAddress()
    {
        return walletAddress;
    }

    public void setWalletAddress(String walletAddress)
    {
        this.walletAddress = walletAddress;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Timestamp getDate()
    {
        return date;
    }

    public void setDate(Timestamp date)
    {
        this.date = date;
    }
}
