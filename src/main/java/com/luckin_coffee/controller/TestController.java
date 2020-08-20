package com.luckin_coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @RequestMapping("/thymeleaf")
    public String index(Model model) {
        model.addAttribute("message", "Hello Spring-Thymeleaf！草拟吗啊");
        return "index";
    }
}
