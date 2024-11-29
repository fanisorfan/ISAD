<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.Year" %>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="header.jsp" %>
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agro - Register</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>
        .bg-warning {
            padding: 15px 20px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">8220161</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                        <li><a href="<%= request.getContextPath() %>/agro/register.jsp">Register</a></li>
                        <li><a href="<%= request.getContextPath() %>/agro/login.jsp">Sign in</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container theme-showcase" role="main">
        <div class="jumbotron">
            <h1>3η Ατομική Άσκηση</h1>
        </div>

        <div class="page-header">
            <h2>Registration Form</h2>
        </div>
        <p class="bg-warning">Please fill in the following form to create an account</p>
		
        <form action="<%= request.getContextPath() %>/agro/registerController.jsp" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
            </div>
            <div class="form-group">
                <label for="surname">Surname</label>
                <input type="text" class="form-control" id="surname" name="surname" placeholder="Surname" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            <div class="form-group">
                <label class="checkbox-inline"><input type="checkbox" name="terms"> I agree to the terms and conditions</label>
            </div>
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Submit</button>
            <button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>