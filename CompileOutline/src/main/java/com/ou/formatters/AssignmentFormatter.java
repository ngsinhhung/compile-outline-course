package com.ou.formatters;

import com.ou.pojo.Assignments;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class AssignmentFormatter implements Formatter<Assignments> {
    @Override
    public Assignments parse(String id, Locale locale) throws ParseException {
        Assignments assignments = new Assignments();
        assignments.setId(Integer.parseInt(id));
        return assignments;
    }

    @Override
    public String print(Assignments assignments, Locale locale) {
        return String.valueOf(assignments.getId());
    }
}
