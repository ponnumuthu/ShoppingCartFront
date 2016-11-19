
package com.niit.ShoppingCartFront.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.CategoryDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.model.Category;
import com.niit.shoppingcartback.model.Product;

@Controller
@RequestMapping("/")
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;
	
	
	@RequestMapping("/addcategory")
	public ModelAndView addCategory() {
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("isAddCategoryClicked", true);
	  return mv;
	 }
	
	@RequestMapping("/newCategory")
	public ModelAndView newCategory(@ModelAttribute Category category) {
		categoryDAO.saveOrUpdate(category);
		ModelAndView mv = new ModelAndView("adminHome");
	
		return mv;
	 }
	
	
	@RequestMapping("/searchCategory")
	public ModelAndView orderedBy(@RequestParam(value="search") String search ) {
		
		List<Category> categoryList = categoryDAO.search(search);		 
		
		ModelAndView mv = new ModelAndView("adminHome");
		
		mv.addObject("categoryList", categoryList);
		mv.addObject("isViewCategoriesClicked", true);

		return mv;
		
	}
	
	
	
	
	@RequestMapping("/viewCategories")
	public ModelAndView viewCategories() {

		List<Category> categoryList = categoryDAO.list();
		
		ModelAndView mv = new ModelAndView("adminHome");
	
		mv.addObject("categoryList", categoryList);
		mv.addObject("isViewCategoriesClicked", true);

		return mv;
	}
	
	@RequestMapping("/editcategory/{id}")
	public ModelAndView editCategory(@PathVariable ("id") String id){
		Category category = categoryDAO.get(id);
		ModelAndView mv = new ModelAndView("/adminHome");
		mv.addObject("category", category);
		mv.addObject("isEditCategoryClicked", true);
		
		return mv;
	}
	
	@RequestMapping("/deletecategory/{id}")
	public String deleteCategory(@PathVariable ("id") String id,ModelMap model){
		
		 categoryDAO.delete(id);
		return "redirect:/viewCategories";

	}

	
	@RequestMapping("/editCategory")
	public ModelAndView editAndSave(@ModelAttribute Category category)
	//public ModelAndView editAndSave(@PathVariable("id") String id,@RequestParam(value="name") String name,@RequestParam(value="description") String description)
	//public ModelAndView editAndSave(@RequestParam("id")String id,@RequestParam("name")String name)
	{
		
		//category.setId(id);
		//category.setName(name);
		//category.setDescription(description);
		categoryDAO.saveOrUpdate(category);
	
		List<Category> categoryList = categoryDAO.list();
		ModelAndView mv = new ModelAndView("/adminHome");		
		mv.addObject("categoryList", categoryList);
		mv.addObject("isViewCategoriesClicked", true);		
		return mv;
	}
	
	@ModelAttribute
	public void commonToCategory(Model model){
		 model.addAttribute("isLoggedInAdmin", true);
	}
	}
