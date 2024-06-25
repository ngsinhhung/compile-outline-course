package com.ou.controllers;

import com.ou.pojo.Specification;
import com.ou.pojo.SubjectRequirementId;
import com.ou.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/specification")
@CrossOrigin
public class ApiSpecificationController {
    @Autowired
    private SubjectRequirementService subjectRequirementService;
    @Autowired
    private ObjectiveService objectiveService;
    @Autowired
    private OutcomeService outcomeService;
    @Autowired
    private SpecificationRatingService specificationRatingService;
    @Autowired
    private SpecificationService specificationService;

    @DeleteMapping(value = "/{subjectId}/{subjectRequirementsId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteSubjectRequirement(@PathVariable int subjectId,
                                    @PathVariable int subjectRequirementsId) {
        try{
            this.subjectRequirementService.deleteSubjectRequirementById(subjectId, subjectRequirementsId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    @DeleteMapping(value = "/objectives/{objectiveId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteObjective(@PathVariable int objectiveId) {
        try{
            this.objectiveService.deleteObjectiveById(objectiveId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    @DeleteMapping(value = "/outcomes/{outcomeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteOutcomes(@PathVariable int outcomeId) {
        try{
            this.outcomeService.deleteOutcomeById(outcomeId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    @DeleteMapping(value = "/rating/{ratingId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteRating(@PathVariable int ratingId) {
        try{
            this.specificationRatingService.deleteSpecificationRating(ratingId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    @PostMapping(value = "/{specId}/submit")
    public ResponseEntity<Specification> submitSpecification(@PathVariable("specId") int specId){
        this.specificationService.submitSpecification(specId);
        return new ResponseEntity<>(this.specificationService.getSpecificationById(specId), HttpStatus.OK);
    }


    @GetMapping(value = "/")
    public ResponseEntity<List<Specification>> getAllSpecifications(@RequestParam Map<String, String> params){
        return new ResponseEntity<>(this.specificationService.getSpecifications(params, false), HttpStatus.OK);
    }

    @GetMapping(value = "/{specId}")
    public ResponseEntity<Specification> getSpecification(@PathVariable int specId) {
        return null;
    }
}
