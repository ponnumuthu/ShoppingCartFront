package com.niit.ShoppingCartFront.Controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
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
@SessionAttributes("username")
public class CartController {

	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired(required = true)
	private UserDAO userDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Cart cart;
	
	@RequestMapping("/cart/{id}")
	public ModelAndView viewProductDetails(@PathVariable("id") String Id, Model model) {
		Product product = productDAO.get(Id);
		ModelAndView mv = new ModelAndView("/success");
		mv.addObject("isProductClicked", true);
		mv.addObject("isLoggedInUser", true);
		mv.addObject("product", product);
		
		/*boolean username = model.containsAttribute("username");
		if(!username){
			mv.addObject("isLoggedInUser", true);
		}*/
		//mv.addObject(username);
	  return mv;	  
	 }
	
	@RequestMapping("/addToCart/{usersId}/{Id}")
	public String addCart(@PathVariable("usersId") String usersId, @PathVariable("Id") String Id, Model model){
		
		Product product = productDAO.get(Id);
		User user = userDAO.getById(usersId);
		Cart crt = cartDAO.getByUserandProduct(usersId, Id);
		
		
		if(product.getProduct_Stock() > 1){
			
			Random t = new Random();
			int day = 2 + t.nextInt(7);
			
			
			if(cartDAO.itemAlreadyExist(usersId, Id, true)){
							
				int qt = crt.getQuantity() + 1;
				crt.setQuantity(qt);
				crt.setTotal(product.getProduct_Price() * qt);
				cartDAO.saveOrUpdate(crt);
				
				
			}
			
			else {
				
				cart.setProductName(product.getProduct_Name());
				cart.setPrice(product.getProduct_Price());
				cart.setQuantity(1);
				cart.setTotal(product.getProduct_Price());
				cart.setStatus("N");
				cart.setDays(day);
				cart.setUserName(user.getUsername());
				cart.setUserId(usersId);
				cart.setProductId(product.getProduct_Id());
				
				cartDAO.saveOrUpdate(cart);
				
			}
			
			
			
			/*cart.setProductName(product.getProduct_Name());
			cart.setPrice(product.getProduct_Price());
			cart.setQuantity(qty);
			cart.setTotal(product.getProduct_Price() * qty);
			cart.setStatus("N");
			cart.setDays(day);
			cart.setUserName(user.getUsername());
			cart.setUserId(usersId);
			cart.setProductId(product.getProduct_Id());
		
			int stock = product.getProduct_Stock() - 1;
			product.setProduct_Stock(stock);
			
			
			cartDAO.saveOrUpdate(cart);*/
			int stock = product.getProduct_Stock() - 1;
			product.setProduct_Stock(stock);
			productDAO.saveOrUpdate(product);
			
			model.addAttribute("isLoggedInUser", true);
			String message = "You Have Successfully Logged In";
			model.addAttribute("msg", message);
			return "redirect:/myCart/{username}";
			
		}
		else{
			
			model.addAttribute("outOfStock", "Out Of Stock");
			return "redirect:/cart/{Id}";
		}
		
		
		
		
	
		
		//List<Cart> cartList = cartDAO.list(user.getId());
		//long total = cartDAO.getTotalAmount(user.getId());
 		//ModelAndView mv = new ModelAndView();
 	//	mv.addObject("isAddToCartClicked", true);
		//mv.addObject("cartList", cartList);
	//	mv.addObject("total", total);
		
		//return "rtun";
	}
	
	@RequestMapping("/myCart/{username}")
	public  ModelAndView myCart(@PathVariable("username") String username)
	{	
		User user = userDAO.get(username);
		
		List<Cart> cartList = cartDAO.list(user.getUsersId()); 
	
		
		long total = cartDAO.getTotalAmount(user.getUsersId());
		
		long count = cartDAO.getCount(username);
		
		String message = "You Have Successfully Logged In";
		
		ModelAndView mv = new ModelAndView("/success");
		mv.addObject("msg", message);
		mv.addObject("isLoggedInUser", true);
		mv.addObject("isMyCartClicked", true);
		mv.addObject("numberOfProduct", count);
		mv.addObject("cartList", cartList);
		mv.addObject("total", total);
		
		return mv;
		
	}
	
	@RequestMapping("/deletecart/{username}/{cartId}")
	public String deleteCart(@PathVariable ("cartId") String cartId, @PathVariable ("username") String username){
	
		cartDAO.delete(cartId);		
		return "redirect:/myCart/{username}";
		
		
		
	}
	
	@RequestMapping("/viewCarts")
	public ModelAndView viewCartDetails(){
		List<Cart> cartList = cartDAO.list(); 
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("cartList", cartList);
		mv.addObject("isViewCartClicked", true);
		mv.addObject("isLoggedInAdmin", true);
		return mv;
		
	}
	

	@RequestMapping("/searchCart")
	public ModelAndView orderedBy(@RequestParam(value="search") String search ) {
		
		List<Cart> cartList = cartDAO.search(search);		 
		
		ModelAndView mv = new ModelAndView("adminHome");
		
		mv.addObject("cartList", cartList);
		mv.addObject("isViewCartClicked", true);
		mv.addObject("isLoggedInAdmin", true);
		return mv;
		
	}
	
	@ModelAttribute
	public void commonObject(Model model){	
		
		List<Category> CategoryList = categoryDAO.list();
		 model.addAttribute("categoryList",CategoryList);
		
	}
	
	
}
