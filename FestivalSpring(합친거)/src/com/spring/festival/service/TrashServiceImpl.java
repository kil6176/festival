package com.spring.festival.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.festival.dao.TrashDAO;
import com.spring.festival.dto.TrashVO;

@Service
public class TrashServiceImpl implements TrashService {

   @Inject
   private TrashDAO dao;
   
   @Override
   public List<TrashVO> selectTrashCan() throws Exception {
       return dao.selectTrashCan();
   }
   
   @Override
   public List<TrashVO> searchTrashCan(TrashVO vo) throws Exception {
	   List<TrashVO>result = dao.searchTrashCan(vo);
       return result;
   }
   
   @Override
   public int insertTrashCan(TrashVO vo) throws Exception {
       return dao.insertTrashCan(vo);
   }
   
   @Override
   public List<TrashVO> selectOneTrashCan(TrashVO vo) throws Exception {
	   List<TrashVO>result = dao.selectOneTrashCan(vo);
       return result;
   }
   
   //쓰레기통 정보 변경
   @Override
   public int updateTrashCan(TrashVO vo) throws Exception {
       return dao.updateTrashCan(vo);
   }
   
   //쓰레기통 정보 삭제
   @Override
   public int deleteTrashCan(TrashVO vo) throws Exception {
       return dao.deleteTrashCan(vo);
   }
}
