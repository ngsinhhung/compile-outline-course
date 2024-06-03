package com.ou.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/admin/manage-outlines")
    public String manageOutlines() {
        return "manageOutlines";
    }

    @RequestMapping("/admin/manage-accounts")
    public String manageAccounts() {
        return "manageAccounts";
    }

    @RequestMapping("/admin/manage-courses")
    public String manageCourses() {
        return "manageCourses";
    }
    @RequestMapping("/admin/assignment-teacher")
    public String assignmentTeacher() {
        return "assignmentTeachers";
    }
}
