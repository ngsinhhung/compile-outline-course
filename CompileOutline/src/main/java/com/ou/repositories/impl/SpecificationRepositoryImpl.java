package com.ou.repositories.impl;


import com.ou.pojo.*;
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
        if (specification.getId() != null) {
            s.update(specification);
        } else {
            s.save(specification);
        }
    }

    @Override
    public List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId) {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Subject.findAllUnassignedIncludingCurrent");
        query.setParameter("currentSubjectId", currentAssignmentId);
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
    public List<Specification> findSpecSubmitted() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Specification.findByIsSubmittedTrue");
        return q.getResultList();
    }

    @Override
    public List<Specification> getSpecifications(Map<String, String> params, Boolean isAdmin) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        List<Predicate> predicates = new ArrayList<>();

        Root rS = q.from(Specification.class);
        Root rRY = q.from(SpecificationYear.class);
        q.select(rS).distinct(true);

        Join<Specification, Subject> specSubjectJoin = rS.join("subject", JoinType.INNER);

        Join<Specification, Year> specYearSpecJoin = rS.join("years", JoinType.INNER);

        Join<Specification, Lecturer> specLecture = rS.join("lecturerUser", JoinType.INNER);

        if (isAdmin == false) {
            predicates.add(b.equal(rS.get("isSubmitted"), true));
        }
        String subjectName = params.get("subjectName");
        if (subjectName != null && !subjectName.isEmpty()) {
            predicates.add(b.like(specSubjectJoin.get("subjectName"), String.format("%%%s%%", subjectName)));
        }
        String year = params.get("year");
        if (year != null && !year.isEmpty()) {
            predicates.add(b.equal(specYearSpecJoin.get("year"), Integer.parseInt(year)));
        }

        String credits = params.get("credits");
        if (credits != null && !credits.isEmpty()) {
            predicates.add(b.equal(rS.get("credits"), Integer.parseInt(credits)));
        }

        String lecturerName = params.get("lectureName");
        if (lecturerName != null && !lecturerName.isEmpty()) {
            predicates.add(b.like(specLecture.get("user").get("profile").get("fullname"), String.format("%%%s%%", lecturerName)));
        }

        q.where(predicates.toArray(Predicate[]::new));
        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
