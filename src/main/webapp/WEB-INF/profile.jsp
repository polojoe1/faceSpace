<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${profileUser.firstName}'s Profile</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="content"></div>
        <nav class="mybar navbar navbar-expand-lg">
            <a class="navbar-brand text-light d-flex" href="/home"><h3>🌜Face<h3 class="space">Space</h3></h3></a>
            
            <form action="/facespace/search" method="get">
			<input class="searchbar" type="search" name="search" placeholder="Search FaceSpace.." id="searchFor">
			</form>
            <ul class="navbar-nav">
                <div class="shadow d-flex flex-column justify-content-center align-items-center text-center"><a class="none1" href="/messages/start/messaging"><li class="text-light"><h2>✉</h2><p class="text-light">${thisUser.getReciever().size()} Messages</p></li></a></div>
                
                <div class="shadow d-flex flex-column justify-content-center align-items-center text-center"><a class="none1" href="/logout"><li><h2>🛬</h2><p class="text-light">Log out</p></li></a></div>
            </ul>
            
        </nav>


                        <!-- BACKGROUND IMAGE EVERYTHING POSITIONED RELATIVE TO IT -->
        <div class="plaza">
            
        </div>




                    <!-- START OF CONTENT, EVERYTHING ON PAGE DIVIDED INTO 3 SECTIONS -->
        <div class="mainPage d-flex justify-content-between">




                                    <!-- LEFT SIDE -->
            <div class="left text-light">
                <a class="none" href="/home"><div class="left-item "><h4>🏠</h4><h4>Home</h4></div></a>
                <hr>
                <a class="none" href="/friend/profile/${thisUser.id}"><div class="left-item "><h4>👤</h4><h4>${thisUser.firstName } ${thisUser.lastName }</h4></div></a>
                <hr>
                <a onclick="alert('Coming soon!')" class="none" href=""><div class="left-item "><h4>🙋</h4><h4>About</h4></div></a>
            </div>
            
            
            
            
            
            
            


                                <!-- MIDDLE -->
            <div class="middle overflow-auto putItRight">
                                

                <h1 class="profile-name">${profileUser.firstName } ${profileUser.lastName }</h1>
                <!-- ADD LOGIC IF NOT USERS PROFILE ADD SEND MESSAGE BUTTON IF THEY ARE FRIENDS! IF NOT HAVE ADD FRIEND BUTTON -->
                <div class="d-flex justify-content-between align-items-center mb-3"><a class="none2 mb-3" href="/friends/all/friends/${profileUser.id}"><h6><em>${profileUser.getFriends().size()+ profileUser.getUserFriends().size()} Friends</em></h6></a><c:if test="${!(profileUser.id eq thisUser.id)}"><c:if test="${thisUser.getFriends().contains(profileUser) or thisUser.getUserFriends().contains(profileUser) }"><a class="btn btn-info" href="/message/friend/${profileUser.id }">Send a message</a></c:if><c:if test="${not thisUser.getFriendRequest().contains(profileUser) and !(thisUser.getUserRequest().contains(profileUser)) }"><c:if test="${not thisUser.getFriends().contains(profileUser) and !(thisUser.getUserFriends().contains(profileUser)) }"><a class="btn btn-warning" href="/add/friendRequest/${profileUser.id}"> add as friend</a></c:if></c:if></c:if></div>
                <!-- LOGIC ADD POST IF ITS USER IN SESSIONS PROFILE  -->
                <c:if test="${thisUser.id eq profileUser.id }">
                <div class="form-control makePost pt-3">
				<form:form action="/post/create/post" class="d-flex mind" method="post" modelAttribute="newPost">
					<div class="d-flex percent">
						<form:hidden path="creator" value="${thisUser.id}"/>
						<div class="circle">
							
							<form:label path="thePost"><h2>👤</h2></form:label>
						</div>
						<form:input class="searchbar1" type="text" placeholder="Whats on your mind, Name?" path="thePost" id=""/>
					</div>
				</form:form>
				<hr>

				<p class="text-center">
					<em>Dont be afraid to make a post! Tell us whats up!</em>
				</p>
			</div>
			<hr>
                <!-- END OF LOGIC  -->
                </c:if>
                <c:set var="numOfPost" value="${profileUser.post.size()}"></c:set>
                <c:forEach var="i" begin="1" end="${numOfPost}" step="1" >
                <c:set var="proPost" value="${profileUser.post[numOfPost-i]}"></c:set>
                <div class="form-control mb-3  pt-3 displayPost">
             
                    <div class="topPost d-flex align-items-center"><div class="circle d-flex "><h4>👤</h4></div><h5>${profileUser.firstName } ${profileUser.lastName }</h5></div>
                    <div class="contentOfPost text-center mt-3 mb-3"><h6>${proPost.thePost}</h6></div>
                    <div class="likesAndComments d-flex justify-content-between"><a class="none2" href=""><em class="pink">${proPost.getLikers().size() }💞</em></a><em class="text-info">${proPost.getComments().size() } comments</em></div>
                    <hr>
                    <div class="likesAndComments d-flex justify-content-around">
                    <c:if test="${proPost.getLikers().contains(thisUser) }"><a class="none1" href="/post/dislike/post/${proPost.id}/${profileUser.id}"> <div class="middle-item text-info text-center">Like 💞</div></a></c:if>
					<c:if test="${!(proPost.getLikers().contains(thisUser)) }"><a class="none" href="/post/like/post/${proPost.id}/${profileUser.id}"> <div class="middle-item text-center">Like 💞</div></a></c:if>
                    <a class="none " href="/post/comments/all/${proPost.id}"><div class="middle-item text-center">Comments</div></a></div>
                    <hr>
                    <form:form action="/comment/create/comment/${proPost.id}" class="d-flex mind" modelAttribute="newComment" method="post">
					<div
						class="d-flex justify-content-center align-items-center percent">
						<div class="circle">
							<label for="post"><h4>👤</h4></label>
						</div>
						<form:hidden path="commenter" value="${thisUser.id}"/>
						<form:hidden path="post" value="${proPost.id}"/>
						<form:input class="searchbarComment" path="theComment" type="text"
							placeholder="Write a comment..." name="comment" id=""/>
					</div>
				</form:form>
                    
                </div>
                </c:forEach>
            </div>
            







                            <!-- RIGHT SIDE -->
                            <div class="right">
                                <a class="none" href="/friends/all/friends/${thisUser.id }"><div class="left-item "><h4>🫂</h4><h4>All Friends</h4></div></a>
                                <hr>
                                <div class="form-control overflow-auto"><div class="left-item "><h4>👥</h4><h4>Friend Request</h4></div>
                                <hr>
                                            <!-- LOGIC STARTS HERE -->
                                <c:forEach var="potentialFriend" items="${thisUser.getUserRequest() }" >
				<div class="d-flex justify-content-around">
					<a class="none1" href="/friend/profile/${potentialFriend.id}"><h4>${potentialFriend.firstName} ${potentialFriend.lastName}</h4></a>
					<div class="d-flex justify-content-around">
						<a class="none1" href="/friend/request/accept/${potentialFriend.id}"><h4>✅</h4></a> <a class="none1" href="/friend/request/deny/${potentialFriend.id}"><h4>❌</h4></a>
					</div>
				</div>
				<hr>
				</c:forEach>
                                            <!-- LOGIC ENDS HERE -->
                                </div>
                            </div>
                        </div>
                    </div>
</body>
</html>

