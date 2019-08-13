package tlkpop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import tlboard.dto.Tl_BoardCommentDTO;
import tlboard.dto.Tl_BoardDTO;
import tlkpop.dto.Tl_KpopCommentDTO;
import tlkpop.dto.Tl_KpopDTO;

public class Tl_KpopDAO {
	
	public List<Tl_KpopDTO> list(){
		List<Tl_KpopDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("tlkpop.list");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list; 
	}
	
	//첨부파일 이름 찾기
		public String getFileName(int num) {
			String result="";
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				result=session.selectOne("tlkpop.getFileName", num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
			return result;
		}//getFileName()
	
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
					session.update("tlkpop.plusReadCount", num);
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
		
		public Tl_KpopDTO view(int num) {
			Tl_KpopDTO dto=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				dto=session.selectOne("tlkpop.view", num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if( session!= null ) session.close();
			}
			return dto;
		}//view()
		
		//댓글 목록을 구하는 코드
		public List<Tl_KpopCommentDTO> commentList(int num) {
			List<Tl_KpopCommentDTO> list=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				list=session.selectList("tlkpop.commentList", num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if( session!= null ) session.close();
			}
			return list;
		}
		
		public void insert(Tl_KpopDTO dto) {
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				session.insert("tlkpop.insert", dto);
				session.commit();//auto commit이 아님
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
		}//insert()

		//댓글 추가
		public void commentAdd(Tl_KpopCommentDTO dto) {
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				session.insert("tlkpop.commentAdd", dto);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
			
		}
		
		//비밀번호 체크
		public String passwdCheck(int num, String passwd) {
			String result=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				Map<String,Object> map=new HashMap<>();
				map.put("num", num);
				map.put("passwd", passwd);
				result=session.selectOne("tlkpop.pass_check", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
			
			return result;
		}
		
		//수정
		public void update(Tl_KpopDTO dto) {
			SqlSession session=null;
			try {
				session = MybatisManager.getInstance().openSession();
				session.update("tlkpop.update", dto);
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
				session.update("tlkpop.delete", num);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
		
		public Tl_KpopDTO viewReplace(int num) {
			Tl_KpopDTO dto=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				dto=session.selectOne("tlkpop.view", num);
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

}
