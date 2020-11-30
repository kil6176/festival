package com.spring.festival.service;
import java.util.List;

import com.spring.festival.common.ResultUtil;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
import com.spring.festival.dto.CommonDTO;
 
public interface MemberService {
    
    public List<MemberVO> selectMember(MemberVO vo) throws Exception;
    
    public void register(MemberVO vo) throws Exception;
    
    public int idDupleCheck(MemberVO vo) throws Exception;
    
    public int nickDupleCheck(MemberVO vo) throws Exception;
    
    public MemberVO login(MemberVO vo) throws Exception;

	public int infoChange(MemberVO vo) throws Exception;;

    public int passwordCheck(MemberVO vo) throws Exception;
    
    public int passwordChange(MemberVO vo) throws Exception;

    public int getUserCnt(MemberVO vo) throws Exception;
    
    public ResultUtil getUserList(MemberVO vo) throws Exception;
    
    public int authorityChange(MemberVO vo) throws Exception;

    //아이디 찾기
    public List<MemberVO> selectFindID(MemberVO vo) throws Exception;
    
    //비밀번호 찾기 / 초기화
    public String updateFindPW(MemberVO vo) throws Exception;

    
}
