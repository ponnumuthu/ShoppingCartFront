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
import com.niit.shoppingcartback.dao.ShippingAddressDAO;
import com.niit.shoppingcartback.dao.UserDAO;
import com.niit.shoppingcartback.dao.UserRoleDAO;
import com.niit.shoppingcartback.model.Cart;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.Product;
import com.niit.shoppingcartback.model.ShippingAddress;
import com.niit.shoppingcartback.model.User;
import com.niit.shoppingcartback.model.UserRole;

@Controller
public class HomeController {

	@Autowired(required = true)
	private UserDAO userDAO;

	@Autowired
	private User user;
	
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private UserRole userRole;
	
	@Autowired
	private ShippingAddressDAO shippingAddressDAO;
	
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
	public ModelAndView loginpage(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		ModelAndView mv = new ModelAndView("home");
		
		if(error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
			}
		
		if(logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
			}
		
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
	public ModelAndView registerUser(@ModelAttribute User user, @ModelAttribute ShippingAddress shippingAddress,@RequestParam(value = "emailid") String email, ModelMap model) {
		ModelAndView mv ;
		String message;
	
		
		if(userDAO.isAllReadyRegister(email, true))		{
			
			model.addAttribute("isAllReadyRegister", true);	
			model.addAttribute("isLoginClicked", true);
			message = "Your Email Id All Ready Registered";
		}
		else {
			
			/*user.setShippingAddress(shippingAddress);
			shippingAddress.setUser(user);*/
				user.setEnabled(true);
				userRole.setEmailid(user.getEmailid());
				userRole.setPhoneNo(user.getPhoneNo());
				userRole.setUsername(user.getUsername());
				
				userRole.setRoleId("10");
				userRole.setRole("ROLE_USER");
				
				user.setUserRole(userRole);
				userRole.setUser(user);
				
				userDAO.saveOrUpdate(user);
				userRoleDAO.saveOrUpdate(userRole);
			
				model.addAttribute("User", user);
				//model.addAttribute("isSignUpClicked", true);
				// TODO Auto-generated catch block
				
			
			
			shippingAddress.setUsersId(user.getUsersId());
			shippingAddressDAO.saveOrUpdate(shippingAddress);
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
