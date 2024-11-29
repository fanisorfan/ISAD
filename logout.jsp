<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>

<head>
		
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- automatically will redirect to index_ex2_8XXXXXX.jsp after 2 seconds -->
	<meta http-equiv="refresh" content="2;url=index.jsp" />
			<title>Agro - logout</title>
</head>
<body>	

	<div class="container theme-showcase" role="main">

		<div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιηθηκε με επιτυχία</div>		

	</div>
	<!-- /container -->

	<!-- footer -->
	<%@ include file="footer.jsp" %>

</body>
</html>
