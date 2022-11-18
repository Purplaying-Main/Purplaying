package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class CommunityDto {

    private int chat_no;
    private int chat_serial_no;
    private int prdt_id;
    private String chat_writer;
    private String chat_context;
    private Date chat_date;
    private int chat_type;
  
    public CommunityDto(String chat_writer, String chat_context) {
      super();
      this.chat_writer = chat_writer;
      this.chat_context = chat_context;
    }
  

    public int getPrdt_id() {
      return prdt_id;
    }


    public void setPrdt_id(int prdt_id) {
      this.prdt_id = prdt_id;
    }


    public String getChat_writer() {
      return chat_writer;
    }
  
    public void setChat_writer(String chat_writer) {
      this.chat_writer = chat_writer;
    }
  
    public int getChat_no() {
      return chat_no;
    }
  
    public void setChat_no(int chat_no) {
      this.chat_no = chat_no;
    }
  
    public int getChat_serial_no() {
      return chat_serial_no;
    }
  
    public void setChat_serial_no(int chat_serial_no) {
      this.chat_serial_no = chat_serial_no;
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
  
    public int getChat_type() {
      return chat_type;
    }
  
    public void setChat_type(int chat_type) {
      this.chat_type = chat_type;
    }
  
    @Override
    public String toString() {
      return "CommunityDto [chat_no=" + chat_no + ", chat_serial_no=" + chat_serial_no + ", prdt_id="
          + prdt_id + ", chat_writer=" + chat_writer + ", chat_context=" + chat_context + ", chat_date="
          + chat_date + ", chat_type=" + chat_type + "]";
    }

    @Override
    public int hashCode() {
      return Objects.hash(chat_context, chat_no, chat_serial_no, chat_type, chat_writer, prdt_id);
    }

    @Override
    public boolean equals(Object obj) {
      if (this == obj)
        return true;
      if (obj == null)
        return false;
      if (getClass() != obj.getClass())
        return false;
      CommunityDto other = (CommunityDto) obj;
      return Objects.equals(chat_context, other.chat_context) && chat_no == other.chat_no
          && chat_serial_no == other.chat_serial_no && chat_type == other.chat_type
          && Objects.equals(chat_writer, other.chat_writer) && prdt_id == other.prdt_id;
    }

}