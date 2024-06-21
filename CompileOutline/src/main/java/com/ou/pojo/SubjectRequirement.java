package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "subject_requirements")
@NamedQueries({
        @NamedQuery(name = "SubjectRequirement.findBySubject_Id", query = "select s from SubjectRequirement s where s.subject.id = :id")
})
public class SubjectRequirement {
    @EmbeddedId
    private SubjectRequirementId id;

    @MapsId("subjectId")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Subject_id", nullable = false)
    private Subject subject;

    @MapsId("subjectRequirementsId")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Subject_requirements_id", nullable = false)
    private Subject subjectRequirements;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Requirements_id", nullable = false)
    private Requirement requirements;

}