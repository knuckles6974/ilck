package kr.co.ilck.mapper;

import kr.co.ilck.vo.MemberVo;

public interface MemberMapper {

	public void member_input_ok(MemberVo mvo);
	public int userid_check(String userid);
	public int email_check(String email);
}
