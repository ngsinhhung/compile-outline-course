package com.ou.repositories;

import com.ou.pojo.Assignments;

import java.util.List;

public interface SpecificationRepository {

    List<Assignments> getAssignmentById(int assignmentId);




}
