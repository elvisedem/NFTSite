package com.bartmint.users;

import static com.bartmint.util.Constant.UserWalletConstants.USER_WALLET_TABLE;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author BLAZE
 * @since Aug 21, 2023 7:56:14 PM
 */
@Entity
@Table(name = USER_WALLET_TABLE)
public class UserWallet implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    private int id;
    private int userId;
    private double balance;

    public UserWallet()
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

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
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
