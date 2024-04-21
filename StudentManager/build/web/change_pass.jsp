<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>

     <form name="input" action="changePasswordServlet" method="post">
	<table>
		<tr>
		   <td>Your ID:</td><td><input type="text" name="username"/></td>
		</tr>
                <tr>
		   <td>Old password</td><td><input type="text" name="oldPassword"/></td>
		</tr>
		<tr>
		   <td>New password:</td><td><input type="password" name="newPassword"/></td>
		</tr>
		<tr>
		   <td></td>
                   <td><input type="submit" value="Confirm"/></td>
		</tr>

	</table>
    </form>
</section>

<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
