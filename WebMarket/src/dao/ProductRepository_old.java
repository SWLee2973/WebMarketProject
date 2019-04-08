package dao;
//로직처리 객체
import java.util.ArrayList;
import dto.Product;

public class ProductRepository_old {
	//싱글톤
	static private  ProductRepository_old instance;
	//싱글톤 getMethod()
	public static ProductRepository_old getInstance() {
		if(instance==null) instance=new ProductRepository_old();
		return instance;
	}
	//Product객체들을 등록하는 list
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	//싱글톤 생성자 
	private  ProductRepository_old() {
		 Product phone = new Product("p1234", "iPhone 6s", 8000000);
		 phone.setCategory("SamrtPhone");
		 phone.setDescription("4.7-inch 1334x750 Retina HD display, 8-megapixel iSight Camera");
		 phone.setManufacturer("Apple");
		 phone.setUnitsInStock(1000);
		 phone.setCondition("New");
		 phone.setFilename("P1234.png");
		 
		 Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		 notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		 notebook.setCategory("Notebook");
		 notebook.setManufacturer("LG");
		 notebook.setUnitsInStock(1000);
		 notebook.setCondition("Refurbished");
		 notebook.setFilename("P1235.png");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
			tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
			tablet.setCategory("Tablet");
			tablet.setManufacturer("Samsung");
			tablet.setUnitsInStock(1000);
			tablet.setCondition("Old");
			tablet.setFilename("P1236.png");

			listOfProducts.add(phone);
			listOfProducts.add(notebook);
			listOfProducts.add(tablet);
	}
	//상품리스트 메소드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	//상품 상세정보
	public Product getProductById(String id){
		Product productById=null;
		for(int i=0;i<listOfProducts.size();i++) {
			  Product product = listOfProducts.get(i);
			  if(product!=null && product.getProductId()!=null) {//null이 아니고
				  if(product.getProductId().equals(id)) {//id가 동일하면 
					  productById = product;
					  break;
			  }
			  }
		}
		return productById;
	}
	
	//신규상품 등록
    public void addProduct(Product product){
    	listOfProducts.add(product);
	}
}
