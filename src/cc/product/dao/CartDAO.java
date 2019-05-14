package cc.product.dao;

import java.util.List;

import cc.product.dao.domain.Product;

public interface CartDAO {
	 void addproduct(Product pro,String user);
	 List<Product> querycart(String user);



}
