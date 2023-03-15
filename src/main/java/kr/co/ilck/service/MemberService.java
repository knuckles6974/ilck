package kr.co.ilck.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import kr.co.ilck.vo.MemberVo;

public interface MemberService {
	
	public String member_input_ok(MemberVo mvo);
	public void userid_check(HttpServletRequest request,PrintWriter out);
	public void email_check(HttpServletRequest request,PrintWriter out);
}
