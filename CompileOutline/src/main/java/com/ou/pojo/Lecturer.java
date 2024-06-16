package com.ou.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "Lecturer.findAll", query = "select l from Lecturer l"),
        @NamedQuery(name = "Lecturer.findByFaculty", query = "SELECT l.user.profile.fullname , l.id FROM Lecturer l WHERE l.facultyId = :facultyId")
})
@Table(name = "lecturer")
public class Lecturer {
    @Id
    @Column(name = "User_id")
    private Integer userId;

    @Column(name = "Faculty_id")
    private Integer facultyId;

    @MapsId
    @OneToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "User_id", nullable = false)

    @JsonIgnore
    private User user;


}
