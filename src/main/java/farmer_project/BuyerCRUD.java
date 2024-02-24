package farmer_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuyerCRUD {
	
	public  static int   getId() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerdb", "root", "root");

		
			PreparedStatement preparedStatement=connection.prepareStatement("select max(id) from buyer");
			ResultSet set=preparedStatement.executeQuery();
			if(set.next()) {
				System.out.println(set.getInt(1));
				int id= set.getInt(1);
				return id;
			}
			else {
				return 0;
			}

		
		

	}
	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerdb", "root", "root");

	}
	
	public int signUp(Buyer buyer) throws ClassNotFoundException, SQLException {
		Connection connection=getConnection();
		String sql="insert into buyer values(?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(sql);
		int id=getId();
		preparedStatement.setInt(1,(++id));
		preparedStatement.setString(2,buyer.getFname());
		preparedStatement.setString(3,buyer.getLname());
		preparedStatement.setLong(4,buyer.getPhone());
		preparedStatement.setString(5,buyer.getEmail());
		preparedStatement.setString(6,buyer.getAddress());
		preparedStatement.setString(7,buyer.getPassword());
		preparedStatement.setString(8, buyer.getRole());
		
		int res=preparedStatement.executeUpdate();
			connection.close();
			return res;
		
		
	}
	
	
	
}
