package com.ou.controllers;

import com.ou.pojo.Specification;
import com.ou.services.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;

@Controller
@ControllerAdvice
@RequestMapping("/assignment")
public class AssignmentController {

    @Autowired
    private SpecificationService specificationService;

    @ModelAttribute
    public void getNecessary(Model model){
        model.addAttribute("subjects", this.specificationService.getAllSubjectNoAssignment());
    }

    @GetMapping("/")
    public String assignmentList(Model model) {
        Specification s = new Specification();
        s.setCredits(0);
        s.setAssignmentDate(Instant.now());
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
    public String editAssignment(@PathVariable("assignmentId") int id, Model model) {
        model.addAttribute("assignment", this.specificationService.getSpecificationById(id));
        model.addAttribute("allSubject",this.specificationService.findAllUnassignedSubjectsIncludingCurrent(id));
        System.out.println(this.specificationService.getSpecificationById(1));
        return "assignemted";
    }
}
