<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>

   <html>
<body>
    <form name="input" action="login" method="post">
	<table>
		<tr>
		   <td>Username:</td><td><input type="text" name="user"/></td>
		</tr>
		<tr>
		   <td>Password:</td><td><input type="password" name="pass"/></td>
		</tr>
		<tr>
                    <td></td><td><input type="submit" value="Login"/><a href="ChangePassword.jsp">ChangePassword</a></td>
                    
		</tr>
	</table>
        
	</form>
</body>
<html>

    

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
