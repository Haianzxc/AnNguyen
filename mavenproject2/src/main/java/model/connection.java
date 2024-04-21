/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public interface connection {
    String dbUrl="jdbc:sqlserver://localhost:1433;databaseName=Schools;intergratedSecurity=false;encrypt=false;trustServerCertificate=true;";
    String dbUser="AnNguyen";
    String dbPass="abcd";
    String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
}
