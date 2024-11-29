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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Lab exercise template 2019-2020">

    <title>Agro Field Registration Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/agro.css">
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
    </nav>

    <div class="hero-section">
        <h1>Manage your olive tree fields efficiently and effectively.</h1>
    </div>

    <div class="container">
        <div class="field-register">
            <h2>Register Your Field</h2>

            <!-- Field Name -->
            <label for="fieldName">Field Name:</label>
            <input type="text" id="fieldName" name="fieldName" placeholder="Enter the field name" required>

            <!-- Field Location -->
            <label for="area">Field Location:</label>
            <select id="area" name="area" required>
                <option value="Κρήτη">Κρήτη</option>
                <option value="Πελοπόννησος">Πελοπόννησος</option>
                <option value="Μακεδονία">Μακεδονία</option>
                <option value="Θεσσαλία">Θεσσαλία</option>
                <option value="Ήπειρος">Ήπειρος</option>
            </select>

            <!-- Acreage -->
            <label for="acreage">Acreage of Olive Groves:</label>
            <input type="number" id="acreage" name="acreage" min="0" step="0.1" required>

    <!-- Submit and Reset Buttons -->
            <div style="text-align: center; margin-top: 20px;">
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Submit</button>
                <button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
            </div>
        </div>

        <div class="fields">
            <a href="fields.jsp">See the fields you have registered</a>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>