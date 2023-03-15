package kr.co.ilck.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.ilck.mapper.MemberMapper;
import kr.co.ilck.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String member_input_ok(MemberVo mvo)
	{
		mapper.member_input_ok(mvo);
		return "redirect:../login/login";
	}
	
	@Override
	public void userid_check(HttpServletRequest request,PrintWriter out) 
	{
		String userid=request.getParameter("userid");
		out.print(mapper.userid_check(userid));
	}
	
	@Override
	public void email_check(HttpServletRequest request,PrintWriter out)
	{
		String email=request.getParameter("email");
		out.print(mapper.email_check(email));
	}
}
