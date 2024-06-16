package com.ou.services;

import com.ou.dto.ProfileDto;

public interface UserService {
    ProfileDto getProfileUserById(int id);
    void addOrUpdateProfileDto(ProfileDto profileDto);
}
