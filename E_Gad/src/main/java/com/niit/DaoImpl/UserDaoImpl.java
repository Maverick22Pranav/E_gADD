package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.UserDao;
import com.niit.pojo.User;
@Transactional
@Repository
public class UserDaoImpl implements UserDao {
 @Autowired
 private SessionFactory sessionFactory;
	@Override
	public User addUser(User user) {
	Session  session=sessionFactory.openSession();
	Transaction transaction=session.beginTransaction();
	session.persist(user);
	transaction.commit();
	session.close();
	return user;
	}
     @Override
	public void upUser(User user) {
		Session  session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(user);
		transaction.commit();
		session.close();
		}

	@Transactional
	@Override
	public User getUserById(int id) 
	{
		Session  session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		User a1=new User();
		a1=session.get(User.class, id);
		transaction.commit();	
		session.close();
		return a1;

	}

	@Override
	public List<User> getAlluser() 
	{
		Session  session=sessionFactory.openSession();
		List<User> b1=session.createQuery("from User", User.class).list();
		session.close();
		return b1;
	}
	@Override
	public User getUserByUsername(String username)
	{
		Session session = sessionFactory.openSession();
		User u1=(User) session.createQuery("FROM User WHERE username ='" + username +"' ").uniqueResult();
		session.close();
		return u1;
	}

}
