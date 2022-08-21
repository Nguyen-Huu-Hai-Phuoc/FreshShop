package com.ps18371.controller.site;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps18371.dao.ProductDAO;
import com.ps18371.domain.Product;


@Controller
public class CategorySiteController {
	
	@Autowired
	ProductDAO proDao;
	
	String idCategory;
	Boolean check = false;
	@RequestMapping("/product/category/{id}")
	public String productBycategory(Model model, @PathVariable("id") String id, 
			@RequestParam("p") Optional<Integer> p) {
		
		idCategory = id;
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = proDao.findByCategoryId(idCategory, pageable);
		model.addAttribute("prd", page);
		return "site/shop";
	}
	
	@RequestMapping("/product/search-and-page")
	public String productpage(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		if(check == false) {
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> page = proDao.findByCategoryId(idCategory, pageable);
			model.addAttribute("prd", page);
			System.out.println("123");
		} else {
			double minPrice = min.orElse(Double.MIN_VALUE);
			double maxPrice = max.orElse(Double.MAX_VALUE);
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> page = proDao.findByPrice(minPrice, maxPrice, pageable);
			model.addAttribute("prd", page);
		}
		return "site/shop";
	}
	
	@RequestMapping("/product/price")
	public String productByPrice(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		check = true;
		
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = proDao.findByPrice(minPrice, maxPrice, pageable);
		model.addAttribute("prd", page);
		return "site/shop";
	}
}
