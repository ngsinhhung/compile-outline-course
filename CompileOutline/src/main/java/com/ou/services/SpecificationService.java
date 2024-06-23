package com.ou.services;

import com.ou.pojo.Specification;

import java.util.List;

public interface SpecificationService {
    List<Specification> getAllSpecification();
    List<Specification> getListSpecificationOfLecturerId(int lecturerId);
    Integer getIdSpecificationLatest();
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);
    void submitSpecification(int specificationId);
}
