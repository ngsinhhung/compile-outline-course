package com.ou.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
@NoArgsConstructor
public class SpecificationRatingId implements Serializable {
    private static final long serialVersionUID = -3818165039698718954L;
    @Column(name = "Specification_id", nullable = false)
    private Integer specificationId;

    @Column(name = "Rating_id", nullable = false)
    private Integer ratingId;

    public SpecificationRatingId(Integer specificationId, Integer ratingId) {
        this.specificationId = specificationId;
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