package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "lecturer")
@NamedQueries({
        @NamedQuery(name = "Lecturer.findAll", query = "select l from Lecturer l"),
        @NamedQuery(name = "Lecturer.findById", query = "select l from Lecturer l where l.id = :id"),
        @NamedQuery(name = "Lecturer.findByFaculty", query = "SELECT l.user.profile.fullname , l.id FROM Lecturer l WHERE l.faculty.id = :facultyId")
})
public class Lecturer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "User_id", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "User_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Faculty_id", nullable = false)
    private Faculty faculty;

}