<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<!-- start the middle column -->

<section>

    <h2>Add New Course</h2>

    <form name="input" action="addCourseServlet" method="post">
        <table>
            <tr>
                <td>Course ID:</td>
                <td><input type="text" name="courseID" required></td>
            </tr>
            <tr>
                <td>Subject ID</td>
                <td><input type="text" name="subjectID" required></td>
            </tr>
            <tr>
                <td>Subject Name:</td>
                <td><input type="text" name="subjectName" required></td>
            </tr>
            <tr>
                <td>Group ID:</td>
                <td><input type="text" name="groupID" required></td>
            </tr>
            <tr>
               <td></td>
               <td><button type="submit">Register</button>
            </tr>
        </table>

        <!-- Submit button -->
   
    </form>


</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>

