
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="utf-8" language="java" import="java.util.*,model.*" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <c:set var="page" value="${param.page}"/>
    <c:set var="pagesize" value="10"/>
    <c:if test="${empty page}">
        <c:set var="page" value="1"/>
        <c:set var="pagesize" value="10"/>
    </c:if>
    <c:set var="list" value="${Student.generate(200)}"/>    
   
    <h1>Welcome to FPT Library Management System</h1>
    <h2>Student List - Page ${page}</h2>
   <table >
       <tr><th>Student ID</th><th>Name</th><th>Gender</th><th>Date of birth</th></tr>
       <c:forEach var="s" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}" >
           <tr><td>${list[s].maSV}</td><td>${list[s].hoTen}</td><td>${list[s].gioiTinh}</td><td>${list[s].ngaySinh}</td></tr>
       </c:forEach> 
           
    </table>
        <a href="?page=1&pagesize=${pagesize}">First</a>
        <c:forEach var="i" begin="1" end="5" >            
            <a href=?page=${(page+i) mod pagesize}&pagesize=${pagesize}> ${(page+i)} </a>
        </c:forEach>
        <a href="?page=${list.size() div pagesize}&pagesize=${pagesize}">Last</a>
</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
