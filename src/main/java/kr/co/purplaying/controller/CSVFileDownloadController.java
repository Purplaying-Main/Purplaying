package kr.co.purplaying.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.domain.PaymentDto;

@Controller
public class CSVFileDownloadController {
  
  @Autowired
  PaymentDao paymentDao;
  
  @RequestMapping(value = "/downloadCSV/{prdt_id}")
  public void downloadCSV(HttpServletResponse response,Model m,@PathVariable Integer prdt_id)  throws IOException {
    try {
      
    m.addAttribute("prdt_id",prdt_id);
    
    Date ld = new Date(); //파일이름 날짜 형식 지정
    SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd");
    String now = sdf.format(ld);
    String csvFileName = "fundingManage_"+now+"_prdt_id="+prdt_id+".csv"; //생성 파일이름 형식
    
    response.setContentType("text/csv");
    response.setContentType("application/ms-excel; charset=MS949"); //한글깨짐 방지를 위해 인코딩
    response.setCharacterEncoding("MS949");
   
    String headerKey = "Content-Disposition";
    String headerValue = String.format("attachment; filename=\"%s\"",csvFileName);
    response.setHeader(headerKey, headerValue);
    
    Map map = new HashMap(); 
    map.put("prdt_id", prdt_id);
    List<PaymentDto> lpay  = paymentDao.fundingManage(map);
    List<PaymentDto> list_pay = new ArrayList<PaymentDto>(paymentDao.fundingManage(map));

    ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(),CsvPreference.STANDARD_PREFERENCE);
    
    String[] header = { "pay_no", "pay_time","user_no", "reward_id", "reward_user_cnt",
        "delivery_reciever", "delivery_phone", "delivery_postcode","delivery_address","delivery_addressdetail","delivery_memo" };

    csvWriter.writeHeader(header);
    
    
    //SQL문으로 가져온 데이터를 header에 맞춰 넣어줌
    for (PaymentDto payment : list_pay) {
    csvWriter.write(payment, header);
    }
    
    csvWriter.close();
    
  }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  
}
