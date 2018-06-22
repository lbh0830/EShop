package com.shop.DAO;

import com.shop.model.AccountBean;

public interface IAccountDAO {
    boolean isUserExisted(AccountBean account);
    void addAccount(AccountBean account);
    AccountBean getAccount(AccountBean account); 
}
