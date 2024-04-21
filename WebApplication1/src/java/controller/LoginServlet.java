/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;
import model.StudentList;
/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        String us = request.getParameter("user");
        String ps = request.getParameter("pass");
        StudentList slist=(StudentList)request.getServletContext().getAttribute("slist");
        Student s=slist.getByID(Integer.parseInt(us));
        s=s.login(Integer.parseInt(us), ps);
        String msg="";
        if(s==null) msg+="not found!";
        else msg="Welcome "+s+" ";
        request.setAttribute("message", msg);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
   

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
