package com.spring.festival.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.festival.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO
{

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.spring.festival.mapper.memberMapper";

	@Override
	public List<MemberVO> selectMember() throws Exception
	{

		return sqlSession.selectList(Namespace + ".selectMember");
	}

	@Override
	public void register(MemberVO vo) throws Exception
	{
		sqlSession.insert(Namespace + ".insertMember", vo);
	}

	@Override
	public int idDupleCheck(MemberVO vo) throws Exception
	{
		int result = sqlSession.selectOne(Namespace + ".idDupleCheck", vo);
		return result;
	}

	@Override
	public int nickDupleCheck(MemberVO vo) throws Exception
	{
		int result = sqlSession.selectOne(Namespace + ".nickDupleCheck", vo);
		return result;
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception
	{
		return sqlSession.selectOne(Namespace + ".login", vo);
	}

	// 회원정보 변경
	@Override
	public int infoChange(MemberVO vo) throws Exception
	{
		return sqlSession.update(Namespace + ".infoChange", vo);
	}
	
	//패스워드 체크
	@Override
	public int passwordCheck(MemberVO vo) throws Exception
	{
		int result = sqlSession.selectOne(Namespace + ".passwordCheck", vo);
		return result;
	}
}