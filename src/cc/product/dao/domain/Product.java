package cc.product.dao.domain;

public class Product {
	private int p_id;//商品ID
	private String p_name;//商品名称
	private double price;// 商品价格
	private String category; //商品类别
	private String p_description;//商品描述   book  digital  traffic exercise  plant  sundries
	private String p_soler;//售卖人
	private String has_sold; //是否已售
	private String p_picture;//商品图片
	private int p_hits;//商品浏览量





	public Product()
	{
		
	}
	
	
	





	public String getHas_sold() {
		return has_sold;
	}

	public void setHas_sold(int has_sold) {
		if(has_sold==0) {
		this.has_sold = "未售";
		}
		else{
		this.has_sold="已售";
		}
	}








	public String getP_soler() {
		return p_soler;
	}



	public void setP_soler(String p_soler) {
		this.p_soler = p_soler;
	}



	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public String getP_picture() {
		return p_picture;
	}



	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}


	public int getP_hits() {
		return p_hits;
	}



	public void setP_hits(int p_hits) {
		this.p_hits = p_hits;
	}



}
