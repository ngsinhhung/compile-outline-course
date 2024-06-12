package com.ou.controllers;


import com.ou.services.AssignmentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class ApiAssignmentController {

    @Autowired
    private AssignmentServices assignmentServices;

    @DeleteMapping("/{assigmentId}/delete")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletedAssigment(@PathVariable(value = "assigmentId") int id){
        this.assignmentServices.deletedAssigmentTeacher(id);
    }
}
