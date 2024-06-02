package com.ou.pojo;

import javax.persistence.*;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    public Lecturer getLecturerUser() {
        return lecturerUser;
    }

    public void setLecturerUser(Lecturer lecturerUser) {
        this.lecturerUser = lecturerUser;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

}