package com.ou.controllers;

import com.ou.dto.ProfileDto;
import com.ou.services.LecturerService;
import com.ou.services.ProfileService;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private LecturerService lecturerService;

    @GetMapping("/admin")
    public String admin() {
        return "admin_account";
    }

    @GetMapping("/lecturer")
    public String lecturer(Model model) {
        model.addAttribute("lecturers", this.lecturerService.getAllLecturer());
        return "lecturer_account";
    }

    @PostMapping("/")
    public String updateProfile(@ModelAttribute("profileDto") ProfileDto profileDto) {
        this.userService.addOrUpdateProfileDto(profileDto);
        return "redirect:/users/lecturer";
    }

    @GetMapping("/{userID}")
    public String updateProfile(Model model, @PathVariable("userID") int id){
        model.addAttribute("profileDto", this.userService.getProfileUserById(id));
        return "user_profile";
    }

    @GetMapping("/student")
    public String student() {
        return "student_account";
    }
}
