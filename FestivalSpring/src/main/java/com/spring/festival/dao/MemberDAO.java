package com.spring.festival.dao;

import java.util.List;
 
import com.spring.festival.dto.MemberVO;
 
public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
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

    //닉네임 중복체크
    public int passwordCheck(MemberVO vo) throws Exception;
}
 