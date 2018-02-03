package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Dao.CategoryDao;
import com.niit.Dao.ProductDao;
import com.niit.pojo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;

	@RequestMapping("/product")
	public String getProductPage(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("products", productDao.getAllProduct());
		model.addAttribute("categories", categoryDao.getAllCategory());
		return "product";
	}
	@RequestMapping("/product with img")
	public String shopping() 
	{
		return "product with img";

	}

	@RequestMapping("/addproduct")

	public String getAddProductPage(@ModelAttribute("product")Product product, BindingResult result, HttpServletRequest request, Model model) {
		productDao.addProduct(product);
		MultipartFile file = product.getFile();
		String imagepath = request.getServletContext().getRealPath("/resources/images/");
		System.out.println("Directory:" + imagepath);
		Path path = Paths.get(imagepath + File.separator + product.getId() + ".jpg");
		File imageFile = new File(path.toString());
		System.out.println("Path:" + path.toString());
		if (!imageFile.exists()) {
			imageFile.mkdirs();
		}
		try {
			file.transferTo(imageFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("categoryList", this.categoryDao.getAllCategory());
		model.addAttribute("products", this.productDao.getAllProduct());
		return "redirect:/product";
	}

	@RequestMapping(value = "/editproduct/{id}")
	public ModelAndView editProduct(@PathVariable int id, Model model) {
		ModelAndView mv = new ModelAndView("product");
		mv.addObject("product", productDao.getProductById(id));
		model.addAttribute("product", new Product());
		model.addAttribute("products", productDao.getAllProduct());
		model.addAttribute("categoryList", this.categoryDao.getAllCategory());
		return mv;
	}

	@RequestMapping(value = "/deleteproduct/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id) {
		productDao.delete(id);
		
		return "redirect:/product";
	}

}
