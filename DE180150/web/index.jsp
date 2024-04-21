<%@page contentType="text/html" pageEncoding="utf-8" import="java.util.*,model.*" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<!-- start the middle column -->

<section>
     <h1>Magazine List</h1>
        <table border="1">
        <tr>
            <th>Maz ID</th>
            <th>Magazine Title</th>
            <th>Publisher</th>
            <th>Price</th>
        </tr>
            <c:forEach var="mg" items="${list}">
            <tr>
                <td>${mg.magaID}</td>
                <td>${mg.magaTitle}</td>
                <td>${mg.publisher}</td>
                <td>${mg.price}</td>
            </tr>
            </c:forEach>
    </table>
        <a href="magazine.jsp">Add New Magazine</a>
        <p>Number of Requests to Magazine List: ${requestCount}</p>
</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
