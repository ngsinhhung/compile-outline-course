package com.ou.services;

import com.ou.dto.requets.UpdateRequireRequest;
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

    boolean authUser(String username,String password);

    boolean userExistByName(String username);

    void updateRequired(UpdateRequireRequest updateRequireRequest) throws Exception;

    void updateRequired(User user) throws Exception;


}
