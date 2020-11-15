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

	@Override
	public int idDupleCheck(MemberVO vo) throws Exception {
		int result = dao.idDupleCheck(vo);
		return result;
	}

	@Override
	public int nickDupleCheck(MemberVO vo) throws Exception {
		int result = dao.nickDupleCheck(vo);
		return result;
	}
	

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
}
