<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List, agrowise.UserDAO, agrowise.User" %>

<%
    UserDAO userDAO = new UserDAO();
    List<User> usersTotal = userDAO.getUsers();

    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agro - Dashboard page</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
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
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li class="active"><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/field_registration.jsp">Field Registration</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><p class="navbar-text">Signed in as <%= user.getUsername() %></p></li>
                    <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container theme-showcase" role="main">

        <div class="jumbotron">
            <h1>3η Ατομική Άσκηση</h1>
        </div>

        <div class="page-header">
            <h1>Welcome <code><%= user.getFirstname() %> <%= user.getLastname() %></h1>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <h2>Available Users <span class="badge"><%= usersTotal.size() %></span></h2>
                <table class="table table-bordered">
                    <thead class="alert alert-info">
                        <tr>
                            <th>Α/Α</th>
                            <th>Last Name</th>
                            <th>First Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int counter = 1;
                            for (User currentUser : usersTotal) {
                                boolean isLoggedInUser = currentUser.getUsername().equals(user.getUsername());
                        %>
                        <tr <%= isLoggedInUser ? "class='success'" : "" %>>
                            <td><%= counter++ %></td>
                            <td><%= currentUser.getFirstname() %></td>
                            <td><%= currentUser.getUsername() %></td>
                            <td>
                                <a href="profile.jsp?uname=<%= currentUser.getUsername() %>">
                                    <%= currentUser.getLastname() %>
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
