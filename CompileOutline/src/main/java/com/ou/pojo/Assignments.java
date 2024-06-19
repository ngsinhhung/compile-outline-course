package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "assignments")
@NamedQueries({
        @NamedQuery(name = "Assignment.FindBySubject", query = "SELECT a FROM Assignments a WHERE a.subject.id = :subject"),
        @NamedQuery(name = "Assignment.findAll", query = "select a from Assignments a"),
        @NamedQuery(name = "Subject.findAllUnassigned", query = "SELECT s FROM Subject s WHERE s.id NOT IN (SELECT a.subject.id FROM Assignments a)"),
        @NamedQuery(name = "Subject.findAllUnassignedIncludingCurrent", query = "SELECT s FROM Subject s WHERE s.id NOT IN (SELECT a.subject.id FROM Assignments a) OR s.id = :currentSubjectId"),
        @NamedQuery(name = "Assignment.FindByTeacherId",query = "SELECT a FROM Assignments a WHERE a.lecturerUser.id = :lectureId")
})

public class Assignments {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @NotNull(message = "Vui Lòng chọn giảng viên")
    @JoinColumn(name = "Lecturer_User_id", nullable = false)
    private Lecturer lecturerUser;

    @NotNull(message = "Vui Lòng chọn môn học")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "Subject_id", nullable = false)
    private Subject subject;


    @Column(name = "assignment_date")
    private LocalDateTime assignmentDate;


}
