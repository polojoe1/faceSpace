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
    <title>all ${profileUser.firstName}'s friends!</title>
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
        <div class="mainPage">




                                    <!-- LEFT SIDE -->
            <div class="left text-light">
                <a class="none" href="/home"><div class="left-item "><h4>🏠</h4><h4>Home</h4></div></a>
                <hr>
                <a class="none" href="/friend/profile/${thisUser.id}"><div class="left-item "><h4>👤</h4><h4>${thisUser.firstName } ${thisUser.lastName }</h4></div></a>
                <hr>
                <a onclick="alert('Coming soon!')" class="none" href=""><div class="left-item "><h4>🙋</h4><h4>About</h4></div></a>
            </div>
            
            
            
            
            
            
            


                                <!-- MIDDLE -->
            
            <div class="middle overflow-auto pb-3">
                <c:if test="${thisUser.id eq profileUser.id }"><h1 class="text-center friends-list">All Your friends!</h1></c:if>
                <c:if test="${!(thisUser.id eq profileUser.id) }"><h1 class="text-center friends-list">All ${profileUser.firstName } ${profileUser.lastName } friends!</h1></c:if>
                <!-- LOGIC OF ALL FRIENDS -->
                <c:forEach var="myFriend" items="${profileUser.getFriends()}">
                <div class="form-control makePost pt-3">
                    <a href="/friend/profile/${myFriend.id}" class="none1"><div class="topPost d-flex align-items-center"><div class="circle d-flex "><h4>👤</h4></div><h5>${myFriend.firstName} ${myFriend.lastName}</h5></div></a>
                </div>
                <hr>
                </c:forEach>
                    <!-- END LOGIC -->
                <c:forEach var="myUserFriend" items="${profileUser.getUserFriends()}">
                <div class="form-control makePost pt-3">
                    <a href="/friend/profile/${myUserFriend.id}" class="none1"><div class="topPost d-flex align-items-center"><div class="circle d-flex "><h4>👤</h4></div><h5>${myUserFriend.firstName} ${myUserFriend.lastName}</h5></div></a>
                </div>
                <hr>
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

