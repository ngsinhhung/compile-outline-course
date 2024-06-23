package com.ou.services;

import com.ou.pojo.SpecificationRating;

public interface SpecificationRatingService {
    void addSpecificationRating(SpecificationRating specificationRating);
    void deleteSpecificationRating(int spectId, int ratingId);
}
