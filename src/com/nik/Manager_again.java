package com.nik;
import java.util.Scanner;
import java.util.Scanner.*;
import java.sql.*;
public class Manager_again
{
static Scanner sc= new Scanner(System.in);
public static void main(String[] args)
{
	do{
		System.out.println("Enter the detail of employee");
		System.out.println("1 Register ");
		System.out.println("2 Select ");
		System.out.println("3 update");
		System.out.println("4 delete");
		System.out.println("5 exit");
		System.out.println("enter ur choice");
		int ch=sc.nextInt();
		switch(ch){
			case 1:
				create();
				break;
			case 2:
				Select();
				break;
			case 3:
			    Update();
			    break;
			case 4:
				Delete();
				break:
			case 5:
				System.out.println("thanks");
				System.exit(0);
				break;
				default:
					System.out.println("plse enter the choice 1-5");
					break;	
		}
		System.out.println("do u want  to continue ?:(y/n)");
	}while("y".equalsIgnoreCase(sc.next()));
	System.out.println("thanks");
	
		
	}
private static void Select()
{
	try{
Connection con=DbUtil.getConnection();
System.out.println("do u want to see all  or individual");
System.out.println("1 all");
System.out.println("2 individual");
int c1=sc.nextInt();
String sql="";
PreparedStatement pstmt=null;
if(c1==1){
	sql="select * from employee";
	pstmt=con.prepareStatement(sql);
	
	
}
else{
	
	
}
}
	
}
private static void create()
{
try{
	Connection con=DbUtil.getConnection();
	System.out.println("do u want see all or individual");
	System.out.println("1.all");
	System.out.println("2 single");
	int c=sc.nextInt();
	String sql="";
	PreparedStatement pstmt=null;
	if(c==1)
	{
		sql="select * from employee";
		pstmt=con.prepareCall(sql);
	} 
		else{
			sql="select * from employee where id=?";
			System.out.println("enter the id of employee which u want u display");
			int id=sc.nextInt();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, id);
			
		}
	ResultSet rs=pstmt.executeQuery();
	while(rs.next()){
		System.out.println("id=" + rs.getInt(1));
	System.out.println("fname=" + rs.getString(2));
	System.out.println("lanme=" + rs.getString(3));
	System.out.println("age=" + rs.getInt(4));
	System.out.println("------------------------");
}}
catch(SQLException ex){
	ex.printStackTrace();
}
	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	
}
	
	
}
	


