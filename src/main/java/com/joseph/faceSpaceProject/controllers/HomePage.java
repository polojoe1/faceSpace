package com.joseph.faceSpaceProject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.joseph.faceSpaceProject.models.Comment;
import com.joseph.faceSpaceProject.models.Post;
import com.joseph.faceSpaceProject.models.User;
import com.joseph.faceSpaceProject.services.PostService;
import com.joseph.faceSpaceProject.services.UserService;

@Controller
public class HomePage {
	@Autowired
	private UserService userServ;
	@Autowired
	private PostService postServ;
	
	
	@GetMapping("/home")
    public String home(@ModelAttribute("newPost")Post post, @ModelAttribute("newComment")Comment comment, HttpSession session, Model model) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null) {
			return "redirect:/";
		}
		else {
			 
			User thisUser = userServ.findOne(userId);
			List<Post>everyPost = postServ.findAllPost();
		
			model.addAttribute("thisUser", thisUser);
			model.addAttribute("everyPost", everyPost);
		}
		return "home.jsp";
	}
	
	@GetMapping("/facespace/search")
	public String customSearch(@RequestParam("search")String search) {
		System.out.println(search);
		return "redirect:/actualSearch/" + search;
	}
	
//	the actual seaching
	@GetMapping("/actualSearch/{query}")
	public String actualSearch(@PathVariable("query") String q, Model model,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		List <User>x= userServ.findSearchedfirst(q);
		List <User>y= userServ.findSearchedlast(q);
		
		model.addAttribute("allUsersfirst",x);
		model.addAttribute("allUserslast",y);
		return "search.jsp";
	}
	
	
	
			//ADD AS A FRIEND
	@GetMapping("/add/friendRequest/{id}")
	public String friendRequestedMethod(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getFriendRequest().add((User)userServ.findOne(id));
		userServ.updateUser(thisUser);
		return "redirect:/home";
	}
	
			//DENY FRIEND REQUEST
	@GetMapping("/friend/request/deny/{id}")
	public String denyFriendRequest(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getUserRequest().remove((User)userServ.findOne(id));
		userServ.updateUser(thisUser);
		return "redirect:/home";
	}
	
			//ACCEPT FRIEND REQUEST
	@GetMapping("/friend/request/accept/{id}")
	public String acceptFriendRequest(@PathVariable("id")Long id,HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		thisUser.getUserRequest().remove((User)userServ.findOne(id));
		thisUser.getFriends().add((User)userServ.findOne(id));
		userServ.updateUser(thisUser);
		return "redirect:/home";
		
	}
			//SEE ALL FRIENDS
	@GetMapping("/friends/all/friends/{id}")
	public String seeMyFriends(@PathVariable("id")Long id,Model model, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		User profileUser = userServ.findOne(id);
		model.addAttribute("profileUser", profileUser);
		model.addAttribute("thisUser", thisUser);
		return "allFriends.jsp";
	}
	
			//SEE USERS PROFILE!
	@GetMapping("/friend/profile/{id}")
	public String viewProfile(@ModelAttribute("newComment")Comment comment,@ModelAttribute("newPost")Post post,@PathVariable("id")Long id,Model model,  HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		User profileUser = userServ.findOne(id);
		model.addAttribute("profileUser", profileUser);
		model.addAttribute("thisUser", thisUser);
		return "profile.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
