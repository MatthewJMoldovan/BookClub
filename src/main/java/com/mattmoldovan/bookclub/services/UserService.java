package com.mattmoldovan.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mattmoldovan.bookclub.models.LoginUser;
import com.mattmoldovan.bookclub.models.User;
import com.mattmoldovan.bookclub.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		return null;
	}
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		if(optionalUser.isPresent()) {
			result.rejectValue("email","unique","This email is already registered!");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm","unique","Passwords do not match!");
			result.rejectValue("password","unique","Passwords do not match!");
		}
		if(result.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		
		Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
		if(!optionalUser.isPresent()){
			result.rejectValue("email","unique","Incorrect email or password!");
			return null;
		}
		User user = optionalUser.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password","unique","Incorrect email or password!");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		return user;
	}
}
