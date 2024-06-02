package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "requirements")
public class Requirement {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "type", length = 45)
    private String type;

}