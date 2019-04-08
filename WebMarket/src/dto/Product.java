package dto;

import java.io.Serializable;

public class Product implements Serializable{
	//private로 선언한 필드(속성)
	private String productId;
	private String pname;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInStock;
	private String condition;
	private String filename;//파일 경로 필드
	private int     quantity;//주문수량
	
	//기본생성자
	public Product() {}
	//매개변수3개짜리 생성자
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
    //gett/setter메소드
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	//파일경로 저장메소드
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	

}
