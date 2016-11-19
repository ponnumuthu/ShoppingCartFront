package com.niit.ShoppingCartFront.Controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.CartDAO;
import com.niit.shoppingcartback.dao.CategoryDAO;
import com.niit.shoppingcartback.dao.CreditCardDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.dao.ShippingAddressDAO;
import com.niit.shoppingcartback.dao.UserDAO;
import com.niit.shoppingcartback.model.Cart;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.CreditCard;
import com.niit.shoppingcartback.model.ShippingAddress;
import com.niit.shoppingcartback.model.User;

@Controller
@SessionAttributes("username")
public class PaymentController {

	@Autowired
	private User user;
	
	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired(required = true)
	private UserDAO userDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private Cart cart;
	

	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired 
	private CreditCard creditCard;
	
	@Autowired
	private ShippingAddressDAO shippingAddressDAO;
	
	
	@RequestMapping("/cashOnDelivery/{username}")
	public ModelAndView Proceed (@PathVariable("username") String username){
		
		ShippingAddress shippingAddress = shippingAddressDAO.get(username);
		
		List<ShippingAddress> shippingAddresses = shippingAddressDAO.list(shippingAddress.getUsersId());
		User user = userDAO.get(username);
		
		ModelAndView mv = new ModelAndView("/success");
		mv.addObject("User", user);
		mv.addObject("shippingAddresses", shippingAddresses);
		mv.addObject("isPlaceOrderClicked", true);
		

		
		return mv;		
	}
	
	@RequestMapping("/shippingAddess/{username}")
	public String createNewAddress(@ModelAttribute ShippingAddress shippingAddress, @PathVariable("username") String username){
		
		User user = userDAO.get(username);
		
		shippingAddress.setUsersId(user.getUsersId());
		shippingAddressDAO.saveOrUpdate(shippingAddress);
		
		return "redirect:/cashOnDelivery/{username}";
	}
	
	@RequestMapping("/deleteShippingAddress/{shippingId}")
	public String deleteShippingAddress(@PathVariable("shippingId") String shippingId){
		
		shippingAddressDAO.delete(shippingId);
		return "redirect:/cashOnDelivery/{username}";
	}
	
	@RequestMapping("/editShippingAddress/{shippingId}")
	public String editShippingAddress(@PathVariable("shippingId") String shippingId, Model model){
		
	ShippingAddress shippingAddress = shippingAddressDAO.getByShippingId(shippingId);
	model.addAttribute("shippingAddress", shippingAddress);
	
	return "redirect:/newShippingAddress";
	}
	/*@RequestMapping("/paymentMethod/{username}")
	public ModelAndView paymentMethod(@PathVariable("username") String username){
		
		return null;
		
	}
	*/
	@RequestMapping("/onLinePayment/{username}")
	public ModelAndView OnLinePayment(@PathVariable("username") String username)
	{
		User user = userDAO.get(username);		
		
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("onLinePaymentClicked", true);
		return mv;
	}
	
	
	@RequestMapping("/cardPayment/{username}")
	private  String cardPayment(@PathVariable ("username") String username){
		
		//creditCardDAO.saveOrUpdate(creditCard);
		
		return "redirect:/cashOnDelivery/{username}";
	}
	
	
	
	/*@RequestMapping("/editAdress/{shiipingAddress}")
	public ModelAndView cashOnDelivery(@PathVariable("shiipingAddress") String shiipingAddress)
	{
		shippingAddressDAO.getByShippingId(shiipingAddress);
		
		ModelAndView mv = new ModelAndView("success");
		
		
		
		return mv;
	}*/
	
	@RequestMapping("/newShippingAddress")
	public ModelAndView newAdress(){
		
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("shippingAddress", true);
		return mv;
	}
	
	@RequestMapping("/productDeliverd/{username}")
	public ModelAndView shippingAdresss(@PathVariable ("username") String username){
		
		User user = userDAO.get(username);
		
	/*	
		Random t = new Random();
		int day = 2 + t.nextInt(7);*/
		
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("ProductDelivered", true);
		mv.addObject("User", user);
		/*mv.addObject("day", day);*/
		return mv;
		
	}	
	@RequestMapping("/days/{username}")
	public ModelAndView Days(@PathVariable ("username") String username){
		
		User user = userDAO.get(username);
		
		List<Cart> cartList = cartDAO.list(user.getUsersId());
		List<Category> CategoryList = categoryDAO.list();
		long total = cartDAO.getTotalAmount(user.getUsersId());
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("cartList", cartList);
		mv.addObject("CategoryList", CategoryList);
		mv.addObject("total", total);
		mv.addObject("isViewDaysClicked", true);
		return mv;
	}
	
	@ModelAttribute
	public void commonObject(Model model){	
		
		model.addAttribute("isLoggedInUser", true);
		String message = "You Have Successfully Logged In";
		model.addAttribute("msg", message);
		List<Category> CategoryList = categoryDAO.list();
		 model.addAttribute("categoryList",CategoryList);
	}
}
