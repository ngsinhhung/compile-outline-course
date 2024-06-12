package com.ou.services;

import com.ou.pojo.Assignment;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;

import java.util.List;

public interface AssignmentServices {
     List<Lecturer> getAllLecturer();
     List<Subject> getAllSubjectNoAssignemnt();
     List<Assignment> getAllAssignment();
     void assigmentTeacher(Assignment assignment);
     boolean isCheckSubject(Subject subject);
     Assignment getAssignmentById(int id);
     void deletedAssigmentTeacher(int id);

     List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);
}
