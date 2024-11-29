<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="agrowise.UserDAO, agrowise.User" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
    <link rel="stylesheet" href="/css/bootstrap-theme.min.css">
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
                        <li><a href="<%= request.getContextPath() %>/8220161/exercise3/register.jsp">Register</a></li>
                        <li><a href="<%= request.getContextPath() %>/agro/login.jsp">Sign in</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container theme-showcase" role="main">
        <div class="jumbotron">
            <h1>3η Ατομική Άσκηση</h1>
        </div>
            <%
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String confirmPassword = request.getParameter("confirmPassword");
                String terms = request.getParameter("terms");
                ArrayList<String> errors = new ArrayList<String>();
                boolean success = false;
                String errorMessage = null;

                if (name == null || name.length() < 3) {
                    errors.add("Name must be at least 3 characters.");
                }
                if (surname == null || surname.length() < 3) {
                    errors.add("Surname must be at least 3 characters.");
                }
                if (username == null || username.length() < 5) {
                    errors.add("Username must be at least 5 characters.");
                }
                if (password == null || password.length() < 6) {
                    errors.add("Password must be at least 6 characters.");
                }
                if (confirmPassword == null || !confirmPassword.equals(password)) {
                    errors.add("Passwords do not match.");
                }
                if (terms == null) {
                    errors.add("You must agree to the terms.");
                }

                if (errors.isEmpty()) {
                    UserDAO userDAO = new UserDAO();
                    User newUser = new User(name, surname, email, username, password);
                    try {
                        userDAO.register(newUser);
                        success = true;
                    } catch (Exception e) {
                        errorMessage = e.getMessage();
                    }
                }
            %>

            <% if (success) { %>
                <h1>Registration Successful!</h1>
                <ul>
                    <li><strong>Name:</strong> <%= name %></li>
                    <li><strong>Surname:</strong> <%= surname %></li>
                    <li><strong>Username:</strong> <%= username %></li>
                    <li><strong>Email:</strong> <%= email %></li>
                </ul>
            <% } else if (errorMessage != null) { %>
                <h1>Registration form has errors</h1>
                <div class="container theme-showcase" role="main">
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                </div>
                <div class="container theme-showcase\" role="main">
                    <a href="<%= request.getContextPath() %>/agro/register.jsp" class="btn btn-info">
                        <i class="fa fa-arrow-left">< Back to the form</i>
                    </a>
                </div>
            <% } else { %>
                <h1>Registration form has Errors</h1>
                <div class="container theme-showcase" role="main">
                    <div class="alert alert-danger" role="alert">
                        <ol>
                            <% for (String error : errors) { %>
                                <li><%= error %></li>
                            <% } %>
                        </ol>
                    </div>
                </div>
                <div class="container theme-showcase\" role="main">
                    <a href="<%= request.getContextPath() %>/agro/register.jsp" class="btn btn-info">
                        <i class="fa fa-arrow-left">< Back to the form</i>
                    </a>
                </div>
            <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>

