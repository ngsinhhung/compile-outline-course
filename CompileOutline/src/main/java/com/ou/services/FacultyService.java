package com.ou.services;

import com.ou.pojo.Faculty;

import java.util.List;

public interface FacultyService {
    List<Faculty> getFaculties();
    void addOrUpdate(Faculty faculty);
    Faculty getFacultyById(int id);
    void deleteFaculty(int id);
}
