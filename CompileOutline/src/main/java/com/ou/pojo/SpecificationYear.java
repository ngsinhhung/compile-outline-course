package com.ou.pojo;

import javax.persistence.*;

@Entity
@Table(name = "specification_year")
public class SpecificationYear {
    @EmbeddedId
    private SpecificationYearId id;

    @MapsId("specificationId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Specification_id", nullable = false)
    private Specification specification;

    @MapsId("yearId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Year_id", nullable = false)
    private Year year;

    public SpecificationYearId getId() {
        return id;
    }

    public void setId(SpecificationYearId id) {
        this.id = id;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public Year getYear() {
        return year;
    }

    public void setYear(Year year) {
        this.year = year;
    }

}