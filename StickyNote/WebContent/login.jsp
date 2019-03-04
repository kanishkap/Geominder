<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->

<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script type="text/javascript" src="js/Validation.js"></script> -->
</head>
<body>
	<div class="container">


		<section>
			<div id="container_demo">
				<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
				<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
					id="tologin"></a>
				<div id="wrapper">
					<div id="login" class="animate form">
						<form action="LoginServlet" name="login" autocomplete="on" method="post">
							<h1>Log in</h1>
							<center><h3 style="color: red; font-weight: bold;">${error}</h3></center>
							<p>
								<label for="username" class="uname" data-icon="u"> Your
									email or username </label> <input id="username" name="username"
									required="required" type="text"
									placeholder="myusername or mymail@mail.com" />
							</p>
							<p>
								<label for="password" class="youpasswd" data-icon="p">
									Your password </label> <input id="password" name="password"
									required="required" type="password" placeholder="eg. X8df!90EO"/>
							</p>
							<p class="keeplogin">
								<input type="checkbox" name="loginkeeping" id="loginkeeping"
									value="loginkeeping" /> <label for="loginkeeping">Keep
									me logged in</label>
							</p>
							<p class="login button">
								<input type="submit" value="Login" />
							</p>
							<p class="change_link">
								Not a member yet ? <a href="#toregister" class="to_register">Join
									us</a>
							</p>
							
						</form>
					</div>

					<div id="register" class="animate form">
						<form action="RegisterServlet" autocomplete="on" name="register" method="post">
							<h1>Sign up</h1>
							<center><h3 style="color: red; font-weight: bold;">${register_error}</h3></center>
							<p>
								<label for="usernamesignup" class="uname" data-icon="u">Your
									username</label> <input id="usernamesignup" name="usernamesignup"
									required="required" type="text"
									placeholder="mysuperusername690"  pattern="[A-Za-z].{5,8}" title="username must be alphabet and contains 5 to 8" />
							</p>
							<p>
								<label for="emailsignup" class="youmail" data-icon="e">
									Your email</label> <input id="emailsignup" name="emailsignup"
									required="required" type="email"
									placeholder="mysupermail@mail.com" pattern=".+@gmail.com" pattern=".+@gmail.com" title="Please provide only a gmail e-mail address"/>
							</p>
							<p>
								<label for="passwordsignup" class="youpasswd" data-icon="p">Your
									password </label> <input id="passwordsignup" name="passwordsignup"
									required="required" type="password" placeholder="eg. X8df!90EO" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@,$,&]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/>
							</p>
							<p class="signin button">
								<input type="submit" value="Sign up" />
							</p>
							<p class="change_link">
								Already a member ? <a href="#tologin" class="to_register">
									Go and log in </a>
							</p>
							
						</form>
					</div>
					
				</div>
			</div>
		</section>
	</div>
</body>
</html>