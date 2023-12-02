<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">

<title>Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-none fixed-top">
		<a class="navbar-brand text-light d-flex" href="/"><h1>
				🌜Face
				<h1 class="space">Space</h1>
			</h1></a>

		<ul class="navbar-nav">
			<li class="text-light"><a href="#login"><button class="reg">login</button></a></li>
			<li><a href="#register"><button class="reg">
						register</button></a></li>
		</ul>

	</nav>
	<div class="content">


		<div class="video-wrapper">
			<video id="myVideo" autoplay loop   src="/images/background.mov"></video>

			<div class="d-flexer">
				<h1 id="main_stuff" class="wordsToShow mt-3 space1">WELCOME..</h1>
			</div>
		</div>
		<div id="video" class="firstImage">
			<div class="d-flexer">
				<h1 id="next_stuff" class="wordsToShow text-light">to the
					future of Social media</h1>
			</div>
		</div>
		<div id="nextPage" class="nextPage">
			<div class="video-wrapper">
				<video loop="loop" autoplay src="/images/gotoit.mov"></video>
				<div class="d-flexer">
					<h1 id="tough_stuff" class="wordsToShow text-light">Communicate
						with anyone..</h1>
				</div>
			</div>
			<div id="video1" class="secondImage">
					<div class="d-flexer">
						<h1 id="forever_stuff" class="wordsToShow text-light">the
							internet last...</h1>
					</div>
				</div>
			
			<div id="nextPage" class="nextPage">
				<div class="video-wrapper">
					<video autoplay="autoplay" loop="loop" src="/images/loveThis.mov"></video>
					<div class="d-flexer">
						<h1 class="wordsToShow text-light">Forever..</h1>
					</div>
				</div>
				<div class="loginImage">
					<div id="login" class="d-flexer">
						<h1 class="wordsToShow text-light mb-3 mt-3">coming back...</h1>
						<form:form class="mt-3" action="/login" method="post"
							modelAttribute="newLogin">
							<div class="form-group">
								<form:label path="email" class="h5 text-light">Email address</form:label>
								<form:errors class="text-danger" path="email" />
								<form:input path="email" type="email" name="email"
									class="form-control w-100 mx-auto mb-3" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" />

							</div>
							<div class="form-group">
								<form:label path="password" class="h5 text-light">Password</form:label>
								<form:input type="password" path="password"
									class="form-control w-100 mx-auto mb-3"
									id="exampleInputPassword1" placeholder="Password" />

							</div>
							<input type="submit" class="btn btn-success" id="button"
								value="Login" />
						</form:form>
					</div>
				</div>
				<div class="registerImage">
					<div id="register" class="d-flexer">
						<h1 class="wordsToShow text-light mb-3 mt-3">Join us..</h1>
						<form:form action="/register" modelAttribute="newUser"
							method="post">

							<div class="first_name">
								<form:label path="firstName" class="h5 text-light">First Name:</form:label>
								<form:errors class="text-danger" path="firstName" />
								<form:input path="firstName" type="text"
									class="form-control w-100 mx-auto mb-1" />
							</div>
							<div class="last_name">
								<form:label path="lastName" class="h5 text-light">Last Name:</form:label>
								<form:errors class="text-danger" path="lastName" />
								<form:input path="lastName" type="text"
									class="form-control w-100 mx-auto mb-1" />
							</div>
							<div class="email">
								<form:label path="email" class="h5 text-light">Email:</form:label>
								<form:errors class="text-danger" path="email" />
								<form:input type="email" path="email"
									class="form-control w-100 mx-auto mb-1" />
							</div>
							<div class="password">
								<form:label path="password" class="h5 text-light">Password:</form:label>
								<form:errors class="text-danger" path="password" />
								<form:input type="password" path="password"
									class="form-control w-100 mx-auto mb-1" id="password" />
							</div>
							<div class="confirm">
								<form:label path="confirm" class="h5 text-light">Confirm Password:</form:label>
								<form:errors class="text-danger" path="confirm" />
								<form:input path="confirm" type="password"
									class="form-control w-100 mx-auto mb-1" />
							</div>
							<div class="last">
								<input type="submit" class="btn btn-success" id="button"
									value="Register" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
			</div>
</div>


			<script src="script/script.js">
				
			</script>
</body>
</html>

