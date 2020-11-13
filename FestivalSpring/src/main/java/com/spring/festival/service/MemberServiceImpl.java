package com.spring.festival.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.festival.dao.MemberDAO;
import com.spring.festival.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

   @Inject
   private MemberDAO dao;
   
   @Override
   public List<MemberVO> selectMember() throws Exception {

       return dao.selectMember();
   }
   
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
		
	}
}
