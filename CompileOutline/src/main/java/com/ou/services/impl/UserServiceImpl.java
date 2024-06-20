package com.ou.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.pojo.*;
import com.ou.repositories.*;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service("userDetailsService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProfileRepository profileRepository;


    @Autowired
    private LecturerRepository lecturerRepository;
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private AdminRepository adminRepository;


    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public Profile getProfileById(int id) {
        return this.profileRepository.getProfileById(id);
    }

    @Override
    public void updateProfile(Profile profile) {
        if(!profile.getFile().isEmpty()){
            try {
                Map rs = this.cloudinary.uploader().upload(profile.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                profile.setAvatar(rs.get("secure_url").toString());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        System.out.println(profile.getAvatar());
        this.profileRepository.updateProfile(profile);
        User u = this.userRepository.getUserById(profile.getId());
        u.setUsername(profile.getUser().getUsername());
        u.setIsActive(profile.getUser().getIsActive());
        this.userRepository.addOrUpdateUser(u);
        if(profile.getUser().getRole().equals("ROLE_LECTURER")){
            Lecturer l = this.lecturerRepository.getLecturerById(profile.getId());
            l.setFaculty(profile.getUser().getLecturer().getFaculty());
            this.lecturerRepository.updateLecturer(l);
        } else if (profile.getUser().getRole().equals("ROLE_STUDENT")) {
            Student s = this.studentRepository.getStudentById(profile.getId());
            s.setFaculty(profile.getUser().getStudent().getFaculty());
            this.studentRepository.updateStudent(s);
        }
    }

    @Override
    public void addNewStudent(Student student) {
        User u = student.getUser();
        String pwd = student.getUser().getPassword();
        u.setPassword(this.passwordEncoder.encode(pwd).toString());
        u.setRole("ROLE_STUDENT");
        u.setIsActive(true);
        this.userRepository.addOrUpdateUser(u);
        User user = this.userRepository.getUserByUsername(u.getUsername());
        student.setId(user.getId());
        student.setUser(user);
        this.studentRepository.addStudent(student);
        Profile p = student.getUser().getProfile();
        p.setId(user.getId());
        p.setUser(user);
        this.profileRepository.addProfile(p);
    }

    @Override
    public void registerAdmin(User u) {
        String pwd = u.getPassword();
        u.setPassword(this.passwordEncoder.encode(pwd).toString());
        u.setRole("ROLE_ADMIN");
        u.setIsActive(true);
        this.userRepository.addOrUpdateUser(u);
        this.adminRepository.addAdmin(u);
    }

    @Override
    public void registerLecturer(User u) {
        if(!u.getProfile().getFile().isEmpty()){
            try {
                Map rs = this.cloudinary.uploader().upload(u.getProfile().getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                u.getProfile().setAvatar(rs.get("secure_url").toString());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        String pwd = u.getPassword();
        u.setPassword(this.passwordEncoder.encode(pwd).toString());
        u.setRole("ROLE_LECTURER");
        u.setIsActive(false);
        this.userRepository.addOrUpdateUser(u);
        User user = this.userRepository.getUserByUsername(u.getUsername());
        Lecturer l = u.getLecturer();
        l.setId(user.getId());
        l.setUser(user);
        this.lecturerRepository.addLecturer(l);
        Profile p = u.getProfile();
        p.setId(user.getId());
        p.setUser(user);
        this.profileRepository.addProfile(p);
    }


    @Override
    public User getUserByUsername(String username) {
        return this.userRepository.getUserByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepository.getUserByUsername(username);
        if (u == null || !u.getIsActive()) {
            throw new UsernameNotFoundException("Không tồn tại hoặc chưa active !");
        }
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRole()));
        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }


    @Override
    public boolean authUser(String username, String password) {
        return this.userRepository.authUser(username,password);
    }

    @Override
    public boolean userExistByName(String username) {
        return this.userRepository.userExistByName(username);
    }
}
