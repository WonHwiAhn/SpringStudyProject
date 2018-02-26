package com.naver.ex;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sample")
public class SampleController {
	
	@RequestMapping("/hello")
	public String sayHello(){
		return "Hello World";
	}

}
