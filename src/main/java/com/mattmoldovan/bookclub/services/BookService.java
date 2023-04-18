package com.mattmoldovan.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mattmoldovan.bookclub.models.Book;
import com.mattmoldovan.bookclub.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepo;
	
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	public Book createBook(Book newBook) {
		return bookRepo.save(newBook);
	}
	
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		return null;
	}
	
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	public Book updateBook(Book oneBook) {
		return bookRepo.save(oneBook);
	}
}
