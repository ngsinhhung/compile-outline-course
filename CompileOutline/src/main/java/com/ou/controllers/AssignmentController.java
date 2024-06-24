package com.ou.controllers;

import com.ou.dto.requets.AssignmentDto;
import com.ou.pojo.Specification;
import com.ou.services.SpecificationService;
import com.ou.services.SpecificationYearService;
import com.ou.services.SubjectService;
import com.ou.services.YearService;
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
    private SubjectService subjectService;
    @Autowired
    private SpecificationService specificationService;
    @Autowired
    private SpecificationYearService specificationYearService;

    @ModelAttribute
    public void getNecessary(Model model){
        model.addAttribute("subjects", this.subjectService.getSubjects());
    }

    @GetMapping("/")
    public String assignmentList(Model model) {
        model.addAttribute("assignmentDto", new AssignmentDto());
        model.addAttribute("assignments", this.specificationService.getAllSpecification());
        return "assignmentList";
    }

    @PostMapping("/new")
    public String newAssignment(@ModelAttribute("assignmentDto") AssignmentDto assignmentDto) {
        Specification spec = assignmentDto.getSpecification();
        spec.setAssignmentDate(Instant.now());
        this.specificationService.createOrUpdateSpecification(spec);
        this.specificationYearService.addSpecificationYear(spec, assignmentDto.getStartYear());
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
