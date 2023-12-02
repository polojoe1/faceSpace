package com.joseph.faceSpaceProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joseph.faceSpaceProject.models.Post;
import com.joseph.faceSpaceProject.repositories.PostRepository;

@Service
public class PostService {
	@Autowired
	private PostRepository postRepo;
	
			//FIND POST BY ID
	public Post findOne(Long id) {
		Optional<Post> potentialPost = postRepo.findById(id);
		return potentialPost.isPresent() ? potentialPost.get() : null;
	}
	
	
			//CREATE POST
	public Post createPost(Post p) {
		return postRepo.save(p);
	}
	
	
	
			//UPDATE POST
	public Post updatePost(Post p) {
		return postRepo.save(p);
	}
	
	
	
			//DELETE POST
	
	public void deletePost(Long id) {
		postRepo.deleteById(id);
	}
	
	
			//FIND ALL POST
	public List<Post> findAllPost(){
		return postRepo.findAll();
	}
}
