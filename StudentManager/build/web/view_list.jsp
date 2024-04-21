
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="utf-8" language="java" import="java.util.*,model.*" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>
    <h2>Student List</h2>
   <table border="1">
  
    <c:set var="list" value="${StudentDB.getAll()}"/> 
       <tr><th>Student ID</th><th>Name</th><th>Gender</th><th>Date of birth</th></tr>
       <c:forEach var="s" begin="0" end="${list.size()-1}" >
           <tr><td>${list[s].maSV}</td><td>${list[s].hoTen}</td><td>${list[s].gioiTinh}</td><td>${list[s].ngaySinh}</td></tr>
       </c:forEach>     
    </table>

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
