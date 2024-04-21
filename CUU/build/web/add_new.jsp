<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<jsp:useBean id="sv" class="model.Student" scope="session"/>

<section>

    <h2>Student Registration</h2>

    <form action="confirm.jsp" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="hoTen" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="matKhau" required></td>
            </tr>
            <tr>
                <td>Date of Birth:</td>
                <td><input type="text" name="ngaySinh" required></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><input type="text" name="gioiTinh" required></td>
            </tr>
            <tr>
               <td></td>
               <td><button type="submit">Register</button>
            </tr>
        </table>

        <!-- Submit button -->
   
    </form>


</section>

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
