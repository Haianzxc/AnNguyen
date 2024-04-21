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
        return null;
    }
    //---------------------------------------------

    public static Student update(Student s) {
        return null;

    }
//---------------------------------------------

    public static boolean delete(Student s) {
        return false;

    }

//---------------------------------------------
    public static void main(String[] args) {
        System.out.println(getByID(101));
    }
}
