package com.ou.controllers;


import com.ou.pojo.Objective;
import com.ou.pojo.Outcome;
import com.ou.pojo.Specification;
import com.ou.pojo.User;
import com.ou.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/specification")
public class SpecificationController {
    @Autowired
    private SpecificationService specificationService;

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private ObjectiveService objectiveService;
    @Autowired
    private OutcomeService outcomeService;

    @Autowired
    private HomeController homeController;

    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("requirements", this.requirementService.getAllRequirements());
    }

    @GetMapping("/")
    public String specificationList (Model model) {
        User u = this.homeController.getCurrentUser();
        model.addAttribute("specification", this.specificationService.getListSpecificationOfLecturerId(u.getId()));
        return "lecturerHome";
    }

    @GetMapping("/{specificationId}/edit")
    public String editSpecification(@PathVariable("specificationId") int specificationId, Model model) {
        model.addAttribute("specification",this.specificationService.getSpecificationById(specificationId));
        return "specification";
    }

    @PostMapping("/update")
    public String updateSpecification(@ModelAttribute("specification") Specification specification) {
        this.specificationService.createOrUpdateSpecification(specification);
        return String.format("redirect:/specification/%d/edit", specification.getId());
    }

    //objective
    @GetMapping("/{specificationId}/edit/objectives")
    public String editObjectives(@PathVariable("specificationId") int specificationId, Model model) {
        Specification specification = this.specificationService.getSpecificationById(specificationId);
        Objective objective = new Objective();
        objective.setSpecification(specification);
        model.addAttribute("objectives", objective);
        return "objectives";
    }

    @PostMapping("/objectives")
    public String editObjectives(@ModelAttribute("objectives") Objective objective ){
        this.objectiveService.addOrUpdateObjective(objective);
        return String.format("redirect:/specification/%d/edit",objective.getSpecification().getId());
    }

    @GetMapping("/objectives/{objectiveId}")
    public String editObjective(@PathVariable("objectiveId") int objectiveId, Model model) {
        model.addAttribute("objectives", this.objectiveService.getObjectiveById(objectiveId));
        return "objectives";
    }

    //outcomes
    @GetMapping("/{specificationId}/edit/outcomes")
    public String editOutcomes(@PathVariable("specificationId") int specificationId, Model model) {
        Specification specification = this.specificationService.getSpecificationById(specificationId);
        Outcome outcome = new Outcome();
        outcome.setSpecification(specification);
        model.addAttribute("outcome", outcome);
        return "outcomes";
    }

    @PostMapping("/outcomes")
    public String editOutcomes(@ModelAttribute("outcomes") Outcome outcome ){
        this.outcomeService.addOrUpdateOutcome(outcome);
        return String.format("redirect:/specification/%d/edit",outcome.getSpecification().getId());
    }

    @GetMapping("/outcomes/{outcomeId}")
    public String editOutcome(@PathVariable("outcomeId") int outcomeId, Model model) {
        model.addAttribute("outcome", this.outcomeService.getOutcomeById(outcomeId));
        return "outcomes";
    }
}
