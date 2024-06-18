package com.ou.services;

import com.ou.dto.ProfileDto;
import com.ou.pojo.Student;
import com.ou.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService {
    ProfileDto getProfileUserById(int id);
    User getUserByUsername(String username);
    void updateProfileDto(ProfileDto profileDto);
    void addNewStudent(Student student);
    void registerAdmin(User u);
    void registerLecturer(User u);
}
