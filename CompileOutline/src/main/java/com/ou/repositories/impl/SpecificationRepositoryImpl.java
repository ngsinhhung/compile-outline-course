package com.ou.repositories.impl;


import com.ou.pojo.Assignments;
import com.ou.repositories.SpecificationRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class SpecificationRepositoryImpl implements SpecificationRepository {
    @Autowired
    private LocalSessionFactoryBean factoryBean;

    @Override
    public List<Assignments> getAssignmentById(int assignmentId) {
        Session session = factoryBean.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Specification.findAssignmentsById");
        query.setParameter("assignmentId",assignmentId);
        return query.getResultList();

    }
}
