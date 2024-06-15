package com.ou.dto;

import com.ou.pojo.Profile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * DTO for {@link Profile}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfileDto implements Serializable {
    private Integer id;
    private String username;
    private String fullname;
    private String email;
    private String phone;
    private String avatar;
    private String role;
    private Boolean isActive;
    private Integer facultyId;
}