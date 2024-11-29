<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error.jsp"%>
<%@ page import="agrowise.UserDAO, agrowise.User" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    UserDAO userDAO = new UserDAO();
    try {
        User user = userDAO.authenticate(username, password);    
        session.setAttribute("userObj2024", user);
        response.sendRedirect("dashboard.jsp");
    } catch (Exception e) {
        request.setAttribute("message", "Wrong username or password.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
