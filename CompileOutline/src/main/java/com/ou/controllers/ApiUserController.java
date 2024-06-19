package com.ou.controllers;


import com.ou.components.JWTService;
import com.ou.pojo.Profile;
import com.ou.pojo.User;
import com.ou.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private JWTService jwtService;

    @PostMapping("/login/")
    @CrossOrigin
    public ResponseEntity<String> login(@RequestBody User user){
        if(this.userService.authUser(user.getUsername(),user.getPassword())){
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            return new ResponseEntity<>(token, HttpStatus.OK);
        }
        return new ResponseEntity<>("error",HttpStatus.BAD_REQUEST);
    }

    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Object> getCurrentUser(Principal principal) {
        User user = userService.getUserByUsername(principal.getName());
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        Profile profile = user.getProfile();

        Map<String, Object> responseObject = new HashMap<>();
        responseObject.put("username", user.getUsername());
        responseObject.put("fullName", profile.getFullname());
        responseObject.put("email", profile.getEmail());
        responseObject.put("avatar", profile.getAvatar());
        responseObject.put("dateJoined", profile.getDateJoined());
        responseObject.put("phone", profile.getPhone());
        return new ResponseEntity<>(responseObject, HttpStatus.OK);
    }
}
