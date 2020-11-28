package com.spring.festival.service;
import java.util.List;

import com.spring.festival.dto.TrashVO;
 
public interface TrashService {
    
    public List<TrashVO> selectTrashCan() throws Exception;

    public List<TrashVO> searchTrashCan(TrashVO vo) throws Exception;

    public int insertTrashCan(TrashVO vo) throws Exception;
    
    //쓰레기통 상세정보 
    public List<TrashVO> selectOneTrashCan(TrashVO vo) throws Exception;
    
    //쓰레기통 정보 변경
    public int updateTrashCan(TrashVO vo) throws Exception;
    
    //쓰레기통 정보 삭제
    public int deleteTrashCan(TrashVO vo) throws Exception;
}
