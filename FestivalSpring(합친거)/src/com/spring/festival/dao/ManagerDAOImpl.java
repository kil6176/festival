package com.spring.festival.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.festival.dto.ManagerVO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO
{

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.spring.festival.mapper.managerMapper";

	//유저 수 체크
	@Override
	public int getFestivalCnt(ManagerVO vo) throws Exception
	{
		return sqlSession.selectOne(Namespace + ".getFestivalCnt", vo);
	}	
	//유저 수 체크
	@Override
	public int getFestivalAllCnt(ManagerVO vo) throws Exception
	{
		return sqlSession.selectOne(Namespace + ".getFestivalAllCnt", vo);
	}	

	//축제 불러오기
	@Override
    public List<ManagerVO> selectFestival(ManagerVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".getSelectFestival", vo);
	}	
	
	//축제 전체 불러오기
	@Override
    public List<ManagerVO> selectAllFestival(ManagerVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".getSelectAllFestival", vo);
	}	
	
	//쓰레기통 수 체크
	@Override
	public int getTrashCanCnt(ManagerVO vo) throws Exception
	{
		return sqlSession.selectOne(Namespace + ".getTrashCanCnt", vo);
	}	

	@Override
	//쓰레기통 리스트 가져오기
    public List<ManagerVO> getTrashCanList(ManagerVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".getTrashCanList", vo);
	}	


	@Override
	//유저 축제 정보 추가
	public int addUserFestival(ManagerVO vo) throws Exception
	{
		return sqlSession.insert(Namespace + ".addUserFestival", vo);
	}	
	
	@Override
	//유저 축제 정보 삭제
	public int deleteUserFestival(ManagerVO vo) throws Exception
	{
		return sqlSession.delete(Namespace + ".deleteUserFestival", vo);
	}	

}