//package com.ou.components;
//
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
//
//    @PostConstruct
//    public void init() throws ExecutionException, InterruptedException {
//        String defaultLecture = "minhtam22";
//        User user = null;
//        if (!userService.userExistByName(defaultLecture)) {
//
//            //register lecturer  db
//            User newUser = User.builder().username(defaultLecture).password("123").role("ROLE_LECTURER").build();
//            userService.registerLecturer(newUser);
//        } else {
//            user = this.userService.getUserByUsername(defaultLecture);
//            System.out.println("Admin account has added with username: " + defaultLecture + ", password: ");
//        }
//        try {
//            List<QueryDocumentSnapshot> users = this.firebaseService.getUserById("id", defaultLecture);
//            if (users.isEmpty()) {
//                Map<String, Object> userMap = new HashMap<>();
//                userMap.put("username", defaultLecture);
//                userMap.put("role", user.getRole());
//
//                boolean isUserCollectionExists = this.firebaseService.checkCollectionExist("users");
//                if (isUserCollectionExists) {
//                    this.firebaseService.addUserFirebase((User) userMap);
//                    System.out.println("Added user: " + user.getUsername() + " to firebase");
//                } else {
//                    //----------- Khởi tạo collection users---------------
//                    this.firebaseService.initCollection("users", userMap);
//                    System.out.println("Added user: " + user.getUsername() + "to firebase");
//                }
//            }
//            boolean isRoomCollectionExisted = this.firebaseService.checkCollectionExist("rooms");
//            if (!isRoomCollectionExisted) {
//                Map<String, Object> roomMap = new HashMap<>();
//                roomMap.put("members", Arrays.asList(new String[]{defaultLecture}));
//                roomMap.put("name", "Chat phản hồi đề cương");
//                //----------- Khởi tạo collection rooms ---------------
//                this.firebaseService.initCollection("rooms", roomMap);
//                //----------- Khởi tạo collection messages ---------------
//                Map<String, Object> messageMap = new HashMap<>();
//                this.firebaseService.initCollection("messages", messageMap);
//            }
//            this.firebaseService.addUserToFirstRoom("resident2");
//        } catch (Exception exception) {
//            System.out.println(exception.getMessage());
//            System.out.println("Some thing went wrong with firebase");
//        }
//    }
//}
//
