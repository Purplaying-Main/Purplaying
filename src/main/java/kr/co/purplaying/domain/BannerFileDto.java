package kr.co.purplaying.domain;

import java.util.Date;

public class BannerFileDto {
  private int bannerfile_id;
  private String bannerfile_file;
  private int bannerfile_prdt_id;
  private Date bannerfile_regdate;
  
  public BannerFileDto() {
    super();
  }
  
  public BannerFileDto(int bannerfile_id, String bannerfile_file, int bannerfile_prdt_id, Date bannerfile_regdate) {
    super();
    this.bannerfile_id = bannerfile_id;
    this.bannerfile_file = bannerfile_file;
    this.bannerfile_prdt_id = bannerfile_prdt_id;
    this.bannerfile_regdate = bannerfile_regdate;
  }

  public int getBannerfile_id() {
    return bannerfile_id;
  }

  public void setBannerfile_id(int bannerfile_id) {
    this.bannerfile_id = bannerfile_id;
  }


  public String getBannerfile_file() {
    return bannerfile_file;
  }

  public void setBannerfile_file(String bannerfile_file) {
    this.bannerfile_file = bannerfile_file;
  }


  public int getBannerfile_prdt_id() {
    return bannerfile_prdt_id;
  }


  public void setBannerfile_prdt_id(int bannerfile_prdt_id) {
    this.bannerfile_prdt_id = bannerfile_prdt_id;
  }


  public Date getBannerfile_regdate() {
    return bannerfile_regdate;
  }


  public void setBannerfile_regdate(Date bannerfile_regdate) {
    this.bannerfile_regdate = bannerfile_regdate;
  }


  @Override
  public String toString() {
    return "BannerFileDto [bannerfile_id=" + bannerfile_id + ", bannerfile_file=" + bannerfile_file
        + ", bannerfile_prdt_id=" + bannerfile_prdt_id + ", bannerfile_regdate=" + bannerfile_regdate + "]";
  }
  
  
}
