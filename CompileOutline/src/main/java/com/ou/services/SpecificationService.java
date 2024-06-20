package com.ou.services;

import com.ou.pojo.Specification;

import java.util.List;

public interface SpecificationService {
    List<Specification> getAllSpecification();
    Integer getIdSpecificationLatest();
    Specification getSpecificationById(int specificationId);
    void createOrUpdateSpecification(Specification specification);
}
