package farmer_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class FarmerCRUD {

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerdb", "root", "root");

	}

	
	public static int  getId() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerdb", "root", "root");

		
			PreparedStatement preparedStatement=connection.prepareStatement("select max(id) from farmer");
			ResultSet set=preparedStatement.executeQuery();
			if(set.next()) {
				
				return set.getInt(1);
			}
			else {
				return 0;
			}

		
		

	}

	public int signUp(Farmer farmer) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		String sql = "insert into farmer values(?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		int id=getId();
		preparedStatement.setInt(1, (++id));
		preparedStatement.setString(2, farmer.getFname());
		preparedStatement.setString(3, farmer.getLname());
		preparedStatement.setLong(4, farmer.getPhone());
		preparedStatement.setString(5, farmer.getEmail());
		preparedStatement.setString(6, farmer.getAddress());
		preparedStatement.setString(7, farmer.getPassword());
		preparedStatement.setString(8, farmer.getRole());

		int res = preparedStatement.executeUpdate();
		connection.close();
		return res;

	}

	// login for both farmer and buyer

	public ResultSet login(long phone) throws ClassNotFoundException, SQLException {
		System.out.println("from login method");
		Connection connection = getConnection();
		String sql = "select id,phone,email,password,role from farmer where phone=? union select id,phone,email,password,role from buyer where phone=?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, phone);
		preparedStatement.setLong(2, phone);

		ResultSet set = preparedStatement.executeQuery();
		// connection.close();
		return set;

	}

	public int postProduct(Product product) throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		String sql = "insert into product values(?,?,?,?,?,?,?)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, product.getName());
		preparedStatement.setDouble(2, product.getQuantity());
		preparedStatement.setDouble(3, product.getPrice());
		preparedStatement.setString(4, product.getDesc());
		preparedStatement.setString(5, product.getUrl());
		preparedStatement.setString(6, product.getName());
		preparedStatement.setInt(7, product.getFid());

		int res = preparedStatement.executeUpdate();
		connection.close();
		return res;

	}

	public int editFarmerProfile(Farmer farmer, int id) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		String sql = "update farmer set fname=?,lname=?,email=?,address=?,phone=? where id=?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, farmer.getFname());
		preparedStatement.setString(2, farmer.getLname());
		preparedStatement.setString(3, farmer.getEmail());
		preparedStatement.setString(4, farmer.getAddress());
		preparedStatement.setLong(5, farmer.getPhone());
		preparedStatement.setInt(6, id);

		int res = preparedStatement.executeUpdate();
		connection.close();
		return res;

	}

	public ResultSet fetchAllData(int id) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		String sql = "SELECT * FROM farmer WHERE id = ? UNION SELECT * FROM buyer WHERE id = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		preparedStatement.setInt(2, id);
		return preparedStatement.executeQuery();
	}
}
