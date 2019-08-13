package tlkpop.dto;

import java.util.Date;

public class Tl_KpopCommentDTO {
	private int comment_count;
	private int comment_num;
	private int tlkpop_num; 
	private String writer;
	private String content;
	private Date reg_date;//import java.util.Date;
	//getter,setter, toString까지만
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getTlkpop_num() {
		return tlkpop_num;
	}
	public void setTlkpop_num(int tlkpop_num) {
		this.tlkpop_num = tlkpop_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "Tl_KpopCommentDTO [comment_count=" + comment_count + ", comment_num=" + comment_num + ", tlkpop_num="
				+ tlkpop_num + ", writer=" + writer + ", content=" + content + ", reg_date=" + reg_date + "]";
	}


}
