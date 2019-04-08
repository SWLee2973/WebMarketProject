package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//로직처리 객체
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Product;

public class ProductRepository {
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
	public Connection con=null;
	//싱글톤
	static private  ProductRepository instance;
	//싱글톤 getMethod()
	public static ProductRepository getInstance() {
		if(instance==null) instance=new ProductRepository();
		return instance;
	}
	//Product객체들을 등록하는 list
	public ArrayList<Product> listOfProducts = new ArrayList<>();
	//싱글톤 생성자 
	private  ProductRepository() {}
	
	//connection메소드
public void getConnection() {
	/*
	 * String url="jdbc:mysql://localhost:3306/webmarketdb"; String user="root";
	 * String password="1234"; try { Class.forName("com.mysql.jdbc.Driver");
	 * con=DriverManager.getConnection(url, user, password); } catch (Exception e) {
	 * e.printStackTrace(); } }
	 */
	
	  Context initContext; 
	  try {
		  initContext = new
	  InitialContext(); Context envContext =
	  (Context)initContext.lookup("java:/comp/env"); 
	  DataSource ds =
	  (DataSource)envContext.lookup("jdbc/WebMarketDB"); 
	  con = ds.getConnection(); 
	  System.out.print("connection:"+(con!=null?"연결성공":"연결실패"));
	  }
	  catch (Exception e) {
		  e.printStackTrace();
	  } 
}
	 
	
	//상품리스트 메소드
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			       getConnection();
				  pstmt = con.prepareStatement("select * from product order by p_id");
				  rs = pstmt.executeQuery();
				  
				  while(rs.next()) {
				  Product p = new Product();
				  int i=0;
				  p.setProductId(rs.getString(++i));
				  p.setPname(rs.getString(++i));
				  p.setUnitPrice(rs.getInt(++i));
				  p.setDescription(rs.getString(++i));
				  p.setCategory(rs.getString(++i));
				  p.setManufacturer(rs.getString(++i));
				  p.setUnitsInStock(rs.getLong(++i));
				  p.setCondition(rs.getString(++i)); 
				  p.setFilename(rs.getString(++i));
				  
				  list.add(p);
				 
			    }
			/* System.out.println(cnt); */
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		
		return list;
	}
	//상품 상세정보
	public Product getProductById(String id){
		Product productById=null;
		String sql ="select * from product where p_id=?";
		 try {
			 getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 int i=0;
				 productById=new Product();
				 productById.setProductId(rs.getString(++i));
				 productById.setPname(rs.getString(++i));
				 productById.setUnitPrice(rs.getInt(++i));
				 productById.setDescription(rs.getString(++i));
				 productById.setCategory(rs.getString(++i));
				 productById.setManufacturer(rs.getString(++i));
				 productById.setUnitsInStock(rs.getLong(++i));
				 productById.setCondition(rs.getString(++i)); 
				 productById.setFilename(rs.getString(++i));
			 }
		} catch (SQLException e) {	e.printStackTrace();		}
		return productById;
	}
	
	//신규상품 등록
    public int addProduct(Product product){
		String sql ="INSERT INTO product VALUES(?, ?,?, ?, ?, ?,?, ?,?)";
		int result=0;
		 try {
			      getConnection();
			    con.setAutoCommit(false);
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, product.getProductId());
			    pstmt.setString(2, product.getPname());
			    pstmt.setInt(3, product.getUnitPrice());
			    pstmt.setString(4, product.getDescription());
			    pstmt.setString(5, product.getCategory());
			    pstmt.setString(6, product.getManufacturer());
			    pstmt.setLong(7, product.getUnitsInStock());
			    pstmt.setString(8,product.getCondition());
			    pstmt.setString(9,product.getFilename());
			  
			    result = pstmt.executeUpdate();
			    con.commit();
		} catch (SQLException e) {	
			try {
				con.rollback();
			} catch (SQLException e1) { e1.printStackTrace();	}
			e.printStackTrace();		
		}finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {	e.printStackTrace();	}
		}
		return result;
	}
	
    //수정
    public  int updateProduct(Product product){
    	   int result=0;
    	      String sql="";
    	try {
    		  getConnection();//연결객체 얻기
    		  
    		  if(product.getFilename()!=null) {
    			  sql="update product set " + 
    			  		" p_name=?, " + 
    			  		" p_unitPrice=?,     " + 
    			  		" p_description =?,   " + 
    			  		" p_category=?,    " + 
    			  		" p_manufacturer=?,     " + 
    			  		" p_unitsInStock=?,     " + 
    			  		" p_condition=?,     " + 
    			  		" p_fileName=?     " + 
    			  		"where p_id =?";
    			    pstmt=con.prepareStatement(sql);
    			 
    			    pstmt.setString(1, product.getPname());
    			    pstmt.setInt(2, product.getUnitPrice());
    			    pstmt.setString(3, product.getDescription());
    			    pstmt.setString(4, product.getCategory());
    			    pstmt.setString(5, product.getManufacturer());
    			    pstmt.setLong(6, product.getUnitsInStock());
    			    pstmt.setString(7,product.getCondition());
    			    pstmt.setString(8,product.getFilename());
    			    pstmt.setString(9, product.getProductId());
    			   result= pstmt.executeUpdate();
    			  
    		  }else {
    			  sql="update product set " + 
    			  		" p_name=?, " + 
    			  		" p_unitPrice=?,     " + 
    			  		" p_description =?,   " + 
    			  		" p_category=?,    " + 
    			  		" p_manufacturer=?,     " + 
    			  		" p_unitsInStock=?,     " + 
    			  		" p_condition=?     " + 
    			  		"where p_id =?";	
    			  
    			  pstmt=con.prepareStatement(sql);
     			 
  			    pstmt.setString(1, product.getPname());
  			    pstmt.setInt(2, product.getUnitPrice());
  			    pstmt.setString(3, product.getDescription());
  			    pstmt.setString(4, product.getCategory());
  			    pstmt.setString(5, product.getManufacturer());
  			    pstmt.setLong(6, product.getUnitsInStock());
  			    pstmt.setString(7,product.getCondition());
  			    pstmt.setString(8, product.getProductId());
  			   result= pstmt.executeUpdate();
    		  }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return result;
    }
  
    //상품삭제
   public int deleteProduct(String productId){
    	int result=0;
    	String sql="delete from product where p_id=?";
    	try {
    		     getConnection();
    		     con.setAutoCommit(false);
    		     pstmt = con.prepareStatement(sql);
    		     pstmt.setString(1, productId);
    		     result=pstmt.executeUpdate();
    		     con.commit();
    	}catch(Exception e) {
    		try {
				con.rollback();
			} catch (SQLException e1) {	e1.printStackTrace();			}
    		e.printStackTrace();
    	}finally {
    		try {
				con.setAutoCommit(true);
			} catch (SQLException e) {	e.printStackTrace();			}
    	}
    	return result;
    }
    
}
