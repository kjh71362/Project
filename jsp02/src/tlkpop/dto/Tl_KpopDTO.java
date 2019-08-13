package tlkpop.dto;

import java.sql.Date;

public class Tl_KpopDTO {
 private int num;
 private String subject;
 private String passwd;
 private Date reg_date;
 private int readcount;
 private String content;
 private String filename;
 private int filesize;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public Date getReg_date() {
	return reg_date;
}
public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}
public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public int getFilesize() {
	return filesize;
}
public void setFilesize(int filesize) {
	this.filesize = filesize;
}
@Override
public String toString() {
	return "Tl_KpopDTO [num=" + num + ", subject=" + subject + ", passwd=" + passwd + ", reg_date=" + reg_date
			+ ", readcount=" + readcount + ", content=" + content + ", filename=" + filename + ", filesize=" + filesize
			+ "]";
}
 
 

 
 
 
 
}
