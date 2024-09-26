package com.CollegeAppp.collegeManagement;

import org.springframework.web.bind.annotation.GetMapping;

public class MainController {
    @GetMapping("")
    public String index(){
        return "index";
    }

    @GetMapping("/admin/signin")
    public String adminlogin(){
        return "admin/adminlogin";
    }

}
