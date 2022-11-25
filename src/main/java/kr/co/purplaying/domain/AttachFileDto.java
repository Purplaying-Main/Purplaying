package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

import lombok.Data;

@Data
public class AttachFileDto {

  private int file_id;
  private String file_name;
  private String file_location;
  private int file_size;
  private Date file_regdate;
  private int file_del;
  private int prdt_id;
  
  private String uploadPath;
  private String uuid;
  private boolean image;
  
  public AttachFileDto() {
    // TODO Auto-generated constructor stub
  }

  @Override
  public int hashCode() {
    return Objects.hash(file_id, file_location, file_name, file_regdate, file_size, file_del, image, prdt_id,
        uploadPath, uuid);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    AttachFileDto other = (AttachFileDto) obj;
    return file_id == other.file_id && Objects.equals(file_location, other.file_location)
        && Objects.equals(file_name, other.file_name) && Objects.equals(file_regdate, other.file_regdate)
        && file_size == other.file_size && file_del == other.file_del && image == other.image
        && prdt_id == other.prdt_id && Objects.equals(uploadPath, other.uploadPath) && Objects.equals(uuid, other.uuid);
  }

  @Override
  public String toString() {
    return "AttachFileDto [file_id=" + file_id + ", file_name=" + file_name + ", file_location=" + file_location
        + ", file_size=" + file_size + ", file_regdate=" + file_regdate + ", file_del=" + file_del + ", prdt_id="
        + prdt_id + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", image=" + image + "]";
  }

  public AttachFileDto(int file_id, String file_name, String file_location, int file_size, Date file_regdate,
      int file_del, int prdt_id, String uploadPath, String uuid, boolean image) {
//    super();
    this.file_id = file_id;
    this.file_name = file_name;
    this.file_location = file_location;
    this.file_size = file_size;
    this.file_regdate = file_regdate;
    this.file_del = file_del;
    this.prdt_id = prdt_id;
    this.uploadPath = uploadPath;
    this.uuid = uuid;
    this.image = image;
  }

  public int getFile_id() {
    return file_id;
  }

  public void setFile_id(int file_id) {
    this.file_id = file_id;
  }

  public String getFile_name() {
    return file_name;
  }

  public void setFile_name(String file_name) {
    this.file_name = file_name;
  }

  public String getFile_location() {
    return file_location;
  }

  public void setFile_location(String file_location) {
    this.file_location = file_location;
  }

  public int getFile_size() {
    return file_size;
  }

  public void setFile_size(int file_size) {
    this.file_size = file_size;
  }

  public Date getFile_regdate() {
    return file_regdate;
  }

  public void setFile_regdate(Date file_regdate) {
    this.file_regdate = file_regdate;
  }

  public int getFile_del() {
    return file_del;
  }

  public void setFile_del(int file_del) {
    this.file_del = file_del;
  }

  public int getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }

  public String getUploadPath() {
    return uploadPath;
  }

  public void setUploadPath(String uploadPath) {
    this.uploadPath = uploadPath;
  }

  public String getUuid() {
    return uuid;
  }

  public void setUuid(String uuid) {
    this.uuid = uuid;
  }

  public boolean isImage() {
    return image;
  }

  public void setImage(boolean image) {
    this.image = image;
  }
  
  
  
}
