package tlboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import tlboard.dto.Tl_BoardCommentDTO;
import tlboard.dto.Tl_BoardDTO;
import sqlmap.MybatisManager;

public class Tl_BoardDAO {
	
	//게시물 목록 리턴
	public List<Tl_BoardDTO> list(){
		List<Tl_BoardDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("tlboard.list");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list; 
	}

	public void insert(Tl_BoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("tlboard.insert", dto);
			session.commit();//auto commit이 아님
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	}//insert()

	//첨부파일 이름 찾기
	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("tlboard.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}//getFileName()

	//다운로드 횟수 증가 처리
	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("tlboard.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//plusDown()

	public Tl_BoardDTO view(int num) {
		Tl_BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("tlboard.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
	}//view()
	
	public Tl_BoardDTO viewReplace(int num) {
		Tl_BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("tlboard.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
		
	}
	
	
	
	
	//조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000) {//현재시간-읽은시간>5초
				//24*60*60*1000 하루에 한번
				session.update("tlboard.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute(
						"read_time_"+num, current_time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
	}//plusReadCount()

	//댓글 목록을 구하는 코드
	public List<Tl_BoardCommentDTO> commentList(int num) {
		List<Tl_BoardCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("tlboard.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return list;
	}

	//댓글 추가
	public void commentAdd(Tl_BoardCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("tlboard.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
	}

	//답글의 순서 조정
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Tl_BoardDTO dto=new Tl_BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("tlboard.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//updateStep

	//답글 쓰기
	public void reply(Tl_BoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("tlboard.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//reply()

	//비밀번호 체크
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("tlboard.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return result;
	}

	//수정
	public void update(Tl_BoardDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("tlboard.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}//update()

	public void delete(int num) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("tlboard.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	

}
