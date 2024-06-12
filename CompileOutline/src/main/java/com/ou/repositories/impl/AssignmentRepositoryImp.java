package com.ou.repositories.impl;


import com.ou.pojo.Assignment;
import com.ou.pojo.Lecturer;
import com.ou.pojo.Subject;
import com.ou.repositories.AssignmentRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.transaction.Transactional;
import java.time.Instant;
import java.util.List;

@Repository
@Transactional
public class AssignmentRepositoryImp implements AssignmentRepository {
    @Autowired
    private LocalSessionFactoryBean factoryBean;
    @Override
    public List<Lecturer> getAllLecturer() {
        Session session = factoryBean.getObject().getCurrentSession();
        Query q = session.createNamedQuery("Lecturer.findAll");
        System.out.println();
        return q.getResultList();

    }
    @Override
    public List<Subject> getAllSubjectNoAssignemnt() {
        Session session = factoryBean.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Subject.findAllUnassigned");
        return query.getResultList();
    }

    @Override
    public List<Subject> findAllUnassignedSubjectsIncludingCurrent(int currentAssignmentId) {
        Session session = factoryBean.getObject().getCurrentSession();
        Assignment currentAssignment = session.get(Assignment.class, currentAssignmentId);
        return session.createNamedQuery("Subject.findAllUnassignedIncludingCurrent", Subject.class)
                .setParameter("currentSubjectId", currentAssignment.getSubject().getId())
                .getResultList();
    }
    @Override
    public List<Assignment> getAllAssignment() {
        Session session = factoryBean.getObject().getCurrentSession();
        Query q = session.createNamedQuery("Assignment.findAll");
        return q.getResultList();
    }

    @Override
    public boolean isCheckSubject(Subject subject) {
        Session session = factoryBean.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Assignment.FindBySubject");
        query.setParameter("subject", subject);
        List<Assignment> assignments = query.getResultList();
        return !assignments.isEmpty();
    }

    @Override
    public void addorUpdate(Assignment assignment) {
        Instant currentTime = Instant.now();
        Session session = factoryBean.getObject().getCurrentSession();
       if(assignment.getId() != null && assignment.getId() > 0 ){
           assignment.setAssignmentDate(currentTime);
           session.update(assignment);
       }
       else {
           assignment.setAssignmentDate(currentTime);
           session.save(assignment);
       }
    }

    @Override
    public Assignment getAssignmentById(int id) {
        Session s = this.factoryBean.getObject().getCurrentSession();
        return s.get(Assignment.class,id);
    }

    @Override
    public void deletedAssigmentTeacher(int id) {
        Session s = this.factoryBean.getObject().getCurrentSession();
        Assignment assignment = this.getAssignmentById(id);
        s.delete(assignment);
    }
}
