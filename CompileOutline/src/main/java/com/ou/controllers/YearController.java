package com.ou.controllers;

import com.ou.pojo.Year;
import com.ou.services.YearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@ControllerAdvice
@RequestMapping("/year")
public class YearController {
    @Autowired
    private YearService yearService;

    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("years", this.yearService.getYears());
    }

    @GetMapping("/")
    public String listYear(Model model) {
        model.addAttribute("year", new Year());
        return "year";
    }

    @PostMapping("/")
    public String addYear(@ModelAttribute("year") Year year) {
        this.yearService.addOrUpdateYear(year);
        return "redirect:/year/";
    }

    @GetMapping("/{yearId}")
    public String editYear(@PathVariable("yearId") int yearId, Model model) {
        model.addAttribute("year", this.yearService.getYearById(yearId));
        return "editYear";
    }
}
