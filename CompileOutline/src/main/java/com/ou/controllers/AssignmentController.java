package com.ou.controllers;

import com.ou.pojo.Assignments;
import com.ou.services.AssignmentServices;
import com.ou.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/assignment")
public class AssignmentController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private AssignmentServices assignmentServices;

    @ModelAttribute
    public void getSubject(Model model) {
        model.addAttribute("subjects", this.assignmentServices.getAllSubjectNoAssignemnt());
        model.addAttribute("assignment", new Assignments());
    }


    @PostMapping("/add")
    public String addAssignment(Model model,
                                @ModelAttribute(value = "assignment") @Valid Assignments assignment,
                                BindingResult rs) {
        if (!rs.hasErrors()) {
            try {
                this.assignmentServices.assigmentTeacher(assignment);
                return "redirect:/assignment/";
            } catch (Exception ex) {
                model.addAttribute("errMsg", ex.toString());
            }
        }
        return "assignment";
    }

    @GetMapping("/{assignmentId}/update")
    public String updateAssignment(Model model, @PathVariable("assignmentId") int id) {
        model.addAttribute("assignments", this.assignmentServices.getAssignmentById(id));
        model.addAttribute("allSubject", this.assignmentServices.findAllUnassignedSubjectsIncludingCurrent(id));
        return "assignemted";
    }

    @GetMapping("/")
    public String list(Model model) {
        model.addAttribute("assignments", this.assignmentServices.getAllAssignment());
        return "assignment";
    }
}
