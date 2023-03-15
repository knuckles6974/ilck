package kr.co.ilck.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.MypageMapper;
import kr.co.ilck.vo.CalVo;
import kr.co.ilck.vo.MemberVo;

@Service
@Qualifier("ms")
public class MypageServiceImpl implements MypageService{

    @Autowired
    private MypageMapper mapper;

    // 마이페이지 한 페이지로 구현. 회원정보,거래일정,내 글 보기,찜 목록
    @Override
    public String mypage(HttpSession session, Model model,HttpServletRequest request) throws IOException {
        // 로그인 안 한 상태면 돌려보내기
        if(session.getAttribute("userid")==null)
            return "redirect:/login/login";
            // 로그인 했으면 아래 실행
        else
        {
            String userid=session.getAttribute("userid").toString();

            // 거래일정 리스트 가져오기
            //model.addAttribute("clist",mapper.getCal(userid));

            // 내 글 보기 리스트 가져오기
            model.addAttribute("plist",mapper.getPanmae(userid));

            // 찜 목록 리스트 가져오기
            String pid=request.getParameter("pid");
            int page;
            // 페이지값이 없을 경우
            if(request.getParameter("page")==null)
            {
                page=1; // 기본 1페이지
            }
            else
            {
                page=Integer.parseInt(request.getParameter("page"));
            }
            int index=(page-1)*10;

            model.addAttribute("wlist",mapper.getWish(userid,index));
            // pstart, pend, chong, page값을 view에 전달
            int pstart=page/10;
            if(page%10 == 0)
                pstart--;
            pstart=pstart*10+1;
            int pend=pstart+9;

            int chong=mapper.getwChong(userid);

            if(pend>chong)
                pend=chong;

            model.addAttribute("pstart",pstart);
            model.addAttribute("pend",pend);
            model.addAttribute("chong",chong);
            model.addAttribute("page",page);
            model.addAttribute("pid", pid);

            // 내 게시글 개수 확인
            model.addAttribute("myguel", mapper.myguel(userid));

            // 내 게시글 중 판매완료된 개수 확인
            model.addAttribute("mypguel", mapper.mypguel(userid));

            model.addAttribute("mvo", mapper.mypage(userid));

            model.addAttribute("ww",request.getParameter("ww"));

            //model.addAttribute("tab",request.getParameter("tab"));
            return "/mypage/mypage";
        }
    }
    // 찜 목록 삭제하기.
    @Override
    public String wishdel(HttpServletRequest request,Model model) {
        String[] id=request.getParameter("id").split(",");
        for(int i=0;i<id.length;i++)
        {
            mapper.wishdel(id[i]);
        }

        //return "redirect:/mypage/mypage?tab="+request.getParameter("tab");
        return "redirect:/mypage/mypage";
    }
    // 판매글의 거래상태 변경
    @Override
    public String chgstate(HttpServletRequest request,Model model) {
        String id=request.getParameter("id");
        String sstate=request.getParameter("sstate");
        String ww=request.getParameter("ww");


        mapper.chgstate(sstate,id);

        return "redirect:/mypage/mypage?ww="+ww;
    }

}





