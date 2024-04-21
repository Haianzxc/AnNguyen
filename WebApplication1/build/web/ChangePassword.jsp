<%-- 
    Document   : ChangePassword
    Created on : Jan 16, 2024, 1:11:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<section>
   <h1>Welcome to FPT Library Management System</h1>

   <html>
<body>
    <h2>Change Password</h2>
   <form name="input" action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="oldPassword">Old Password:</label>
        <input type="password" id="oldPassword" name="oldPassword" required><br>

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>

        <button type="submit">Change Password</button>
    </form>
</body>
<html>

    

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>

