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
   
   
}
