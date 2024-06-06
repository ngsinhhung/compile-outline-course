package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "feedback")
public class Feedback {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Specification_id", nullable = false)
    private Specification specification;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Student_User_id", nullable = false)
    private Student studentUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_feedback_id")
    private Feedback parentFeedback;

}