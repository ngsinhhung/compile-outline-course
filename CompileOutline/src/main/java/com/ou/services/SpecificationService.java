package com.ou.services;

import com.ou.pojo.Assignments;

import java.util.List;

public interface SpecificationService {
    List<Assignments> getAssignmentById(int assignmentId);
}
