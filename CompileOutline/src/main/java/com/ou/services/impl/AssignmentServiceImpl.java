package com.ou.services.impl;

import com.ou.pojo.Assignment;
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
    public List<Assignment> getAllAssignment() {
        return this.assignmentRepository.getAllAssignment();
    }

    @Override
    public void assigmentTeacher(Assignment assignment) {
        this.assignmentRepository.addorUpdate(assignment);
    }

    @Override
    public boolean isCheckSubject(Subject subject) {
        return this.assignmentRepository.isCheckSubject(subject);
    }

    @Override
    public Assignment getAssignmentById(int id) {
        return this.assignmentRepository.getAssignmentById(id);
    }

    @Override
    public void deletedAssigmentTeacher(int id) {
        this.assignmentRepository.deletedAssigmentTeacher(id);
    }
}
