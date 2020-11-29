package com.spring.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.festival.common.PagingUtil;
import com.spring.festival.dto.CommonDTO;
import com.spring.festival.common.ResultUtil;
import com.spring.festival.dao.MemberDAO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;

@Service
public class MemberServiceImpl implements MemberService {
	final int SELECT_OK = 1;
	final int UPDATE_OK = 1;
	final int DELETE_OK = 1;

   @Inject
   private MemberDAO dao;
   
   @Override
   public List<MemberVO> selectMember(MemberVO vo) throws Exception {
       return dao.selectMember(vo);
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
	
	@Override
	public int infoChange(MemberVO vo) throws Exception {
		return dao.infoChange(vo);
	}
	

	@Override
	public int passwordCheck(MemberVO vo) throws Exception {
		int result = dao.passwordCheck(vo);
		return result;
	}
	
	@Override
	public int passwordChange(MemberVO vo) throws Exception {
		int result = dao.passwordChange(vo);
		return result;
	}
	
	@Override
	public int getUserCnt(MemberVO vo) throws Exception {
		return dao.getUserCnt(vo);
	}
	
	@Override
	public ResultUtil getUserList(MemberVO vo) throws Exception {
		ResultUtil resultUtil = new ResultUtil();

		CommonDTO commonDto = new CommonDTO();

		int totalCount = dao.getUserCnt(vo);
		if (totalCount != 0) {
			CommonDTO commonForm = new CommonDTO();
			commonForm.setFunction_name(vo.getFunction_name());
			commonForm.setCurrent_page_no(vo.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTotal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		vo.setLimit(commonDto.getLimit());
		vo.setOffset(commonDto.getOffset());

		List<MemberVO> list = dao.selectMember(vo);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}
	
	@Override
	public int authorityChange(MemberVO vo) throws Exception {
		int result = dao.authorityChange(vo);
		return result;
	}
	

    //아이디 찾기
	@Override
    public List<MemberVO> selectFindID(MemberVO vo) throws Exception
    {
		return dao.selectFindID(vo);
		
	}
	

	@Override
    //비밀번호 찾기 / 초기화
    public String updateFindPW(MemberVO vo) throws Exception
    {
		
        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','!', '@','#','$','%','^','&','*'};
        StringBuilder sb = new StringBuilder("");
        Random rn = new Random();
        for( int i = 0 ; i < 10 ; i++ )
        {
            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
        }
        if(dao.selectFindPW(vo) == SELECT_OK)
        {
        	String password = sb.toString();
        	vo.setNewPassword(password);
        	if(dao.passwordChange(vo) == UPDATE_OK)
        	{
        		return sb.toString();
        	}
        }
		return "";
    }
	
}
