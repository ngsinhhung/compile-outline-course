package com.ou.repositories.impl;


import com.ou.pojo.Specification;
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
    private LocalSessionFactoryBean factory;

    @Override
    public List<Specification> getAllSpecification() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Specification.findAll");
        return q.getResultList();
    }

    @Override
    public List<Specification> getListSpecificationDesc() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Specification.findByOrderByIdDesc");
        return q.getResultList();
    }

//    @Override
//    public List<Specification> getSpecificationByLecturer(int lecturerId) {
//        Session s = factory.getObject().getCurrentSession();
//        Query q = s.createNamedQuery("Specification.findByAssignments_LecturerUser_Id");
//        q.setParameter("id", lecturerId);
//        return q.getResultList();
//    }

    @Override
    public Specification getSpecificationById(int specificationId) {
        Session s = factory.getObject().getCurrentSession();
        return s.get(Specification.class, specificationId);
    }

    @Override
    public void createOrUpdateSpecification(Specification specification) {
        Session s = factory.getObject().getCurrentSession();
        s.saveOrUpdate(specification);
    }
}
