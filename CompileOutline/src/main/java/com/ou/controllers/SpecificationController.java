package com.ou.controllers;


import com.ou.pojo.User;
import com.ou.services.AssignmentServices;
import com.ou.services.SpecificationService;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/specification")
public class SpecificationController {

    @Autowired
    private AssignmentServices assignmentServices;

    @Autowired
    private SpecificationService specificationService;

    @GetMapping("/")
    public String specificationList (Model model) {
        model.addAttribute("assigment",this.assignmentServices.getAssignmentByTeacherId(3));
        return "lecturerHome";
    }

    @GetMapping("/create")
    public String createSpecification(Model model, @RequestParam("assigmentId") int id){
        System.out.println(id);
        model.addAttribute("specifications",this.specificationService.getAssignmentById(id));
        return "createSpecification";
    }
}
