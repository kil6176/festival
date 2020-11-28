package com.spring.festival.dao;

import java.util.List;

import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
 
public interface TrashDAO {
    
    public List<TrashVO> selectTrashCan() throws Exception;
    
    //쓰레기통 버튼 눌렀을때 검색
    public List<TrashVO> searchTrashCan(TrashVO vo) throws Exception;
    
    //쓰레기통 추가하기
    public int insertTrashCan(TrashVO vo) throws Exception;
}
 