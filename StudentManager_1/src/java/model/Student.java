/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Student implements Serializable, Comparable<Student> {
    private int maSV;
    private String hoTen;
    private Date ngaySinh;
    private char gioiTinh;
    private String matKhau;

    static int counter=1000;

    public Student(){
        
    }
    public Student(int maSV, String hoTen, Date ngaySinh, char gioiTinh, String matKhau) {
        this.maSV = maSV;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.matKhau = matKhau;
    }
    
    public Student( String hoTen, String ngaySinh, String gioiTinh) {
        this.maSV = ++counter;
        this.hoTen = hoTen;
        setNgaySinh(ngaySinh);
        this.gioiTinh = gioiTinh.charAt(0);
        this.matKhau = ngaySinh;
    }

    
    public int getMaSV() {
        return maSV;
    }

    public void setMaSV(int maSV) {
        this.maSV = maSV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getNgaySinh() {
        SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(ngaySinh);
    }

    public void setNgaySinh(String ngaySinh) {
        SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.ngaySinh = sdf.parse(ngaySinh);
        } catch (ParseException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public java.sql.Date getDob(){
        return new java.sql.Date(ngaySinh.getTime());
    }
    public String getGioiTinh() {
        switch(gioiTinh){
            case 'M':return "Male"; 
            case 'F':return "Female"; 
            case 'L':return "Lesbian";
            default: return "NA";
        }
        
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh.charAt(0);
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    
   

    
    @Override
    public int compareTo(Student otherStudent) {
        return this.ngaySinh.compareTo(otherStudent.ngaySinh);
    }

    
    
    @Override
    public String toString() {
        return maSV + " : " + hoTen + " : " +getNgaySinh() + " : " +getGioiTinh();
    }

    public static ArrayList<Student> generate (int n){
        ArrayList<Student>ls=new ArrayList<>(); 
        for(int i=1;i<=n;i++){
            ls.add(new Student(i,"Name"+i,new Date(),i%2==0?'M':'F', "abcd"));    
        }
        return ls;
    }
    
}