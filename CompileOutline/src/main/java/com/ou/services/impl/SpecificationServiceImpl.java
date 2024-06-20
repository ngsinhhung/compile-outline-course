package com.ou.services.impl;

import com.ou.pojo.Specification;
import com.ou.repositories.SpecificationRepository;
import com.ou.services.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecificationServiceImpl implements SpecificationService {
    @Autowired
    private SpecificationRepository specificationRepository;

    @Override
    public List<Specification> getAllSpecification() {
        return this.specificationRepository.getAllSpecification();
    }

    @Override
    public Integer getIdSpecificationLatest() {
        if(!this.specificationRepository.getListSpecificationDesc().isEmpty()){
            List<Specification> specifications = this.specificationRepository.getListSpecificationDesc();
            return specifications.get(0).getId();
        }
        return 1;
    }

    @Override
    public Specification getSpecificationById(int specificationId) {
        return this.specificationRepository.getSpecificationById(specificationId);
    }

    @Override
    public void createOrUpdateSpecification(Specification specification) {
        this.specificationRepository.createOrUpdateSpecification(specification);
    }
}
