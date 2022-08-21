package com.ps18371.controller.site;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ps18371.service.ParamService;
import com.ps18371.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	@Autowired
	ShoppingCartService cart;
	@Autowired
	ParamService param;
	

	@RequestMapping("/site/cart/view")
	public String view(Model model) {
		model.addAttribute("count", cart.getCount());
		model.addAttribute("amount",cart.getAmount());
		model.addAttribute("sizes",cart.getSize());
		model.addAttribute("cart", cart);
		return "site/cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/site/cart/view";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/site/cart/view";
	}

	@RequestMapping("/cart/update")
	public String update() {
		Integer id = param.getInt("id", 0);
		int qty = param.getInt("qty", 0);
		cart.update(id, qty);
		return "redirect:/site/cart/view";
	}

	@RequestMapping("/site/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/site/cart/view";
	}
	
}
