package com.niit.ShoppingCartFront.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.SupplierDAO;
import com.niit.shoppingcartback.model.Supplier;

@Controller
@RequestMapping("/")
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;
	

	@RequestMapping("/addsupplier")
	public ModelAndView newSupplier() {
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("isAddSupplierClicked", true);
		return mv;
	 }
	
	@RequestMapping("/newSupplier")
	public ModelAndView newSupplier(@ModelAttribute Supplier supplier) {
		supplierDAO.saveOrUpdate(supplier);
	  return new ModelAndView("adminHome");
	 }
	
	
	@RequestMapping("/viewSuppliers")
	public ModelAndView viewSuppliers() {

	//	System.out.println("getAllSuppliers");
		
		List<Supplier> supplierList = supplierDAO.list();
		
		ModelAndView mv = new ModelAndView("adminHome");
		mv.addObject("supplierList", supplierList);
		mv.addObject("isViewSupplierClicked", true);
		
		return mv;
		
	}
		@RequestMapping("/editSupplier/{id}")
		public ModelAndView viewSupplier(@PathVariable ("id") String id) {
				Supplier supplier = supplierDAO.get(id);
				ModelAndView mv = new ModelAndView("adminHome");
				mv.addObject("supplier", supplier);
				mv.addObject("isEditSupplierClicked", true);
		  return mv;
		  
		 }
		
		@RequestMapping("/editSupplier")
		public ModelAndView editAndSave(@ModelAttribute Supplier supplier){
			supplierDAO.saveOrUpdate(supplier);
			List<Supplier> supplierList = supplierDAO.list();
			
			ModelAndView mv = new ModelAndView("/adminHome");
			mv.addObject("supplierList", supplierList);
			mv.addObject("isViewSupplierClicked", true);
			return mv;

		}
		
		@RequestMapping("/deleteSupplier/{id}")
		public String deleteSupplier(@PathVariable ("id") String id){
			
			supplierDAO.delete(id);
			
			return "redirect:/viewSuppliers";
		}
		
		@ModelAttribute
		public void commonToCategory(Model model){
			 model.addAttribute("isLoggedInAdmin", true);
		}
		
	}

