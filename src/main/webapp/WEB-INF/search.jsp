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
    <title>Results</title>
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



        <div class="searchPage d-flex overflow-auto flex-column justify-content-top align-items-center">
        	<c:forEach var="oneUser" items="${allUsersfirst}">
            <div class="d-flex justify-content-right align-items-center">
                <div class="form-control  mb-3  pt-3 displayPost">
                    <div class="topPost d-flex align-items-center"><div class="circle d-flex "><h4>👤</h4></div><a class="none1" href="/friend/profile/${oneUser.id}"><h5>${oneUser.firstName } ${oneUser.lastName }</h5></a><c:if test="${ not(oneUser.id eq thisUser.id)}"><c:if test="${not thisUser.getUserRequest().contains(oneUser) and not  thisUser.getFriendRequest().contains(oneUser)}"><c:if test="${not thisUser.getUserFriends().contains(oneUser) and not  thisUser.getFriends().contains(oneUser)}"><a class="btn btn-warning" href="/add/friendRequest/${oneUser.id}">add as friend</a></c:if></c:if></c:if><c:if test="${(oneUser.id eq thisUser.id)}"><em>its You!🙃</em></c:if></div>
                </div>
            </div>
            </c:forEach>
            <c:forEach var="thatUser" items="${allUserslast}">
            <div class="d-flex justify-content-right align-items-center">
                <div class="form-control  mb-3  pt-3 displayPost">
                    <div class="topPost d-flex align-items-center"><div class="circle d-flex "><h4>👤</h4></div><a class="none1" href="/friend/profile/${thatUser.id}"><h5>${thatUser.firstName } ${thatUser.lastName }</h5></a><c:if test="${not(thatUser.id eq thisUser.id)}"><c:if test="${not thisUser.getUserRequest().contains(thatUser) and not thisUser.getFriendRequest().contains(thatUser)}"><c:if test="${not thisUser.getUserFriends().contains(thatUser) and not thisUser.getFriends().contains(thatUser)}"> <a class="btn btn-warning" href="/add/friendRequest/${thatUser.id}"> add as friend</a></c:if></c:if></c:if><c:if test="${(thatUser.id eq thisUser.id)}"><em>its You!🙃</em></c:if></div>
                </div>
                
            </div>
            </c:forEach>
        </div>
   
</body>
</html>

