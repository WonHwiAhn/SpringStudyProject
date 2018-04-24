package com.naver.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dao.MessageDAO;
import com.naver.dao.PointDAO;
import com.naver.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{

	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private PointDAO pointDAO;
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
	}

	@Override
	public MessageVO readMessage(String uid, Integer mno) throws Exception {
		messageDAO.updateState(mno);
		pointDAO.updatePoint(uid, 5);
		return messageDAO.readMessage(mno);
	}
	
}
