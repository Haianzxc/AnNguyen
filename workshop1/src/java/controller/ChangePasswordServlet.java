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


/**
 *
 * @author Admin
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String username = request.getParameter("username");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
           
            Student s=slist.getByID(Integer.parseInt(username));
            String msg="";
            if(Student.login(Integer.parseInt(username), oldPassword)!=null){
               s.setMatKhau(newPassword);
                msg+="change Password succesfull!";
                request.setAttribute("message", msg);
                request.getRequestDispatcher("ChangePasswordResult.jsp").forward(request, response);
            }else{
                throw new RuntimeException("Ðang nhap fail...");
            }
            
                
           
            
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

