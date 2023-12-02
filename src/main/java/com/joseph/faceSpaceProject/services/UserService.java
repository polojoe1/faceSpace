package com.joseph.faceSpaceProject.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.joseph.faceSpaceProject.models.LoginUser;
import com.joseph.faceSpaceProject.models.User;
import com.joseph.faceSpaceProject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;

	// TO-DO: Write register and login methods!
	public User register(User newUser, BindingResult result) {
		// TO-DO: Additional validations!
		Optional<User> potentialUser= userRepo.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "registrationErrors", "This email is taken");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
		    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if(result.hasErrors()) {
			return null;
		}else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
		}
		
	}

	public User login(LoginUser newLogin, BindingResult result) {
		// TO-DO: Additional validations!
		Optional<User> potentialUser= userRepo.findByEmail(newLogin.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "loginErrors", "This email is NOT found.");
		}
		else {
			User user = potentialUser.get();
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			    result.rejectValue("password", "Matches", "Invalid Password!");
			}
			if(result.hasErrors()) {
				return null;
			}
			else {
				return user;
			}
		}
		return null;
	}
	public User findOne(Long id) {
		Optional<User>potentialUser= userRepo.findById(id);
		if(potentialUser.isPresent()) {
			return potentialUser.get();
		}
		else {
			return null;
		}
	}
	
	public List<User> findSearchedfirst(String search){
		return userRepo.findByFirstName(search);
	}
	
	public List<User> findSearchedlast(String search){
		return userRepo.findByLastName(search);
	}
	
	public User updateUser(User u) {
		return userRepo.save(u);
	}
	
}
