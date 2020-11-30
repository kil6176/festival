package com.spring.festival.dao;

import java.util.List;

import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
import com.spring.festival.dto.CommonDTO;
 
public interface MemberDAO {
    
    public List<MemberVO> selectMember(MemberVO vo) throws Exception;
    
    //회원가입
    public void register(MemberVO vo) throws Exception;
    
    //아이디 중복체크
    public int idDupleCheck(MemberVO vo) throws Exception;
    
    //닉네임 중복체크
    public int nickDupleCheck(MemberVO vo) throws Exception;
    
    //로그인
    public MemberVO login(MemberVO vo) throws Exception;

    //회원정보 변경
    public int infoChange(MemberVO vo) throws Exception;

    //패스워드 맞는지 체크
    public int passwordCheck(MemberVO vo) throws Exception;

    //패스워드 변경
    public int passwordChange(MemberVO vo) throws Exception;
    
	//유저 수 체크
	public int getUserCnt(MemberVO vo) throws Exception;
	
    //권한 변경
    public int authorityChange(MemberVO vo) throws Exception;
    
    //아이디 찾기
    public List<MemberVO> selectFindID(MemberVO vo) throws Exception;
    
    //비밀번호 찾기 / 초기화
    public int updateFindPW(MemberVO vo) throws Exception;
    
    //비밀번호 찾기 / 초기화
    public int selectFindPW(MemberVO vo) throws Exception;


}
 