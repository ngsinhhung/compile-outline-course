package com.ou.repositories.impl;


import com.ou.pojo.Specification;
import com.ou.pojo.SpecificationYear;
import com.ou.pojo.Subject;
import com.ou.pojo.Year;
import com.ou.repositories.SpecificationRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.*;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public List<Subject> getAllSubjectNoAssignment() {
        Session session = factory.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Subject.findAllUnassigned");
        return query.getResultList();
    }



    @Override
    public List<Specification> getListSpecificationOfLecturerId(int lecturerId) {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Specification.findByLecturerUser_Id");
        q.setParameter("id", lecturerId);
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
        if(specification.getId() != null){
            s.update(specification);
        }
        else {
            s.save(specification);
        }
    }

    @Override
    public List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId) {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Subject.findAllUnassignedIncludingCurrent");
        query.setParameter("currentSubjectId",currentAssignmentId);
        return query.getResultList();
    }

    @Override
    public List<Specification> findBySubjectAndYear(Subject subject, int year) {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createQuery("select s from Specification s join s.years y where s.subject = :subject and y.id = :year");
        query.setParameter("subject", subject);
        query.setParameter("year", year);
        System.out.println(subject);
        System.out.println(year);
        System.out.println(query.getResultList());
        return query.getResultList();
    }

    @Override
    public List<Specification> getSpecifications(Map<String, String> params, Boolean isAdmin) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();

        List<Predicate> predicates = new ArrayList<>();
        CriteriaQuery<SpecificationYear> specificationYearCriteriaQuery = builder.createQuery(SpecificationYear.class);
        Root<SpecificationYear> specificationYearRoot = specificationYearCriteriaQuery.from(SpecificationYear.class);
        Join<SpecificationYear, Specification> specYearJoin = specificationYearRoot.join("specification", JoinType.INNER);
        Join<SpecificationYear, Year> yearJoin = specificationYearRoot.join("year", JoinType.INNER);
        Join<Specification, Subject> subjectJoin = specYearJoin.join("subject", JoinType.INNER);

        //If user is student -> get specification submitted ELSE user is admin -> get specification submit and not submit
        if(isAdmin == false){
            predicates.add(builder.equal(specYearJoin.get("isSubmitted"), true));
        }

        String subjectName = params.get("subjectName");
        if(subjectName != null && !subjectName.isEmpty()){
            predicates.add(builder.like(subjectJoin.get("subjectName"), String.format("%%%s%%", subjectName)));
        }

        String year = params.get("year");
        if(year != null && !year.isEmpty()){
            predicates.add(builder.equal(yearJoin.get("year"), Integer.parseInt(year)));
        }


        specificationYearCriteriaQuery.select(specificationYearRoot).where(predicates.toArray(Predicate[]::new));
        Query query = s.createQuery(specificationYearCriteriaQuery);
        return query.getResultList();
    }


}
