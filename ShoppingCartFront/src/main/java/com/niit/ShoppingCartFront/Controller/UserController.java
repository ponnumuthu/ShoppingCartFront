package com.niit.ShoppingCartFront.Controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.niit.shoppingcartback.dao.CartDAO;
import com.niit.shoppingcartback.dao.CategoryDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.dao.UserDAO;
import com.niit.shoppingcartback.dao.UserRoleDAO;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.Product;
import com.niit.shoppingcartback.model.User;
import com.niit.shoppingcartback.model.UserRole;


@Controller
@SessionAttributes({"username","usersId"})
public class UserController {

	@Autowired(required = true)
	private UserDAO userDAO;
	
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
		
	/*@RequestMapping(value="/isvaliduser", method=RequestMethod.POST)
	public String login(@RequestParam(value = "username") String name,
			@RequestParam(value = "password") String password, ModelMap model ) {
		
		String message;
		String mv;
		if(name.equals("admin") && password.equals("admin"))
		{
			mv = new ModelAndView("adminHome");
			mv.addObject("isLoggedInAdmin", true);
			model.addAttribute("isLoggedInAdmin", true);
			message = "You Have Successfully Logged In";
			mv = "adminHome";
			
		}
		
	else if (userDAO.isValidUser(name, password, true))
		{
		 
			mv = new ModelAndView("/success");
			User user = userDAO.get(name);
			List<Product> List = productDAO.list();
			model.addAttribute("User", user);
			model.addAttribute("productList",List);
			model.addAttribute("isLoggedInUser", true);
			message = "You Have Successfully Logged In";
			mv = "success";
			
		}
	 
		else {
			
			mv = "home";
			model.addAttribute("isLoginClicked", true);
			message = "*your username or password incorrect";		
		}
		model.addAttribute("msg", message);
		model.addAttribute("name", name);
		return mv;
	}
	
*/	
	
	@ModelAttribute
	public void commonObject(Model model){
		
		List<Product> List = productDAO.list();		
		model.addAttribute("productList",List);
		
		 List<Category> CategoryList = categoryDAO.list();
		 model.addAttribute("categoryList",CategoryList);
		
		String message = "You Have Successfully Logged In";
		model.addAttribute("msg", message);
	}
	
	@RequestMapping("/afterlogin")
	String loginProcess(Principal p,Model model,@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request)
	{
		String email=p.getName();
		User user1 = userDAO.getByEmail(email);
		String username = user1.getUsername();
		String usersId = user1.getUsersId();
		// request.getSession().setAttribute("username", username);
		
		User user = userDAO.get(username);
		model.addAttribute("username", username);
		model.addAttribute("usersId", usersId);
		
		long count = cartDAO.getCount(username);
		model.addAttribute("numberOfProduct", count);
		
		
		UserRole Role=userRoleDAO.get(username);
		String role=Role.getRole();
		
		if(role.equals("ROLE_ADMIN")){
			 model.addAttribute("isLoggedInAdmin", true);
			return "adminHome";
		}
		else if(role.equals("ROLE_USER")){
			
			model.addAttribute("isLoggedInUser", true);
			
			return "success";
		}
		else{
			model.addAttribute("error", "Invalid username or password!");
			return "home";
		}
	}
	
}
