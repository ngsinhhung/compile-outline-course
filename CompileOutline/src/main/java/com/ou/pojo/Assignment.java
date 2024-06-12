package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "assignments")
@NamedQueries({
        @NamedQuery(name = "Assignment.FindBySubject", query = "SELECT a FROM Assignment a WHERE a.subject = :subject"),
        @NamedQuery(name = "Assignment.findAll", query = "select a from Assignment a"),
        @NamedQuery(name = "Subject.findAllUnassigned", query = "SELECT s FROM Subject s WHERE s.id NOT IN (SELECT a.subject.id FROM Assignment a)")
})

public class Assignment {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Lecturer_User_id", nullable = false)
    private Lecturer lecturerUser;


    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Subject_id", nullable = false)
    private Subject subject;

    @Lob
    @Column(name = "content")
    private String content;

    @Column(name = "assignment_date")
    private Instant assignmentDate;

}