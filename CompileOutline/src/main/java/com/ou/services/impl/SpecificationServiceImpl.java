package com.ou.services.impl;

import com.ou.pojo.Assignments;
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
    public List<Assignments> getAssignmentById(int assignmentId) {
        return this.specificationRepository.getAssignmentById(assignmentId);
    }
}
