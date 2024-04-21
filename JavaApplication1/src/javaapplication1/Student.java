/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javaapplication1;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Student implements Comparable<Student> {
    private int maSV=1000;
    private String hoTen;
    private Date ngaySinh;
    private char gioiTinh;
    private String matKhau;

    static int counter=1000;
    static Student[] students = new Student[5];
    public Student(int maSV, String hoTen, Date ngaySinh, char gioiTinh, String matKhau) {
        this.maSV = maSV;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.matKhau = matKhau;
    }
    
    public Student( String hoTen, String ngaySinh, String gioiTinh) {
        this.maSV = ++counter ;
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

    public String getGioiTinh() {
        switch(gioiTinh){
            case 'M':return "Male"; 
            case 'F':return "Female"; 
            case 'L':return "Lesbian";
            default: return "NA";
        }
        
    }

    public void setGioiTinh(char gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    
    public Student login(int msv, String inputMatKhau) {
//        this.getMaSV()==msv &&
        if(this.getMaSV()==msv && matKhau.equals(inputMatKhau)) return this;
        return null;
    }

    
    @Override
    public int compareTo(Student otherStudent) {
        return this.ngaySinh.compareTo(otherStudent.ngaySinh);
    }

    
    
    public String toString() {
        return maSV + " : " + hoTen + " : " +getNgaySinh() + " : " +getGioiTinh();
    }

    public static void main(String[] args) {
        students[0] = new Student("Nguyen Van A", "03/02/2000", "F");
        students[1] = new Student("Nguyen Van Y", "04/01/2000", "F");
        students[2] = new Student("Nguyen Van C", "05/01/2010", "M");
        students[3] = new Student("Nguyen Van F", "06/01/2000", "F");
        students[4] = new Student("Nguyen Van E", "07/01/2005", "M");
        for (Student student : students){
            System.out.println(student.toString());
        }
    }
   
}
