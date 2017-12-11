package com.nik;

import java.sql.*;
import java.util.Scanner;

public class Manager
{
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args)
	{
		do {
			System.out.println("****Epmloyee Details******");
			System.out.println("1.Register");
			System.out.println("2.update");
			System.out.println("3.delete");
			System.out.println("4.select");
			System.out.println("5.exit");
			System.out.println("enter your choice");
			int ch = sc.nextInt();
			switch (ch) {
			case 1:
				create();
				break;
			case 2:
				update();
				break;
			case 3:
				delete();
				break;
			case 4:
				display();
				break;
			case 5:
				System.out.println("thanks!!!!");
				System.exit(0);
				break;

			default:
				System.out.println("please enter the choic from 1-5");
				break;
			}
			System.out.println("do u want to continue?(y/n)");
		} while ("y".equalsIgnoreCase(sc.next()));
		System.out.println("thanks");
	}

	private static void display()
	{
		try {
			Connection con = DbUtil.getConnection();
			System.out.println("do u want to see all or individual");
			System.out.println("1.all");
			System.out.println("2.single");
			int c = sc.nextInt();
			String sql = "";
			PreparedStatement pstmt = null;
			if (c == 1) 
			{
				sql = "select * from employee";
				pstmt = con.prepareStatement(sql);
			} 
			else {
				sql = "select * from employee where id=?";
				System.out.println("enter the id of employye which you want to display");
				int id = sc.nextInt();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);

			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("id=" + rs.getInt(1));
				System.out.println("fname=" + rs.getString(2));
				System.out.println("lanme=" + rs.getString(3));
				System.out.println("age=" + rs.getInt(4));
				System.out.println("------------------------");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	private static void delete()
	{
		try {
			Connection con = DbUtil.getConnection();
			System.out
					.println("enter the id of employye which you want to delete");
			int id = sc.nextInt();
			PreparedStatement pstmt = con
					.prepareStatement("delete from  employee where id=?");
			pstmt.setInt(1, id);
			int i = pstmt.executeUpdate();
			if (i > 0) {
				System.out.println(" you are deleted succesfully!!!!");
			} else {
				System.out.println("oops!!! some db error try again later");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static void update()
	{
		try {
			Connection con = DbUtil.getConnection();
			System.out
					.println("enter the id of employye which you want to update");
			int id = sc.nextInt();
			PreparedStatement pstmt = con
					.prepareStatement("update employee set fname=? , lname=? , age=? where id=?");
			System.out.println("enter the fname");
			String fname = sc.next();
			System.out.println("eter the lname");
			String lname = sc.next();
			System.out.println("enter the age");
			int age = sc.nextInt();
			pstmt.setInt(4, id);
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setInt(3, age);
			int i = pstmt.executeUpdate();
			if (i > 0) {
				System.out.println(" you are updated succesfully!!!!");
			} else {
				System.out.println("oops!!! some db error try again later");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static void create()
	{
		try {
			Connection con = DbUtil.getConnection();
			System.out.println("enter the id value");
			int id = sc.nextInt();
			System.out.println("enter the fname");
			String fname = sc.next();
			System.out.println("eter the lname");
			String lname = sc.next();
			System.out.println("enter the age");
			int age = sc.nextInt();
			PreparedStatement pstmt = con
					.prepareStatement("insert into employee values(?,?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, fname);
			pstmt.setString(3, lname);
			pstmt.setInt(4, age);
			int i = pstmt.executeUpdate();
			if (i > 0) {
				System.out.println("congratulation you are registered!!!!");
			} else {
				System.out.println("oops!!! some db error try again later");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
