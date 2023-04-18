package com.mattmoldovan.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mattmoldovan.bookclub.models.LoginUser;
import com.mattmoldovan.bookclub.models.User;
import com.mattmoldovan.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userService;	
	
	@GetMapping("/")
	public String renderLogregForm(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "logreg.jsp";
	}
	
	@PostMapping("/register")
	public String processRegister(
			@Valid @ModelAttribute("newUser")User newUser,
			BindingResult result, Model model, HttpSession session) {
		User registeredUser = userService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return"logreg.jsp";
		} else {
			session.setAttribute("userId", registeredUser.getId());
			session.setAttribute("userName", registeredUser.getUserName());
			return "redirect:/dashboard";
		}
	}
	
	@PostMapping("/login")
	public String processLogin(
			@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		User loginUser = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return"logreg.jsp";
		} else {
			session.setAttribute("userId", loginUser.getId());
			session.setAttribute("userName", loginUser.getUserName());
			return "redirect:/dashboard";
		}
	}
	

}
