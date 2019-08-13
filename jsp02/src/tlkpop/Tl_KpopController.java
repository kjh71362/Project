package tlkpop;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import tlboard.dto.Tl_BoardCommentDTO;
import tlboard.dto.Tl_BoardDTO;
import tlkpop.dao.Tl_KpopDAO;
import tlkpop.dto.Tl_KpopCommentDTO;
import tlkpop.dto.Tl_KpopDTO;


//@WebServlet("/board_servlet/*") 어노테이션은 꼭 지워야 함(web.xml에서 매핑 사용시)
public class Tl_KpopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		//클라이언트에서 요청한 주소
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		Tl_KpopDAO dao=new Tl_KpopDAO();
		
		if(url.indexOf("list.do") != -1) {
			List<Tl_KpopDTO> list=dao.list();
			request.setAttribute("list", list);
			String page="/hiphop/news.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//MultipartRequest(request,파일업로드 디렉토리,업로드용량,
			//,파일인코딩,중복파일정책)
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD,
					"utf-8", new DefaultFileRenamePolicy());
			
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String filename=" ";//공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			Tl_KpopDTO dto=new Tl_KpopDTO();
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			//파일 첨부를 하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/tlkpop_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("comment_add.do") != -1) {
			Tl_KpopCommentDTO dto=new Tl_KpopCommentDTO();
			//게시물 번호
			int tlkpop_num=Integer.parseInt(
					request.getParameter("tlkpop_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setTlkpop_num(tlkpop_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어디로 page이동하든
			//소용없다.
		}else if(url.indexOf("pass_check.do") != -1){
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 맞는지 확인
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null){ //비밀번호가 맞으면
				page="/hiphop/news_edit.jsp";
				request.setAttribute("dto",  dao.view(num));
				RequestDispatcher rd
					=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{ //비밀번호가 틀리면
				page=contextPath+"/tlkpop_servlet/view.do?num="
			+num+"&message=error";
				response.sendRedirect(page); 
			}//else
		}else if(url.indexOf("update.do") != -1) {
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			MultipartRequest multi=new MultipartRequest(
				request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
				, "utf-8", new DefaultFileRenamePolicy() );
			
			int num=Integer.parseInt(multi.getParameter("num"));
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String filename=" "; //공백 1개
			int filesize=0;

			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length(); //파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Tl_KpopDTO dto=new Tl_KpopDTO();
			dto.setNum(num); 
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);

			if(filename == null || filename.trim().equals("")){
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				Tl_KpopDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
			}else{ 
				//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			//체크박스에 체크되었으면, value없이 썼기 때문에 on이 디폴트가됨
			if(fileDel != null && fileDel.equals("on")){
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete(); //파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0); 
			}
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/tlkpop_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("delete.do") != -1) {
			//파일업로드를 안쓰더라도 MultipartRequest 처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
					, "utf-8", new DefaultFileRenamePolicy() );
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			//페이지이동
			String page="/tlkpop_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			//조회수 증가 처리
			HttpSession session=request.getSession();
			dao.plusReadCount(num,session); 
			//번호에 해당하는 게시물 리턴
			Tl_KpopDTO dto=dao.viewReplace(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면 전환
			String page="/hiphop/news_view.jsp";
			RequestDispatcher rd
				=request.getRequestDispatcher(page);
			rd.forward(request, response);
				
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num);
			//댓글 목록 리턴
			List<Tl_KpopCommentDTO> list=dao.commentList(num);
			//request 영역에 저장
			request.setAttribute("list", list);
			//출력 페이지로 이동
			String page="/hiphop/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
