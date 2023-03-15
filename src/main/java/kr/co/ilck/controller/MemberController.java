package kr.co.ilck.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.MemberService;
import kr.co.ilck.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member_input")
	public String member_input()
	{
		return "/member/member_input";
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo)
	{
		return service.member_input_ok(mvo);
	}
	
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request, PrintWriter out)
	{
		service.userid_check(request,out);
	}
	
	@RequestMapping("/member/email_check")
	public void email_check(HttpServletRequest request, PrintWriter out)
	{
		service.email_check(request, out);
	}
}
