package com.joseph.faceSpaceProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joseph.faceSpaceProject.models.Comment;
import com.joseph.faceSpaceProject.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepo;
	
			//FIND BY ID
	public Comment findOne(Long id) {
		Optional<Comment> potentialComment = commentRepo.findById(id);
		return potentialComment.isPresent() ? potentialComment.get() : null;
	}
	
	
	
			//CREATE COMMENT
	public Comment createComment(Comment c) {
		return commentRepo.save(c);
	}
	
	
				//UPDATE COMMENT
	public Comment updateComment(Comment c) {
		return commentRepo.save(c);
	}
	
	
	
				//DELETE COMMENT
	public void deleteComment(Long id) {
		commentRepo.deleteById(id);
	}
	
	
				//FIND ALL COMMENTS
	public List<Comment> findAllComments(){
		return commentRepo.findAll();
	}
	
}
