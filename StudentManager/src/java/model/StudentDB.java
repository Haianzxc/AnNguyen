/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class StudentDB implements connection {

    public StudentDB() {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Student getByID(int sID) {
        new StudentDB();
        Student s = null;

        try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select id, name, gender,dob,password from Student where id=" + sID);
            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                char gt = rs.getString(3).charAt(0);
                Date ns = rs.getDate(4);
                String pass = rs.getString(5);
                s = new Student(id, name, ns, gt, pass);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    //---------------------------------------------
    public static Student addNew(Student s) {
        new StudentDB();
        try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement stmt = con.prepareStatement("Insert into Student(name,gender,dob,password)output inserted.ID values(?,?,?,?)");
            stmt.setString(1, s.getHoTen());
            stmt.setString(2, "" + s.getGioiTinh().charAt(0));
            stmt.setDate(3, s.getDob());
            stmt.setString(4, s.getMatKhau());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s.setMaSV(rs.getInt(1));
            } else {
                throw new RuntimeException("Insert fail..");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex.getMessage());
        }
        return s;
    }

    //---------------------------------------------
    public static ArrayList<Student> getAll() {
        StudentDB studentDB = new StudentDB();
        ArrayList<Student> list = new ArrayList<>();
        try(Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement stmt = con.prepareStatement("select Id,Name,Gender,Dob,password from Student");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                int id=rs.getInt(1);
                String name=rs.getString(2);
                char sex=rs.getString(3).charAt(0);
                java.util.Date dob= new java.util.Date(rs.getDate(4).getTime());
                String pass=rs.getString(5);
                list.add(new Student(id, name, dob, sex, pass));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex.getMessage());
        }
        return list;
    }
    //---------------------------------------------

    public static Student changePass(Student s) {
        new StudentDB();
        try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            String sql = "UPDATE Student SET password = ? WHERE id = ?";
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setString(1, s.getMatKhau());
                pstmt.setInt(2, s.getMaSV());

                pstmt.executeUpdate();
                return s;
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); 
        }
        return null; 
    }
//---------------------------------------------

    public static Course addNewCourse(Course c) {
       new StudentDB();
        try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement stmt = con.prepareStatement("Insert into Student(CID,SubID,SubName,GroupID)output inserted.ID values(?,?,?,?)");
            stmt.setString(1, c.getCourseID());
            stmt.setString(2,c.getSubjectID());
            stmt.setString(3, c.getSubName());
            stmt.setString(4, c.getGroupID());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
              c.setCourseID(rs.getString(1));
            } else {
                throw new RuntimeException("Insert fail..");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex.getMessage());
        }
        return c;

    }

//---------------------------------------------    
//---------------------------------------------

    public static boolean delete(Student s) {
        return false;

    }

//---------------------------------------------
  
}
