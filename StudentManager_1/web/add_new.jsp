<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<jsp:useBean id="sv" class="model.Student" scope="session"/>

<section>

    <h2>Add New Student</h2>

    <form name="input" action="addStudentServlet" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="pass" required></td>
            </tr>
            <tr>
                <td>Date of Birth:</td>
                <td><input type="text" name="dob" required></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><select id="gender" name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Lesbian">Lesbian</option>
                </select></td>
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
