package com.ou.pojo;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class SpecificationYearId implements Serializable {
    private static final long serialVersionUID = -7952768420144059266L;
    @Column(name = "Specification_id", nullable = false)
    private Integer specificationId;

    @Column(name = "Year_id", nullable = false)
    private Integer yearId;

    public Integer getSpecificationId() {
        return specificationId;
    }

    public void setSpecificationId(Integer specificationId) {
        this.specificationId = specificationId;
    }

    public Integer getYearId() {
        return yearId;
    }

    public void setYearId(Integer yearId) {
        this.yearId = yearId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        SpecificationYearId entity = (SpecificationYearId) o;
        return Objects.equals(this.specificationId, entity.specificationId) &&
                Objects.equals(this.yearId, entity.yearId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(specificationId, yearId);
    }

}