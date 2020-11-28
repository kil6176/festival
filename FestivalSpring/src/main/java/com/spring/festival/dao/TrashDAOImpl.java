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
	
	@Override
    //쓰레기통 상세정보 
    public List<TrashVO> selectOneTrashCan(TrashVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".selectOneTrashCan", vo);
	}
	

    //쓰레기통 추가하기
	@Override
    public int insertTrashCan(TrashVO vo) throws Exception
	{
		return sqlSession.insert(Namespace + ".insertTrashCan", vo);
	}
	
    //쓰레기통 정보 변경하기
	@Override
    public int updateTrashCan(TrashVO vo) throws Exception
	{
		return sqlSession.update(Namespace + ".updateTrashCan", vo);
	}
	
    //쓰레기통 정보 삭제하기
	@Override
    public int deleteTrashCan(TrashVO vo) throws Exception
	{
		return sqlSession.delete(Namespace + ".deleteTrashCan", vo);
	}
}