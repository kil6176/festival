package com.spring.festival.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.festival.dto.TrashVO;

@Repository
public class TrashDAOImpl implements TrashDAO
{

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.spring.festival.mapper.trashMapper";

	@Override
	public List<TrashVO> selectTrashCan() throws Exception
	{
		return sqlSession.selectList(Namespace + ".selectTrashCan");
	}
	
	@Override
	public List<TrashVO> searchTrashCan(TrashVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".searchTrashCan", vo);
	}
	
}