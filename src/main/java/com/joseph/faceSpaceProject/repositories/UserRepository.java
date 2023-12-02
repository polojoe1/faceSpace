package com.joseph.faceSpaceProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.joseph.faceSpaceProject.models.Post;
import com.joseph.faceSpaceProject.models.User;
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	List<User>findAll();
	Optional<User>findByEmail(String email);
	List<User>findByFirstName(String search);
	List<User>findByLastName(String search);
	
}
