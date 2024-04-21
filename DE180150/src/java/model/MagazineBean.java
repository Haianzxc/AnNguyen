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
public class MagazineBean {

    public MagazineBean() {
        
    }
    
    
    
    public List<Magazine> getAll() {
        List<Magazine> magazines = new ArrayList<>();
        String sqlQuerry ="SELECT * FROM Magazine_DE180150";
        try {
            Connection conn = new DBcontext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlQuerry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Magazine magazine = new Magazine();
                magazine.setMagaID(rs.getString(1));
                magazine.setMagaTitle(rs.getString(2));
                magazine.setPublisher(rs.getString(3));
                magazine.setPrice(rs.getInt(4));
                magazines.add(magazine);
                
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(Magazine.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return magazines;
        
    }
    
    public static Magazine newMagazine(Magazine magazine) {
        Magazine m=null;
         String sqlQuerry ="INSERT INTO Magazine_DE180150 (MazID, MagazineTitle, Publisher, Price) VALUES (?, ?, ?, ?)";
        try  {
           Connection conn = new DBcontext().getConnection(); 
           PreparedStatement ps = conn.prepareStatement(sqlQuerry);
           ps.setString(1, magazine.getMagaID());
           ps.setString(2, magazine.getMagaTitle());
           ps.setString(3, magazine.getPublisher());
           ps.setInt(4,magazine.getPrice()); 
           ResultSet rs = ps.executeQuery();
           if (rs.next()) {
                m.setMagaID(rs.getString(1));
            } else {
                throw new RuntimeException("Insert fail..");
            }
        } catch (Exception ex) {
           Logger.getLogger(Magazine.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m; 
    }
}
