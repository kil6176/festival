package com.spring.festival.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.festival.common.PagingUtil;
import com.spring.festival.common.ResultUtil;
import com.spring.festival.dao.ManagerDAO;
import com.spring.festival.dao.TrashDAO;
import com.spring.festival.dto.CommonDTO;
import com.spring.festival.dto.ManagerVO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;

@Service
public class ManagerServiceImpl implements ManagerService
{

	@Inject
	private ManagerDAO dao;

	@Override
	public List<ManagerVO> selectFestival(ManagerVO vo) throws Exception
	{
		return dao.selectFestival(vo);
	}

	@Override
	public List<ManagerVO> selectAllFestival(ManagerVO vo) throws Exception
	{
		return dao.selectAllFestival(vo);
	}

	@Override
	public int getTrashCanCnt(ManagerVO vo) throws Exception
	{
		return dao.getTrashCanCnt(vo);
	}

	@Override
	public ResultUtil getFestivalList(ManagerVO vo) throws Exception
	{
		ResultUtil resultUtil = new ResultUtil();

		CommonDTO commonDto = new CommonDTO();
		int fc_num = vo.getFc_num();
		String authority = vo.getM_authority();
		System.out.print("나의 권한" + authority);
		int totalCount = 0;
		if (authority.equals("3"))
		{
			totalCount = dao.getFestivalAllCnt(vo);
		}
		else
			totalCount = dao.getFestivalCnt(vo);

		if (totalCount != 0)
		{
			CommonDTO commonForm = new CommonDTO();
			commonForm.setFunction_name(vo.getFunction_name());
			commonForm.setCurrent_page_no(vo.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setFc_num(fc_num);
			commonForm.setTotal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		vo.setLimit(commonDto.getLimit());
		vo.setOffset(commonDto.getOffset());
		List<ManagerVO> list = null;
		if (authority.equals("3"))
		{
			list = dao.selectAllFestival(vo);
		}
		else
			list = dao.selectFestival(vo);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	@Override
	public ResultUtil getTrashCanList(ManagerVO vo) throws Exception
	{
		ResultUtil resultUtil = new ResultUtil();

		int fc_num = vo.getFc_num();
		CommonDTO commonDto = new CommonDTO();
		int totalCount = 0;

		totalCount = dao.getTrashCanCnt(vo);

		if (totalCount != 0)
		{
			CommonDTO commonForm = new CommonDTO();
			commonForm.setFunction_name(vo.getFunction_name());
			commonForm.setCurrent_page_no(vo.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setFc_num(fc_num);
			commonForm.setTotal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		vo.setLimit(commonDto.getLimit());
		vo.setOffset(commonDto.getOffset());
		List<ManagerVO> list = null;
		list = dao.getTrashCanList(vo);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	@Override
	public ResultUtil getUserFestivalList(ManagerVO vo) throws Exception {
		ResultUtil resultUtil = new ResultUtil();
		
		CommonDTO commonDto = new CommonDTO();
		int fc_num = vo.getFc_num();
		String m_id = vo.getM_id();
		int totalCount = 0;
		totalCount = dao.getFestivalCnt(vo);	
		
		if (totalCount != 0) {
			CommonDTO commonForm = new CommonDTO();
			commonForm.setFunction_name(vo.getFunction_name());
			commonForm.setCurrent_page_no(vo.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setM_id(m_id);
			commonForm.setTotal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		vo.setLimit(commonDto.getLimit());
		vo.setOffset(commonDto.getOffset());
		List<ManagerVO> list = null;
		list = dao.selectFestival(vo);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	// 유저 축제 정보 추가
	public int addUserFestival(ManagerVO vo) throws Exception
	{
		return dao.addUserFestival(vo);
	}
	
	//유저 축제 정보 삭제
	public int deleteUserFestival(ManagerVO vo) throws Exception
	{
		return dao.deleteUserFestival(vo);
	}
}
