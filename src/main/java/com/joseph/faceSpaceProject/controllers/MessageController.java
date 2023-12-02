package com.joseph.faceSpaceProject.controllers;

import java.util.List;

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

import com.joseph.faceSpaceProject.models.Message;
import com.joseph.faceSpaceProject.models.User;
import com.joseph.faceSpaceProject.services.MessageService;
import com.joseph.faceSpaceProject.services.UserService;

@Controller
public class MessageController {
	
	
	@Autowired
	private MessageService messageServ;
	@Autowired
	private UserService userServ;
	
	
	@GetMapping("/messages/start/messaging")
	public String startMessagingFriends(HttpSession session, Model model) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		return "messages.jsp";
	}
	
	
				//MESSAGE ONE FRIEND!
	@GetMapping("/message/friend/{id}")
	public String messageOneFriend(@ModelAttribute("newMessage")Message message,@PathVariable("id")Long id, HttpSession session, Model model) {
		Long userId = (Long)session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		
		User thisFriend = (User)(userServ.findOne(id));
		model.addAttribute("thisFriend", thisFriend);
		
		List<Message> allMessages = messageServ.findAllMessges();
		model.addAttribute("allMessages", allMessages);
		return "oneMessage.jsp";
	}
	
	
			//CREATE MESSAGE
	@PostMapping("/message/send/message/{id}")
	public String createNewMessage(@Valid @ModelAttribute("newMessage")Message message,BindingResult result,Model model, HttpSession session, @PathVariable("id")Long id) {
		if (result.hasErrors()) {
			return "oneMessage.jsp";
		}
		else {
			messageServ.createMessage(message);
		return "redirect:/message/friend/{id}";
	}
		
}
}
