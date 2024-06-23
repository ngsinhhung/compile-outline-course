package com.ou.repositories;

import com.ou.pojo.SpecificationRating;

public interface SpecificationRatingRepository {
    void addSpecificationRating(SpecificationRating specificationRating);
    SpecificationRating getSpecificationRating(int specId, int ratingId);
    void deleteSpecificationRating(int specId, int ratingId);
}
