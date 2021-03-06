package com.spring.festival.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.CommonDTO;

@Repository
public class MemberDAOImpl implements MemberDAO
{

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.spring.festival.mapper.memberMapper";

	@Override
	public List<MemberVO> selectMember(MemberVO vo) throws Exception
	{

		return sqlSession.selectList(Namespace + ".selectMember", vo);
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
	
	//패스워드 체크
	@Override
	public int passwordChange(MemberVO vo) throws Exception
	{
		int result = sqlSession.update(Namespace + ".passwordChange", vo);
		return result;
	}
	
	//유저 수 체크
	@Override
	public int getUserCnt(MemberVO vo) throws Exception
	{
		return sqlSession.selectOne(Namespace + ".getUserCnt", vo);
	}	
	
	//권한 변경
	@Override
	public int authorityChange(MemberVO vo) throws Exception
	{
		return sqlSession.update(Namespace + ".authorityChange", vo);
	}

    //아이디 찾기
    public List<MemberVO> selectFindID(MemberVO vo) throws Exception
	{
		return sqlSession.selectList(Namespace + ".selectFindID", vo);
	}	


    //비밀번호 찾기 / 초기화
    public int updateFindPW(MemberVO vo) throws Exception
    {
		return sqlSession.update(Namespace + ".updateFindPW", vo);
	}	

    //비밀번호 찾기 / 초기화
    public int selectFindPW(MemberVO vo) throws Exception
    {
		return sqlSession.selectOne(Namespace + ".selectFindPW", vo);
	}	
}