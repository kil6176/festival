package com.spring.festival.service;
import java.util.List;

import com.spring.festival.common.ResultUtil;
import com.spring.festival.dto.ManagerVO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
 
public interface ManagerService {

    public ResultUtil getFestivalList(ManagerVO vo) throws Exception;
    
    public ResultUtil getTrashCanList(ManagerVO vo) throws Exception;

    public List<ManagerVO> selectFestival(ManagerVO vo) throws Exception;
    
    public List<ManagerVO> selectAllFestival(ManagerVO vo) throws Exception;

	//쓰레기통 갯수 검색
	public int getTrashCanCnt(ManagerVO vo) throws Exception;

}
