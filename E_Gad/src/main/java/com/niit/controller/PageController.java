package com.niit.controller;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Dao.ProductDao;
import com.niit.Dao.UserDao;
import com.niit.pojo.Address;
import com.niit.pojo.Product;
import com.niit.pojo.User;

@Controller
@SessionAttributes
public class PageController {
	@Autowired
	private UserDao userdao;
	@Autowired
	ProductDao pa;


	@RequestMapping(value = { "/", "/index" })
	public String home() {

		return "index";

	}
	@RequestMapping("/MoreAddress")
	public String moreAddress1() {
		return "MoreAddress";
	}

	@RequestMapping("/login")
	public String getlogin(Model model,@RequestParam(name="error",required=false)String error) {
		if (error !=null) {
			model.addAttribute("message", "Invalid user name & password");
		}
		return "login";

	}

	@RequestMapping("/procategory")
	public String category() {
		return "procategory";

	}

	

	@RequestMapping("/extras")
	public String extras() {
		return "extras";

	}
	@RequestMapping("/register")
	public ModelAndView getregister() {
		ModelAndView mv = new ModelAndView("register");
		mv.addObject("user", new User());
		return mv;

	}

	@RequestMapping("/success")
	public String success() {
		return "success";

	}
	@RequestMapping("/about us")
	public String about() {
		return "about us";

	}
	@RequestMapping("/fproduct")
	public String fproduct(Model model,Product product) 
	{
		model.addAttribute("view", pa.getAllProduct());
		model.addAttribute("product", product);
		return "fproduct";

	}
	@RequestMapping("/shopping")
	public String shopping() 
	{
		return "shopping page";

	}
	@RequestMapping("/user")
	public String user(@ModelAttribute("user") User user,Model model) {
		model.addAttribute("users",userdao.getAlluser() );
		return "user";
}

	@RequestMapping("/full product description")
	public String description() {
		return "full product description";

	}

	@RequestMapping(value = "userdetails", method = RequestMethod.POST)
	public String getUser(@ModelAttribute User user) {
		System.out.println("Username:" + user.getUsername());
		System.out.println("DOB:" + user.getDob());
		return "login";
	}


	@RequestMapping("/add")
	public String getPage(@ModelAttribute("user")@Valid User user,BindingResult results, Model model) {

		if(results.hasErrors())
		{
			return "user";
		}
		
		else
		{
		
		user = userdao.addUser(user);
		return "redirect:/up";
	}
	}
	@RequestMapping(value = "address", method = RequestMethod.POST)
	public String getAddress( @Valid @ModelAttribute("user") User user, BindingResult results, Model model)
{
		if (results.hasErrors()) {
			return "register";
		} 
		user.setRole("USER");
		user.setEnabled(true);
	    user = userdao.addUser(user);
			System.out.println("Username:" + user.getUsername());
			System.out.println("DOB:" + user.getDob());
			model.addAttribute("user", user);
			model.addAttribute("address", new Address());
			return "address";
		
	}

	@RequestMapping("/address1/{id}")
	public String getAddressPage(@ModelAttribute("address")@Valid Address address,BindingResult results,@PathVariable int id,Model model) 
	{
		if (results.hasErrors())
		{
			return "address";
		} 
		else 
		{
		User user = userdao.getUserById(id);
		List<Address> addresses = user.getAddresses();
		addresses.add(address);
		user.setAddresses(addresses);
		userdao.upUser(user);
		
		return "redirect:/login";
	}
	}
	
}


