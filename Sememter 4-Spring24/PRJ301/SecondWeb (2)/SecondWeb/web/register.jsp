<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>

    <form name="registerForm" action="register" method="post">
        <table>
            <tr>
                <td>Full Name:</td><td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <td>Date of Birth:</td><td><input type="date" name="dob"/></td>
            </tr>
            <tr>    
                <td>Gender:</td>
                <td>
                    <select name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Others">Others</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Register"/></td>
            </tr>
        </table>
    </form>
   
</section>

<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
