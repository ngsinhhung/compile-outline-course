//package com.ou.components;
//
//import com.google.cloud.firestore.QueryDocumentSnapshot;
//import com.ou.pojo.User;
//import com.ou.services.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.ExecutionException;
//
//@Component
//public class InitUser {
//
//    @Autowired
//    private UserService userService;
//
//    @Autowired
//    private FirebaseService firebaseService;
//
//    @PostConstruct
//    public void init() throws ExecutionException, InterruptedException {
//        String defaultUsername = "maitrang123";
//
//        if (!userService.userExistByName(defaultUsername)) {
//            User newUser = User.builder()
//                    .username(defaultUsername)
//                    .password("123")
//                    .build();
//            userService.registerAdmin(newUser);
//            System.out.println("Admin account created with username: " + defaultUsername);
//        } else {
//            User existingUser = userService.getUserByUsername(defaultUsername);
//            System.out.println("Admin account already exists with username: " + defaultUsername);
//        }
//
//        try {
//            List<QueryDocumentSnapshot> users = firebaseService.getUserById("id", defaultUsername);
//            if (users.isEmpty()) {
//                Map<String, Object> userMap = new HashMap<>();
//                userMap.put("username", defaultUsername);
//
//                // You can add more fields from the existing user if needed
//                User existingUser = userService.getUserByUsername(defaultUsername);
//                userMap.put("role", existingUser.getRole());
//
//                boolean isUserCollectionExists = firebaseService.checkCollectionExist("users");
//                if (isUserCollectionExists) {
//                    firebaseService.addUser(userMap);
//                    System.out.println("Added user: " + defaultUsername + " to Firebase");
//                } else {
//                    firebaseService.initCollection("users", userMap);
//                    System.out.println("Initialized 'users' collection in Firebase with user: " + defaultUsername);
//                }
//            }
//
//            boolean isRoomCollectionExisted = firebaseService.checkCollectionExist("rooms");
//            if (!isRoomCollectionExisted) {
//                Map<String, Object> roomMap = new HashMap<>();
//                roomMap.put("members", Arrays.asList(defaultUsername));
//                roomMap.put("name", "Chat phản hồi đề cương"); // Adjust room details as needed
//                firebaseService.initCollection("rooms", roomMap);
//                firebaseService.initCollection("messages", new HashMap<>());
//                System.out.println("Initialized 'rooms' and 'messages' collections in Firebase");
//            }
//
//            firebaseService.addUserToFirstRoom("resident2"); // Adjust as per your application logic
//        } catch (Exception e) {
//            System.err.println("Error initializing Firebase collections or adding user: " + e.getMessage());
//        }
//    }
//}
