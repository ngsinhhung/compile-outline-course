package com.ou.repositories;

import com.ou.pojo.Lecturer;

import java.util.List;

public interface LecturerRepository {
    List<Lecturer> getAllLecturer();
    void updateLecturer(Lecturer lecturer);
    Lecturer getLecturerById(int id);
}
