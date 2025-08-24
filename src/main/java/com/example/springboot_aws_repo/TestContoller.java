package com.example.springboot_aws_repo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class TestContoller {

    @GetMapping("/data")
    public String getName(){
        return "AWS just started now";
    }


}
