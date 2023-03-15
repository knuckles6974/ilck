package kr.co.ilck.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.MemberVo;

public interface LoginService {
	
	public String login(HttpServletRequest request,Model model);
	public String login_ok(MemberVo mvo, HttpSession session);
	public String logout(HttpSession session);
}
