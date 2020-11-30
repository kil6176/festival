package com.spring.festival.dao;

import java.util.List;

import com.spring.festival.common.ResultUtil;
import com.spring.festival.dto.ManagerVO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
 
public interface ManagerDAO {

	//축제관리자일때 축제 수 체크
	public int getFestivalCnt(ManagerVO vo) throws Exception;

	//운영자일때 축제 수 체크
	public int getFestivalAllCnt(ManagerVO vo) throws Exception;

	//쓰레기통 갯수 검색
	public int getTrashCanCnt(ManagerVO vo) throws Exception;

	//축제 관계자일때 축제 가져오기
    public List<ManagerVO> selectFestival(ManagerVO vo) throws Exception;

	//운영자일때 축제 가져오기
    public List<ManagerVO> selectAllFestival(ManagerVO vo) throws Exception;
    
	//쓰레기통 리스트 가져오기
    public List<ManagerVO> getTrashCanList(ManagerVO vo) throws Exception;

}
 