package com.ou.controllers;

import com.ou.pojo.User;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.logging.Logger;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;

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
    public String register(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if (!result.hasErrors()) {
            try {
                this.userService.registerLecturer(user);
                return "redirect:/login";
            } catch (Exception exception) {
                System.err.println(exception.getMessage());
            }
        }
        return "register";
    }

}
