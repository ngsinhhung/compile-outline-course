package com.ou.controllers;

import com.ou.pojo.Specification;
import com.ou.services.LecturerService;
import com.ou.services.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/{assignmentId}")
    public String editAssignment(@PathVariable("assignmentId") int assignmentId, Model model) {
        model.addAttribute("assignment", this.specificationService.getSpecificationById(assignmentId));
        return "assignemted";
    }
}
