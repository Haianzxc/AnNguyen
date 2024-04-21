/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.function.Predicate;

/**
 *
 * @author ASUS
 */
public class StudentList extends ArrayList<Student>{
    public StudentList(){
        add(new Student("Nguyen Van A", "01/01/2000", "M"));
        add(new Student("Nguyen Van Y", "01/01/2000", "F"));
        add(new Student("Nguyen Van C", "01/01/2010", "M"));
        add(new Student("Nguyen Van F", "01/01/2000", "F"));
        add(new Student("Nguyen Van E", "01/01/2005", "M"));
    }
    public Student getByID(int id){
        ArrayList<Student> rs = search(p->p.getMaSV()==id);
        if(rs.isEmpty()) return null;
        return rs.get(0);
    }
    //------------------------------------------------------------    
    public ArrayList<Student> search (Predicate<Student> p){
        ArrayList <Student> rs = new ArrayList<>();
        for (Student s:this) {
            if(p.test(s))rs.add(s);
        }
        return rs;
    }
    //------------------------------------------------------------    

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        for(Student s: this){
            result.append(s.toString()).append("\n");
        }
        return result.toString();
    }
    //------------------------------------------------------------  
    public boolean addStudent(Student student) {
        
        if(this.add(student))
            return true;
        else
            return false;
    }
}