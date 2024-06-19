package com.ou.controllers;

import com.ou.pojo.User;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.logging.Logger;

@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private UserService userService;

    @ModelAttribute
    public void currentUser(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                String username = userDetails.getUsername();
                User u = this.userService.getUserByUsername(username);
                model.addAttribute("currentUser", u);
            }
        }
//        String username = userDetails.getUsername();
//        User u = this.userService.getUserByUsername(username);
//        model.addAttribute("currentUser", u);
    }


    @RequestMapping("/")
    public String index() {
        return "home";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user) {
        this.userService.registerLecturer(user);
        return "redirect:/login";
    }


//    @RequestMapping("/admin/manage-outlines")
//    public String manageOutlines() {
//        return "manageOutlines";
//    }
//
//
//
//    @RequestMapping("/assignment")
//    public String assignmentTeacher() {
//        return "assignment";
//    }
//    @RequestMapping("/teacher/home")
//    public String teacherHome() {
//        return "teacherHome";
//    }
//
//    @RequestMapping("/teacher/chat")
//    public String chatPage() {
//        return "chatpage";
//    }
//    @RequestMapping("/teacher/create-specification")
//    public String createSpecification() {
//        return "createSpecification";
//    }


}
