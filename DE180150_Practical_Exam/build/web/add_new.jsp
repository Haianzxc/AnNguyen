<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>


<section>

    <h2>Add New Course</h2>

    <form name="input" action="addNewCourseServlet" method="post">
        <table>
            <tr>
                <td>Course ID:</td>
                <td><input type="text" name="courseID" required></td>
            </tr>
            <tr>
                <td>Subject:</td>
                <td><input type="text" name="subject" required></td>
            </tr>
            <tr>
                <td>lecturer Name:</td>
                <td><input type="text" name="lecturerName" required></td>
            </tr>
            <tr>
                <td>Credits:</td>
                <td><input type="number" name="credit" required></td>
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
