package com.ou.services;

import com.ou.dto.ProfileDto;
import com.ou.pojo.Profile;
import com.ou.pojo.Student;
import com.ou.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService {
    Profile getProfileById(int id);
    User getUserByUsername(String username);
    void updateProfile(Profile profile);
    void addNewStudent(Student student);
    void registerAdmin(User u);
    void registerLecturer(User u);
}
