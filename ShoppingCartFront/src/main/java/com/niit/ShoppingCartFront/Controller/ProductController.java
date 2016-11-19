package com.niit.ShoppingCartFront.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.CategoryDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.dao.SupplierDAO;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.Product;
import com.niit.shoppingcartback.model.Supplier;

@Controller
@Repository("/product")
public class ProductController {

	
	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired(required = true)
	private CategoryDAO categoryDAO;
	
	@Autowired(required = true)
	private SupplierDAO supplierDAO;
	
	@RequestMapping("/addproduct")
	public ModelAndView newProduct() {
		
		List<Category> categoryList = categoryDAO.list();
		List<Supplier> supplierList = supplierDAO.list();
	ModelAndView mv = new ModelAndView("/adminHome");
	mv.addObject("categoryList", categoryList);
	mv.addObject("supplierList", supplierList);
	mv.addObject("isAddProductClicked", true);
	return mv;
	 }
	
	
	
	@RequestMapping(value = "/newProduct", method=RequestMethod.POST)
	public ModelAndView newProduct(@ModelAttribute ("Product") Product product, @RequestParam("file") MultipartFile file ) {
	productDAO.saveOrUpdate(product);
	String path = "E://project/ShoppingCartFront/src/main/webapp/WEB-INF/resources/image/products/";
	FileUtil.upload(path, file, product.getProduct_Id()+".jpg");
	
	  return new ModelAndView("adminHome");
	 }
	
		
	@RequestMapping("/viewProducts")
	public ModelAndView viewProducts() {

		List<Product> List = productDAO.list();
		
		ModelAndView mv = new ModelAndView("/adminHome");
		mv.addObject("productList", List);
		mv.addObject("isViewProductClicked", true);

		return mv;
	}
	
	
	
	@RequestMapping("/editProduct/{id}")
	public ModelAndView editProduct(@PathVariable ("id") String id){
		Product product = productDAO.get(id);
		ModelAndView mv = new ModelAndView("/adminHome");
		mv.addObject("Product", product);
		mv.addObject("isEditProductClicked", true);
		return mv;
	}	
	

	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public ModelAndView editAndSave(@ModelAttribute ("Product") Product product){
		productDAO.saveOrUpdate(product);
		List<Product> List = productDAO.list();
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("productList", List);
		mv.addObject("isViewProductClicked", true);
		return mv;
	}
	
	
	
	
	@RequestMapping("deleteProduct/{id}")
	public String deleteProduct(@PathVariable ("id") String id){
	
	productDAO.delete(id);
	return "redirect:/viewProducts";
	}
	
	@RequestMapping("/searchProduct")
	public ModelAndView searchProduct(@RequestParam(value="search") String search ) {
	
		List<Product> List = productDAO.search(search);
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("productList", List);
		mv.addObject("isViewProductClicked", true);
		return mv;
	}
	
	@ModelAttribute
	public void commonToProduct(Model model){
		 model.addAttribute("isLoggedInAdmin", true);
	}
	
	
}
