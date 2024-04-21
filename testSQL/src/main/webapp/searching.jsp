<%-- 
    Document   : search
    Created on : Jan 16, 2024, 8:23:41 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="utf-8" import="model.StudentList" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<jsp:useBean id="slist" class="model.StudentList" scope="application"/>
<!-- start the middle column -->
    
<section>
    <html>
        <body>
            <h1>Welcome to FPT Library Management System</h1>
            <h2>searching Student</h2>
            <form name="input" action="${pageContext.request.contextPath}//SearchingServlet" method="post">
                <table>
                    <tr>
                        <td>Mã Số Sinh Viên:</td><td><input type="text" name="user"/></td>
                    </tr>
                    <tr>
                        <td></td><td><input type="submit" value="Enter"/></td>

                    </tr>
                </table>
            </form>
        </body>
        <html>        
</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>