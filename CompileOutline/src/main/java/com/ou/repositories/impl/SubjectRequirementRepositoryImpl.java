package com.ou.repositories.impl;

import com.ou.pojo.SubjectRequirement;
import com.ou.repositories.SubjectRequirementRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class SubjectRequirementRepositoryImpl implements SubjectRequirementRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
    @Override
    public void addOrUpdateSubjectRequirement(SubjectRequirement subjectRequirement) {
        Session s = this.factory.getObject().getCurrentSession();
        s.saveOrUpdate(subjectRequirement);
    }
}
