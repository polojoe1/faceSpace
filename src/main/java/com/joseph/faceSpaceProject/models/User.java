package com.joseph.faceSpaceProject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "First name is required!")
	@Size(min = 2, max = 30, message = "First name must be between 2 and 30 characters")
	private String firstName;

	@NotEmpty(message = "Last name is required!")
	@Size(min = 2, max = 30, message = "Last name must be between 2 and 30 characters")
	private String lastName;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;

	@NotEmpty(message = "Password is required!")
	@Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	@Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
	private String confirm;
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
	        name = "likes", 
	        joinColumns = @JoinColumn(name = "liker_id"), 
	        inverseJoinColumns = @JoinColumn(name = "post_id")
	    )
	private List<Post> likedPost;
	
	
	@OneToMany(mappedBy="creator",fetch=FetchType.LAZY)
	private List<Post> post;
	
	@OneToMany(mappedBy="commenter",fetch=FetchType.LAZY)
	private List<Comment> commentOnPost;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "messages", 
        joinColumns = @JoinColumn(name = "messenger_id"), 
        inverseJoinColumns = @JoinColumn(name = "friend_id")
    )
	private List<User> messenger;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "messages", 
        joinColumns = @JoinColumn(name = "friend_id"), 
        inverseJoinColumns = @JoinColumn(name = "messenger_id")
    )
    private List<User> reciever;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "friendRequest", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "requester_id")
    )
	private List<User> friendRequest;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "friendRequest", 
        joinColumns = @JoinColumn(name = "requester_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userRequest;
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "friends", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "friend_id")
    )
	private List<User> friends;
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "friends", 
        joinColumns = @JoinColumn(name = "friend_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userFriends;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public User() {
	}

	// TODO - Don't forget to generate getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Post> getLikedPost() {
		return likedPost;
	}

	public void setLikedPost(List<Post> likedPost) {
		this.likedPost = likedPost;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
	}

	public List<Comment> getCommentOnPost() {
		return commentOnPost;
	}

	public void setCommentOnPost(List<Comment> commentOnPost) {
		this.commentOnPost = commentOnPost;
	}

	public List<User> getMessenger() {
		return messenger;
	}

	public void setMessenger(List<User> messenger) {
		this.messenger = messenger;
	}

	public List<User> getReciever() {
		return reciever;
	}

	public void setReciever(List<User> reciever) {
		this.reciever = reciever;
	}

	public List<User> getFriendRequest() {
		return friendRequest;
		
	}

	public void setFriendRequest(List<User> friendRequest) {
		this.friendRequest = friendRequest;
	}

	public List<User> getUserRequest() {
		return userRequest;
	}

	public void setUserRequest(List<User> userRequest) {
		this.userRequest = userRequest;
	}

	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	public List<User> getUserFriends() {
		return userFriends;
	}

	public void setUserFriends(List<User> userFriends) {
		this.userFriends = userFriends;
	}

}
