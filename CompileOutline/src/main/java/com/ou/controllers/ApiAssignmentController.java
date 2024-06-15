package com.ou.controllers;


import com.ou.pojo.Lecturer;
import com.ou.services.AssignmentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @GetMapping(value = "/getLecturersByFaculty", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Lecturer>> getLecturersByFaculty(@RequestParam("facultyId") int facultyId) {
        System.out.println("Faculty ID: " + facultyId);

        List<Lecturer> lecturers = this.assignmentServices.getLecturersByFacultyId(facultyId);
        System.out.println(lecturers);
        return ResponseEntity.ok().body(lecturers);
    }
}
