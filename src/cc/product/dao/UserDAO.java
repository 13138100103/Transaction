package cc.product.dao;

import java.util.List;

import cc.product.dao.domain.Account;


public interface UserDAO {
	 void saveUser(Account account);
	 boolean findUser(String username, String pwd);
	 boolean checkUser(String username);
	 List<Account> AllUser();
	 void deleteById(String id);
	 
}
