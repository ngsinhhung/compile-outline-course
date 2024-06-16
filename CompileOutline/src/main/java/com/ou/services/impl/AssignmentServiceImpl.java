package com.ou.services.impl;

import com.ou.pojo.Assignments;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;
import com.ou.repositories.AssignmentRepository;
import com.ou.services.AssignmentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AssignmentServiceImpl implements AssignmentServices {
    @Autowired
    private AssignmentRepository assignmentRepository;
    @Override
    public List<Lecturer> getAllLecturer() {
        return this.assignmentRepository.getAllLecturer();
    }

    @Override
    public List<Assignments> getAllAssignment() {
        return this.assignmentRepository.getAllAssignment();
    }

    @Override
    public List<Subject> getAllSubjectNoAssignemnt() {
        return this.assignmentRepository.getAllSubjectNoAssignemnt();
    }

    @Override
    public List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId) {
        return this.assignmentRepository.findAllUnassignedSubjectsIncludingCurrent(currentAssignmentId);
    }

    @Override
    public List<Lecturer> getLecturersByFacultyId(int facultyId) {
        return this.assignmentRepository.getLecturersByFacultyId(facultyId);
    }

    @Override
    public List<Assignments> getAssignmentByTeacherId(int lectureId) {
        return this.assignmentRepository.getAssignmentByTeacherId(lectureId);
    }

    @Override
    public void assigmentTeacher(Assignments assignment) {
        this.assignmentRepository.addorUpdate(assignment);
    }

    @Override
    public boolean isCheckSubject(Subject subject) {
        return this.assignmentRepository.isCheckSubject(subject);
    }

    @Override
    public Assignments getAssignmentById(int id) {
        return this.assignmentRepository.getAssignmentById(id);
    }

    @Override
    public void deletedAssigmentTeacher(int id) {
        this.assignmentRepository.deletedAssigmentTeacher(id);
    }
}
