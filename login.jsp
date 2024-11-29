<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file="header.jsp" %>
	<head>        
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="your email">

		<title>Agro - login page</title>

		<!-- Bootstrap Optional theme -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<style>						
			.form-signin {
				max-width: 330px;
				padding: 15px;
				margin: 0 auto;
			}
			.form-signin .form-signin-heading,
			.form-signin .checkbox {
				margin-bottom: 10px;
			}
			.form-signin .form-control {
				position: relative;
				height: auto;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				padding: 10px;
				font-size: 16px;
			}
			.form-signin .form-control:focus {
				z-index: 2;
			}
			.form-signin input[type="text"] {
				margin-bottom: 10px;
				border-bottom-right-radius: 0;
				border-bottom-left-radius: 0;
			
			}
			.form-signin input[type="password"] {
				margin-bottom: 10px;
				border-top-left-radius: 0;
				border-top-right-radius: 0;
			}
		</style>
	</head>
	
	<body>
		
		<div class="container" role="main">

            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
    
            <form class="form-signin" method="post" action="loginController.jsp">
                <h2 class="form-signin-heading text-center">Please sign in</h2>
                <label for="inputusername" class="sr-only">Username</label> 
                <input type="text" name="username" id="inputusername" class="form-control" placeholder="username" required>
                <label for="inputpassword" class="sr-only">Password</label>
                <input name="password" type="password" id="inputpassword" class="form-control" placeholder="password" required>
    
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
            <div class="alert alert-info"><strong>Help: </strong>
                    <ul>
                        <li>For John Doe: jdoe 1111</li>
                        <li>For Mary Smith: msmith 2222</li>
                        <li>For Bob Jakson: bjakson 3333</li>
                    </ul>
            </div>
    
        </div>

		<%@ include file="footer.jsp" %>
	</body>
</html>