/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBcontext;
import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class StudentDB  {

    public StudentDB() {
    }
    public Student login(String maSv,String password){
        
        String sqlQuerry ="select * from Student where Id ='?' and password ='?'";
        try {
            Connection conn = new DBcontext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlQuerry);
            ps.setString(1, maSv);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Student(rs.getInt(1),rs.getString(2), rs.getDate(3), rs.getString(4).charAt(0), rs.getString(5));
            }
                  
        } catch (Exception e) {
        }
        return null;
    }
    

    public static Student getByID(int sID) {
        
        return null;
    }

    //---------------------------------------------
    public static Student addNew(Student s) {
        return null;
    }

    //---------------------------------------------
    public static ArrayList<Student> getAll() {
        return null;
    }
    //---------------------------------------------

    public static Student changePass(Student s) {
        return null;
    }
//---------------------------------------------

    public static Course addNewCourse(Course c) {
       return null;

    }

//---------------------------------------------    
//---------------------------------------------

    public static boolean delete(Student s) {
        return false;

    }
    
//---------------------------------------------
  
}
