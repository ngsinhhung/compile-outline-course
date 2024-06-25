package com.ou.repositories;

import com.ou.pojo.Specification;
import com.ou.pojo.Subject;

import java.util.List;
import java.util.Map;

public interface SpecificationRepository {
    List<Specification> getAllSpecification();
    List<Subject> getAllSubjectNoAssignment();
    List<Specification> getListSpecificationOfLecturerId(int lecturerId);
//    List<Specification> getSpecificationByLecturer(int lecturerId);
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);

    List<Subject>findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId);
    List<Specification> getSpecifications(Map<String, String> params, Boolean isAdmin);

}
