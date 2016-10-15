package com.niit.ShoppingCartFront.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.CartDAO;
import com.niit.shoppingcartback.dao.CategoryDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.dao.UserDAO;
import com.niit.shoppingcartback.model.Cart;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.Product;
import com.niit.shoppingcartback.model.User;

@Controller
public class HomeController {

	@Autowired(required = true)
	private UserDAO userDAO;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	

	@RequestMapping("/home")
	public String home() {

		ModelAndView mv = new ModelAndView();
		List<Product> List = productDAO.list();
		mv.addObject("List", List);
		return "redirect:/";
	}
	@RequestMapping("/")
	public ModelAndView listedProduct()
	{	ModelAndView mv=new ModelAndView("/home");
		List<Category> CategoryList = categoryDAO.list();
		List<Product> List = productDAO.list(); 
		mv.addObject("productList",List);
		mv.addObject("categoryList",CategoryList);
		return mv;
		
	}


	@RequestMapping("/loginpage")
	public ModelAndView loginpage() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isLoginClicked", true);
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isLoggedOutClicked", true);
		mv.addObject("message", "Your Are Successfully Logged Out");
		return mv;
	}
	
	
	@RequestMapping("/register")
	public ModelAndView registerPage() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isSignUpClicked", true);
		return mv;
	}
	/*
	 * @RequestMapping("/laptop") public ModelAndView mobile(){ ModelAndView mv
	 * = new ModelAndView("home");
	 * 
	 * return mv; }
	 */

	@RequestMapping("/newuser")
	public ModelAndView registerUser(@ModelAttribute User user, @RequestParam(value = "emailid") String email, ModelMap model) {
		ModelAndView mv ;
		String message;
	
		
		if(userDAO.isAllReadyRegister(email, true))		{
			
			model.addAttribute("isAllReadyRegister", true);	
			model.addAttribute("isLoginClicked", true);
			message = "Your Email Id All Ready Registered";
		}
		else {
			userDAO.saveOrUpdate(user);
			model.addAttribute("isLoginClicked", true);
			message = "Your Have Successfully Registered";
		}
		
		
		mv = new ModelAndView("home");
		mv.addObject("message", message);
		return mv;
	}
	@RequestMapping("/viewproduct/{name}")
	public ModelAndView viewCategoryItems(@PathVariable ("name") String name){
		List<Category> CategoryList = categoryDAO.list();
		List<Product> productList = productDAO.list(name);
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("productList", productList);
		mv.addObject("categoryList",CategoryList);
		return mv;
		
	}
	
	
	@ModelAttribute
	public void commonToProduct(Model model){
		 List<Category> CategoryList = categoryDAO.list();
		 model.addAttribute("categoryList",CategoryList);
	}
}
