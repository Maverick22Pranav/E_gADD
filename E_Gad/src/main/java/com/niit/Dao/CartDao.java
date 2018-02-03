package com.niit.Dao;

import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.User;

public interface CartDao {

	public Cart getCartByUser(User user);
	public void addCartItem(Cart cart);
	public void removeCartItem(Cart cart,CartItem cartItem);
	public void deleteCart(Cart cart);
	public CartItem getCartItemById(int id);
}