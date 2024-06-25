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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.logging.Logger;


@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private UserService userService;

    @ModelAttribute
    public void currentUser(Model model) {
        if (this.getCurrentUser() != null) {
            model.addAttribute("currentUser", this.getCurrentUser());
        }
    }

    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                String username = userDetails.getUsername();
                User u = this.userService.getUserByUsername(username);
                return u;
            }
        }
        return null;
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
    public String register(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "register";
        }
        try {
            this.userService.registerLecturer(user);
            return "redirect:/login";
        } catch (Exception exception) {
            model.addAttribute("error", "Vui Long upload anh.");
            System.err.println(exception.getMessage());
        }
        return "register";
    }

    @GetMapping("/information")
    public String informationPage() {
        return "information";
    }
}
