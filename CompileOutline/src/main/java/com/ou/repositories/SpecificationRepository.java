package com.ou.repositories;

import com.ou.pojo.Specification;

import java.util.List;

public interface SpecificationRepository {
    List<Specification> getAllSpecification();
    List<Specification> getListSpecificationDesc();
//    List<Specification> getSpecificationByLecturer(int lecturerId);
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);
}
