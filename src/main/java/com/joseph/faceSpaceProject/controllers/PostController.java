package com.joseph.faceSpaceProject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.joseph.faceSpaceProject.models.Post;
import com.joseph.faceSpaceProject.models.User;
import com.joseph.faceSpaceProject.services.PostService;
import com.joseph.faceSpaceProject.services.UserService;

@Controller
public class PostController {
@Autowired
private PostService postServ;
@Autowired UserService userServ;


			//CREATE POST
	@PostMapping("/post/create/post")
	public String createPost(@Valid @ModelAttribute("newPost")Post newPost,BindingResult result,Model model, HttpSession session) {
		if (result.hasErrors()) {
			return "home.jsp";
		}
		else {
			postServ.createPost(newPost);
			return "redirect:/home";
		}
	}
	
	
	//LIKE A POST FROM HOME PAGE
	@GetMapping("/post/like/post/{id}")
	public String likeAhPost(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().add(postServ.findOne(id));
		userServ.updateUser(thisUser);
		
		return"redirect:/home";
	}
	
	
	//DISLIKE A POST FROM HOME PAGE
	@GetMapping("/post/dislike/post/{id}")
	public String dislikeAhPost(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().remove(postServ.findOne(id));
		userServ.updateUser(thisUser);
		
		return"redirect:/home";
	}
	
	//LIKE FROM PROFILE
	@GetMapping("/post/like/post/{id}/{profileId}")
	public String likeAhPostFromProfile(@PathVariable("id")Long id,@PathVariable("profileId")Long profileId,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().add(postServ.findOne(id));
		userServ.updateUser(thisUser);
		
		return"redirect:/friend/profile/{profileId}";
	}
	
	
	
				//DISLIKE FROM PROFILE
	@GetMapping("/post/dislike/post/{id}/{profileId}")
	public String dislikeAhPostFromProfile(@PathVariable("id")Long id,@PathVariable("profileId")Long profileId,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().remove(postServ.findOne(id));
		userServ.updateUser(thisUser);
		
		return"redirect:/friend/profile/{profileId}";
	}
	
			//LIKE FROM THE COMMENTS
	@GetMapping("/post/like/post/comments/{id}")
	public String likeAhPostFromComments(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().add(postServ.findOne(id));
		userServ.updateUser(thisUser);
		
		return"redirect:/post/comments/all/{id}";
	}
	
	//DISLIKE FROM THE COMMENTS
	@GetMapping("/post/dislike/post/comments/{id}")
	public String dislikeAhPostFromComments(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getLikedPost().remove(postServ.findOne(id));
		userServ.updateUser(thisUser);
	
		return"redirect:/post/comments/all/{id}";
}
}
