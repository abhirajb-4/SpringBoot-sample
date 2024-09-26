package com.CollegeAppp.collegeManagement;

import java.util.*;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

@Configuration
public class DatabaseLoader {

    private StudentRepository repo;
    public DatabaseLoader(StudentRepository repo){
        this.repo = repo;

    }
    @Bean
    public CommandLineRunner initializeDatabase(){
        return args ->{
            Student stud1 = new Student("Abhi1234","Abhiraj","1234","abhi@gmail.com",745688,Role.STUDENT);
            Student stud2 = new Student("Arun","Arun","1234 ","arun@gmail.com",897673,Role.STUDENT);
            repo.saveAll(List.of(stud1,stud2));

            System.out.println("Sample database intialized");
        };
    }
}
