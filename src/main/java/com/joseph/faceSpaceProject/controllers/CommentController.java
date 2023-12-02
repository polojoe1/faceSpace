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

import com.joseph.faceSpaceProject.models.Comment;
import com.joseph.faceSpaceProject.models.Post;
import com.joseph.faceSpaceProject.models.User;
import com.joseph.faceSpaceProject.services.CommentService;
import com.joseph.faceSpaceProject.services.PostService;
import com.joseph.faceSpaceProject.services.UserService;

@Controller
public class CommentController {
	
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private CommentService commentServ;
	@Autowired
	private PostService postServ;
	
	
	
	
				//CREATE A COMMENT
	@PostMapping("/comment/create/comment/{id}")
	public String createAhComment(@Valid @ModelAttribute("newComment")Comment comment,BindingResult result,Model model, HttpSession session,@PathVariable("id")Long id) {
		if (result.hasErrors()) {
			return "home.jsp";
		}
		else {
			commentServ.createComment(comment);
			return "redirect:/post/comments/all/{id}";
		}
	}
	
	
				//ALL COMMENTS ON SPECIFIC POST
	@GetMapping("/post/comments/all/{id}")
	public String allCommentsOnPost(@ModelAttribute("newComment")Comment comment,@PathVariable("id")Long id,HttpSession session,Model model) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		Post thisPost = (Post)postServ.findOne(id);
		model.addAttribute("thisPost", thisPost);
		return "comments.jsp";
	}
}
