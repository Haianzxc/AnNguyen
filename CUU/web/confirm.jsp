<%@page contentType="text/html" pageEncoding="utf-8" import="model.*"%>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<jsp:setProperty name="sv" property="*"/>

<section>
    <h2>Student Confirm</h2>

    <form action="addnew" method="post">
        <table>
            <li>Student name: ${sv.hoTen}
            <li>Student pass: ${sv.matKhau}
            <li>Student dob: ${sv.ngaySinh}
            <li>Student gender: ${sv.gioiTinh}
        </table>

        <!-- Submit button -->  
        <button type="submit">Confirm</button>
        <input type="button" value="Back" onclick="javascript:history.go(-1);">
    </form>
</section>
<%@ include file="/includes/column_right_news.jsp" %>
<%@ include file="/includes/footer.jsp" %>
