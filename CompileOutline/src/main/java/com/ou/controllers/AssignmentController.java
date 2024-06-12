package com.ou.controllers;


import com.ou.pojo.Assignment;
import com.ou.services.AssignmentServices;
import com.ou.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@ControllerAdvice
@RequestMapping("/assignment")
public class AssignmentController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private AssignmentServices assignmentServices;

    @ModelAttribute
    public void getSubject(Model model) {
        model.addAttribute("subjects", this.assignmentServices.getAllSubjectNoAssignemnt());

        model.addAttribute("lecturers", this.assignmentServices.getAllLecturer());
        model.addAttribute("assignment", new Assignment());
    }

    @PostMapping("/add")
    public String addAssignement( Model model,
            @ModelAttribute(value = "assigment") @Valid Assignment assignment,
            BindingResult rs
    ) {
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



    @GetMapping("/{assigmentId}/updated")
    public String updateAssignment(Model model ,@PathVariable("assigmentId") int id){
        model.addAttribute("assignments",this.assignmentServices.getAssignmentById(id));
        model.addAttribute("allSubject",this.assignmentServices.findAllUnassignedSubjectsIncludingCurrent(id));
        return "assignemted";
    }


    @GetMapping("/")
    public String List(Model model) {
        model.addAttribute("assignments",this.assignmentServices.getAllAssignment());
        return "assignment";
    }
}
