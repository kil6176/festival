package com.spring.festival.service;
import java.util.List;

import com.spring.festival.dto.TrashVO;
 
public interface TrashService {
    
    public List<TrashVO> selectTrashCan() throws Exception;

    public List<TrashVO> searchTrashCan(TrashVO vo) throws Exception;
}
