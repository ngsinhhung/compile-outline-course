package com.ou.services;

import com.ou.dto.NewStudentDto;
import com.ou.dto.ProfileDto;

public interface UserService {
    ProfileDto getProfileUserById(int id);
    void updateProfileDto(ProfileDto profileDto);
    void addNewStudent(NewStudentDto newStudentDto);
}
