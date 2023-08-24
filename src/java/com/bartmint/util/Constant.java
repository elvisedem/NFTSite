package com.bartmint.util;

public class Constant
{
    public final class UserConstants
    {
        public static final String USER_TABLE = "user";
        public static final String USER_ID = "userId";
        public static final String USER_NAME = "userName";
        public static final String EMAIL = "email";
    }

    public final class UserWalletConstants
    {

        public static final String USER_WALLET_TABLE = "userWallet";
        public static final String USER_ID = "userId";
    }

    public final class UserDepositConstants
    {

        public static final String USER_DEPOSIT_TABLE = "userdeposit";
        public static final String USER_ID = "userId";
        public static final String SUCCESS = "Success";
        public static final String PENDING = "Pending";
        public static final String FAILED = "Failed";
    }

    public final class UserWithdrawalConstants
    {

        public static final String USER_WITHDRAWAL_TABLE = "withdrawal";
        public static final String USER_ID = "userId";
        public static final String SUCCESS = "Success";
        public static final String PENDING = "Pending";
        public static final String FAILED = "Failed";
    }

    public final class TransactionsConstants
    {

        public static final String TRANSACTON_TABLE = "transactions";
        public static final String USER_ID = "userId";

        public final class StatusConstant
        {
            public static final String SUCCESS = "Success";
            public static final String PENDING = "Pending";
            public static final String FAILED = "Failed";
        }

        public final class TransType
        {
            public static final String WITHDRAWAL = "Withdrawal";
            public static final String DEPOSIT = "Deposit";
            public static final String BROUGHT = "Brought";
            public static final String SOLD = "Sold";
        }
    }
}
