package com.ou.repositories;

import com.ou.dto.ProfileDto;
import com.ou.pojo.Profile;

public interface ProfileRepository {
    void addOrUpdateProfile(Profile profile);
    Profile getProfileById(int id);
}
