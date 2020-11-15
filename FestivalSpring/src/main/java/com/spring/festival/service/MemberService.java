package com.spring.festival.service;
import java.util.List;

import com.spring.festival.dto.MemberVO;
 
public interface MemberService {
    
    public List<MemberVO> selectMember() throws Exception;
    public void register(MemberVO vo) throws Exception;
    public int idDupleCheck(MemberVO vo) throws Exception;
    public int nickDupleCheck(MemberVO vo) throws Exception;
}
