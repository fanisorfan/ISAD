<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="agrowise.UserDAO, agrowise.User" %>


<%
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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Lab exercise template 2019-2020">

    <title>Agro Index Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
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
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                    <% if (user != null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/dashboard.jsp">Dashboard</a></li>
                        <li><a href="<%= request.getContextPath() %>/agro/field_registration.jsp">Field Registration</a></li>
                    <% } %>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (user == null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/register.jsp">Register</a></li>
                        <li><a href="<%= request.getContextPath() %>/agro/login.jsp">Sign in</a></li>
                    <% } else { %>
                        <li>
                            <p class="navbar-text">Signed in as <%= user.getFirstname() %></p>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath() %>/agro/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container theme-showcase" role="main">

        <div class="jumbotron">
            <h1>Agro-Wise</h1>
        </div>

        <div class="page-header">
            <h1>George Flourakis</h1>
        </div>
        
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>