package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.*;

public interface PanmaeMapper {
	 	public ArrayList<DaeVo> getDae();
	    public ArrayList<JungVo> getJung(String daecode);
	    public ArrayList<SoVo> getSo(String daejung);
	    public int getCode(String pcode);
	    public void panmae_ok(PanmaeVo pvo);

		public int readnum(String pcode);
		public int getChong(String pcode);

		public ArrayList<PanmaeVo> plist(String pcode, int index);
		public PanmaeVo pcontent(String pcode);
		public int getwish(String pcode);
		public void wishadd(int pid, String userid);
		public int getcpcode();
		public ArrayList<PanmaeVo> getcimg(String pcode);
		public int getwishcount(int pid, String userid);
		public ArrayList<PanmaeVo> getimgs(String userid);
		public MemberVo getmemberstate(String userid,String pcode);
		public ArrayList<PanmaeVo> desc(String pcode, String imsi);

		//public void singo_ok(SingoVo svo);



}
