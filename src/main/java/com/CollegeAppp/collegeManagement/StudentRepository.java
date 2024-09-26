package com.CollegeAppp.collegeManagement;

import org.apache.catalina.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StudentRepository extends CrudRepository<Student,Integer> {
    public List<Student> findByEmail(String email);



}
