package com.ou.repositories;

import com.ou.pojo.Assignment;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;

import java.util.List;

public interface AssignmentRepository {

     List<Lecturer> getAllLecturer();
     List<Assignment> getAllAssignment();
     boolean isCheckSubject(Subject subject);
     void addorUpdate(Assignment assignment);
     Assignment getAssignmentById(int id);
     void deletedAssigmentTeacher(int id);

}
