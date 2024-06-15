package com.ou.repositories;

import com.ou.pojo.Assignments;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;

import java.util.List;

public interface AssignmentRepository {

     List<Lecturer> getAllLecturer();

     List<Lecturer> getLecturersByFacultyId(int facultyId);
     List<Subject> getAllSubjectNoAssignemnt();
     List<Assignments> getAllAssignment();
     boolean isCheckSubject(Subject subject);
     void addorUpdate(Assignments assignment);
     Assignments getAssignmentById(int id);
     void deletedAssigmentTeacher(int id);

     List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);

}
