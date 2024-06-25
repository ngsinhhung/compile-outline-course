package com.ou.dto.requets;

import com.ou.pojo.Specification;
import com.ou.pojo.Year;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AssignmentDto {
    private Specification specification;
    private Year startYear;
}
