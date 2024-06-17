package com.ou.repositories;

import com.ou.dto.ProfileDto;
import com.ou.pojo.User;

public interface UserRepository {
    User getUserById(int id);
    User getUserByUsername(String username);
    void addOrUpdateUser(User user);
}
