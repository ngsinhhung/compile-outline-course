package com.ou.repositories;

import com.ou.pojo.Lecturer;

import java.util.List;

public interface LecturerRepository {
    List<Lecturer> getAllLecturer();
    void addOrUpdateLecturer(Lecturer lecturer);
    Lecturer getLecturerById(int id);
}
