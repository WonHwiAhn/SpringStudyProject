package com.naver.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.naver.vo.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.naver.mappers.MessageMapper";
	
	@Override
	public void create(MessageVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
	}

	@Override
	public MessageVO readMessage(Integer mid) throws Exception {
		return sqlSession.selectOne(namespace+".readMessage", mid);
	}

	@Override
	public void updateState(Integer mid) throws Exception {
		sqlSession.update(namespace+".updateState", mid);
	}
	
}
