package com.niit.Dao;

import java.util.List;

import com.niit.pojo.User;

public interface UserDao {
	public User addUser(User user);
	public void upUser(User user);
	public User getUserById(int id);
	public List<User> getAlluser();
	public User getUserByUsername(String username);
}





