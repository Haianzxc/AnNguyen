package com.mycompany.test;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.*;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class StudentDB {
    public static Student getByID(int sID){
        Student s=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Schools;","AnNguyen","abcd");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select id, name, gender,dob,password from Student where id="+sID);
            if(rs.next()){
                int id=rs.getInt(1);
                String name=rs.getString(2);
                char gt=rs.getString(3).charAt(0);
                Date ns=rs.getDate(4);
                String pass=rs.getString(5);
                s= new Student(id,name,ns,gt,pass);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error");
        }
        return s;
    }
    public static void main(String[] args) {
        System.out.println(getByID(101));
    }
}