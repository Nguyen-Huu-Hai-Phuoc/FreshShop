package com.ps18371.controller.site;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps18371.dao.AccountDAO;
import com.ps18371.dao.CategoryDAO;
import com.ps18371.dao.ProductDAO;
import com.ps18371.domain.Account;
import com.ps18371.domain.Category;
import com.ps18371.domain.Product;
import com.ps18371.service.CookieService;
import com.ps18371.service.ParamService;
import com.ps18371.service.SessionService;

@Controller
public class SiteController {
	
	@Autowired
	CookieService cookieService;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	
	@Autowired
	JavaMailSender mailer;
	
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	AccountDAO accDAO;
	
	@Autowired
	ProductDAO daoPrd;
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		
		session.set("fild", false);
		Cookie ck =cookieService.get("username");
		
		if(ck!=null) {
			session.set("fild", true);
		}
		
		return "site/index";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "site/about";
	}
	
	@RequestMapping("/shop-detail")
	public String shopDetail() {
		return "site/shop-detail";
	}
	
	@RequestMapping("/checkout")
	public String checkout() {
		return "site/checkout";
	}

	
	@RequestMapping("/sigin")
	public String dangky(Model model, @ModelAttribute("us") Account us) { 
		if(isSigin == true) {
			model.addAttribute("message", "Đăng ký thành công");
		}
		  return "site/dangKy";
	}
	 
	@RequestMapping("/gallery")
	public String gallery() {
		return "site/gallery";
	}
	
	@RequestMapping("/forgotpass")
	public String forgotpass1() {
		return "site/forgotpass";
	}
	
	@RequestMapping("/shop")
	public String shopDetail(Model model) {
		
		List<Product> list = daoPrd.findAll();
		model.addAttribute("prd", list);
		return "site/shop";
	}
	
	
	@RequestMapping("/login")
	public String login() {		
		return "site/login";
	}
	
	@RequestMapping("/logoff")
	public String logoff() {
		cookieService.remove("username");
		return "site/login";
	}
	
	@RequestMapping("/loginForm")
	public String loginSite(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request) {
		try {
			boolean remember =Boolean.parseBoolean(request.getParameter("remember")) ;
			System.out.println(remember);
			Account user = accDAO.getOne(username);
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
					if(user.isAdmin()==false) {
						if(remember == true) {
							cookieService.add("username", username, 240);
							return "site/index";							
						}
						session.set("fild", true);
						return "site/index";
					} else {
						if(remember == true) {
							cookieService.add("username", username, 240);
							return "admin/index";							
						}
						return "admin/index";
					}
										
				}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
			return "site/index";
		}
		return "";
	}
	
	@RequestMapping("/forgotpass/email")
	public String forgotpass2(Model model, @RequestParam("username") String username,  
			@RequestParam("email") String email) {
		
		Account user = accDAO.getOne(username);
		cookieService.add("user", username, 10);
		if(email.equalsIgnoreCase(user.getEmail())) {
			try{
				// Random pass moi
				Random generator = new Random();
				int value = generator.nextInt((9999 - 1000) + 1) + 1000;
				String macode = String.valueOf(value);
				cookieService.add("code", macode, 1);
				// Tạo mail
				MimeMessage mail = mailer.createMimeMessage();
				// Sử dụng lớp trợ giúp
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom("phuocnhhps18371@fpt.edu.vn");
				helper.setTo(email);
				helper.setReplyTo("hinobai123@gmail.com");
				helper.setSubject("New code:");
				helper.setText(macode, true);
				

				// Gửi mail
				mailer.send(mail);
				
				model.addAttribute("message", "Vui lòng kiểm tra email và nhập mã code !");
			}
			catch(Exception ex){
				model.addAttribute("message", "Gửi email thất bại !");
			}
		}		
		
		return "site/enter-code";
	}
	
	@RequestMapping("/entercode")
	public String enterCode(Model model, @RequestParam("code") String code) {
		String macode = cookieService.getValue("code");
		if(macode.equalsIgnoreCase(code)) {
			return "site/changePass";
		} else {
			model.addAttribute("message","Mã code không chính xác!");
			return "site/enter-code";
		}
		
	}
	
	@RequestMapping("/update/pass")
	public String updatepass(Model model, @RequestParam("pass1") String pass1,
			@RequestParam("pass2") String pass2) {
			String user = cookieService.getValue("user");
			Account account = accDAO.getOne(user);
			if(pass1.equalsIgnoreCase(pass2)) {
				account.setPassword(pass1);
				accDAO.save(account);
				model.addAttribute("message","Đổi mật khẩu thành công");
			}
		return "site/changePass";
	}
	
	boolean isSigin = false;
	@RequestMapping("/dangky")
	public String sigin(Account us) {

		us.setAdmin(false);
		accDAO.save(us);
		isSigin = true;
		return "redirect:/sigin";
	}
}
