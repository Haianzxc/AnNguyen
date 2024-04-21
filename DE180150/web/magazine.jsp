<%-- 
    Document   : add_new
    Created on : Mar 15, 2024, 3:35:45 PM
    Author     : ASUS
--%>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <h1>Add New Magazine</h1>
    <section>
    <form action="newMagazineServlet" method="post">
        Maz ID: <input type="text" name="mazID" value="${magazine.mazID}" /><br/>
        Magazine Title: <input type="text" name="magazineTitle" value="${magazine.magazineTitle}" /><br/>
        Publisher: <input type="text" name="publisher" value="${magazine.publisher}" /><br/>
        Price: <input type="text" name="price" value="${magazine.price}" /><br/>
        <input type="submit" value="Submit" />
    </form>
    </section>
</html>
<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
