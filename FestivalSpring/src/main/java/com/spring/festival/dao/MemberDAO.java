package com.spring.festival.dao;

import java.util.List;
 
import com.spring.festival.dto.MemberVO;
 
public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
    public void register(MemberVO vo) throws Exception;
}
 