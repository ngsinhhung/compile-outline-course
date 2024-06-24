package com.ou.repositories.impl;

import com.ou.pojo.Year;
import com.ou.repositories.YearRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class YearRepositoryImpl implements YearRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
    @Override
    public List<Year> getYears() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Year.findAll");
        return q.getResultList();
    }

    @Override
    public void addOrUpdateYear(Year year) {
        Session s = this.factory.getObject().getCurrentSession();
        if(year.getId() != null) {
            s.update(year);
        }
        else{
            s.save(year);
        }
    }

    @Override
    public Year getYearById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Year.class, id);
    }

    @Override
    public void deleteYear(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        s.delete(s.get(Year.class, id));
    }
}
