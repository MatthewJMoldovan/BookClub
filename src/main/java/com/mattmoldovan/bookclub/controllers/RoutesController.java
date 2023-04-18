package com.mattmoldovan.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.mattmoldovan.bookclub.models.Book;
import com.mattmoldovan.bookclub.services.BookService;
import com.mattmoldovan.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RoutesController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		
		model.addAttribute("bookList", bookService.allBooks());
		return "dashboard.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/books/new")
	public String renderCreateBook(@ModelAttribute("newBook") Book newBook, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		
		return "createBook.jsp";
	}
	
	@PostMapping("/process/createBook")
	public String processCreateBook(@Valid @ModelAttribute("newBook")Book newBook,
			BindingResult result, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "createBook.jsp";
		} else {
			bookService.createBook(newBook);
			return "redirect:/dashboard";
		}	
	}
	
	@GetMapping("/books/{id}")
	public String viewBook(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		
		model.addAttribute("oneBook", bookService.findBook(id));
		return"viewBook.jsp";
	}
	
	@GetMapping("/books/edit/{id}")
	public String editBook(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		Book oneBook = bookService.findBook(id);
		model.addAttribute("oneBook", oneBook);
		return"editBook.jsp";
	}
	
	@PutMapping("/process/edit/{id}")
	public String processEditBook(@Valid @ModelAttribute("oneBook")Book oneBook,
			BindingResult result,@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return"editBook.jsp";
		}
		bookService.updateBook(oneBook);
		return "redirect:/books/{id}";
	}
	
	@DeleteMapping("/books/{id}")
	public String deleteBook(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		bookService.deleteBook(id);
		return "redirect:/dashboard";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
