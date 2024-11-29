<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.Year" %>

<!DOCTYPE html>
<html lang="en">
<footer class="navbar-inverse">
    <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <p class="text-center">&copy; Copyright <%= Year.now().getValue() %> by ismgroup21</p>
                </div>
            </div>
        </div>
</footer>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>