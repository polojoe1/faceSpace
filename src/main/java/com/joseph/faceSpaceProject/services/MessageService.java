package com.joseph.faceSpaceProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joseph.faceSpaceProject.models.Message;
import com.joseph.faceSpaceProject.repositories.MessageRepository;

@Service
public class MessageService {
		@Autowired
		private MessageRepository messageRepo;
		
					//FIND BY ID
	public Message findOne(Long id) {
		Optional<Message> potentialMessage = messageRepo.findById(id);
		return potentialMessage.isPresent() ? potentialMessage.get() : null;
	}
		
		
				//CREATE MESSAGE
		
	public Message createMessage(Message m) {
		return messageRepo.save(m);
	}
	
	
			//FIND ALL MESSAGES
	
	public List<Message> findAllMessges(){
		return messageRepo.findAll();
	}
}
