package com.ou.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.logging.Logger;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index() {
        return "home";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }


//    @RequestMapping("/admin/manage-outlines")
//    public String manageOutlines() {
//        return "manageOutlines";
//    }
//
//    @RequestMapping("/admin/manage-accounts")
//    public String manageAccounts() {
//        return "register";
//    }
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
