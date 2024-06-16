package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "student")
@NamedQueries({
        @NamedQuery(name = "Student.findById", query = "select s from Student s where s.id = :id"),
        @NamedQuery(name = "Student.findAll", query = "select s from Student s")
})

public class Student {
    @Id
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