package com.ou.repositories;

import com.ou.dto.ProfileDto;
import com.ou.pojo.User;

public interface UserRepository {
    User getUserById(int id);
    void addOrUpdateUser(User user);
}
