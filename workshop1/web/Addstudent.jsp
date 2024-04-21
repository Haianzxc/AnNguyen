<%-- 
    Document   : Addstudent
    Created on : Jan 16, 2024, 6:05:40 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="utf-8"  %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Add Student</title>
    </head>
    <body>

        <h2>Add Student</h2>

        <form action="${pageContext.request.contextPath}/AddStudentServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="dob">Date of Birth:</label>
            <input type="text" id="dob" name="dob" required><br>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="N/A">N/A</option>
            </select><br>

            <input type="submit" value="Add Student">
        </form>
        <h2>${message}</h2>    
    </body>
    </html>
   
    
</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
