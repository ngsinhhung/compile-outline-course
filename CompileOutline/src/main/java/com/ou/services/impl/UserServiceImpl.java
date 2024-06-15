package com.ou.services.impl;

import com.ou.dto.ProfileDto;
import com.ou.pojo.Faculty;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Profile;
import com.ou.pojo.User;
import com.ou.repositories.FacultyRepository;
import com.ou.repositories.LecturerRepository;
import com.ou.repositories.ProfileRepository;
import com.ou.repositories.UserRepository;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProfileRepository profileRepository;
    @Autowired
    private FacultyRepository facultyRepository;
    @Autowired
    private LecturerRepository lecturerRepository;

    @Override
    public ProfileDto getProfileUserById(int id) {
        User u = this.userRepository.getUserById(id);
        Profile p = this.profileRepository.getProfileById(id);
        Faculty f = new Faculty();
        if(u.getRole().equals("LECTURER")){
            f = this.facultyRepository.getFacultyOfLecturerId(id);
        } else if (u.getRole().equals("STUDENT")) {
            f = this.facultyRepository.getFacultyOfStudentId(id);
        }
        ProfileDto profileDto = new ProfileDto();
        profileDto.setId(id);
        profileDto.setUsername(u.getUsername());
        profileDto.setFullname(p.getFullname());
        profileDto.setEmail(p.getEmail());
        profileDto.setPhone(p.getPhone());
        profileDto.setAvatar(p.getAvatar());
        profileDto.setRole(u.getRole());
        profileDto.setIsActive(u.getIsActive());
        profileDto.setFacultyId(f.getId());
        return profileDto;
    }

    @Override
    public void addOrUpdateProfileDto(ProfileDto profileDto) {
        Faculty f = this.facultyRepository.getFacultyById(profileDto.getFacultyId());
        Lecturer l = this.lecturerRepository.getLecturerById(profileDto.getId());
        l.setFaculty(f);
        this.lecturerRepository.addOrUpdateLecturer(l);
        User u = this.userRepository.getUserById(profileDto.getId());
        u.setUsername(profileDto.getUsername());
        u.setIsActive(profileDto.getIsActive());
        this.userRepository.addOrUpdateUser(u);
        Profile p = this.profileRepository.getProfileById(profileDto.getId());
        p.setFullname(profileDto.getFullname());
        p.setEmail(profileDto.getEmail());
        p.setPhone(profileDto.getPhone());
        this.profileRepository.addOrUpdateProfile(p);
    }
}
