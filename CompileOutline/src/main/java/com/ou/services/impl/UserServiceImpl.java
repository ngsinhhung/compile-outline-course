package com.ou.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.dto.NewStudentDto;
import com.ou.dto.ProfileDto;
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
    private FacultyRepository facultyRepository;
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
    public ProfileDto getProfileUserById(int id) {
        User u = this.userRepository.getUserById(id);
        Profile p = this.profileRepository.getProfileById(id);
        Faculty f = new Faculty();
        if(u.getRole().equals("ROLE_LECTURER")){
            f = this.facultyRepository.getFacultyOfLecturerId(id);
        } else if (u.getRole().equals("ROLE_STUDENT")) {
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
    public void updateProfileDto(ProfileDto profileDto) {
        Faculty f = this.facultyRepository.getFacultyById(profileDto.getFacultyId());
        if(profileDto.getRole().equals("ROLE_LECTURER")){
            Lecturer l = this.lecturerRepository.getLecturerById(profileDto.getId());
            l.setFaculty(f);
            this.lecturerRepository.updateLecturer(l);
        } else if (profileDto.getRole().equals("ROLE_STUDENT")) {
            Student s = this.studentRepository.getStudentById(profileDto.getId());
            s.setFaculty(f);
            this.studentRepository.updateStudent(s);
        }
        User u = this.userRepository.getUserById(profileDto.getId());
        u.setUsername(profileDto.getUsername());
        u.setIsActive(profileDto.getIsActive());
        this.userRepository.addOrUpdateUser(u);
        Profile p = this.profileRepository.getProfileById(profileDto.getId());
        p.setFullname(profileDto.getFullname());
        p.setEmail(profileDto.getEmail());
        p.setPhone(profileDto.getPhone());
        if(!profileDto.getFile().isEmpty()){
            try {
                Map rs = this.cloudinary.uploader().upload(profileDto.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                p.setAvatar(rs.get("secure_url").toString());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        this.profileRepository.updateProfile(p);
    }

    @Override
    public void addNewStudent(NewStudentDto newStudentDto) {
        User u = new User();
        u.setUsername(newStudentDto.getUsername());
        String pwd = newStudentDto.getPassword();
        u.setPassword(this.passwordEncoder.encode(pwd).toString());
        u.setRole("ROLE_STUDENT");
        u.setIsActive(true);
        this.userRepository.addOrUpdateUser(u);

        User u1 = this.userRepository.getUserByUsername(newStudentDto.getUsername());

        Student s = new Student();
        s.setId(u1.getId());
        s.setUser(u1);
        s.setFaculty(newStudentDto.getFaculty());
        this.studentRepository.addStudent(s);

        Profile p = new Profile();
        p.setId(u1.getId());
        p.setEmail(newStudentDto.getEmail());
        p.setUser(u1);
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
}
