package com.ou.repositories;

import com.ou.pojo.Student;

import java.util.List;

public interface StudentRepository {
    List<Student> getAllStudent();
    Student getStudentById(int id);
    void addOrUpdateStudent(Student student);
}