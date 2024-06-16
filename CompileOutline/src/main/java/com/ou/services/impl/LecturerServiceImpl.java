package com.ou.services.impl;

import com.ou.pojo.Lecturer;
import com.ou.repositories.LecturerRepository;
import com.ou.services.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LecturerServiceImpl implements LecturerService {
    @Autowired
    private LecturerRepository lecturerRepository;

    @Override
    public List<Lecturer> getAllLecturer() {
        return this.lecturerRepository.getAllLecturer();
    }
}
