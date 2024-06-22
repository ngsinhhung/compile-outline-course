package com.ou.controllers;

import com.ou.pojo.SubjectRequirementId;
import com.ou.services.SubjectRequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/specification")
@CrossOrigin
public class ApiSpecificationController {
    @Autowired
    private SubjectRequirementService subjectRequirementService;

    @DeleteMapping(value = "/{subjectId}/{subjectRequirementsId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteSpecification(@PathVariable int subjectId,
                                    @PathVariable int subjectRequirementsId) {
        try{
            this.subjectRequirementService.deleteSubjectRequirementById(subjectId, subjectRequirementsId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
