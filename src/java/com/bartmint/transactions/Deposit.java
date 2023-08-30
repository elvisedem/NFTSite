package com.bartmint.transactions;

import static com.bartmint.util.Constant.UserDepositConstants.USER_DEPOSIT_TABLE;
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
 * @since Aug 24, 2023 12:55:01 AM
 */
@Entity
@Table(name = USER_DEPOSIT_TABLE)
public class Deposit implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int tId;
    private int userId;
    private double amount;
    private String status;
    private Timestamp date;

    public Deposit()
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

    public Timestamp getDate()
    {
        return date;
    }

    public void setDate(Timestamp date)
    {
        this.date = date;
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
