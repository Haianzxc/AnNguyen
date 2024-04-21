/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBcontext;
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
public class Magazine {
    protected String magaID;
    protected String magaTitle;
    protected String publisher;
    protected int price;

    public Magazine() {
    }

    public Magazine(String magaID, String magaTitle, String publisher, int price) {
        this.magaID = magaID;
        this.magaTitle = magaTitle;
        this.publisher = publisher;
        this.price = price;
    }
    
    

    public String getMagaID() {
        return magaID;
    }

    public void setMagaID(String magaID) {
        this.magaID = magaID;
    }

    public String getMagaTitle() {
        return magaTitle;
    }

    public void setMagaTitle(String magaTitle) {
        this.magaTitle = magaTitle;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
   

    @Override
    public String toString() {
        return "Magazine{" + "magaID=" + magaID + ", magaTitle=" + magaTitle + ", publisher=" + publisher + ", price=" + price + '}';
    }
    
    
}
