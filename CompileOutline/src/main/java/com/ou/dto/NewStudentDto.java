package com.ou.dto;

import com.ou.pojo.Faculty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * DTO for {@link com.ou.pojo.Student}
 */
@Data
@NoArgsConstructor
public class NewStudentDto implements Serializable {
    private String username;
    private String password;
    private String email;
    private Faculty faculty;
}