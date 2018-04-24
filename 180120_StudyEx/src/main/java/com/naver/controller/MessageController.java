package com.naver.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.naver.service.MessageService;
import com.naver.vo.MessageVO;

// @RestController 원래 이거 붙여야되는데 이거는 4버전 이후에 되는거라 일단 보류
@RestController
@RequestMapping("/messages")
public class MessageController {
	@Inject
	private MessageService service;
	
	//@ResponseBody
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageVO vo){
		System.out.println("MessageController / vo ==> " + vo);
		ResponseEntity<String> entity = null;
		try{
			service.addMessage(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
