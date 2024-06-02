package com.ou.pojo;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Lob
    @Column(name = "content")
    private String content;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Specification_id", nullable = false)
    private Specification specification;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Student_User_id", nullable = false)
    private Student studentUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public Student getStudentUser() {
        return studentUser;
    }

    public void setStudentUser(Student studentUser) {
        this.studentUser = studentUser;
    }

}