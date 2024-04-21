<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>

    <form name="input" action="login" method="post">
	<table>
		<tr>
		   <td>Username (ID):</td><td><input type="text" name="user"/></td>
		</tr>
		<tr>
		   <td>Password:</td><td><input type="password" name="pass"/></td>
		</tr>
		<tr>
		   <td></td>
                   <td><input type="submit" value="Login"/>
                         <button type="button" onclick="redirectToRegistration()">Register</button>
                   </td>
		</tr>

	</table>
    </form>
   <script>
    function redirectToRegistration() {
        window.location.href = "register";
    }
    </script>
</section>

<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
