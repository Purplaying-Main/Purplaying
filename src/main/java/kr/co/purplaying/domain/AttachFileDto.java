package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

import lombok.Data;

@Data
public class AttachFileDto {

  private int file_id;
  private String file_name;
  
  private String uploadPath;
  private String uuid;
  private boolean image;
  
  private String file_location;
  private int file_size;
  private Date file_regdate;
  private int file_state;
  
  public AttachFileDto() {
    // TODO Auto-generated constructor stub
  }
  
  public AttachFileDto(int file_id, String file_name, String file_location, int file_size, Date file_regdate,
      int file_state) {
    super();
    this.file_id = file_id;
    this.file_name = file_name;
    this.file_location = file_location;
    this.file_size = file_size;
    this.file_regdate = file_regdate;
    this.file_state = file_state;
  }



  @Override
  public int hashCode() {
    return Objects.hash(file_id, file_location, file_name, file_regdate, file_size, file_state, image, uploadPath,
        uuid);
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
        && file_size == other.file_size && file_state == other.file_state && image == other.image
        && Objects.equals(uploadPath, other.uploadPath) && Objects.equals(uuid, other.uuid);
  }
  
  @Override
  public String toString() {
    return "AttachFileDto [file_id=" + file_id + ", file_name=" + file_name + ", uploadPath=" + uploadPath + ", uuid="
        + uuid + ", image=" + image + ", file_location=" + file_location + ", file_size=" + file_size
        + ", file_regdate=" + file_regdate + ", file_state=" + file_state + "]";
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

  public int getFile_state() {
    return file_state;
  }

  public void setFile_state(int file_state) {
    this.file_state = file_state;
  }
  
  
}
