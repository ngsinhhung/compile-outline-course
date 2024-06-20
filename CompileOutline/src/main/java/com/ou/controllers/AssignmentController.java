package com.ou.controllers;

import com.ou.pojo.Specification;
import com.ou.services.LecturerService;
import com.ou.services.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/assignment")
public class AssignmentController {

    @Autowired
    private LecturerService lecturerService;

    @Autowired
    private SpecificationService specificationService;

    @GetMapping("/")
    public String assignmentList(Model model) {
        Specification s = new Specification();
        s.setCredits(0);
        model.addAttribute("assignment", s);
        model.addAttribute("assignments", this.specificationService.getAllSpecification());
        return "assignmentList";
    }

    @PostMapping("/new")
    public String newAssignment(@ModelAttribute("assignment") Specification specification) {
        this.specificationService.createOrUpdateSpecification(specification);
        return "redirect:/assignment/";
    }
}
