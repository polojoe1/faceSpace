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
    <title>message with ${thisFriend.firstName}</title>
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
                
                
                <div class="shadow d-flex flex-column justify-content-center align-items-center text-center"><a class="none1" href="/logout"><li><h2>🛬</h2><p class="text-light">Log out</p></li></a></div>
            </ul>
            
        </nav>


                        <!-- BACKGROUND IMAGE EVERYTHING POSITIONED RELATIVE TO IT -->
        <div class="plaza">
            
        </div>




                    <!-- START OF CONTENT, EVERYTHING ON PAGE DIVIDED INTO 3 SECTIONS -->
        <div class="mainPage">




                                    <!-- LEFT SIDE -->
            <div class="left text-light overflow-auto">
                <a class="none" href="/home"><div class="left-item "><h4>🏠</h4><h4>Home</h4></div></a>
                <hr>
                <a class="none" href="/friend/profile/${thisUser.id}"><div class="left-item "><h4>👤</h4><h4>${thisUser.firstName} ${thisUser.lastName }</h4></div></a>
                <hr>
                                <!-- LOGIC STARTS HERE -->
                 <c:forEach var="oneFriend" items="${thisUser.getFriends()}">
                <a class="none" href="/message/friend/${oneFriend.id }"><div class="left-item "><h4>👤</h4><h4>${oneFriend.firstName } ${oneFriend.lastName }</h4></div></a>
                <hr>
                </c:forEach>
               <c:forEach var="otherFriend" items="${thisUser.getUserFriends()}">
                <a class="none" href="/message/friend/${otherFriend.id }"><div class="left-item "><h4>👤</h4><h4>${otherFriend.firstName } ${otherFriend.lastName }</h4></div></a>
                <hr>
                </c:forEach>
            </div>
            
            
            
            
            
            
            
            <div class="messageMain d-flex flex-column justify-content-between">
                <a class="none1" href="/friend/profile/${thisFriend.id}"><h1 class="friends-list">${thisFriend.firstName} ${thisFriend.lastName}</h1></a>
                <div id="messaging5" class="top overflow-auto">
                    
                    <div  class="messagesHere mt-2">
                        <c:forEach var="thisFeed" items="${allMessages}">
                        <c:if test="${ thisFeed.messenger eq thisFriend and thisFeed.receiver eq thisUser or thisFeed.receiver eq thisFriend and thisFeed.messenger eq thisUser }">
                        	<c:choose><c:when test="${ (thisFeed.messenger eq thisUser) }"><div class="form-control d-flex mb-1 flex-column"><h4 class="friends-list">${thisFeed.messenger.firstName} ${thisFeed.messenger.lastName}</h4><p>${thisFeed.theMessage}</p></div>
                        <hr></c:when>
                        	<c:otherwise><div class="form-control bg-info d-flex mb-1 flex-column"><h4 class="friends-list2">${thisFeed.messenger.firstName} ${thisFeed.messenger.lastName}</h4><p>${thisFeed.theMessage}</p></div>
                        <hr></c:otherwise>
                        </c:choose></c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="bottom">
                    <form:form class="flex-end" action="/message/send/message/${thisFriend.id}" modelAttribute="newMessage" method="post">
                        <form:textarea class="form-control mb-1" path="theMessage" name="" id="" cols="30" rows="2"></form:textarea>
                        <input class="btn btn-primary" type="submit" value="Send">
                        <form:hidden path="id" value="${allMessages.size()+1}"/>
                        <form:hidden path="messenger" value="${thisUser.id}"/>
                        <form:hidden path="receiver" value="${thisFriend.id}"/>
                    </form:form>
                </div>
            </div>
            <div class="blankDiv"></div>
            <div class="blankDiv"></div>
        </div>
    
    
     <script src="/script/script.js" > 
     function scrollToBottom (id) {
         var div = document.getElementById(id);
         div.scrollTop = div.scrollHeight - div.clientHeight;
     }
scroll_to_bottom.scrollTop = scroll_to_bottom.scrollHeight;
scrollToBottom("messaging5");

    </script>
</body>
</html>

