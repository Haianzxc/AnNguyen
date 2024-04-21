<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>

    <form name="input" action="search" method="post">
	<table>
                <tr>    
                    <td>Search by </td>
                    <td>
                        <select name="criteria">
                            <option value="id">ID</option>
                            <option value="name">Name</option>
                            <option value="dob">Date of Birth</option>
                            <option value="gender">Gender</option>
                        </select>
                    </td>
                </tr>
		<tr>
		   <td>Enter:</td><td><input type="text" name="input"/></td>
		</tr>
		<tr>
		   <td></td>
                   <td><input type="submit" value="Search"/>
                   </td>
		</tr>

	</table>
    </form>

</section>

<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
