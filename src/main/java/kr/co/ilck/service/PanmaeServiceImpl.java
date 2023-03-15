package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.ilck.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.PanmaeMapper;

@Service
@Qualifier("pm")
public class PanmaeServiceImpl implements PanmaeService {

	@Autowired
	private PanmaeMapper mapper;



	@Override
	public String panmae(HttpSession session, Model model)
	{
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/main/main";
		}
		else
		{
			model.addAttribute("dae", mapper.getDae());
			return "/panmae/pnew";
		}
	}


	@Override
	public void getJung(HttpServletRequest request, PrintWriter out) {
		String daecode=request.getParameter("daecode");
		ArrayList<JungVo> jung=mapper.getJung(daecode);

		String str="<option> "+URLEncoder.encode("중분류")+ "</option>";
		for(int i=0;i<jung.size();i++)
		{
		  str=str+"<option value='"+jung.get(i).getCode()+"'> "+URLEncoder.encode(jung.get(i).getName())+" </option>";
		}

		out.print(str);
	}

	@Override
	public void getSo(HttpServletRequest request, PrintWriter out) {
		String daejung=request.getParameter("daejung");
		ArrayList<SoVo> so=mapper.getSo(daejung);

		String str="<option> "+URLEncoder.encode("선택")+"</option>";

		for(int i=0;i<so.size();i++)
		{
			str=str+"<option value='"+so.get(i).getCode()+"'> "+URLEncoder.encode(so.get(i).getName())+" </option>";
		}

		out.print(str);
	}

	@Override
	public void getCode(HttpServletRequest request, PrintWriter out)
	{
		String pcode=request.getParameter("pcode");
		out.print( mapper.getCode(pcode));

	}

	@Override
	public String panmae_ok(HttpSession session , HttpServletRequest request) throws IOException
	{
		String userid = session.getAttribute("userid").toString();

		if(userid==null)
		{
			return "redirect:/main/main";

		}
		else
		{


		String path=request.getRealPath("/resources/pro");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());

		String cimg = multi.getFilesystemName("cimg");
		String pimg = multi.getFilesystemName("pimg");
		String title = multi.getParameter("title");
		int price = Integer.parseInt(multi.getParameter("price"));
		String pcode = multi.getParameter("pcode");
		String selltime = multi.getParameter("selltime");
		String loca = multi.getParameter("loca");
		int pstate = Integer.parseInt(multi.getParameter("pstate"));
		String content  = multi.getParameter("content");



		PanmaeVo pvo=new PanmaeVo();

		pvo.setUserid(userid);
		pvo.setCimg(cimg);
		pvo.setPimg(pimg);
		pvo.setTitle(title);
		pvo.setPrice(price);
		pvo.setPcode(pcode);
		pvo.setSelltime(selltime);
		pvo.setLoca(loca);
		pvo.setPstate(pstate);
		pvo.setContent(content);


		mapper.panmae_ok(pvo);

		return "redirect:/panmae/pnew";

		}

	}

	@Override
	public String readnum(HttpServletRequest request)
	{
		String pcode = request.getParameter("pcode");
		mapper.readnum(pcode);

		return "redirect:/panmae/pcontent?pcode="+pcode;

	}

	@Override
	public String plist(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");

		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*16;

		ArrayList<PanmaeVo> plist=mapper.plist(pcode,index);
		model.addAttribute("plist",plist);

		int pstart=page/10;
		if(page%10 == 0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;

		int chong=mapper.getChong(pcode);

		if(pend>chong)
			pend=chong;

		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		model.addAttribute("pcode",pcode);
		return "/panmae/plist";
	}

	@Override
	public String pcontent(HttpServletRequest request, Model model, HttpSession session)
	{
		String userid = session.getAttribute("userid").toString();
		if(userid==null)
		{
			return "redirect:/main/main";
		}
		else
		{

			String pcode = request.getParameter("pcode");



			int count = mapper.getwish(pcode);
			model.addAttribute("count",count);

			PanmaeVo pvo = mapper.pcontent(pcode);
			model.addAttribute("pvo",pvo);

			int countpcode = mapper.getcpcode();
			model.addAttribute("countpcode",countpcode);

			ArrayList<PanmaeVo> cimg = mapper.getcimg(pcode.substring(0,7));

			model.addAttribute("cimg",cimg);


			ArrayList<PanmaeVo> twoimgs = mapper.getimgs(userid);
			model.addAttribute("twoimgs",twoimgs);

			MemberVo mvo = mapper.getmemberstate(userid,pcode);
			model.addAttribute("mvo",mvo);



			return "/panmae/pcontent";

		}


	}


	@Override
	public void wishadd(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		int pid = Integer.parseInt(request.getParameter("pid"));
		String userid = session.getAttribute("userid").toString();



				if(mapper.getwishcount(pid, userid)==0) {
					mapper.wishadd(pid, userid);
					out.print("0");
				}
				else if(mapper.getwishcount(pid, userid)!=0)
				{
					out.print("1");
				}



	}

	@Override
	public String liststate(HttpServletRequest request,Model model)
	{
		String pcode = request.getParameter("pcode");

		int n = Integer.parseInt(request.getParameter("n"));


			String imsi = "";

			if(n==2)
			{
				imsi= " price asc";

			}
			else if(n==3)
			{
				imsi = " price desc";
			}
			else{
				imsi = " id desc";

			}
			ArrayList<PanmaeVo> plist = mapper.desc(pcode , imsi);
			model.addAttribute("plist",plist);


		return "/panmae/plist";



	}

	@Override
	public String singo(HttpSession session)
	{
		String userid = session.getAttribute("userid").toString();
		if(userid==null)
		{
			return "redirect:/main/main";
		}
		else
		{
			return "/panmae/singo";
		}

	}

	/*
	@Override
	public String singo_ok(HttpSession session , HttpServletRequest request)
	{

		String pcode = request.getParameter("pcode");

		String userid = session.getAttribute("userid").toString();
		String singo_userid = request.getParameter("singo_userid");
		int pid =  Integer.parseInt(request.getParameter("pid"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");


		SingoVo svo = new SingoVo();

		svo.setUserid(userid);
		svo.setSingo_userid(singo_userid);
		svo.setPid(pid);
		svo.setContent(content);
		svo.setTitle(title);

		mapper.singo_ok(svo);


		return "redirect:/panmae/pcontent?pcode="+pcode;

	}


	 */








}




	

