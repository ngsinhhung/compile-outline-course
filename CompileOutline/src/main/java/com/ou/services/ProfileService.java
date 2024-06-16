package com.ou.services;

import com.ou.pojo.Profile;

public interface ProfileService {
    void addOrUpdateProfile(Profile profile);
    Profile getProfile(int id);

}
