package com.niit.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.Dao.CartDao;
import com.niit.Dao.ProductDao;
import com.niit.Dao.UserDao;
import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.Product;
import com.niit.pojo.User;

@Controller
public class CartController {

	@Autowired
	UserDao userdao;

	@Autowired
	CartDao cartDao;

	@Autowired
	ProductDao productDao;

	@RequestMapping("/cart")
	public String getCart(Principal principal, Model model, Cart cart) {
		System.out.println("hi.... " + principal.getName());
		User user; 
		try {
			user = userdao.getUserByUsername(principal.getName());
		} catch (Exception e) {
			System.out.println("MyDebug: User was not found -> "+ principal.getName());
			e.printStackTrace();
			return "cart";
		}
		System.out.println("hi.... " + user);
		
		try {
			cart = cartDao.getCartByUser(user);
		} catch (Exception e) {
			System.out.println("MyDebug: Cart was not found for the user -> "+ user.getUsername());
			e.printStackTrace();
			return "cart";
		}
		model.addAttribute("cart", cart);
		return "cart";
	}

	@RequestMapping("/addtocart/{id}")
	public String addToCart(@PathVariable int id, Model model, Principal principal) {

		User user = userdao.getUserByUsername(principal.getName());
		Product product = productDao.getProductById(id);

		boolean found = false;

		List<CartItem> cartItems;
		CartItem cartItem;
		Cart cart;
		if ((cart = cartDao.getCartByUser(user)) == null) {
			cart = new Cart();
			cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			cartItem.setSubTotal(product.getCost());

			cartItems = new ArrayList<CartItem>();
			cartItems.add(cartItem);

			cart.setCartItems(cartItems);
			cart.setUser(user);
			cart.setGrandTotal(cartItem.getSubTotal());

			cartDao.addCartItem(cart);

		} else {
			for (CartItem ci : cart.getCartItems()) {
				if (ci.getProduct().getId() == id) {
					ci.setQuantity(ci.getQuantity() + 1);
					ci.setSubTotal(ci.getQuantity() * ci.getProduct().getCost());
					cart.setGrandTotal(cart.getGrandTotal() + ci.getProduct().getCost());
					found = true;
				}
			}

			if (!found) {
				cartItem = new CartItem();
				cartItem.setProduct(product);
				cartItem.setQuantity(1);
				cartItem.setSubTotal(product.getCost());

				cart.getCartItems().add(cartItem);
				cart.setGrandTotal(cart.getGrandTotal() + cartItem.getSubTotal());

			}

			cartDao.addCartItem(cart);
		}
		model.addAttribute("cart", cart);
		return "redirect:/cart";
	}

	@RequestMapping("/deletecart/{id}")
	public String deleteCartItem(@PathVariable int id, Principal principal, Model model) {

		CartItem cartItem = cartDao.getCartItemById(id);
		User user = userdao.getUserByUsername(principal.getName());
		Cart cart = cartDao.getCartByUser(user);
		cartDao.removeCartItem(cart, cartItem);
		model.addAttribute("cart", cart);
		return "redirect:/cart";
	}

}
