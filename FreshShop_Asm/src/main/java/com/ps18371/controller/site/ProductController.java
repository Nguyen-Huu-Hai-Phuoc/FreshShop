package com.ps18371.controller.site;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ps18371.dao.ProductDAO;
import com.ps18371.domain.Product;
import com.ps18371.service.ParamService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO proDao;
	
	@Autowired
	ParamService param;
	
	@RequestMapping("/view/cart")
	public String cart() {
		return "site/cart";
	}
	
	@RequestMapping("/site/shop-detail/{id}")
	public String productDetail(Model model, @PathVariable("id") int id) {
		Product p = new Product();
		p = proDao.getOne(id);
		model.addAttribute("item", p);
		return "site/shop-detail";
	}
}
