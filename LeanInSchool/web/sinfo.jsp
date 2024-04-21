<%-- 
    Document   : sinfo
    Created on : Jan 16, 2024, 4:03:41 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="utf-8" import="model.StudentList" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>
    
    <h2>Students List</h2>
    <form name="input" action="${pageContext.request.contextPath}/ViewStudentListServlet" method="post">
	<table>
		
            <td><input type="submit" value="viewList"/></td>
                    
		
	</table>
        
	</form>
    ${message}

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
