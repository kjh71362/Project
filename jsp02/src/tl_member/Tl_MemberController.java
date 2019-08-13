package tl_member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Tlmember_servlet/*")
public class Tl_MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		Tl_MemberDAO dao = new Tl_MemberDAO();

		if(uri.indexOf("join.do") != -1) {//회원등록
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			Tl_MemberDTO dto=new Tl_MemberDTO();//MemberDTO생성
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insert(dto);//추가
		}
		if(uri.indexOf("login.do") != -1){//로그인 처리
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			Tl_MemberDTO dto=new Tl_MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			String page="/hiphop/login.jsp";
			if(!result.equals("로그인 실패")) {//로그인 성공
				//세션 객체 생성
				HttpSession session=request.getSession();
				//세션에 값을 저장
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/hiphop/index.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {//로그인 실패
				response.sendRedirect(
						request.getContextPath()+
						page+"?message=error");
			      }
			}else if(uri.indexOf("logout.do") != -1) {
				HttpSession session = request.getSession();
				session.invalidate();
				String page = request.getContextPath()+"/hiphop/index.jsp?message=logout";
				response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
