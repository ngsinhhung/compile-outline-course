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
@Table(name = "year")
public class Year {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "year")
    private Integer year;

}