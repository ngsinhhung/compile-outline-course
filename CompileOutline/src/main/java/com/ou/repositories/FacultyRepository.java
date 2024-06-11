package com.ou.repositories;

import com.ou.pojo.Faculty;

import java.util.List;

public interface FacultyRepository {
    List<Faculty> getFaculties();
    void addOrUpdate(Faculty faculty);
    Faculty getFacultyById(int id);
    void deleteFaculty(int id);
}
