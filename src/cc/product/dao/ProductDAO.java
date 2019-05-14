package cc.product.dao;

import java.util.List;

import cc.product.dao.domain.Product;

public interface ProductDAO {
	 List<Product> queryAll();

	 List<Product> ProNotSold();
	 List<Product> ProHits();//book  digital  traffic exercise  plant  sundries
	 Product proHits(String category);
	 List<Product> querybycategory(String category);
	 Product querybyid(String id);
	 void deletebyid(String p_id);
}
