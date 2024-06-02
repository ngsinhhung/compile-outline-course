package com.ou.pojo;

import javax.persistence.*;

@Entity
@Table(name = "specification_rating")
public class SpecificationRating {
    @EmbeddedId
    private SpecificationRatingId id;

    @MapsId("specificationId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Specification_id", nullable = false)
    private Specification specification;

    @MapsId("ratingId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Rating_id", nullable = false)
    private Rating rating;

    @Column(name = "percent")
    private Integer percent;

    public SpecificationRatingId getId() {
        return id;
    }

    public void setId(SpecificationRatingId id) {
        this.id = id;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public Rating getRating() {
        return rating;
    }

    public void setRating(Rating rating) {
        this.rating = rating;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }

}