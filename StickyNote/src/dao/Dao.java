package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {
	static Connection con=null;
	static 
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static int insert( String sql) throws SQLException {
		System.out.println("in Dao hello");
		System.out.println(sql);
		PreparedStatement ps=con.prepareStatement(sql);
		int i=ps.executeUpdate();
		System.out.println(i);
		return i;
		//db2 connection jar files.
	}
	public static ResultSet select( String checkemail) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps=con.prepareStatement(checkemail);
		ResultSet rs=ps.executeQuery();
		return rs;
		
	}
	
	
}
