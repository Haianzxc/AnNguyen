
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="utf-8" language="java" import="java.util.*,model.*" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>
    <h2>Student List</h2>
   <table border="1">
    <c:set var="list" value="${CourseDB.getAll()}"/> 
       <tr><th>Course ID</th><th>Subject</th><th>lecturer Name</th><th>Credits</th></tr>
       <c:forEach var="c" begin="0" end="${list.size()}" >
           <tr><td>${list[c].courseID}</td><td>${list[s].subject}</td><td>${list[s].lecturerName}</td><td>${list[s].credits}</td></tr>
       </c:forEach>     
    </table>

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
