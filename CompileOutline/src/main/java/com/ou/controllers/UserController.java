package com.ou.controllers;

import com.ou.dto.NewStudentDto;
import com.ou.dto.ProfileDto;
import com.ou.pojo.Admin;
import com.ou.pojo.User;
import com.ou.services.AdminService;
import com.ou.services.LecturerService;
import com.ou.services.StudentService;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private LecturerService lecturerService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("admins", this.adminService.getAllAdmins());
        model.addAttribute("user", new User());
        return "admin_account";
    }

    @PostMapping("/admin")
    public String newAdmin(@ModelAttribute("user") User u) {
        this.userService.registerAdmin(u);
        return "redirect:/users/admin";
    }


    @GetMapping("/lecturer")
    public String lecturer(Model model) {
        model.addAttribute("lecturers", this.lecturerService.getAllLecturer());
        return "lecturer_account";
    }

    @PostMapping("/")
    public String updateProfile(@ModelAttribute("profileDto") @Valid ProfileDto profileDto, BindingResult rs) {
        if(!rs.hasErrors()) {
            try {
                this.userService.updateProfileDto(profileDto);
                if (profileDto.getRole().equals("LECTURER")){
                    return "redirect:/users/lecturer";
                }
                else{
                    return "redirect:/users/student";
                }
            }
            catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        return String.format("redirect:/users/%d", profileDto.getId());
    }

    @GetMapping("/{userID}")
    public String updateProfile(Model model, @PathVariable("userID") int id){
        model.addAttribute("profileDto", this.userService.getProfileUserById(id));
        return "user_profile";
    }

    @GetMapping("/student")
    public String student(Model model) {
        model.addAttribute("students", this.studentService.getAllStudent());
        model.addAttribute("studentDto", new NewStudentDto());
        return "student_account";
    }

    @PostMapping("/student")
    public String newStudent(@ModelAttribute(value = "studentDto") NewStudentDto student) {
        this.userService.addNewStudent(student);
        return "redirect:/users/student";
    }
}
