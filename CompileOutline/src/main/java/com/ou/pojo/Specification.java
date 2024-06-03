package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "specification")
public class Specification {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "credits", nullable = false)
    private Integer credits;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Lecturer_User_id", nullable = false)
    private Lecturer lecturerUser;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Subject_id", nullable = false)
    private Subject subject;

}