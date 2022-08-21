package com.ps18371.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ps18371.dao.CategoryDAO;
import com.ps18371.domain.Category;
import com.ps18371.service.ParamService;

@Controller

public class CategoryAdminController {
	
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	ParamService param;
	
	@RequestMapping( value="/admin/categories", method = RequestMethod.GET)
	public String add(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "categories/list.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		
		Category item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("loadanh", item.getImage());
		model.addAttribute("message", "categories/addOrEdit.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/category/create")
	public String saveOrUpdate(Category item, Model model, @RequestParam("saveimg") MultipartFile image) {
		param.save(image);
		dao.save(item);
		model.addAttribute("message", "categories/list.jsp");
		model.addAttribute("thongbao","Save succsess!");
		return "redirect:/admin/categories";
	}
	
	@RequestMapping("/category/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/admin/categories";
	}
	
	@GetMapping("")
	public String list() {
		return "admin/categories/list";
	}
	
	@GetMapping("search")
	public String search() {
		return "admin/categories/search";
	}

}
