package com.nik;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DbUtil
{
	private static final String driverclass;
	private static final String url;
	private static final String username;
	private static final String password;
	static
	{
		Properties pr=new Properties();
		FileReader in=null;
		try
		{
			in=new FileReader("constants.properties");
			pr.load(in);
		}
		catch(IOException ex)
		{
			ex.printStackTrace();
		}
		//in.close();
		finally
		{
			try
			{
				if(in!=null)
				{
					in.close();
					in=null;
					
				}
			}
			catch(IOException ex)
			{
				ex.printStackTrace();
			}
		}
		driverclass=pr.getProperty("driverclass");
		url=pr.getProperty("url");
		username=pr.getProperty("username");
		password=pr.getProperty("password");
	}
	static
	{
		try
		{
			Class.forName(driverclass);
		}
		catch(ClassNotFoundException ex)
		{
			ex.printStackTrace();
		}
	}
	public static Connection getConnection()throws SQLException
	{
		Connection con=DriverManager.getConnection(url,username,password);
		return con;
	}
	public static void closeAll(ResultSet rs,Statement stmt,Connection con)
	{
		try
		{
			if(rs!=null)
			{
				rs.close();
				rs=null;
				
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		try
		{
			if(stmt!=null)
			{
				stmt.close();
				stmt=null;
				
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		try
		{
			if(con!=null)
			{
				con.close();
				con=null;
				
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}

}
