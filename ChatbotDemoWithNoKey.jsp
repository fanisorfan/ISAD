<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="agrowise.UserDAO, agrowise.User" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Simulate bot response for testing
    String userMessage = request.getParameter("userMessage");
    String botResponse = "I can help you with olive harvesting, watering, and soiling. Ask me anything!";

    if (userMessage != null && !userMessage.trim().isEmpty()) {
        // Here you can simulate the logic you'd use to call OpenAI's API
        // For now, we simulate the response.
        if (userMessage.toLowerCase().contains("water")) {
            botResponse = "Olive trees require deep watering during dry periods, but avoid overwatering.";
        } else if (userMessage.toLowerCase().contains("harvest")) {
            botResponse = "Harvest olives when they are fully ripe, typically from late fall to early winter.";
        } else if (userMessage.toLowerCase().contains("soil")) {
            botResponse = "Olives grow best in well-drained, slightly alkaline soil.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Agro-Wise - Olive Tree Management and Chatbot Assistant">
    <title>Agro-Wise Chatbot</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/agro.css">
    <style>
        .chat-container {
            max-width: 800px;
            margin: 50px auto;
            border: 2px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .chat-box {
            height: 400px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
        }
        .user-input {
            width: calc(100% - 60px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .send-btn {
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .send-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <!-- Navbar code here -->
    </nav>

    <div class="container theme-showcase" role="main">
        <div class="jumbotron">
            <h1>Olive Tree Chatbot Assistant</h1>
            <p>Ask questions about olive harvesting, watering, and soiling.</p>
        </div>

        <div class="chat-container">
            <div class="chat-box" id="chat-box">
                <% if (userMessage != null && !userMessage.trim().isEmpty()) { %>
                    <div><b>You:</b> <%= userMessage %></div>
                    <div><b>Bot:</b> <%= botResponse %></div>
                <% } else { %>
                    <div><b>Bot:</b> Ask a question about olive trees, and I will respond.</div>
                <% } %>
            </div>

            <form action="<%= request.getRequestURI() %>" method="post">
                <input type="text" name="userMessage" class="user-input" placeholder="Ask your question..." value="<%= userMessage != null ? userMessage : "" %>">
                <button type="submit" class="send-btn">Send</button>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
