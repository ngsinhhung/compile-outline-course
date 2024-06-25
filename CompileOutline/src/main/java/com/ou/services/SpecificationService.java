package com.ou.services;

import com.ou.pojo.Specification;
import com.ou.pojo.Subject;

import java.util.List;

public interface SpecificationService {
    List<Specification> getAllSpecification();

    List<Subject> getAllSubjectNoAssignment();
    List<Specification> getListSpecificationOfLecturerId(int lecturerId);
    Integer getIdSpecificationLatest();
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);
    void submitSpecification(int specificationId);

    List<Subject>findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);

    Specification findBySubjectAndYear (Subject subject , int year);
}
