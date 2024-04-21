<%@page contentType="text/html" pageEncoding="utf-8" import="model.Student" import="model.StudentList" import="java.util.ArrayList"%>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>

<!-- start the middle column -->

<section>
    <h1>Welcome to FPT Library Management System</h1>
    
   <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date of Birth</th>
            <th>Gender</th>
        </tr>
         <% ArrayList<Student> list = (ArrayList<Student>) request.getAttribute("studentList");
        for (Student s : list) { %>
            <tr>
                <td><%=s.getMaSV()%></td>
                <td><%=s.getHoTen() %></td>
                <td><%=s.getNgaySinh()%></td>
                <td><%=s.getGioiTinh()%></td>
            </tr>
       <% } %>
    </table>

</section>


<!-- end the middle column -->

<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
