package com.ou.pojo;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class SpecificationRatingId implements Serializable {
    private static final long serialVersionUID = -3818165039698718954L;
    @Column(name = "Specification_id", nullable = false)
    private Integer specificationId;

    @Column(name = "Rating_id", nullable = false)
    private Integer ratingId;

    public Integer getSpecificationId() {
        return specificationId;
    }

    public void setSpecificationId(Integer specificationId) {
        this.specificationId = specificationId;
    }

    public Integer getRatingId() {
        return ratingId;
    }

    public void setRatingId(Integer ratingId) {
        this.ratingId = ratingId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        SpecificationRatingId entity = (SpecificationRatingId) o;
        return Objects.equals(this.specificationId, entity.specificationId) &&
                Objects.equals(this.ratingId, entity.ratingId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(specificationId, ratingId);
    }

}