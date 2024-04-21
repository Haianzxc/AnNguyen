/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class course {
    protected String courseID;
    protected String subject;
    protected String lecturerName;
    protected int credits;

    public course() {
    }

    public course(String courseID, String subject, String lecturerName, int credits) {
        this.courseID = courseID;
        this.subject = subject;
        this.lecturerName = lecturerName;
        this.credits = credits;
    }

    
    
    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    @Override
    public String toString() {
        return "course{" + "courseID=" + courseID + ", subject=" + subject + ", lecturerName=" + lecturerName + ", credits=" + credits + '}';
    }
    
    
}
