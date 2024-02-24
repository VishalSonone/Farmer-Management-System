package farmer_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Result;

public class ProductCRUD {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		return  DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerdb", "root", "root");
		
	}

		public int postProduct(Product product) throws ClassNotFoundException, SQLException {

			Connection connection=getConnection();
			System.out.println("before placeholders");

			String sql="insert into product values(?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, product.getFid());

			preparedStatement.setString(2,product.getName() );
			preparedStatement.setString(3, product.getLoc());
			preparedStatement.setString(4, product.getDesc());
			preparedStatement.setString(5, product.getUrl());

			preparedStatement.setInt(6, product.getQuantity());
			preparedStatement.setDouble(7, product.getPrice());
			System.out.println("after placeholders");

			
			int res=preparedStatement.executeUpdate();
			
			connection.close();
			System.out.println(res);
			return res;
			
			
		}
		
		
		public List<Product> fetchAll() throws ClassNotFoundException, SQLException {
			
			Connection connection=getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement("select * from product");
			
			ResultSet set=preparedStatement.executeQuery();
			
			List<Product> prodList=new ArrayList<Product>();
			
			while(set.next()) {
				Product product =new Product();
				product.setFid(set.getInt("fid"));
				product.setName(set.getString("name"));
				product.setDesc(set.getString("desc"));
				product.setUrl(set.getString("url"));
				product.setLoc(set.getString("loc"));
				product.setQuantity(set.getInt("quantity"));
				product.setUrl(set.getString("url"));
				prodList.add(product);
			}
			
			return prodList;
			
		}
}
