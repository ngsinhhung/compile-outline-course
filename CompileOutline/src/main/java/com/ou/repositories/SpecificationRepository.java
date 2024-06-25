package com.ou.repositories;

import com.ou.pojo.Specification;
import com.ou.pojo.Subject;

import java.util.List;

public interface SpecificationRepository {
    List<Specification> getAllSpecification();
    List<Subject> getAllSubjectNoAssignment();
    List<Specification> getListSpecificationDesc();
    List<Specification> getListSpecificationOfLecturerId(int lecturerId);
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);

    List<Subject>findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);

    List<Specification> findBySubjectAndYear (Subject subject , int year);



}
