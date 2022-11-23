package kr.co.purplaying.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.purplaying.domain.AttachFileDto;
import kr.co.purplaying.service.ProjectService;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/file")
public class UploadController {
  
  @Autowired
  ProjectService projectService;
  
  //이미지 파일 판단
  private boolean checkImageType(File file) {
    try {
      String contentType = Files.probeContentType(file.toPath());
      
      return contentType.startsWith("image");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }
  //날짜별 폴더 생성 
  private String getFolder() {
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String str = sdf.format(date);
    
    return str.replace("-", File.separator);
  }
  
  //프로젝트 대표이미지 업로드
  @PostMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<List<AttachFileDto>> fileUpload(MultipartFile[] uploadFile, Model m, int prdt_id){
    
    List<AttachFileDto> list = new ArrayList<>();
    
    System.out.println("upload file ajax post....");
    String uploadFolder ="/Users/heera15mac/git/Purplaying/src/main/webapp/resources/assets/img/upload";
    
    String uploadFolderPath = getFolder();
  
    //make folder(yyyy/MM/dd)
    File uploadPath = new File(uploadFolder, uploadFolderPath);
    System.out.println("upload path: "+uploadPath);
    
    if(uploadPath.exists() == false) {
      uploadPath.mkdirs();
    }
 
    for (MultipartFile multipartFile : uploadFile) { 
      
      AttachFileDto attachFileDto = new AttachFileDto();
      String uploadFileName = multipartFile.getOriginalFilename();
      System.out.println("only file name: "+ uploadFileName);
      attachFileDto.setFile_name(uploadFileName);
      
//      파일명 중복방지 uuid
      UUID uuid = UUID.randomUUID();
      uploadFileName = uuid.toString() + "_" + uploadFileName;

      try {
        File saveFile = new File(uploadPath, uploadFileName);
        multipartFile.transferTo(saveFile);
        
        attachFileDto.setUuid(uuid.toString());
        attachFileDto.setUploadPath(uploadFolderPath);
        
        //원본 이미지 DB저장
        /*
         * long uploadFileSize = multipartFile.getSize();
         * imgToDB(uploadPath, uploadFileName, uploadFileSize, prdt_id);
         */
        
        //썸네일 생성
        if(checkImageType(saveFile)) {
          attachFileDto.setImage(true);
          
          FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
          Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 230, 195); //width, height
          //썸네 이미지 DB저장
          /*
           * long uploadFileSize_tumb = multipartFile.getSize();
           * String uploadFileName_tumb = "s_"+uploadFileName;
           * imgToDB(uploadPath, uploadFileName_tumb, uploadFileSize_tumb, prdt_id);
           */
          
          thumbnail.close();
        }
        // add to List
        list.add(attachFileDto);
        
      } catch (Exception e) {
        e.printStackTrace();
      }  
    }//for
    return new ResponseEntity<>(list,HttpStatus.OK);
  }
  
  private void imgToDB(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception {
    if( projectService.insertFile(uploadPath, uploadFileName, uploadFileSize, prdt_id) != 1) {
      System.out.println("insertFile ERR");
    }
  }

}
