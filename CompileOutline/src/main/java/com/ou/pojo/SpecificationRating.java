package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
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

}