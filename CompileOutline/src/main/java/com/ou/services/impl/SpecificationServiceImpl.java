package com.ou.services.impl;

import com.ou.pojo.Specification;
import com.ou.pojo.Subject;
import com.ou.repositories.SpecificationRepository;
import com.ou.services.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
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
    public List<Subject> getAllSubjectNoAssignment() {
        return this.specificationRepository.getAllSubjectNoAssignment();
    }

    @Override
    public List<Specification> getListSpecificationOfLecturerId(int lecturerId) {
        return this.specificationRepository.getListSpecificationOfLecturerId(lecturerId);
    }

    @Override
    public Integer getIdSpecificationLatest() {
        if (!this.specificationRepository.getListSpecificationDesc().isEmpty()) {
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

    @Override
    public void submitSpecification(int specificationId) {
        Specification specification = this.specificationRepository.getSpecificationById(specificationId);
        specification.setIsSubmitted(true);
        specification.setCreatedAt(Instant.now());
        this.createOrUpdateSpecification(specification);
    }

    @Override
    public List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId) {
        return this.specificationRepository.findAllUnassignedSubjectsIncludingCurrent(currentAssignmentId);
    }
}
