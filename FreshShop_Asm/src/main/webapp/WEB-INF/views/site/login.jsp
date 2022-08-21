<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/login.css"/>
</head>
<body>
	<section class="login-block">
		<div class="container">
			<div class="row">
				<div class="col-md-4 login-sec">
					<h2 class="text-center">Login Now</h2>
					<form action="/loginForm" method="post" class="login-form">
						<div class="form-group">
							<label for="exampleInputEmail1" class="text-uppercase">Username</label>
							<input name="username" type="text" class="form-control">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1" class="text-uppercase">Password</label>
							<input name="password" type="password" class="form-control">
						</div>


						<div class="form-check">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="remember" value="true"> <small>Remember Me</small>
							</label>
							<button class="btn btn-login float-right">Login</button>
						</div>

					</form>
				</div>
				<div class="col-md-8 banner-sec">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner" role="listbox">
						</div>

					</div>
				</div>
			</div>
			</div>
	</section>
</body>
</html>