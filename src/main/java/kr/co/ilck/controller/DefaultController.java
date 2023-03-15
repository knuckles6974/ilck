package kr.co.ilck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.DefaultService;

@Controller
public class DefaultController {

	@Autowired
	@Qualifier("ds")
	private DefaultService service;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main()
	{
		return "/main/main";
	}
}
