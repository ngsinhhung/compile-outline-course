package com.ou.controllers;


import com.ou.pojo.*;
import com.ou.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

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
    private SubjectRequirementService subjectRequirementService;

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
    public String specificationList(Model model) {
        User u = this.homeController.getCurrentUser();
        model.addAttribute("specification", this.specificationService.getListSpecificationOfLecturerId(u.getId()));
        return "lecturerHome";
    }

    @GetMapping("/{specificationId}/edit")
    public String editSpecification(@PathVariable("specificationId") int specificationId, Model model) {
        model.addAttribute("specification", this.specificationService.getSpecificationById(specificationId));
        return "specification";
    }

    @PostMapping("/update")
    public String updateSpecification(@ModelAttribute("specification") Specification specification) {
        this.specificationService.createOrUpdateSpecification(specification);
        return String.format("redirect:/specification/%d/edit", specification.getId());
    }

    //requirement
    @GetMapping("/{specificationId}/requirement")
    public String requirement(@PathVariable("specificationId") int specificationId, RedirectAttributes redirectAttributes, Model model) {
        redirectAttributes.addFlashAttribute("specId", specificationId);
        Specification spec = this.specificationService.getSpecificationById(specificationId);
        SubjectRequirement subjectRequirement = new SubjectRequirement();
        subjectRequirement.setSubject(spec.getSubject());
        model.addAttribute("subjectRequirement", subjectRequirement);
        model.addAttribute("specId", specificationId);
        return "requirement";
    }

    @PostMapping("/requirement/save")
    public String saveRequirement(@ModelAttribute("subjectRequirement") SubjectRequirement subjectRequirement,
                                  @RequestParam("specId") int specId) {
        SubjectRequirementId subjectRequirementId = new SubjectRequirementId(subjectRequirement.getSubject().getId(), subjectRequirement.getSubjectRequirements().getId());
        subjectRequirement.setId(subjectRequirementId);
        this.subjectRequirementService.addOrUpdateSubjectRequirement(subjectRequirement);
        return String.format("redirect:/specification/%d/edit", specId);
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
    public String editObjectives(@ModelAttribute("objectives") Objective objective) {
        this.objectiveService.addOrUpdateObjective(objective);
        return String.format("redirect:/specification/%d/edit", objective.getSpecification().getId());
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
    public String editOutcomes(@ModelAttribute("outcomes") Outcome outcome) {
        this.outcomeService.addOrUpdateOutcome(outcome);
        return String.format("redirect:/specification/%d/edit", outcome.getSpecification().getId());
    }

    @GetMapping("/outcomes/{outcomeId}")
    public String editOutcome(@PathVariable("outcomeId") int outcomeId, Model model) {
        model.addAttribute("outcome", this.outcomeService.getOutcomeById(outcomeId));
        return "outcomes";
    }
}
