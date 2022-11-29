package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class ReplyDto {

  private int rno;
  private int prdt_id;
  private int chat_no;
  private String writer;
  private String chat_context;
  private Date chat_date;
  private int user_no;

  public ReplyDto() {
    // TODO Auto-generated constructor stub
  }

  public int getRno() {
    return rno;
  }

  public void setRno(int rno) {
    this.rno = rno;
  }

  public int getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }

  public int getChat_no() {
    return chat_no;
  }

  public void setChat_no(int chat_no) {
    this.chat_no = chat_no;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public String getChat_context() {
    return chat_context;
  }

  public void setChat_context(String chat_context) {
    this.chat_context = chat_context;
  }

  public Date getChat_date() {
    return chat_date;
  }

  public void setChat_date(Date chat_date) {
    this.chat_date = chat_date;
  }

  public int getUser_no() {
    return user_no;
  }

  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }

  @Override
  public int hashCode() {
    return Objects.hash(chat_context, chat_date, chat_no, prdt_id, rno, user_no, writer);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ReplyDto other = (ReplyDto) obj;
    return Objects.equals(chat_context, other.chat_context) && Objects.equals(chat_date, other.chat_date)
        && chat_no == other.chat_no && prdt_id == other.prdt_id && rno == other.rno && user_no == other.user_no
        && Objects.equals(writer, other.writer);
  }

  @Override
  public String toString() {
    return "ReplyDto [rno=" + rno + ", prdt_id=" + prdt_id + ", chat_no=" + chat_no + ", writer=" + writer
        + ", chat_context=" + chat_context + ", chat_date=" + chat_date + ", user_no=" + user_no + "]";
  }

}
