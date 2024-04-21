/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class Course {
   protected String courseID;
   protected String subjectID;
   protected String subName;
   protected String groupID;

    public Course(String courseID, String subjectID, String subName, String groupID) {
        this.courseID = courseID;
        this.subjectID = subjectID;
        this.subName = subName;
        this.groupID = groupID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getGroupID() {
        return groupID;
    }

    public void setGroupID(String groupID) {
        this.groupID = groupID;
    }

    @Override
    public String toString() {
        return "Course{" + "courseID=" + courseID + ", subjectID=" + subjectID + ", subName=" + subName + ", groupID=" + groupID + '}';
    }
   
}
