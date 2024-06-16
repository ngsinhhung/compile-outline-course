package com.ou.services;

import com.ou.pojo.Assignments;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;

import java.util.List;

public interface AssignmentServices {
     List<Lecturer> getAllLecturer();
     List<Subject> getAllSubjectNoAssignemnt();
     List<Assignments> getAllAssignment();
     List<Assignments> getAssignmentByTeacherId(int lectureId);
     void assigmentTeacher(Assignments assignment);
     boolean isCheckSubject(Subject subject);
     Assignments getAssignmentById(int id);
     void deletedAssigmentTeacher(int id);
     List<Lecturer> getLecturersByFacultyId(int facultyId);
     List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);
}
