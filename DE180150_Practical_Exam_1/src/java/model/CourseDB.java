/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class CourseDB {

    public CourseDB() {
    }
    
    public static List<course> getAll() {
        List<course> courses = new ArrayList<>();
        String sqlQuerry ="SELECT * FROM DE180150";
        try {
            Connection conn = new DBcontext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlQuerry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String couseID=rs.getString(1);
                String subject=rs.getString(2);
                String lecturerName=rs.getString(3);
                int credits =rs.getInt(4);
                courses.add(new course(couseID, subject, lecturerName, credits));
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(CourseDB.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return courses;
    } 
    public void addNew(course newCourse) {
        String sqlQuerry ="INSERT INTO DE180150 (CourseID, Subject, LecturerName, Credits) VALUES (?, ?, ?, ?)";
        try  {
           Connection conn = new DBcontext().getConnection(); 
           PreparedStatement ps = conn.prepareStatement(sqlQuerry);
           ps.setString(1, newCourse.getCourseID());
           ps.setString(2, newCourse.getSubject());
           ps.setString(3, newCourse.getLecturerName());
           ps.setInt(4, newCourse.getCredits()); 
           ps.executeUpdate();
        } catch (Exception ex) {
           Logger.getLogger(course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public static void main(String[] args) {
//        List<course> courses = new ArrayList<>();
//        String sqlQuerry ="SELECT * FROM DE180150";
//        try {
//            Connection conn = new DBcontext().getConnection();
//            PreparedStatement ps = conn.prepareStatement(sqlQuerry);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                String couseID=rs.getString(1);
//                String subject=rs.getString(2);
//                String lecturerName=rs.getString(3);
//                int credits =rs.getInt(4);
//                courses.add(new course(couseID, subject, lecturerName, credits));
//            }
//            
//        } catch (Exception ex) {
//            Logger.getLogger(CourseDB.class.getName()).log(Level.SEVERE, null, ex);
//            
//        }
//        for(course c :courses){
//            System.out.println(c.toString());
//        }
//    }
}
