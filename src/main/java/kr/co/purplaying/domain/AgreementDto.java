package kr.co.purplaying.domain;

import java.util.Objects;

public class AgreementDto {
  private boolean agree_age;
  private boolean agree_terms;
  private boolean agree_inform;
  private boolean agree_inform_third;
  private boolean agree_marketing;
  
  public AgreementDto() {
    this(false,false,false,false,false);
  }
  public AgreementDto(boolean agree_age, boolean agree_terms, boolean agree_inform, boolean agree_inform_third, boolean agree_marketing) {
    this.agree_age = agree_age;
    this.agree_terms = agree_terms;
    this.agree_inform = agree_inform;
    this.agree_inform_third = agree_inform_third;
    this.agree_marketing = agree_marketing;
  }
  public boolean isAgree_age() {
    return agree_age;
  }
  public void setAgree_age(boolean agree_age) {
    this.agree_age = agree_age;
  }
  public boolean isAgree_terms() {
    return agree_terms;
  }
  public void setAgree_terms(boolean agree_terms) {
    this.agree_terms = agree_terms;
  }
  public boolean isAgree_inform() {
    return agree_inform;
  }
  public void setAgree_inform(boolean agree_inform) {
    this.agree_inform = agree_inform;
  }
  public boolean isAgree_inform_third() {
    return agree_inform_third;
  }
  public void setAgree_inform_third(boolean agree_inform_third) {
    this.agree_inform_third = agree_inform_third;
  }
  public boolean isAgree_marketing() {
    return agree_marketing;
  }
  public void setAgree_marketing(boolean agree_marketing) {
    this.agree_marketing = agree_marketing;
  }
  
  @Override
  public int hashCode() {
    return Objects.hash(agree_age, agree_inform, agree_inform_third, agree_marketing, agree_terms);
  }
  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    AgreementDto other = (AgreementDto) obj;
    return agree_age == other.agree_age && agree_inform == other.agree_inform
        && agree_inform_third == other.agree_inform_third && agree_marketing == other.agree_marketing
        && agree_terms == other.agree_terms;
  }
  
  @Override
  public String toString() {
    return "AgreementDto [agree_age=" + agree_age + ", agree_terms=" + agree_terms + ", agree_inform=" + agree_inform
        + ", agree_inform_third=" + agree_inform_third + ", agree_marketing=" + agree_marketing + "]";
  }
  
  
}
