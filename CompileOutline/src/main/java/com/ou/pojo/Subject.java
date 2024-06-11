package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@Entity
@Table(name = "subject")
@NamedQueries({
        @NamedQuery(name = "Subject.findAll", query = "select s from Subject s")
})
public class Subject {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "subject_name", length = 50)
    private String subjectName;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Faculty_id", nullable = false)
    private Faculty faculty;

}